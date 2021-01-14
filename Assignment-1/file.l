%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int key=0, op=0, i=0,d=0,s=0,p=0;
%}


keyword   TYPE|PURNOSHONGKHA|BEGIN|END|ALLOW|SENTENCE

operator  [+][+]|[-][-]|[*][*]|[%][%]|[=][=]|[<][<]|[>][>]

id [a-zA-Z][a-zA-Z0-9]*

DIGIT [0-9]

string \"(\\.|[^"])*\"

punctuation [;]|"["|"]"|"!"

multiline_comment [ ]*[<][&][a-zA-Z0-9!@#$*(){}_+-,.:\|?><\n\t ]*[&][>]

singleline_comment ['@@']+.*

%%

{keyword} {printf("Got Keyword "); key++;}

{operator} {printf("Got Operator "); op++;}

{id} {printf("Got Id "); i++;}

{DIGIT}+  {printf("got Digit: %s (%d)\n", yytext,atoi( yytext ) ); d++;}

{string} {printf("Got String "); s++;}

{punctuation} {printf("Got punctuation "); p++;}

{multiline_comment} {printf("Got Multiline comment ");}

{singleline_comment} {printf("Got Singleline comment ");}

%%

int yywrap(){

return 1;

}

int main()
{
    yyin=freopen("file.c","r",stdin);
    yyout=freopen("fout.txt","w",stdout);
    yylex();
    printf("Total no. of keywords,operators,ids,digits,strings and punctuations are given below:");
    printf("\nNo. of keywords: %d",key);
    printf("\nNo. of operators: %d",op);
    printf("\nNo. of ids: %d",i);
    printf("\nNo. of digits: %d",d);
    printf("\nNo. of strings: %d",key);
    printf("\nNo. of punctuations: %d",p);
   
    
    fclose(yyin);
    fclose(yyout);
    return 0;

}