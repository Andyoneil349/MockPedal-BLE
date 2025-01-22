cmake_minimum_required(VERSION 3.16)
project(MockLooperDevice VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Set Qt6 installation path if needed
if(APPLE)
    # Modify this path to match your Qt installation
    list(APPEND CMAKE_PREFIX_PATH "/opt/homebrew/opt/qt@6")
    # Alternative locations:
    # list(APPEND CMAKE_PREFIX_PATH "/opt/Qt/6.6.1/macos")
    # list(APPEND CMAKE_PREFIX_PATH "/Applications/Qt/6.6.1/macos")
endif()

# Find required Qt packages
find_package(Qt6 REQUIRED COMPONENTS 
    Core
    Gui
    Widgets
    Bluetooth
    DBus
)

# Define source files
set(SOURCES
    src/main.cpp
    src/main_window.cpp
    src/ble_service.cpp
    src/mock_device.cpp
)

# Define header files
set(HEADERS
    include/main_window.h
    include/ble_service.h
    include/mock_device.h
)

# Create executable
add_executable(${PROJECT_NAME} 
    ${SOURCES}
    ${HEADERS}
)

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Link Qt libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    Qt6::Bluetooth
    Qt6::DBus
)

# Set macOS specific properties
if(APPLE)
    set_target_properties(${PROJECT_NAME} PROPERTIES
        MACOSX_BUNDLE TRUE
        MACOSX_BUNDLE_GUI_IDENTIFIER "com.humbltech.mocklooper"
        MACOSX_BUNDLE_BUNDLE_NAME "Mock Looper Device"
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    )
    
    # Configure and copy Info.plist
    configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/resources/macos/Info.plist
        ${CMAKE_CURRENT_BINARY_DIR}/Info.plist
        @ONLY
    )
    
    set_target_properties(${PROJECT_NAME} PROPERTIES
        MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_BINARY_DIR}/Info.plist
    )
endif()

# Install rules
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Enable testing if needed
# enable_testing() 