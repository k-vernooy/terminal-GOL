.PHONY: all say_hello generate clean

CC = g++
prefix=/usr/local

all: compile

compile:
	@echo "Compiling..."
	@mkdir bin
	@${CC} -std=c++11 src/iterCalc.cpp -o bin/iterCalc
	@printf "\e[32mCompiled successfuly!\e[0m\n"
	@sleep .4
	@printf "To copy the binaries now run '\e[31mmake install\e[0m'\n"
install:
	@echo "Copying executables..."
	@install -m 0755 bin/iterCalc $(prefix)/bin
	@install -m 0755 terminalGOL $(prefix)/bin
	@printf "\x1b[32mSuccessfully copied binaries.\x1b[0m \nRun command '\x1b[31mterminalGOL\x1b[0m' to start program!\n"