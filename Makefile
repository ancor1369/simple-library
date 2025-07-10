CC = g++

OBJECTS = src/main.o src/file_creator.o
OBJECTS_TEST = tests/file_creator_test.o
INCLUDES = src/include
INCLUDES_GTEST = /home/$(USER)/playground

all: simple-library simple-library-test

simple-library: $(OBJECTS)
	echo $(USER)
	$(CC) -o src/simple-library $(OBJECTS)

simple-library-test: $(OBJECTS_TEST)
	echo $(USER)
	$(CC) -o tests/simple-library-test $(OBJECTS_TEST) -lgtest -lgtest_main -pthread

src/%.o: src/%.cpp
	$(CC) -c $< -o $@ -I$(INCLUDES)

tests/%.o: tests/%.cpp
	$(CC) -c $< -o $@ -I$(INCLUDES) -I$(INCLUDES_GTEST)

clean:
	echo "Cleaning up..."
	rm -f src/simple-library tests/simple-library-test
	rm -f src/*.o tests/*.o

install:
	echo "Installing..."
	mkdir -p /usr/local/bin
	cp simple-library /usr/local/bin/
	cp simple-library-test /usr/local/bin/
	echo "Installation complete."

uninstall:
	echo "Uninstalling..."
	rm -f /usr/local/bin/simple-library
	rm -f /usr/local/bin/simple-library-test
	echo "Uninstallation complete."
