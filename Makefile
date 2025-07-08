CC=g++

CFLAGS=-Isrc/include

.PHONY: clean all

OBJS= \
	main.o \
	file_creator.o

all: $(OBJS)
	$(CC) -o simple-library $(OBJS)

%.o:src/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf *.o
	rm -rf simple-library

