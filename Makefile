.PHONY: all say_hello generate clean

CC = g++
iterCalcCompiled = bin/iterCalc

ifneq ("$(wildcard $(iterCalcCompiled))","")
	# @printf "\x1b[31mProgram already compiled, exiting...\e[0m\n"
all: exit
else
all: compile
endif

exit:
	@printf "Compiling...\n"
	@sleep .3
	@printf "\x1b[31mProgram already compiled, exiting... see 'make install' to move the binaries\e[0m\n"

compile:
	@echo "Compiling..."
	@${CC} -std=c++11 src/iterCalc.cpp -o bin/iterCalc
	@printf "\e[32mCompiled successfuly!\e[0m\n"
	@sleep .4
	@printf "To copy the binaries now run '\e[31mmake install\e[0m'\n"

install:
	@echo "Copying executables..."
	@install -m 0755 bin/iterCalc /usr/local/bin
	@install -m 0755 bin/terminalGOL /usr/local/bin
	@printf "\x1b[32mSuccessfully copied binaries.\x1b[0m \nRun command '\x1b[31mterminalGOL\x1b[0m' to start program!\n"

brewcompile:
	@${CC} -std=c++11 src/iterCalc.cpp -o bin/iterCalc