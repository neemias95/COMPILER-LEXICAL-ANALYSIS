%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    int line =1, numAttr, yylval;
    char *strAttr;
    char arry [10000][10000];

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
if          {printf("%s, ", yytext);}
else        {printf("%s, ", yytext);}
while       {printf("%s, ", yytext);}
int         {printf("%s, ", yytext);}
void        {printf("%s, ", yytext);}
return      {printf("%s, ", yytext);}
{id}        {printf("ID, ");}  // error is on these two lines
{number}    {printf("NUM, ");} //

"("         {printf("%s, ", yytext);}
")"         {printf("%s, ", yytext);}
"["         {printf("%s, ", yytext);}
"]"         {printf("%s, ", yytext);}
"{"         {printf("%s, ", yytext);}
"}"         {printf("%s, ", yytext);}
";"         {printf("%s, ", yytext);}
","         {printf("%s, ", yytext);}

"+"         {printf("%s, ", yytext);}
"-"         {printf("%s, ", yytext);}
"*"         {printf("%s, ", yytext);}
"/"         {printf("%s, ", yytext);}
"!="        {printf("%s, ", yytext);}
"="         {printf("%s, ", yytext);}
"=="        {printf("%s, ", yytext);}
"<"         {printf("%s, ", yytext);}
"<="        {printf("%s, ", yytext);}
">"         {printf("%s, ", yytext);}
">="        {printf("%s, ", yytext);}
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]       { 
                                                int length = strlen(yytext);
                                                int i;
                                                for(i = 0; i < length; i++){
                                                   if(yytext[i] == '\n'){
                                                       line++;
                                                   }
                                                }
                                            /* do nothing */ }
"//".*      {/* do nothing */}
.       {printf("\n\nErro na linha %d no token %s\n", line, yytext);}

%%


int yywrap(void){
	return 1;
}

int main(){
	yylex();
	return 0;
}