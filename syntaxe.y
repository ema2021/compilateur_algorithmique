%{
#include <stdio.h>
extern FILE* yyin; //file pointer by default points to terminal
int yylex(void); // defini dans progL.cpp, utilise par yyparse()
void yyerror(const char * msg);
int lineNumber; // notre compteur de lignes
%}
%token Debut Fin // les lexemes que doit fournir yylex()
%token IDENTIF ENTIER AFFECT PTVIRG
%start program // l’axiome de notre grammaire
%%
program : Debut listInstr Fin {printf(" sqlt pgme\n");}
;
listInstr : listInstr inst
| inst
;
inst : IDENTIF AFFECT expr PTVIRG {printf(" instr affect\n");}
;
expr : ENTIER {printf(" expr entier \n");}
| IDENTIF {printf(" expr identif \n");}
;
%%
void yyerror( const char * msg){printf("line %d : %s", lineNumber, msg);
}
int main(int argc,char ** argv){
if(argc>1) yyin=fopen(argv[1],"r"); // check result !!!
lineNumber=1;
if(!yyparse()) printf("Expression correct\n");
return (0);

}