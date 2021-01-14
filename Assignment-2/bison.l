%{
#include <stdio.h>
#include <stdlib.h>
#include "bison.tab.h"
extern int yylval;
%}


multiline_comment [ ]*[<][&][a-zA-Z0-9!@#$*(){}_+-,.:\|?><\n\t ]*[&][>]
singleline_comment ['@@']+.*

/*RE and Action*/

%%
[0-9]+	{ 
		yylval = atoi(yytext);
		return NUM;
	}

[a-z]	{
		yylval = *yytext - 'a';
		return	VAR;
	}

"because"		{ return IF;}
"or"		{ return ELSE;}
"BEGIN"	{ return VOIDMAIN; }
"put" { return PRINT;}
{multiline_comment} {printf("Got Multiline comment\n ");}
{singleline_comment} {printf("Got Singleline comment\n ");}
"PURNOSHONGKHA" {return INT;}
"++"	{ return PLUS; }
"--"	{ return MINUS; }
"**"	{ return MUL; }
"%%"	{ return DIV; }
"<<"    { return LT;  }
">>"    { return GT;  }
"=="    { return ASSIGN;  }
"("    { return LP;  }
")"    { return RP;  }
"{"    { return LB;  }
"}"    { return RB;  }
","	{ return cm; }
";"	{ return sm; }

[ \t\n]*	;

.	{
		yyerror("Unknown Character.\n");
	}

%%
/* user subroutines */

int yywrap(){

return 1;

}

int main()
{
    yyin=freopen("bison.txt","r",stdin);
    yyout=freopen("b.txt","w",stdout);
    yyparse();
    yylex();
    fclose(yyin);
    fclose(yyout);   
    return 0;
}


