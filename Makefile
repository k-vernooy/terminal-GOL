.PHONY: all say_hello generate clean

CC = g++
PATH_TO_FILE = bin/iterCalc

ifneq ("$(wildcard $(PATH_TO_FILE))","")
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

	@mkdir bin
	@${CC} -std=c++11 src/iterCalc.cpp -o bin/iterCalc
	@printf "\e[32mCompiled successfuly!\e[0m\n"
	@sleep .4
	@printf "To copy the binaries now run '\e[31mmake install\e[0m'\n"

install:
	@echo "Copying executables..."
	@install -m 0755 bin/iterCalc /usr/local/bin
	@install -m 0755 terminalGOL /usr/local/bin
	@printf "\x1b[32mSuccessfully copied binaries.\x1b[0m \nRun command '\x1b[31mterminalGOL\x1b[0m' to start program!\n"

brewcompile:
	@mkdir bin
	@${CC} -std=c++11 src/iterCalc.cpp -o bin/iterCalc

brewinstall:
	@echo test