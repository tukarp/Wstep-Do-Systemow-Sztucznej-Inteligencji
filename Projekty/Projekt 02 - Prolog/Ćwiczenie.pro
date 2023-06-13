% Wstęp do Systemów Sztucznej Inteligencji
% Projekt 02 - Prolog
% Ćwiczenie

% Definicja przyjaźni
% ((X lubi Y) i (Y lubi Y))
przyjazn(X, Y) :-
    (
    	(lubi(X, Y)),
    	(lubi(Y, X))
    ).

% Definicja niby przyjaźni
% ((X lubi Y) lub (Y lubi X))
niby_przyjazn(X, Y) :-
    (
    	(
        	(lubi(X, Y)),
    		\+ (lubi(Y, X))
        );
    	(
        	\+ (lubi(X, Y)),
    		(lubi(Y, X))
        )
    ).

% Definicja nieprzyjaźni
% Zaprzeczenie przyjaźni pomiędzy X i Y 
nieprzyjazn(X, Y) :-
    \+ (
       		(przyjazn(X, Y))
       ).

% Definicja miłości
% ((((X to mężczyzna) i (Y to kobieta)) lub ((X to kobieta) i (Y to mężczyzna))) i ((X lubi Y) i (X nie lubi Z, gdzie Z nie może być Y)))
loves(X, Y) :-
	(
    	(
    		(
    			(mezczyzna(X)),
    			(kobieta(Y))
    		);
    		(
    			(mezczyzna(Y)),
    			(kobieta(X))
    		)
    	),
    	(
    		(lubi(X, Y)),
            \+ (
               		(lubi(X, Z)),
                   	(Z \= Y)
               )
    	)
    ).

% Definicja prawdziwej miłości
% ((X przyjaźni się z Y) i (((X kocha tylko i wyłącznie Y) i (Y kocha tylko i wyłącznie X))))
true_love(X, Y) :-
	(
		(przyjazn(X, Y))
    ),
	(
    	(
    		(loves(X, Y))
        ),
    	(
        	(loves(Y, X))
        )
    ).

% Utworzenie osób i relacji
% Utworzenie mężczyzn
mezczyzna(kuba).
mezczyzna(tomek).
mezczyzna(janek).
mezczyzna(marek).
mezczyzna(mikolaj).

% Utworzenie kobiet
kobieta(iza).
kobieta(julia).
kobieta(alicja).
kobieta(monika).
kobieta(karolina).

% Utworzenie relacji między osobami
lubi(julia, iza).
lubi(iza, julia).
lubi(marek, kuba).
lubi(janek, kuba).
lubi(alicja, kuba).
lubi(janek, julia).
lubi(janek, tomek).
lubi(kuba, alicja).
lubi(monika, julia).
lubi(julia, monika).
lubi(marek, monika).
lubi(mikolaj, marek).
lubi(monika, alicja).
lubi(marek, mikolaj).
lubi(karolina, tomek).
lubi(tomek, karolina).

% Wyniki relacji
% Przyjaźń
% przyjazn(mikolaj, marek). - true
% przyjazn(marek, kuba). - false

% Niby przyjaźń
% niby_przyjazn(janek, tomek). - true
% niby_przyjazn(julia, monika). - false

% Nieprzyjaźń
% nieprzyjazn(julia, iza). - true
% nieprzyjazn(julia, iza). - false

% Miłość
% loves(kuba, alicja). - true
% loves(marek, monika). - false

% Prawdziwa miłość
% true_love(tomek, karolina). - true
% true_love(janek, julia). - false
