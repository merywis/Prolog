/****************************************************************************************************************************************
Autors: Maria Orell Monserrat i Jaume Mesquida Lanas
Llenguatges de Programació - 21721
Curs 2020-2021
*****************************************************************************************************************************************/

/****************************************************************************************************************************************
FUNCIONS DE SOPORT
*****************************************************************************************************************************************/


/* Funció per insertar un element dins una llista */

insertar(E,L,[E|L]).
insertar(E,[X|Y],[X|Z]):-insertar(E,Y,Z).

/* Funció per realitzar permutacions dins una llista */
permutacio([],[]).
permutacio([X|Y],Z):-permutacio(Y,L), insertar(X,L,Z).

/* Funció per imprimir els bordes dreta i esquerra i les solucions obtengudes */
imprimir([],[],_,_,_,_).
imprimir([X1|I1],[X2|I2],S1,S2,S3,S4):- write(X2), write(' '), write(S1), write(' '), write(X1), write('\n'), 
imprimir(I1,I2,S2,S3,S4,S1).

/* Funció per imprimir els bordes superior i inferior */
imprimirLinea([]).
imprimirLinea([X|L]):- write(X), write(' '), imprimirLinea(L).

/****************************************************************************************************************************************
PROGRAMA PRINCIPAL
*****************************************************************************************************************************************/

lletres(M1,M2,M3,M4) :-write('   '), imprimirLinea(M1), write('\n'), reverse(M3,I3), reverse(M4,I4), 
permutacio(['a','b','c','-'],S1), permutacio(['a','b','c','-'],S2),
permutacio(['a','b','c','-'],S3), permutacio(['a','b','c','-'],S4),
imprimir(M2,I4,S1,S2,S3,S4), write('   '), imprimirLinea(I3).



