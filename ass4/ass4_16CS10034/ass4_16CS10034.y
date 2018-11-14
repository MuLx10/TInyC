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
%token COMMENT 
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
%token INLINE
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
%token ENUMERATION_CONSTANT
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
%token MODULO
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
%token BITXOR
%token BITOR
%token COMMA
%token HASH

%start translation_unit

%right THEN ELSE
%%

primary_expression
	: IDENTIFIER
	| constant
	| STRING_LITERAL
	| ROBRACOPEN expression ROBRACCLOSE
	{printf("------primary_expression ------\n");}
	;

argument_expression_list_opt
	:argument_expression_list
	|
	;

postfix_expression
	:primary_expression
	|postfix_expression SQBRACOPEN expression SQBRACCLOSE
	|postfix_expression ROBRACOPEN argument_expression_list_opt ROBRACCLOSE
	|postfix_expression DOT IDENTIFIER
	|postfix_expression ACC IDENTIFIER
	|postfix_expression INC
	|postfix_expression DEC
	|ROBRACOPEN type_name ROBRACCLOSE CURBRACOPEN initializer_list CURBRACCLOSE
	|ROBRACOPEN type_name ROBRACCLOSE CURBRACOPEN initializer_list COMMA CURBRACCLOSE
	{printf("------postfix_expression------\n");}
	;

argument_expression_list
	:assignment_expression
	|argument_expression_list COMMA assignment_expression
	{printf("------argument_expression_list------\n");}
	;

unary_expression
	:postfix_expression
	|INC unary_expression
	|DEC unary_expression
	|unary_operator cast_expression
	|SIZEOF unary_expression
	|SIZEOF ROBRACOPEN type_name ROBRACCLOSE
	{printf("------unary_expression------\n");}
	;

unary_operator
	:AMP
	|MUL
	|ADD
	|SUB
	|NEG
	|EXCLAIM
	{printf("------unary_operator------\n");}
	;

cast_expression
	:unary_expression
	|ROBRACOPEN type_name ROBRACCLOSE cast_expression
	{printf("------cast_expression------\n");}
	;

multiplicative_expression
	:cast_expression
	|multiplicative_expression MUL cast_expression
	|multiplicative_expression DIV cast_expression
	|multiplicative_expression MODULO cast_expression
	{printf("------multiplicative_expression------\n");}
	;

additive_expression
	:multiplicative_expression
	|additive_expression ADD multiplicative_expression
	|additive_expression SUB multiplicative_expression
	{printf("------additive_expression------\n");}
	;

shift_expression
	:additive_expression
	|shift_expression SHL additive_expression
	|shift_expression SHR additive_expression
	{printf("------shift_expression------\n");}
	;

relational_expression
	:shift_expression
	|relational_expression BITSHL shift_expression
	|relational_expression BITSHR shift_expression
	|relational_expression LTE shift_expression
	|relational_expression GTE shift_expression
	{printf("------relational_expression------\n");}
	;

equality_expression
	:relational_expression
	|equality_expression EQ relational_expression
	|equality_expression NEQ relational_expression
	{printf("------equality_expression------\n");}
	;

AND_expression
	:equality_expression
	|AND_expression AMP equality_expression
	{printf("------and_expression------\n");}
	;

exclusive_OR_expression
	:AND_expression
	|exclusive_OR_expression BITXOR AND_expression
	{printf("------exclusive_or_expression------\n");}
	;

inclusive_OR_expression
	:exclusive_OR_expression
	|inclusive_OR_expression BITOR exclusive_OR_expression
	{printf("------inclusive_or_expression------\n");}
	;

logical_AND_expression
	:inclusive_OR_expression
	|logical_AND_expression AND inclusive_OR_expression
	{printf("------logical_and_expression------\n");}
	;

logical_OR_expression
	:logical_AND_expression
	|logical_OR_expression OR logical_AND_expression
	{printf("------logical_or_expression------\n");}
	;

conditional_expression
	:logical_OR_expression
	|logical_OR_expression QUESTION expression COLON conditional_expression
	{printf("------conditional_expression------\n");}
	;

assignment_expression
	:conditional_expression
	|unary_expression assignment_operator assignment_expression
	{printf("------assignment_expression------\n");}
	;

assignment_operator 
	:ASSIGN
	|STAREQ
	|DIVEQ
	|MODEQ
	|PLUSEQ
	|MINUSEQ
	|SHLEQ
	|SHREQ
	|BINANDEQ
	|BINXOREQ
	|BINOREQ
	{printf("------assignment_operator------\n");}
	;

expression
	:assignment_expression
	|expression COMMA assignment_expression
	{printf("------expression------\n");}
	;

constant_expression
	:conditional_expression
	{printf("------constant_expression------\n");}
	;

declaration
	:declaration_specifiers init_declarator_list_opt SEMICOLON
	{printf("------declaration------\n");}
	;

init_declarator_list_opt
	:init_declarator_list
	|
	;

declaration_specifiers_opt
	:declaration_specifiers
	|
	;

declaration_specifiers
	:storage_class_specifier declaration_specifiers_opt
	|type_specifier declaration_specifiers_opt
	|type_qualifier declaration_specifiers_opt
	|function_specifier declaration_specifiers_opt
	{printf("------declaration_specifiers------\n");}
	;

init_declarator_list
	:init_declarator
	|init_declarator_list COMMA init_declarator
	{printf("------init_declarator_list------\n");}
	;

init_declarator
	:declarator
	|declarator ASSIGN initializer
	{printf("------init_declarator------\n");}
	;

storage_class_specifier
	: EXTERN
	| STATIC
	| AUTO
	| REGISTER
	{printf("------storage_class_specifier------\n");}
	;

type_specifier
	: VOID
	| CHAR
	| SHORT
	| INT
	| LONG
	| FLOAT
	| DOUBLE
	| SIGNED
	| UNSIGNED
	| BOOL
	| COMPLEX
	| IMAGINARY
	| enum_specifier
	{printf("------type_specifier------\n");}
	;

specifier_qualifier_list_opt
	:specifier_qualifier_list
	|
	;

specifier_qualifier_list
	: type_specifier specifier_qualifier_list_opt
	| type_qualifier specifier_qualifier_list_opt
	{printf("------specifier_qualifier_list------\n");}
	;

identifier_opt
	:IDENTIFIER
	|
	;

enum_specifier
	:ENUM identifier_opt CURBRACOPEN enumerator_list CURBRACCLOSE
	|ENUM identifier_opt CURBRACOPEN enumerator_list COMMA CURBRACCLOSE
	|ENUM IDENTIFIER
	{printf("------enum_specifier------\n");}
	;

enumerator_list
	:enumerator
	|enumerator_list COMMA enumerator
	{printf("------enumerator_list------\n");}
	;

enumerator
	:IDENTIFIER
	|IDENTIFIER ASSIGN constant_expression
	{printf("------enumerator------\n");}
	;

type_qualifier
	:CONST
	|RESTRICT
	|VOLATILE
	{printf("------type_qualifier------\n");}
	;

function_specifier
	:INLINE
	{printf("------function_specifier------\n");}
	;

pointer_opt 
	:pointer
	|
	;

declarator
	:pointer_opt direct_declarator
	{printf("------declarator------\n");}
	;

type_qualifier_list_opt
	:type_qualifier_list
	|
	;

assignment_expression_opt
	:assignment_expression
	|
	;

direct_declarator
	:IDENTIFIER
	|ROBRACOPEN declarator ROBRACCLOSE
	|direct_declarator SQBRACOPEN type_qualifier_list_opt assignment_expression_opt SQBRACCLOSE
	| direct_declarator SQBRACOPEN STATIC type_qualifier_list_opt assignment_expression SQBRACCLOSE
	| direct_declarator SQBRACOPEN type_qualifier_list_opt MUL SQBRACCLOSE
	| direct_declarator ROBRACOPEN parameter_type_list ROBRACCLOSE
	| direct_declarator ROBRACOPEN identifier_list ROBRACCLOSE
	| direct_declarator ROBRACOPEN ROBRACCLOSE
	{printf("------direct_declarator------\n");}
	;

pointer
	:MUL type_qualifier_list_opt
	|MUL type_qualifier_list_opt pointer
	{printf("------pointer------\n");}
	;

type_qualifier_list
	:type_qualifier
	|type_qualifier_list type_qualifier
	{printf("------type_qualifier_list_opt------\n");}
	;

parameter_type_list
	:parameter_list
	|parameter_list COMMA DOTS
	{printf("------parameter_type_list------\n");}
	;

parameter_list
	:parameter_declaration
	|parameter_list COMMA parameter_declaration
	{printf("------parameter_list------\n");}
	;

parameter_declaration
	:declaration_specifiers declarator
	|declaration_specifiers
	{printf("------parameter_declaration------\n");}
	;

identifier_list
	:IDENTIFIER
	|identifier_list COMMA IDENTIFIER
	{printf("------identifier_list------\n");}
	;

type_name
	:specifier_qualifier_list
	{printf("------type_name------\n");}
	;

initializer
	:assignment_expression
	|CURBRACOPEN initializer_list CURBRACCLOSE
	|CURBRACOPEN initializer_list COMMA CURBRACCLOSE
	{printf("------initializer------\n");}
	;

designation_opt
	:designation
	|
	;

initializer_list
	:designation_opt initializer
	|initializer_list COMMA designation_opt initializer
	{printf("------initializer_list------\n");}
	;

designation
	:designator_list ASSIGN
	{printf("------designation------\n");}
	;

designator_list
	:designator
	|designator_list designator
	{printf("------designator_list------\n");}
	;

designator
	:SQBRACOPEN constant_expression SQBRACCLOSE
	|DOT IDENTIFIER
	{printf("------designator------\n");}
	;

statement
	:labeled_statement
	|compound_statement
	|expression_statement
	|selection_statement
	|iteration_statement
	|jump_statement
	{printf("------statement------\n");}
	;

labeled_statement
	:IDENTIFIER COLON statement
	|CASE constant_expression COLON statement
	|DEFAULT COLON statement
	{printf("------labeled_statement------\n");}
	;

block_item_list_opt
	:block_item_list
	|
	;

compound_statement
	:CURBRACOPEN block_item_list_opt CURBRACCLOSE
	{printf("------compound_statement------\n");}
	;

block_item_list
	:block_item
	|block_item_list block_item
	{printf("------block_item_list------\n");}
	;

block_item
	:declaration
	|statement
	{printf("------block_item------\n");}
	;

expression_opt
	:expression
	|
	;

expression_statement
	:expression_opt SEMICOLON
	{printf("------expression_statement------\n");}
	;

selection_statement_base
	:IF ROBRACOPEN expression ROBRACCLOSE statement
	{printf("------selection_statement------\n");}
	;

selection_statement
	:selection_statement_base %prec THEN
	|selection_statement_base ELSE statement
	|SWITCH ROBRACOPEN expression ROBRACCLOSE statement
	;

iteration_statement
	:WHILE ROBRACOPEN expression ROBRACCLOSE statement
	|DO statement WHILE ROBRACOPEN expression ROBRACCLOSE SEMICOLON
	|FOR ROBRACOPEN expression_opt SEMICOLON expression_opt SEMICOLON expression_opt ROBRACCLOSE statement
	|FOR ROBRACOPEN declaration expression_opt SEMICOLON expression_opt ROBRACCLOSE statement
	{printf("------iteration_statement------\n");}
	;

jump_statement
	:GOTO IDENTIFIER SEMICOLON
	|CONTINUE SEMICOLON
	|BREAK SEMICOLON
	|RETURN expression_opt SEMICOLON
	{printf("------jump_statement------\n");}
	;

translation_unit
	:external_declaration
	|translation_unit external_declaration
	{printf("------translation_unit------\n");}
	;

external_declaration
	:function_definition
	|declaration
	{printf("------external_declaration------\n");}
	;

declaration_list_opt
	:declaration_list
	|
	;

function_definition
	:declaration_specifiers declarator declaration_list_opt compound_statement
	{printf("------function_definition------\n");}
	;

declaration_list
	:declaration
	|declaration_list declaration
	{printf("------declaration_list------\n");}
	;


constant
	:INTEGER_CONSTANT
	|FLOATING_CONSTANT
	|ENUMERATION_CONSTANT
	|CHARACTER_CONSTANT
	{printf("------constants------\n");}
	;


%%

void yyerror(char *s) {
    printf("------%s------\n",s);
}