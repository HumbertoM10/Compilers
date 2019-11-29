#include <stdio.h>

int singleQuoteCounter, 
	doubleQuoteCounter, 
	parenthesesCounter, 
	bracketsCounter, 
	bracesCounter, 
	singleQuoteLine, 
	doubleQuoteLine, 
	singleQuoteFlag, 
	doubleQuoteFlag;
int fine = 1;
int currentLine = 1;

void checkEverythingElse(int character);

int main(int argc, char* argv[]){

	char const* const fileName = argv[1];
    FILE* file = fopen(fileName, "r");

	int character;

	while((character = getc(file)) != EOF){

		if(character == '/'){
            int aux;
			if((character = getc(file)) != '/'){
				if((character = getc(file)) != '*'){
					printf("There is a missing comment error in this line: %d \n", currentLine);
					fine = 0;
				}
				else{
					aux = getc(file);
					int commentLine = currentLine;
					while (character != '*' || aux != '/'){
						character = aux;
						if(aux == '\n'){
							currentLine++;
						}
						else if((aux = getc(file)) == EOF){
							printf("There is a missing */ error in this line: %d \n", commentLine);
							fine = 0;
						}
					}
				}
			}
        }
        else{
        	checkEverythingElse(character);
        }

		if(singleQuoteCounter % 2 != 0 && singleQuoteFlag){
			singleQuoteLine = currentLine;
			singleQuoteFlag = 0;
		}
		else if(doubleQuoteCounter % 2 != 0 && doubleQuoteFlag){
			doubleQuoteLine = currentLine;
			doubleQuoteFlag = 0;
		}
		else if(parenthesesCounter < 0){
			printf("There is a missing ( error in this line: %d \n", currentLine);
			parenthesesCounter++;
			fine = 0;
		}
		else if(bracketsCounter < 0){
			printf("There is a missing [ error in this line: %d \n", currentLine);
			bracketsCounter++;
			fine = 0;
		}
		else if(bracesCounter < 0){
			printf("There is a missing { error in this line: %d \n", currentLine);
			bracesCounter++;
			fine = 0;
		}
	}

	if(singleQuoteCounter % 2 != 0){
		printf("There is a missing ' error in this line: %d \n", singleQuoteLine);
		fine = 0;
	}
	if(doubleQuoteCounter % 2 != 0){
		printf("There is a missing \" error in this line: %d \n", doubleQuoteLine);
		fine = 0;
	}
	if(parenthesesCounter > 0){
		printf("There are a total of %d ) missing in this file \n", parenthesesCounter);
		fine = 0;
	}
	if(bracketsCounter > 0){
		printf("There are a total of %d ) missing in this file \n", bracketsCounter);
		fine = 0;
	}
	if(bracesCounter > 0){
		printf("There are a total of %d ) missing in this file \n", bracesCounter);
		fine = 0;
	}
	if(fine){
		printf("There are no errors in this file \n");
	}

	return 0;
}

void checkEverythingElse(int character){
	switch(character){
	    case 39:
	        singleQuoteCounter++;
	        singleQuoteFlag = 1;
	        break;
	    case '"':
	        doubleQuoteCounter++;
	        doubleQuoteFlag = 1;
	        break;
	    case '(':
	        parenthesesCounter++;
	        break;
	    case ')':
	        parenthesesCounter--;
	        break;
	    case '[':
	        bracketsCounter++;
	        break;
	    case ']':
	        bracketsCounter--;
	        break;
	    case '{':
	        bracesCounter++;
	        break;
	    case '}':
	        bracesCounter--;
	        break;
	    case '\n':
	        currentLine++;
	        break;
	    default :
	        break;
    }
}