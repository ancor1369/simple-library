CC=g++

OBJECTS=/src/main.o /src/file_creator.o 
INCLUDES=/src/include/

all:$(OBJECTS)
	$(CC) -o main.bin $(OBJECTS)

%.o: %.cpp
	$(CC) -c $< -o $@ -I$(INCLUDES)

clean:
	echo "Cleaning up..."
	rm -f *.bin
	rm -f *.o

