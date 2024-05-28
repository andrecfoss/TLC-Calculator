grammar Calculator;

options {
    language = CSharp;
}

/*
** Syntax Rules 
*/

computation : assignment
            | expression
            ;

assignment  : IDENTIFIER '=' expression
            ;

expression  : expression '+' term | expression '-' term | term 
            ;
term        : term '*' factor | term '/' factor | factor 
            ;
factor      : value | '-' value 
            ;
value       : '(' expression ')' | NUMBER | IDENTIFIER
            ;

/*
** Lexer Rules
*/

fragment LETTER : [a-zA-Z]
                ;

fragment DIGIT  : [0-9]
                ;

NUMBER      : DIGIT+
            ;

IDENTIFIER  : LETTER ( LETTER | DIGIT )*
            ;

WHITESPACE  : [ \t\r\n]+ -> skip // skip spaces, tabs, newlines
            ;
