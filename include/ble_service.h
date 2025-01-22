#pragma once

#include <QObject>
#include <QBluetoothUuid>
#include <QLowEnergyController>
#include <QLowEnergyService>
#include <QLowEnergyCharacteristic>

class QLowEnergyServiceData;
class QLowEnergyCharacteristicData;
class QLowEnergyDescriptorData;
class QLowEnergyAdvertisingData;
class QLowEnergyAdvertisingParameters;

class BLEService : public QObject
{
    Q_OBJECT

public:
    explicit BLEService(QObject *parent = nullptr);
    ~BLEService();

    void startAdvertising();
    void stopAdvertising();
    void sendNotification(const QByteArray &value);

    // UUIDs should match iOS app expectations
    static constexpr const char* SERVICE_UUID = 
        "12345678-1234-5678-1234-56789abcdef0";
    static constexpr const char* CHARACTERISTIC_UUID = 
        "12345678-1234-5678-1234-56789abcdef1";

signals:
    void connectionStatusChanged(bool connected);
    void parameterUpdateReceived(const QByteArray &value);
    void logMessage(const QString &message);

private slots:
    void handleConnected();
    void handleDisconnected();
    void handleCharacteristicWritten(const QLowEnergyCharacteristic &characteristic,
                                   const QByteArray &value);

private:
    QLowEnergyController *m_leController;
    QLowEnergyService *m_service;
    bool m_connected;
}; 