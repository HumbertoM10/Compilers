main: main.c
	gcc main.c -o main
	gcc -O3 main.c -o main-optimized-level-3
	objdump -d ./main > not-optimized.log
	objdump -d ./main-optimized-level-3 > optimized-level-3.log