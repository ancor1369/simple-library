CXX := g++
CXXFLAGS := -std=c++20 -Iinclude
BIN_DIR := build

all: $(BIN_DIR)/simple-library $(BIN_DIR)/simple-library-test

$(BIN_DIR)/simple-library: src/main.cpp src/file_creator.cpp
	mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ src/main.cpp src/file_creator.cpp

$(BIN_DIR)/simple-library-test: tests/file_creator_test.cpp src/file_creator.cpp
	mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ tests/file_creator_test.cpp src/file_creator.cpp -lgtest -lgtest_main -pthread

clean:
	rm -rf $(BIN_DIR)
