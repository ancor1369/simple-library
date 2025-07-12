
simple-library: main.o file_creator.o
	$(CXX) -o simple-library main.o file_creator.o

main.o: src/main.cpp
	$(CXX) -c $< -o $@ 

file_creator.o: src/file_creator.cpp
	$(CXX) -c $< -o $@ -Isrc/include

clean:
	rm main.o file_creator.o simple-library
