# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /usr/local/lib/python3.11/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /usr/local/lib/python3.11/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build

# Include any dependencies generated for this target.
include solver_code/CMakeFiles/emosqpstatic.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.make

# Include the progress variables for this target.
include solver_code/CMakeFiles/emosqpstatic.dir/progress.make

# Include the compile flags for this target's objects.
include solver_code/CMakeFiles/emosqpstatic.dir/flags.make

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/auxil.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/auxil.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/auxil.c > CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/auxil.c -o CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/error.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/error.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/error.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/error.c > CMakeFiles/emosqpstatic.dir/src/osqp/error.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/error.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/error.c -o CMakeFiles/emosqpstatic.dir/src/osqp/error.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/lin_alg.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/lin_alg.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/lin_alg.c > CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/lin_alg.c -o CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/osqp.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/osqp.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/osqp.c > CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/osqp.c -o CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/proj.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/proj.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/proj.c > CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/proj.c -o CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/scaling.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/scaling.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/scaling.c > CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/scaling.c -o CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/util.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/util.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/util.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/util.c > CMakeFiles/emosqpstatic.dir/src/osqp/util.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/util.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/util.c -o CMakeFiles/emosqpstatic.dir/src/osqp/util.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/kkt.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/kkt.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/kkt.c > CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/kkt.c -o CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/workspace.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/workspace.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/workspace.c > CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/workspace.c -o CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl.c > CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl.c -o CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.s

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o: solver_code/CMakeFiles/emosqpstatic.dir/flags.make
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o: /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl_interface.c
solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o: solver_code/CMakeFiles/emosqpstatic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o -MF CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o.d -o CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o -c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl_interface.c

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.i"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl_interface.c > CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.i

solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.s"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code/src/osqp/qdldl_interface.c -o CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.s

# Object files for target emosqpstatic
emosqpstatic_OBJECTS = \
"CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o" \
"CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o"

# External object files for target emosqpstatic
emosqpstatic_EXTERNAL_OBJECTS =

solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/auxil.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/error.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/lin_alg.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/osqp.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/proj.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/scaling.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/util.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/kkt.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/workspace.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/src/osqp/qdldl_interface.c.o
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/build.make
solver_code/out/libemosqpstatic.a: solver_code/CMakeFiles/emosqpstatic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking C static library out/libemosqpstatic.a"
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && $(CMAKE_COMMAND) -P CMakeFiles/emosqpstatic.dir/cmake_clean_target.cmake
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/emosqpstatic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
solver_code/CMakeFiles/emosqpstatic.dir/build: solver_code/out/libemosqpstatic.a
.PHONY : solver_code/CMakeFiles/emosqpstatic.dir/build

solver_code/CMakeFiles/emosqpstatic.dir/clean:
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code && $(CMAKE_COMMAND) -P CMakeFiles/emosqpstatic.dir/cmake_clean.cmake
.PHONY : solver_code/CMakeFiles/emosqpstatic.dir/clean

solver_code/CMakeFiles/emosqpstatic.dir/depend:
	cd /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/solver_code /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code /Users/sarathmenon/Documents/eth_courses/notebooks/control/MPC/MPC_code/c/build/solver_code/CMakeFiles/emosqpstatic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : solver_code/CMakeFiles/emosqpstatic.dir/depend

