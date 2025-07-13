
all: main.o file_creator.o
	$(CXX) -o my_program main.o file_creator.o 

main.o: src/main.cpp
	$(CXX) -c src/main.cpp

file_creator.o: src/file_creator.cpp
	$(CXX) -c src/file_creator.cpp -I src/include/

clean:
	rm -rf file_creator.o main.o my_program
