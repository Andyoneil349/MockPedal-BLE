# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/andyoneil/Development/mock-humbl-pedal

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andyoneil/Development/mock-humbl-pedal/build

# Include any dependencies generated for this target.
include CMakeFiles/MockLooperDevice.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MockLooperDevice.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MockLooperDevice.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MockLooperDevice.dir/flags.make

CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o: CMakeFiles/MockLooperDevice.dir/flags.make
CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o: MockLooperDevice_autogen/mocs_compilation.cpp
CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o: CMakeFiles/MockLooperDevice.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/andyoneil/Development/mock-humbl-pedal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o -MF CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o -c /Users/andyoneil/Development/mock-humbl-pedal/build/MockLooperDevice_autogen/mocs_compilation.cpp

CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andyoneil/Development/mock-humbl-pedal/build/MockLooperDevice_autogen/mocs_compilation.cpp > CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.i

CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andyoneil/Development/mock-humbl-pedal/build/MockLooperDevice_autogen/mocs_compilation.cpp -o CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.s

CMakeFiles/MockLooperDevice.dir/src/main.cpp.o: CMakeFiles/MockLooperDevice.dir/flags.make
CMakeFiles/MockLooperDevice.dir/src/main.cpp.o: /Users/andyoneil/Development/mock-humbl-pedal/src/main.cpp
CMakeFiles/MockLooperDevice.dir/src/main.cpp.o: CMakeFiles/MockLooperDevice.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/andyoneil/Development/mock-humbl-pedal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/MockLooperDevice.dir/src/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MockLooperDevice.dir/src/main.cpp.o -MF CMakeFiles/MockLooperDevice.dir/src/main.cpp.o.d -o CMakeFiles/MockLooperDevice.dir/src/main.cpp.o -c /Users/andyoneil/Development/mock-humbl-pedal/src/main.cpp

CMakeFiles/MockLooperDevice.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MockLooperDevice.dir/src/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andyoneil/Development/mock-humbl-pedal/src/main.cpp > CMakeFiles/MockLooperDevice.dir/src/main.cpp.i

CMakeFiles/MockLooperDevice.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MockLooperDevice.dir/src/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andyoneil/Development/mock-humbl-pedal/src/main.cpp -o CMakeFiles/MockLooperDevice.dir/src/main.cpp.s

CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o: CMakeFiles/MockLooperDevice.dir/flags.make
CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o: /Users/andyoneil/Development/mock-humbl-pedal/src/main_window.cpp
CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o: CMakeFiles/MockLooperDevice.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/andyoneil/Development/mock-humbl-pedal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o -MF CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o.d -o CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o -c /Users/andyoneil/Development/mock-humbl-pedal/src/main_window.cpp

CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andyoneil/Development/mock-humbl-pedal/src/main_window.cpp > CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.i

CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andyoneil/Development/mock-humbl-pedal/src/main_window.cpp -o CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.s

CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o: CMakeFiles/MockLooperDevice.dir/flags.make
CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o: /Users/andyoneil/Development/mock-humbl-pedal/src/ble_service.cpp
CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o: CMakeFiles/MockLooperDevice.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/andyoneil/Development/mock-humbl-pedal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o -MF CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o.d -o CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o -c /Users/andyoneil/Development/mock-humbl-pedal/src/ble_service.cpp

CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andyoneil/Development/mock-humbl-pedal/src/ble_service.cpp > CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.i

CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andyoneil/Development/mock-humbl-pedal/src/ble_service.cpp -o CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.s

CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o: CMakeFiles/MockLooperDevice.dir/flags.make
CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o: /Users/andyoneil/Development/mock-humbl-pedal/src/mock_device.cpp
CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o: CMakeFiles/MockLooperDevice.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/andyoneil/Development/mock-humbl-pedal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o -MF CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o.d -o CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o -c /Users/andyoneil/Development/mock-humbl-pedal/src/mock_device.cpp

CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andyoneil/Development/mock-humbl-pedal/src/mock_device.cpp > CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.i

CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andyoneil/Development/mock-humbl-pedal/src/mock_device.cpp -o CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.s

# Object files for target MockLooperDevice
MockLooperDevice_OBJECTS = \
"CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/MockLooperDevice.dir/src/main.cpp.o" \
"CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o" \
"CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o" \
"CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o"

# External object files for target MockLooperDevice
MockLooperDevice_EXTERNAL_OBJECTS =

MockLooperDevice.app/Contents/MacOS/MockLooperDevice: CMakeFiles/MockLooperDevice.dir/MockLooperDevice_autogen/mocs_compilation.cpp.o
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: CMakeFiles/MockLooperDevice.dir/src/main.cpp.o
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: CMakeFiles/MockLooperDevice.dir/src/main_window.cpp.o
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: CMakeFiles/MockLooperDevice.dir/src/ble_service.cpp.o
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: CMakeFiles/MockLooperDevice.dir/src/mock_device.cpp.o
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: CMakeFiles/MockLooperDevice.dir/build.make
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: /opt/homebrew/opt/qt@6/lib/QtWidgets.framework/Versions/A/QtWidgets
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: /opt/homebrew/opt/qt@6/lib/QtBluetooth.framework/Versions/A/QtBluetooth
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: /opt/homebrew/opt/qt@6/lib/QtDBus.framework/Versions/A/QtDBus
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: /opt/homebrew/opt/qt@6/lib/QtGui.framework/Versions/A/QtGui
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: /opt/homebrew/opt/qt@6/lib/QtNetwork.framework/Versions/A/QtNetwork
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: /opt/homebrew/opt/qt@6/lib/QtCore.framework/Versions/A/QtCore
MockLooperDevice.app/Contents/MacOS/MockLooperDevice: CMakeFiles/MockLooperDevice.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/andyoneil/Development/mock-humbl-pedal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable MockLooperDevice.app/Contents/MacOS/MockLooperDevice"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MockLooperDevice.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MockLooperDevice.dir/build: MockLooperDevice.app/Contents/MacOS/MockLooperDevice
.PHONY : CMakeFiles/MockLooperDevice.dir/build

CMakeFiles/MockLooperDevice.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MockLooperDevice.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MockLooperDevice.dir/clean

CMakeFiles/MockLooperDevice.dir/depend:
	cd /Users/andyoneil/Development/mock-humbl-pedal/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andyoneil/Development/mock-humbl-pedal /Users/andyoneil/Development/mock-humbl-pedal /Users/andyoneil/Development/mock-humbl-pedal/build /Users/andyoneil/Development/mock-humbl-pedal/build /Users/andyoneil/Development/mock-humbl-pedal/build/CMakeFiles/MockLooperDevice.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/MockLooperDevice.dir/depend

