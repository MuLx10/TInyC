%{
#include <stdio.h>
extern int yylex();
void yyerror(char *s);
%}
%union {
  int intval;
  float floatval;
  char *charval;
}
%token SINGLE_LINE_COMMENT
%token MULTI_LINE_COMMENT 
%token AUTO
%token BREAK
%token CASE
%token CHAR
%token CONST
%token CONTINUE
%token DEFAULT
%token DO
%token DOUBLE
%token ELSE
%token ENUM
%token EXTERN
%token FLOAT
%token FOR
%token GOTO
%token IF
%token INLILE
%token INT
%token LONG
%token REGISTER
%token RESTRICT
%token RETURN
%token SHORT
%token SIGNED
%token SIZEOF
%token STATIC
%token STRUCT
%token SWITCH
%token TYPEDEF
%token UNION
%token UNSIGNED
%token VOID
%token VOLATILE
%token WHILE
%token BOOL
%token COMPLEX
%token IMAGINARY
%token IDENTIFIER
%token<intval> INTEGER_CONSTANT
%token<floatval> FLOATING_CONSTANT
%token<charval> CHARACTER_CONSTANT
%token<charval> STRING_LITERAL
%token SQBRACOPEN
%token SQBRACCLOSE
%token ROBRACOPEN
%token ROBRACCLOSE
%token CURBRACOPEN
%token CURBRACCLOSE
%token DOT
%token ACC
%token INC
%token DEC
%token AMP
%token MUL
%token ADD
%token SUB
%token NEG
%token EXCLAIM
%token DIV
%token MOD
%token SHL
%token SHR
%token BITSHL
%token BITSHR
%token LTE
%token GTE
%token EQ
%token NEQ
%token AND
%token OR
%token QUESTION
%token COLON
%token SEMICOLON
%token DOTS
%token ASSIGN
%token STAREQ
%token DIVEQ
%token MODEQ
%token PLUSEQ
%token MINUSEQ
%token SHLEQ
%token SHREQ
%token BINANDEQ
%token BINXOREQ
%token BINOREQ
%token COMMA
%token HASH
%%
statement : ;
%%

void yyerror(char *s) {
    printf("%s\n",s);
}