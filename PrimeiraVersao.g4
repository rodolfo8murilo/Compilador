/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar PrimeiraVersao;

prog: 'program' ID ';' delcID* delcFun* blPrinc; 

//////////DECLARAÇÕES//////////
delcID : delcVar
       | delcConst
       | delcArray
       ;
//------------------Declaração de variável e constante ------------------------- 
delcVar: tipo ':' listaIds ';';

delcConst: 'final' tipo ID '=' valor ';';

blPrinc: 'main' '('')''{'cmds'}';
//-----------------------Declaração de Arrays-----------------------------------

delcArray: tipo ':' listaArrays ';';


//----------------------Declaração de Funções-----------------------------------

delcFun: tipo ID '(' listaParams ')' '{' cmds '}';


//---------------------Declaração de comandos de repetição----------------------
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
//falta definir o conteúdo
print:'print''('')';

read: 'read' '(' listaIds ')';
//------------------------------------------------------------------------------
atrib: 'a';
//Expressões lógicas
exprLogica:;

//Lista de Parâmetros, Arrays e Ids.
listaParams: tipo ID (','tipo ID)*;         
listaArrays: ID '['INT']'(',' ID'['INT']')*;
listaIds: ID (',' ID)*;         

//Definição de tipos
tipo: 'int'
    | 'float'
    | 'real'
    | 'boolean'
    ;
valor: INT
     | STRING
     | REAL
     ;


//Léxico
ID: [a-zA-Z]([a-zA-Z0-9])*;
STRING: [a-zA-Z]+;
INT: [0-9]+;
REAL: [0-9]+('.'[0-9]+)?;
WS: [ \t\r\n]+ ->skip;
//Definição de comentários
COMENT : '/*'.*? '*/' -> skip;        
COMENTLINE: '//' .*? '\n' -> skip;          