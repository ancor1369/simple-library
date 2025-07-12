CXX = g++
CXXFLAGS = -Wall -O2 -Isrc/include
LDFLAGS =

SRC_DIR = src
BUILD_DIR = build

TARGET_APP = $(BUILD_DIR)/simple-library

SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
SRC_OBJS = $(patsubst %.cpp,$(BUILD_DIR)/%.o,$(notdir $(SRC_FILES)))

all: $(TARGET_APP)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET_APP): $(SRC_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

clean:
	rm -rf $(BUILD_DIR)
