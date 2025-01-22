#pragma once

#include <QObject>
#include <QString>
#include <QByteArray>

class MockDevice : public QObject
{
    Q_OBJECT

public:
    explicit MockDevice(QObject *parent = nullptr);

    enum class LooperState {
        Idle,
        Recording,
        Playing,
        Overdubbing,
        Stopped
    };
    Q_ENUM(LooperState)

    // Device state getters
    LooperState currentState() const { return m_currentState; }
    bool isConnected() const { return m_connected; }
    float volume() const { return m_volume; }
    
    // Parameter update handling
    void processParameterUpdate(const QByteArray &data);
    QByteArray generateStateUpdate() const;

signals:
    void stateChanged(LooperState newState);
    void volumeChanged(float newVolume);
    void connectionChanged(bool connected);
    void logMessage(const QString &message);

public slots:
    void setConnected(bool connected);
    void setState(LooperState state);
    void setVolume(float volume);

private:
    LooperState m_currentState;
    bool m_connected;
    float m_volume;
    
    // Helper methods
    void updateState(LooperState newState);
    QString stateToString(LooperState state) const;
}; 