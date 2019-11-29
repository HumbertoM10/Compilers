#include <limits.h> 
#include <stdio.h> 
#include <stdlib.h> 
 
int nodeCount = 1;
char currentParent = 1;

struct Stack { 
    int top; 
    unsigned capacity; 
    char* array; 
};

struct Stack* createStack(unsigned capacity) { 
    struct Stack* stack = (struct Stack*)malloc(sizeof(struct Stack)); 
    stack->capacity = capacity; 
    stack->top = -1; 
    stack->array = (char*)malloc(stack->capacity * sizeof(char)); 
    return stack; 
} 
  
int isFull(struct Stack* stack) { 
    return stack->top == stack->capacity - 1; 
} 
  
int isEmpty(struct Stack* stack) { 
    return stack->top == -1; 
} 
   
void push(struct Stack* stack, char item) { 
    if (isFull(stack)){
        printf("ERROR, stack overflow");
		exit(1);
    }
    stack->array[++stack->top] = item; 
    //printf("%c pushed to stack\n", item); 
} 
  
char pop(struct Stack* stack) { 
    if (isEmpty(stack)){
        printf("ERROR, empty stack");
		exit(1);
    }
    return stack->array[stack->top--]; 
} 
  
char peek(struct Stack* stack) { 
    if (isEmpty(stack)){
    	printf("ERROR, empty stack");
		exit(1);
    }
    return stack->array[stack->top]; 
}

void graphGen(char *s){
	nodeCount++;
	printf("\t%d [label=\"%s\"];\n", nodeCount, s);
	printf("\t%d--%d\n", currentParent, nodeCount);
}

void gError() { 
    printf("ERROR, invalid word");
	exit(1);
}

int main(argc,argv) 
int argc ;
char **argv;
{
	if (argc > 2) {
		FILE *file;

		file = fopen(argv[2], "r" ) ;
		if (!file) {
			fprintf(stderr,"could not open %s\n",argv[2]);
			exit(1);
		}
		struct Stack* stack = createStack(1024);
		struct Stack* stack2 = createStack(1024);
		push(stack2, '$');
		push(stack, '$');
		push(stack, 'E');
		char ch;
		ch = fgetc(file);
		printf("strict graph G {\n");
		printf("\t%s\n", "1 [label=\"E\"];");
		while (ch != EOF){
			//'\''
			//fgetc, ungetc(ch, file)
			//E' = A, F' = B
			if (ch=='+'){
				//E', T'
				if (peek(stack) == 'A'){
					//printf(%c, pop(stack));
					pop(stack);
					push(stack, 'A');
					push(stack, 'T');
					
					graphGen("+");
					graphGen("T");
					graphGen("E'");
					push(stack2, nodeCount);
					currentParent = nodeCount-1;		
					ch = fgetc(file);
				}else if (peek(stack) == 'B'){
					pop(stack);

					graphGen("epsilon");
					currentParent = pop(stack2);
				}else {
					gError();
				}
				
			}
			if (ch=='*'){
				//T'
				if (peek(stack) == 'B'){
					pop(stack);
					push(stack, 'B');
					push(stack, 'F');

					graphGen("*");
					graphGen("F");
					graphGen("T'");
					push(stack2, nodeCount);
					currentParent = nodeCount-1;
					ch = fgetc(file);
				}else {
					gError();
				}
					
			}
			if (ch=='('){
				//E, T, F
				if (peek(stack) == 'E'){
					pop(stack);
					push(stack, 'A');
					push(stack, 'T');

					graphGen("T");
					graphGen("E'");
					push(stack2, nodeCount);
					currentParent = nodeCount-1;
				}else if (peek(stack) == 'T'){
					pop(stack);
					push(stack, 'B');
					push(stack, 'F');

					graphGen("F");
					graphGen("T'");
					push(stack2, nodeCount);
					currentParent = nodeCount-1;
				}else if (peek(stack) == 'F'){
					pop(stack);
					push(stack, ')');
					push(stack, 'E');

					graphGen("(");
					graphGen("E");
					graphGen(")");
					currentParent = nodeCount-1;
					ch = fgetc(file);
				}else {
					gError();
				}
			}
			if (ch==')'){
				//E', T'
				if (peek(stack) == 'A'){
					pop(stack);
					graphGen("epsilon");
					currentParent = pop(stack2);
				}else if (peek(stack) == 'B'){
					pop(stack);
					graphGen("epsilon");
					currentParent = pop(stack2);
				}else if (peek(stack) == ')'){
					pop(stack);
					ch = fgetc(file);
				}else {
					gError();
				}
			}
			if (isalpha(ch)){
				//F
				while (isalpha(ch)){
					ch = fgetc(file);
				}
				ungetc(ch, file);
				ch = 'a';
				if (peek(stack) == 'E'){
					pop(stack);
					push(stack, 'A');
					push(stack, 'T');
					
					graphGen("T");
					graphGen("E'");
					push(stack2, nodeCount);
					currentParent = nodeCount-1;
				}else if (peek(stack) == 'T'){
					pop(stack);
					push(stack, 'B');
					push(stack, 'F');

					graphGen("F");
					graphGen("T'");
					push(stack2, nodeCount);
					currentParent = nodeCount-1;
				}else if (peek(stack) == 'F'){
					pop(stack);

					graphGen("id");
					currentParent = pop(stack2);
					ch = fgetc(file);
				}else {
					gError();
				}

			}
		}
		while (!isEmpty(stack)){
			//Looking for $
			if (peek(stack) == 'A'){
				pop(stack);
				graphGen("epsilon");
				currentParent = pop(stack2);
			}else if (peek(stack) == 'B'){
				pop(stack);
				graphGen("epsilon");
				currentParent = pop(stack2);
			}else if (peek(stack) == '$'){
				pop(stack);
				printf("}\n");
			}else {
				gError();
			}
		}
	   	fclose(file);	
	}
	

	return 0;
}