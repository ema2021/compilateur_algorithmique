flex -o lexiqueL.c lexique.l
bison -d -o syntaxeY.c syntaxe.y
gcc -o $1 syntaxeY.c lexiqueL.c