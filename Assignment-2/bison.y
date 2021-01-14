/* C Declarations */

%{
	#include<stdio.h>
	int sym[26], store[26];
%}

/* BISON Declarations */

%token NUM VAR IF ELSE VOIDMAIN PRINT INT LT GT PLUS MINUS MUL DIV ASSIGN LP RP LB RB sm cm
%nonassoc IFX
%nonassoc ELSE
%left LT GT
%left PLUS MINUS
%left MUL DIV

/* Simple grammar rules */

%%

program: VOIDMAIN LP RP LB cstatement RB
	 ;

cstatement: /* empty */

	| cstatement statement



	;
declaration: TYPE ID1 
			;
			
TYPE : INT
     ;

ID1  : ID1 cm VAR	{
						if(store[$3] == 1)
						{
							printf("%c is already declared\n", $3 + 97);
						}
						else
						{
							store[$3] = 1;
						}
			        }

     |VAR	{
				if(store[$1] == 1)
				{
					printf("%c is already declared\n", $1 + 97 );
				}
				else
				{
					store[$1] = 1;
				}
			}

     ;
    

statement: sm
    | declaration sm
    | expression sm 			{ printf("value of expression: %d\n", $1); }
	| PRINT expression sm    		{printf("%d\n",$2);}
    | VAR ASSIGN expression sm 		{ 
							sym[$1] = $3; 
							if(store[$1] == 1){
							printf("Value of the variable: %d\t\n",$3);
							}
							else{
							printf("error: '%c' undeclared\n",$1+97);
							}
							$$ = $3;
						}

    | IF expression expression sm %prec IFX {
								if($2)
								{
									printf("\nvalue of expression in IF: %d\n",$3);
								}
								else
								{
									printf("condition value zero in IF block\n");
								}
							}

	| IF expression expression sm ELSE expression sm {
											if($2){
												printf("Value of If condition : %d \n" , $3);
											}
											else{
												printf("Value of else condition : %d \n", $6);
											}
										}
	;

expression: NUM				{ $$ = $1; 	}

	| VAR				{ $$ = sym[$1]; }


	| expression PLUS expression	{ $$ = $1 + $3; }

	| expression MINUS expression	{ $$ = $1 - $3; }

	| expression MUL expression	{ $$ = $1 * $3; }

	| expression DIV expression	{ 	if($3) 
				  		{
				     			$$ = $1 / $3;
				  		}
				  		else
				  		{
							$$ = 0;
							printf("\ndivision by zero\t");
				  		} 	
				    	}

	| expression LT expression	{ $$ = $1 < $3; }

	| expression GT expression	{ $$ = $1 > $3; }

	| LP expression RP		{ $$ = $2;	}
	
	;

%%

yyerror(char *s) /* called by yyparse on error */
{
	printf("%s\n",s);
	return (0);
}
