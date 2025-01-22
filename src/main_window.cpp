#include "main_window.h"
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QGroupBox>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(nullptr)
    , m_bleService(new BLEService(this))
    , m_mockDevice(new MockDevice(this))
{
    setupUi();
    connectSignals();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::setupUi()
{
    // Create central widget and main layout
    QWidget *centralWidget = new QWidget(this);
    QVBoxLayout *mainLayout = new QVBoxLayout(centralWidget);
    setCentralWidget(centralWidget);

    // Create status group
    QGroupBox *statusGroup = new QGroupBox("Device Status", this);
    QVBoxLayout *statusLayout = new QVBoxLayout(statusGroup);
    
    m_connectionStatus = new QLabel("Disconnected", this);
    m_stateLabel = new QLabel("State: Idle", this);
    m_volumeLabel = new QLabel("Volume: 0.5", this);
    
    statusLayout->addWidget(m_connectionStatus);
    statusLayout->addWidget(m_stateLabel);
    statusLayout->addWidget(m_volumeLabel);

    // Create controls group
    QGroupBox *controlsGroup = new QGroupBox("Controls", this);
    QHBoxLayout *controlsLayout = new QHBoxLayout(controlsGroup);
    
    m_advertiseButton = new QPushButton("Start Advertising", this);
    connect(m_advertiseButton, &QPushButton::clicked, this, [this]() {
        static bool advertising = false;
        if (!advertising) {
            m_bleService->startAdvertising();
            m_advertiseButton->setText("Stop Advertising");
        } else {
            m_bleService->stopAdvertising();
            m_advertiseButton->setText("Start Advertising");
        }
        advertising = !advertising;
    });
    
    controlsLayout->addWidget(m_advertiseButton);

    // Create log view
    QGroupBox *logGroup = new QGroupBox("Communication Log", this);
    QVBoxLayout *logLayout = new QVBoxLayout(logGroup);
    
    m_logView = new QTextEdit(this);
    m_logView->setReadOnly(true);
    logLayout->addWidget(m_logView);

    // Add all groups to main layout
    mainLayout->addWidget(statusGroup);
    mainLayout->addWidget(controlsGroup);
    mainLayout->addWidget(logGroup);

    // Set window properties
    setWindowTitle("Mock Looper Device");
    resize(400, 600);
}

void MainWindow::connectSignals()
{
    // Connect BLE service signals
    connect(m_bleService, &BLEService::connectionStatusChanged,
            this, &MainWindow::updateConnectionStatus);
    connect(m_bleService, &BLEService::parameterUpdateReceived,
            this, &MainWindow::handleParameterUpdate);

    // Connect mock device signals
    connect(m_mockDevice, &MockDevice::stateChanged,
            this, &MainWindow::updateStateDisplay);
    connect(m_mockDevice, &MockDevice::volumeChanged,
            this, &MainWindow::updateVolumeDisplay);
    connect(m_mockDevice, &MockDevice::logMessage,
            this, &MainWindow::appendToLog);
}

void MainWindow::updateConnectionStatus(bool connected)
{
    m_connectionStatus->setText(connected ? "Connected" : "Disconnected");
    m_mockDevice->setConnected(connected);
}

void MainWindow::handleParameterUpdate(const QByteArray &value)
{
    m_mockDevice->processParameterUpdate(value);
}

void MainWindow::updateStateDisplay(MockDevice::LooperState state)
{
    QString stateStr;
    switch (state) {
        case MockDevice::LooperState::Recording: stateStr = "Recording"; break;
        case MockDevice::LooperState::Playing: stateStr = "Playing"; break;
        case MockDevice::LooperState::Overdubbing: stateStr = "Overdubbing"; break;
        case MockDevice::LooperState::Stopped: stateStr = "Stopped"; break;
        case MockDevice::LooperState::Idle: stateStr = "Idle"; break;
    }
    m_stateLabel->setText("State: " + stateStr);
}

void MainWindow::updateVolumeDisplay(float volume)
{
    m_volumeLabel->setText(QString("Volume: %1").arg(volume));
}

void MainWindow::appendToLog(const QString &message)
{
    m_logView->append(message);
} 