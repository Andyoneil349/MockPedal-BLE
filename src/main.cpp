#include <QApplication>
#include <QDebug>
#include "main_window.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Set application metadata
    QCoreApplication::setOrganizationName("HumblTech");
    QCoreApplication::setApplicationName("Mock Looper Device");
    QCoreApplication::setApplicationVersion("1.0.0");

    // Enable Bluetooth permissions on macOS if needed
    #ifdef Q_OS_MACOS
    qDebug() << "Running on macOS - Bluetooth permissions may be required";
    #endif

    // Create and show the main window
    MainWindow mainWindow;
    mainWindow.show();

    // Start the event loop
    return app.exec();
} 