%{
#include<stdlib.h>
#include<stdio.h>
#include<string.h>

char string_table[10000];
int yylval=0;
int yyline=1;
int yycolumn=0;
int size=0;
int whitechar=0;

%}

%%
";"	  {yycolumn++;return SEMInumber;}
"(" 	  {yycolumn++;return LPARENnumber;}
"begin"   {yycolumn++;return BEGINnumber;}
"program" {yycolumn++;return PROGRAMnumber;}
"-" 	  {yycolumn++;return MINUSnumber;}
"*" 	  {yycolumn++;return TIMESnumber;}
"var"	  {yycolumn++;return VARnumber;}
"<<EOF>>" {yycolumn++;return EOFnumber;}
"," 	  {yycolumn++;return COMMAnumber;}
")"	  {yycolumn++;return RPARENnumber;}
"end" 	  {yycolumn++;return ENDnumber;}
"is"      {yycolumn++;return ISnumber;}
"+"       {yycolumn++;return PLUSnumber;}
"div"     {yycolumn++;return DIVnumber;}
"print"   {yycolumn++;return PRINTnumber;}
"="       {yycolumn++;return EQnumber;}
"\n"      {yyline++; yycolumn=0; }
[ ]       {whitechar++;}
[0-9]+          {yylval=atoi(yytext); yycolumn++; return ICONSTnumber;}
[a-zA-Z]+[0-9]* {size+yyleng; yylval=put_string(string_table,size); yycolumn++; return IDnumber;}
.               {yycolumn++; printf("Error in line %d\n",yyline); printf("Position %d\n",yycolumn); }

%%

int put_string(char *imAge, int lenGth) {
 strcpy(imAge+lenGth,yytext); 
 return size;
}




