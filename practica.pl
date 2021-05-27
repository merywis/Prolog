/****************************************************************************************************************************************
Autors: Maria Orell Monserrat i Jaume Mesquida Lanas
Llenguatges de Programació - 21721
Curs 2020-2021
*****************************************************************************************************************************************/

/****************************************************************************************************************************************
FUNCIONS DE SOPORT
*****************************************************************************************************************************************/
/* Funció per comprovar si tots els elements d'una llista són diferents */
diferents([]).
diferents([A|L]):-not(member(A,L)), diferents(L).

/* Funció per insertar un element dins una llista */
insertar(E,L,[E|L]).
insertar(E,[X|Y],[X|Z]):-insertar(E,Y,Z).

/* Funció per realitzar permutacions dins una llista */
permutacio([],[]).
permutacio([X|Y],Z):-permutacio(Y,L), insertar(X,L,Z).

/* Funció per imprimir els bordes dreta i esquerra i les solucions obtengudes */
imprimir([],[],_,_,_,_).
imprimir([X1|I1],[X2|I2],F1,F2,F3,F4):- write(X2), write(' '), write(F1), write(' '), write(X1), write('\n'), 
imprimir(I1,I2,F2,F3,F4,F1).

/* Funció per imprimir els bordes superior i inferior */
imprimirLinea([]).
imprimirLinea([X|L]):- write(X), write(' '), imprimirLinea(L).

/* Funció per anomenar els elements de la matriu */
anomenarElements([],_,_,_,_).
anomenarElements([X|F1],E1,E2,E3,E4):- E1 = X, anomenarElements(F1,E2,E3,E4,E1).

/* Funció per anomenar els elements de la matriu (faltaría hacer caso base???)*/
comprobarValorCantons(X, X, X).
comprobarValorCantons('-', _, _).


/****************************************************************************************************************************************
per mirar si un element és '-', ho posam directament dins una llista per fer la comparaci

per mirar quin es el darrer element de la llista, la giram, i miram quin se queda com a nou 1r element

2   3   4
3   1   7

*****************************************************************************************************************************************/

lletres(M1,M2,M3,M4) :- reverse(M3,I3), reverse(M4,I4), 
anomenarElements(M1,M11,M12,M13,M14), 
anomenarElements(M2,M21,M22,M23,M24), 
anomenarElements(I3,M31,M32,M33,M34), 
anomenarElements(I4,M41,M42,M43,M44), 

permutacio(['a','b','c','-'],F1),
anomenarElements(F1,C11,C12,C13,C14), 
permutacio(['a','b','c','-'],F2),
anomenarElements(F2,C21,C22,C23,C24),
permutacio(['a','b','c','-'],F3), 
anomenarElements(F3,C31,C32,C33,C34),
permutacio(['a','b','c','-'],F4),
anomenarElements(F4,C41,C42,C43,C44),

C1 = [C11,C21,C31,C41], 
C2 = [C12,C22,C32,C42],
C3 = [C13,C23,C33,C43],
C4 = [C14,C24,C34,C44], 

diferents(C1),
diferents(C2),
diferents(C3),
diferents(C4),

comprobarValorCantons(C11, M11, M41),
comprobarValorCantons(C14, M14, M21),
comprobarValorCantons(C44, M24, M34),
comprobarValorCantons(C41, M44, M31),

write('   '), imprimirLinea(M1),write('\n'),
imprimir(M2,I4,F1,F2,F3,F4), write('   '), imprimirLinea(I3).





