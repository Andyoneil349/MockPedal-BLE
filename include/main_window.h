#pragma once

#include <QMainWindow>
#include <QLabel>
#include <QTextEdit>
#include <QPushButton>
#include "ble_service.h"
#include "mock_device.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void updateConnectionStatus(bool connected);
    void handleParameterUpdate(const QByteArray &value);
    void updateStateDisplay(MockDevice::LooperState state);
    void updateVolumeDisplay(float volume);
    void appendToLog(const QString &message);

private:
    Ui::MainWindow *ui;
    BLEService *m_bleService;
    MockDevice *m_mockDevice;
    
    QLabel *m_connectionStatus;
    QLabel *m_stateLabel;
    QLabel *m_volumeLabel;
    QTextEdit *m_logView;
    QPushButton *m_advertiseButton;

    void setupUi();
    void connectSignals();
}; 