CXX := g++
CXXFLAGS := -std=c++11 -Iinclude

all: simple-library simple-library-test

simple-library: src/main.cpp src/file_creator.cpp
	$(CXX) $(CXXFLAGS) -o simple-library src/main.cpp src/file_creator.cpp

simple-library-test: tests/file_creator_test.cpp src/file_creator.cpp
	$(CXX) $(CXXFLAGS) -o simple-library-test tests/file_creator_test.cpp src/file_creator.cpp -lgtest -lgtest_main -pthread

clean:
	rm -f simple-library simple-library-test

