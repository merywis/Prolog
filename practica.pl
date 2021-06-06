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

/* Funció per imprimir els extrems dret i esquerre i les solucions obtingudes */
imprimir([],[],_,_,_,_).
imprimir([X1|I1],[X2|I2],F1,F2,F3,F4):- write(X2), write(' '), write(F1), write(' '), write(X1), write('\n'), 
imprimir(I1,I2,F2,F3,F4,F1).

/* Funció per imprimir els extrems superior i inferior */
imprimirLinea([]).
imprimirLinea([X|L]):- write(X), write(' '), imprimirLinea(L).

/* Funció per comprovar si els valors del cantons són els correctes */
comprovarValorCantons(X, X, X).
comprovarValorCantons('-', _, _).

/* Funció per comprovar si els valors dels laterals són els correctes*/
comprovarValorLaterals(X, X).
comprovarValorLaterals('-', _).

/* Funció per crear les permutacions i comprovar si els elements de la matriu són diferents*/
matriu(C11,C12,C13,C14,C21,C22,C23,C24,C31,C32,C33,C34,C41,C42,C43,C44):-

        permutacio(['a','b','c','-'],F1),
        F1 = [C11,C12,C13,C14],

        permutacio(['a','b','c','-'],F2),
        F2 = [C21,C22,C23,C24],

        C1v1 = [C11,C21], 
        C2v1 = [C12,C22],
        C3v1 = [C13,C23],
        C4v1 = [C14,C24], 

        diferents(C1v1),
        diferents(C2v1),
        diferents(C3v1),
        diferents(C4v1),

        permutacio(['a','b','c','-'],F3), 
        F3 = [C31,C32,C33,C34],

        C1v2 = [C11,C21,C31], 
        C2v2 = [C12,C22,C32],
        C3v2 = [C13,C23,C33],
        C4v2 = [C14,C24,C34], 

        diferents(C1v2),
        diferents(C2v2),
        diferents(C3v2),
        diferents(C4v2),

        permutacio(['a','b','c','-'],F4),
        F4 = [C41,C42,C43,C44],

        C1 = [C11,C21,C31,C41], 
        C2 = [C12,C22,C32,C42],
        C3 = [C13,C23,C33,C43],
        C4 = [C14,C24,C34,C44], 

        diferents(C1),
        diferents(C2),
        diferents(C3),
        diferents(C4).


/****************************************************************************************************************************************
PROGRAMA PRINCIPAL
*****************************************************************************************************************************************/

/* Funció lletres */

lletres(M1,M2,M3,M4) :- reverse(M3,I3), reverse(M4,I4), 

M1 = [M11,M12,M13,M14],
M2 = [M21,M22,M23,M24],
I3 = [M31,M32,M33,M34],
I4 = [M41,M42,M43,M44],

matriu(C11,C12,C13,C14,C21,C22,C23,C24,C31,C32,C33,C34,C41,C42,C43,C44),

/* Comprovam que els valors dels 4 cantons siguin els correctes */
comprovarValorCantons(C11, M11, M41),
comprovarValorCantons(C14, M14, M21),
comprovarValorCantons(C44, M24, M34),
comprovarValorCantons(C41, M44, M31),

/* Comprovam que els valors dels 4 laterals siguin els correctes */
comprovarValorLaterals(C12, M12),
comprovarValorLaterals(C13, M13),
comprovarValorLaterals(C24, M22),
comprovarValorLaterals(C34, M23),
comprovarValorLaterals(C43, M33),
comprovarValorLaterals(C42, M32),
comprovarValorLaterals(C21, M42),
comprovarValorLaterals(C31, M43),

F1 = [C11,C12,C13,C14],
F2 = [C21,C22,C23,C24],
F3 = [C31,C32,C33,C34],
F4 = [C41,C42,C43,C44],

write('   '), imprimirLinea(M1),write('\n'),
imprimir(M2,I4,F1,F2,F3,F4), write('   '), imprimirLinea(I3), write('\n'), fail.


/* Funció comptar */

comptar :- asserta(comptador(0)), 

/* Cridam al mètode matriu sense variables per comptar totes les possibles combinacions que es creen */
matriu(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),

comptador(X), X1 is X+1, 
retract(comptador(X)), 
asserta(comptador(X1)),
fail.

comptar :- nl, write('Hi ha '), comptador(X), write(X), retract(comptador(X)), write(' resultats.'), retract(comptador(X)).







