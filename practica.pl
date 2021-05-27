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

F1,F2,F3,F4 i tenim alla 4 permutacions

dsps hem de donar un nom a cada lletra de cada permutacio -> a sa 1a permutacio que li direm F1, 
Als seus elements li deimc c11, c12, c13, c14 i aixi per totes les files. 

dsps haure de comprovar que a les meves 4 columnes C1 C2 C3 C4 les creare amb els elements de c11, c21, c31, c41 i aixi amb totes

ara ja es moment de posar les condicions


per mirar si un element és '-', ho posam directament dins una llista per fer la comparaci


per mirar quin es el darrer element de la llista, la giram, i miram quin se queda com a nou 1r element

*****************************************************************************************************************************************/

lletres(M1,M2,M3,M4) :- write('   '), imprimirLinea(M1), write('\n'), reverse(M3,I3), reverse(M4,I4), 
permutacio([C11,C12,C13,C14],F1), 
C11 ='a', C12 ='b', C13 ='c', C14 ='-', 
permutacio([C21,C22,C23,C24],F2),
C21 ='a', C22 ='b', C23 ='c', C24 ='-', 
permutacio([C31,C32,C33,C34],F3), 
C31 ='a', C32 ='b', C33 ='c', C34 ='-', 
permutacio([C41,C42,C43,C44],F4),
C41 ='a', C42 ='b', C43 ='c', C44 ='-',
imprimir(M2,I4,F1,F2,F3,F4), write('   '), imprimirLinea(I3).



