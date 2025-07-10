CXX = g++
CXXFLAGS = -Wall -O2 -Isrc/include
LDFLAGS =

SRC_DIR = src
TEST_DIR = tests
BUILD_DIR = build

TARGET_APP = $(BUILD_DIR)/simple-library
TARGET_TEST = $(BUILD_DIR)/simple-library-test

SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
SRC_OBJS = $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(notdir $(SRC_FILES)))

TEST_FILES = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJS = $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(notdir $(TEST_FILES)))

all: $(TARGET_APP) $(TARGET_TEST)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: $(TEST_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET_APP): $(SRC_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

TEST_LIB_OBJS = $(filter-out $(BUILD_DIR)/main.o, $(SRC_OBJS))

$(TARGET_TEST): $(TEST_LIB_OBJS) $(TEST_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm -rf $(BUILD_DIR)

