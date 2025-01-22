#include "ble_service.h"
#include <QDebug>
#include <QtBluetooth/qlowenergyservicedata.h>
#include <QtBluetooth/qlowenergycharacteristicdata.h>
#include <QtBluetooth/qlowenergydescriptordata.h>
#include <QtBluetooth/qlowenergyadvertisingdata.h>
#include <QtBluetooth/qlowenergyadvertisingparameters.h>
#include <QBluetoothLocalDevice>

BLEService::BLEService(QObject *parent)
    : QObject(parent)
    , m_leController(nullptr)
    , m_service(nullptr)
    , m_connected(false)
{
    emit logMessage("Initializing BLE service...");
    
    // First, check and enable Bluetooth
    QBluetoothLocalDevice localDevice;
    if (!localDevice.isValid()) {
        emit logMessage("No Bluetooth device found!");
        return;
    }
    
    // Power on and set discoverable
    localDevice.powerOn();
    localDevice.setHostMode(QBluetoothLocalDevice::HostDiscoverable);
    emit logMessage("Bluetooth device initialized and set discoverable");
    
    // Initialize the peripheral manager with explicit peripheral mode
    m_leController = QLowEnergyController::createPeripheral();
    
    if (!m_leController) {
        emit logMessage("Failed to create peripheral controller!");
        return;
    }
    emit logMessage("Peripheral controller created successfully");
    
    connect(m_leController, &QLowEnergyController::connected,
            this, &BLEService::handleConnected);
    connect(m_leController, &QLowEnergyController::disconnected, 
            this, &BLEService::handleDisconnected);
    connect(m_leController, &QLowEnergyController::errorOccurred,
            this, [this](QLowEnergyController::Error error) {
                QString errorStr;
                switch (error) {
                    case QLowEnergyController::UnknownError:
                        errorStr = "Unknown error"; break;
                    case QLowEnergyController::InvalidBluetoothAdapterError:
                        errorStr = "Invalid Bluetooth adapter"; break;
                    case QLowEnergyController::ConnectionError:
                        errorStr = "Connection error"; break;
                    case QLowEnergyController::AdvertisingError:
                        errorStr = "Advertising error"; break;
                    default:
                        errorStr = QString("Error code: %1").arg(static_cast<int>(error));
                }
                emit logMessage("Controller error: " + errorStr);
            });
}

void BLEService::startAdvertising()
{
    emit logMessage("Starting advertising process...");
    emit logMessage(QString("Service UUID: %1").arg(SERVICE_UUID));
    emit logMessage(QString("Characteristic UUID: %1").arg(CHARACTERISTIC_UUID));

    // Define service data
    QLowEnergyServiceData serviceData;
    serviceData.setType(QLowEnergyServiceData::ServiceTypePrimary);
    serviceData.setUuid(QBluetoothUuid(SERVICE_UUID));

    // Create characteristic for parameter updates
    QLowEnergyCharacteristicData charData;
    charData.setUuid(QBluetoothUuid(CHARACTERISTIC_UUID));
    charData.setProperties(QLowEnergyCharacteristic::Write | 
                          QLowEnergyCharacteristic::Notify);
    charData.setValue(QByteArray());

    // Add client configuration descriptor
    const QLowEnergyDescriptorData clientConfig(
        QBluetoothUuid::DescriptorType::ClientCharacteristicConfiguration,
        QByteArray(2, 0));
    charData.addDescriptor(clientConfig);

    // Add characteristic to service
    serviceData.addCharacteristic(charData);

    // Create service
    m_service = m_leController->addService(serviceData);
    if (!m_service) {
        emit logMessage("Failed to add service!");
        return;
    }
    emit logMessage("Service added successfully");

    // Connect to characteristic write signals
    connect(m_service, &QLowEnergyService::characteristicWritten,
            this, &BLEService::handleCharacteristicWritten);

    // Start advertising with explicit parameters
    QLowEnergyAdvertisingData advertisingData;
    advertisingData.setDiscoverability(QLowEnergyAdvertisingData::DiscoverabilityGeneral);
    advertisingData.setLocalName("Mock Looper");
    advertisingData.setServices(QList<QBluetoothUuid>() << QBluetoothUuid(SERVICE_UUID));
    advertisingData.setIncludePowerLevel(true);

    QLowEnergyAdvertisingParameters parameters;
    parameters.setMode(QLowEnergyAdvertisingParameters::AdvInd);
    parameters.setInterval(100, 200);  // min and max interval in ms

    emit logMessage(QString("Starting advertising with name: %1").arg(advertisingData.localName()));
    m_leController->startAdvertising(parameters, advertisingData);

    emit logMessage("Advertising started. Device should be discoverable as 'Mock Looper'");
}

void BLEService::stopAdvertising()
{
    if (m_leController) {
        m_leController->stopAdvertising();
        emit logMessage("Stopped advertising");
    }
}

void BLEService::handleConnected()
{
    m_connected = true;
    emit connectionStatusChanged(true);
    emit logMessage("Device connected");
}

void BLEService::handleDisconnected()
{
    m_connected = false;
    emit connectionStatusChanged(false);
    emit logMessage("Device disconnected");
}

void BLEService::handleCharacteristicWritten(const QLowEnergyCharacteristic &characteristic,
                                           const QByteArray &value)
{
    if (characteristic.uuid() == QBluetoothUuid(CHARACTERISTIC_UUID)) {
        emit parameterUpdateReceived(value);
        emit logMessage(QString("Received parameter update: %1").arg(QString(value)));
    }
}

void BLEService::sendNotification(const QByteArray &value)
{
    if (m_service && m_connected) {
        QLowEnergyCharacteristic characteristic = 
            m_service->characteristic(QBluetoothUuid(CHARACTERISTIC_UUID));
        if (characteristic.isValid()) {
            m_service->writeCharacteristic(characteristic, value);
        }
    }
}

BLEService::~BLEService()
{
    stopAdvertising();
    delete m_leController;
} 