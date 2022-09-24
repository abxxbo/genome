CC 			:= gcc
CFLAGS  := -Wall -Wextra -O3 -g -std=c99

all: clear genome

clear:
	rm -rf bin


genome: src/genome.c
	mkdir -p bin
	$(CC) $^ $(CFLAGS) -o bin/genome
	nasm -fbin src/genome.asm -o bin/genome_repl