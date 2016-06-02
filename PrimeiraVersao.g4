/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar PrimeiraVersao;

prog: 'program' ID ';' delcID* delcFun* blPrinc; 

//////////DECLARA��ES//////////
delcID : delcVar
       | delcConst
       | delcArray
       ;
//------------------Declara��o de vari�vel e constante ------------------------- 
delcVar: tipo ':' listaIds ';';

delcConst: 'final' tipo ID '=' valor ';';

blPrinc: 'main' '('')''{'cmds'}';
//-----------------------Declara��o de Arrays-----------------------------------

delcArray: tipo ':' listaArrays ';';


//----------------------Declara��o de Fun��es-----------------------------------

delcFun: tipo ID '(' listaParams ')' '{' cmds '}';


//---------------------Declara��o de comandos de repeti��o----------------------
cmds: if
    | for
    | while  
    | atrib
    | print
    | read;

//Erro ao colocar os '*' nos 'cmds'
if: 'if' '(' exprLogica ')' 'then' '{' cmds* '}' (else)? ;

else: 'else' '{' cmds* '}';

for: 'for' '(' ID '=' INT|ID ':' INT|ID ')' '[' 'step' INT ']' 
                                     '{' 
                                     cmds*
                                     ('exit')? '}'
;
while: 'while' '(' exprLogica ')' '{'
     cmds*  
     ('[''exit'']')?
     '}'  
     ;
//falta definir o conte�do
print:'print''('')';

read: 'read' '(' listaIds ')';
//------------------------------------------------------------------------------
atrib: 'a';
//Express�es l�gicas
exprLogica:;

//Lista de Par�metros, Arrays e Ids.
listaParams: tipo ID (','tipo ID)*;         
listaArrays: ID '['INT']'(',' ID'['INT']')*;
listaIds: ID (',' ID)*;         

//Defini��o de tipos
tipo: 'int'
    | 'float'
    | 'real'
    | 'boolean'
    ;
valor: INT
     | STRING
     | REAL
     ;


//L�xico
ID: [a-zA-Z]([a-zA-Z0-9])*;
STRING: [a-zA-Z]+;
INT: [0-9]+;
REAL: [0-9]+('.'[0-9]+)?;
WS: [ \t\r\n]+ ->skip;
//Defini��o de coment�rios
COMENT : '/*'.*? '*/' -> skip;        
COMENTLINE: '//' .*? '\n' -> skip;          