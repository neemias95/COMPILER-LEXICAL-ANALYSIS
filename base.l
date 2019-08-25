%{
    #include<stdio.h>
    #include<stdlib.h>
    #define IF 1
    #define ELSE 2
    #define WHILE 3
    #define INT 4
    #define VOID 5
    #define LPAREN 6
    #define RPAREN 7
    #define LBRACK 8
    #define NOT 30
    #define RBRACK 9
    #define LBRACE 10
    #define RBRACE 11
    #define SEMI 12
    #define COMMA 13
    #define PLUS 14
    #define MINUS 15
    #define TIMES 16
    #define DIV 17
    #define IS 18
    #define EQ 19
    #define NE 20
    #define LT 21
    #define LE 22
    #define GT 23
    #define GE 24
    #define NUM 25
    #define ID 26
    #define PUNCT 27
    #define OP 28
    #define RETURN 29
    int line =1, numAttr, yylval;
    char *strAttr;

    #ifndef FALSE
        #define FALSE 0
    #endif

    #ifndef TRUE
        #define TRUE 1
    #endif
%}

delim   [ \t]
ws      {delim}+
letter  [A-Za-z]
digit   [0-9]
id      ({letter}|_)({letter}|{digit}|_)*
number  {digit}+
%%
{ws}        {/* no action and no return */}
[\n]        {line++;}
if          {return(IF);}
else        {return(ELSE);}
while       {return(WHILE);}
int         {return(INT);}
void        {return(VOID);}
return      {return(RETURN);}
{id}        {return(ID);}  // error is on these two lines
{number}    {return(NUM);} //

"("         {yylval = LPAREN; return(PUNCT);}
")"         {yylval = RPAREN; return(PUNCT);}
"["         {yylval = LBRACK; return(PUNCT);}
"]"         {yylval = RBRACK; return(PUNCT);}
"{"         {yylval = LBRACE; return(PUNCT);}
"}"         {yylval = RBRACE; return(PUNCT);}
";"         {yylval = SEMI;   return(PUNCT);}
","         {yylval = COMMA;  return(PUNCT);}

"+"         {yylval = PLUS;   return(OP);}
"-"         {yylval = MINUS;  return(OP);}
"*"         {yylval = TIMES;  return(OP);}
"/"         {yylval = DIV;    return(OP);}
"!"         {yylval = NOT;    return(OP);}
"!="        {yylval = NE;     return(OP);}
"="         {yylval = IS;     return(OP);}
"=="        {yylval = EQ;     return(OP);}
"<"         {yylval = LT;     return(OP);}
"<="        {yylval = LE;     return(OP);}
">"         {yylval = GT;     return(OP);}
">="        {yylval = GE;     return(OP);}
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { /* do nothing */ }
"//".*      {/* do nothing */}
%%


int yywrap(void){
	return 1;
}

int main(){
	yylex();
	int val;
	while(val = yylex()){
        if(val == IF){
            printf("%s, ", yytext);
        }
        else if(val == ELSE){
            printf("%s, ", yytext);
        }
        else if(val == INT){
            printf("%s, ", yytext);
        }
        else if(val == VOID){
            printf("%s, ", yytext);
        }
        else if(val == RETURN){
            printf("%s, ", yytext);
        }
        else if(val == WHILE){
            printf("%s, ", yytext);
        }
        else if(val == PUNCT){
            printf("%s, ", yytext);
        }
        else if(val == OP){
            printf("%s, ", yytext);
        }
        else if(val == ID){
            printf("ID, ");
        }
        else if(val == NUM){
            printf("NUM, ");
        }
        else{
            printf("\nErro na linha %d\n", line);
        }
	}
    printf("\n");
	return 0;
}