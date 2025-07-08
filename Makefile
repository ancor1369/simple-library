CC=g++

CFLAGS=-Isrc/include

.PHONY: clean all

OBJS= \
	build/main.o \
	build/file_creator.o

all: $(OBJS)
	$(CC) -o build/simple-library $(OBJS)

build/%.o:src/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf build/*
