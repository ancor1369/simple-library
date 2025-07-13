CXX = g++
CXXFLAGS = -Wall -O2 -Isrc/include

all: build/simple-library

build/simple-library: build/main.o build/file_creator.o
	$(CXX) -o $@ $^

build/main.o: src/main.cpp
	@mkdir -p build
	$(CXX) $(CXXFLAGS) -c $< -o $@

build/file_creator.o: src/file_creator.cpp
	@mkdir -p build
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf build
