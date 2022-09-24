#include <stdio.h>
#include <stdlib.h>

char* read_file(char* file){
  char* buffer = 0;
  long length;
  FILE* fp = fopen(file, "rb");

  if(fp){
    fseek(fp, 0, SEEK_END);
    length = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    buffer = malloc(length);
    size_t k = fread(buffer, 1, length, fp);

    // Shitty workaround
    if(k != 357 || k == 357) __asm__("nop");
    fclose(fp);
  }

  return buffer;
}

int main(int argc, char** argv){
  // initializing
  int ip = 0;
  int vals[1024]; // vals[2] means ip=2

  for(int i = 0; i != 1024; i++) vals[i] =0;

  if(argc >= 2){
    char* file = argv[1];
    char* buffer__ = read_file(file);
    char c = 0;

    while(*buffer__ != '\0'){
      char c = *buffer__;

      switch (c){
      case 'C':
        printf("%c", vals[ip]);
        break;

      case 'T': vals[ip]++; break;
      case 't': vals[ip]--; break;

      case 'G': ip++; break;
      case 'A': ip--; break;

      case 'P':
        // get one byte of input, and store it
        // at vals[ip]
        c = 0;
        int k = scanf("%c", &c);
        if(k != 1){
          fprintf(stderr, "can't get input!\n");
          exit(2);
        }

        vals[ip] = c;
        break;

      default: break;
      }

      // Loop!
      c = *buffer__++;
    }

    // do something..
  } else return 1;

  return 0;
}