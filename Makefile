CXX      = g++
CXXFLAGS = -Wall -O2 -Isrc/include
LDFLAGS  =
GTEST_LDFLAGS = -lgtest -pthread   # link flags for the test binary

BUILD    = build
SRC_OBJS = $(BUILD)/main.o $(BUILD)/file_creator.o
TEST_OBJS = $(BUILD)/file_creator_test.o

# Default target builds both binaries
all: $(BUILD)/simple-library $(BUILD)/simple-library-test

# ---- Main binary ----
$(BUILD)/simple-library: $(SRC_OBJS) | $(BUILD)
	$(CXX) $(LDFLAGS) $^ -o $@

# ---- Test binary ----
$(BUILD)/simple-library-test: $(SRC_OBJS) $(TEST_OBJS) | $(BUILD)
	$(CXX) $(LDFLAGS) $^ -o $@ $(GTEST_LDFLAGS)

# ---- Object rules ----
$(BUILD)/%.o: src/%.cpp | $(BUILD)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD)/%.o: tests/%.cpp | $(BUILD)
	$(CXX) $(CXXFLAGS) -Isrc -c $< -o $@

# Create build directory if it doesn't exist
$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)
