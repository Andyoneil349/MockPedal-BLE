#include "mock_device.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>

MockDevice::MockDevice(QObject *parent)
    : QObject(parent)
    , m_currentState(LooperState::Idle)
    , m_connected(false)
    , m_volume(0.5f)
{
}

void MockDevice::processParameterUpdate(const QByteArray &data)
{
    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (doc.isNull()) {
        emit logMessage("Error: Invalid JSON data received");
        return;
    }

    QJsonObject obj = doc.object();
    
    // Process state change if present
    if (obj.contains("state")) {
        QString stateStr = obj["state"].toString().toLower();
        if (stateStr == "recording") updateState(LooperState::Recording);
        else if (stateStr == "playing") updateState(LooperState::Playing);
        else if (stateStr == "overdubbing") updateState(LooperState::Overdubbing);
        else if (stateStr == "stopped") updateState(LooperState::Stopped);
        else if (stateStr == "idle") updateState(LooperState::Idle);
    }

    // Process volume if present
    if (obj.contains("volume")) {
        float newVolume = static_cast<float>(obj["volume"].toDouble());
        setVolume(newVolume);
    }

    emit logMessage("Processed parameter update: " + QString(data));
}

QByteArray MockDevice::generateStateUpdate() const
{
    QJsonObject obj;
    obj["state"] = stateToString(m_currentState);
    obj["volume"] = m_volume;
    obj["connected"] = m_connected;

    QJsonDocument doc(obj);
    return doc.toJson(QJsonDocument::Compact);
}

void MockDevice::setConnected(bool connected)
{
    if (m_connected != connected) {
        m_connected = connected;
        emit connectionChanged(connected);
        emit logMessage(QString("Connection status changed: %1").arg(connected ? "Connected" : "Disconnected"));
    }
}

void MockDevice::setState(LooperState state)
{
    updateState(state);
}

void MockDevice::setVolume(float volume)
{
    if (volume != m_volume) {
        m_volume = qBound(0.0f, volume, 1.0f);
        emit volumeChanged(m_volume);
        emit logMessage(QString("Volume changed to: %1").arg(m_volume));
    }
}

void MockDevice::updateState(LooperState newState)
{
    if (m_currentState != newState) {
        m_currentState = newState;
        emit stateChanged(newState);
        emit logMessage(QString("State changed to: %1").arg(stateToString(newState)));
    }
}

QString MockDevice::stateToString(LooperState state) const
{
    switch (state) {
        case LooperState::Recording: return "Recording";
        case LooperState::Playing: return "Playing";
        case LooperState::Overdubbing: return "Overdubbing";
        case LooperState::Stopped: return "Stopped";
        case LooperState::Idle: return "Idle";
        default: return "Unknown";
    }
} 