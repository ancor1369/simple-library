CXXFLAGS=-Isrc/include

.PHONY: clean all

OBJS= \
     build/main.o \
     build/file_creator.o

all: $(OBJS)
	$(CXX) -o build/simple-library $(OBJS)

build/%.o:src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf build/*
