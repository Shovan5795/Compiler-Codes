!ALLOW dotHfile

BEGIN

TYPE PURNOSHONGKHA x;
TYPE PURNOSHONGKHA y==12;
TYPE PURNOSHONGKHA z==2;
TYPE SENTENCE s=="My name is shovon";

<&
This is my own source code with my own syntax
This is multiline comment
&>

get[x];
get[y];
get[z];

@@Single line comment

@@Adding two values
x==y++z;
put[x];

@@Subtracting between two values
x==y--z;
put[x];

@@Multiplicating two values
x==y**z;
put[z];

@@division of two values
x==y%%z;
put[x];

@@conditionals
because y>>z
thats why
put[y]

END

