CXX = g++
CXXFLAGS = -std=c++17 -Wall -Iinclude
LDFLAGS =

SRC_DIR = src
TEST_DIR = tests

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:.cpp=.o)

TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJS = $(TEST_SRCS:.cpp=.o)

TARGET = simple-library
TEST_TARGET = simple-library-test

.PHONY: all clean

all: $(TARGET) $(TEST_TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

$(TEST_TARGET): $(OBJS) $(TEST_OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@ -lgtest -lgtest_main -pthread

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(SRC_DIR)/*.o $(TEST_DIR)/*.o $(TARGET) $(TEST_TARGET)
