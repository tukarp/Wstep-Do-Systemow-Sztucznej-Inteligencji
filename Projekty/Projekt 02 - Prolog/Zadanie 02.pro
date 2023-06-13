% Wstęp do Systemów Sztucznej Inteligencji
% Projekt 02 - Prolog
% Zadanie 2

% Notatka - w tworzeniu definicji osób,
% Zawsze osoba od której jest nazwa jest pierwsza,
% Np. matka(X, Y) - X jest matką Y

% Przykład 0)
% Definicja meżczyzny
% (X jest osobą)
% (żadne z wartości nie mogą być sobie równe)
% mezczyzna(X):-
%     (
%         (osoba(X)),
%     ).

% Przykład 1)
% Definicja kobiety
% ((X jest osobą) i (X nie jest mężczyzną))
% (żadne z wartości nie mogą być sobie równe)
kobieta(X):-
    (
    	(osoba(X)),
        (\+ mezczyzna(X))
    ).

% Przykład 2)
% Definicja ojca
% ((Y jest osobą) i (X jest mężczyzną) i (X jest rodzicem Y))
% (żadne z wartości nie mogą być sobie równe)
ojciec(X, Y):-
    (
    	(
            (osoba(Y)),
       	    (mezczyzna(X)),
            (rodzic(Y, X))
        ),
        (
     	    (X \= Y)
        )
    ).

% Przykład 3)
% Definicja matki
% ((Y jest osobą) i (X jest kobietą) i (X jest rodzicem Y))
% (żadne z wartości nie mogą być sobie równe)
matka(X, Y):-
    (
    	(
            (osoba(Y)),
       	    (kobieta(X)),
            (rodzic(Y, X))
        ),
        (
     	    (X \= Y)
        )
    ).

% Przykład 4)
% Definicja córki
% ((Y jest osobą) i (X jest kobietą) i (Y jest rodzicem X))
% (żadne z wartości nie mogą być sobie równe)
corka(X, Y):-
    (
    	(
            (osoba(Y)),
            (kobieta(X)),
            (rodzic(X, Y))
        ),
        (
     	    (X \= Y)
        )
    ).

% Przykład 5)
% Definicja brata rodzonego
% (((X jest mężczyzną) i (A jest ojcem X) i (B jest matką X)) i ((Y jest osobą) i (A jest ojcem Y) i (B jest ojcem Y)))
% (żadne z wartości nie mogą być sobie równe)
brat_rodzony(X, Y):-
    (
    	(
            (mezczyzna(X)),
            (ojciec(A, X)),
            (matka(B, X))
        ),
        (
            (osoba(Y)),
            (ojciec(A, Y)),
            (matka(B, Y))
        ),
        (
	    (A \= X),
            (A \= Y),
            (A \= B),
            (B \= X),
            (B \= Y),
            (X \= Y)
        )
    ).

% Przykład 6)
% Definicja brata przyrodniego
% (((X jest mężczyzną) i (A jest rodzicem X) i (B jest rodzicem X) i (X nie jest bratem rodzonym Y)) i
% ((Y jest osobą) i (A jest rodzicem Y) i (C jest rodzicem Y)))
% (żadne z wartości nie mogą być sobie równe)
brat_przyrodni(X, Y):-
    (
    	(
    	    (mezczyzna(X)),
            (rodzic(X, A)),
            (rodzic(X, B)),
            (\+ brat_rodzony(X, Y))
    	),
        (
            (osoba(Y)),
            (rodzic(Y, A)),
            (rodzic(Y, C))
        ),
    	(
            (A \= X),
            (A \= Y),
            (A \= B),
            (A \= C),
            (B \= X),
            (B \= Y),
            (B \= C),
            (C \= X),
            (C \= Y),
            (X \= Y)
        )
    ).

% Przykład 7)
% Definicja kuzyna
% (((X jest osobą) i (B jest rodzicem X) i (A jest rodzicem B)) i
% ((Y jest osobą) i (C jest rodzicem Y) i (A jest rodzicem C)))
% (żadne z wartości nie mogą być sobie równe)
kuzyn(X, Y):-
    (
    	(
            (osoba(X)),
            (rodzic(X, B)),
            (rodzic(B, A))
        ),
        (
    	    (osoba(Y)),
            (rodzic(Y, C)),
            (rodzic(C, A))
    	),
    	(
            (A \= X),
            (A \= Y),
            (A \= B),
            (A \= C),
            (B \= X),
            (B \= Y),
            (B \= C),
            (C \= X),
            (C \= Y),
            (X \= Y)
        )
    ).

% Przykład 8)
% Definicja dziadka od strony ojca
% ((A jest ojcem Y) i (X jest rodzicem A))
% (żadne z wartości nie mogą być sobie równe)
dziadek_od_strony_ojca(X, Y):-
    (
    	(
            (ojciec(A, Y)),
            (rodzic(A, X))
        ),
        (
            (A \= X),
            (A \= Y),
            (X \= Y)
        )
    ).

% Przykład 9)
% Definicja dziadka od strony matki
% ((A jest matką Y) i (X jest rodzicem A))
% (żadne z wartości nie mogą być sobie równe)
dziadek_od_strony_matki(X,Y):-
    (
    	(
            (matka(A, Y)),
            (rodzic(A, X))
        ),
        (
            (A \= X),
            (A \= Y),
            (X \= Y)
        )
    ).

% Przykład 10)
% Definicja dziadka
% ((X jest mężczyzną) i (X jest rodzicem A) i (A jest rodzicem Y))
% (żadne z wartości nie mogą być sobie równe)
dziadek(X, Y):-
    (
    	(
            (mezczyzna(X)),
            (rodzic(A, X)),
            (rodzic(Y, A))
        ),
        (
            (A \= X),
            (A \= Y),
            (X \= Y)
        )
    ).

% Przykład 11)
% Definicja babci
% ((X jest kobietą) i (X jest rodzicem A) i (A jest rodzicem Y))
% (żadne z wartości nie mogą być sobie równe)
babcia(X, Y):-
    (
    	(
            (kobieta(X)),
            (rodzic(A, X)),
            (rodzic(Y, A))
        ),
        (
            (A \= X),
            (A \= Y),
            (X \= Y)
        )
    ).

% Przykład 12)
% Definicja wnuczki
% ((Y jest kobietą) i ((X jest dziadkiem Y) lub (X jest babcią Y)))
% (żadne z wartości nie mogą być sobie równe)
wnuczka(X, Y):-
    (
    	(
            (
                (kobieta(Y))
            ),
	    	(
            	(dziadek(X, Y));
            	(babcia(X, Y))
            )
    	),
    	(
            (X \= Y)
        )
    ).

% Przykład 13)
% Definicja przodka do dwóch pokoleń wstecz
% ((A jest rodzicem Y) i ((X jest dziadkiem A) lub (X jest babcią A)))
% (żadne z wartości nie mogą być sobie równe)
przodek_do2pokolenia_wstecz(X, Y):-
    (
    	(
    	    (
            	(rodzic(Y, A))
            ),
	    	(
           		(dziadek(X, A));
            	(babcia(X, A))
            )
        ),
    	(
            (A \= X),
            (A \= Y),
            (X \= Y)
        )
    ).

% Przykład 14)
% Definicja przodka do trzech pokoleń wstecz
% (((A jest dziadkiem Y) lub (A jest babcią Y)) i ((X jest dziadkiem A) lub (X jest babcią A)))
% (żadne z wartości nie mogą być sobie równe)
przodek_do3pokolenia_wstecz(X, Y):-
    (
    	(
    	    (
            	(dziadek(A, Y));
            	(babcia(A, Y))
            ),
	    	(
            	(dziadek(X, A));
         		(babcia(X, A))
            )
        ),
    	(
            (A \= X),
            (A \= Y),
            (X \= Y)
        )
    ).

% Utworzenie osób
osoba(jan).
osoba(anna).
osoba(julia).
osoba(karol).
osoba(antoni).
osoba(ignacy).
osoba(janusz).
osoba(marian).
osoba(nikola).
osoba(jadwiga).
osoba(marysia).
osoba(mateusz).
osoba(natalia).
osoba(elzbieta).

% Utworzenie mężczyzn
mezczyzna(jan).
mezczyzna(karol).
mezczyzna(antoni).
mezczyzna(ignacy).
mezczyzna(janusz).
mezczyzna(marian).
mezczyzna(mateusz).

% Utworzenie kobiet
kobieta(annna).
kobieta(julia).
kobieta(nikola).
kobieta(natalia).
kobieta(marysia).
kobieta(elzbieta).
kobieta(jadwiga).

% Utworzenie relacji między osobami
rodzic(jan, janusz).
rodzic(jan, elzbieta).
rodzic(ignacy, janusz).
rodzic(ignacy, elzbieta).
rodzic(mateusz, jan).
rodzic(mateusz, julia).
rodzic(nikola, julia).
rodzic(nikola, jan).
rodzic(anna, jan).
rodzic(anna, natalia).
rodzic(karol, ignacy).
rodzic(karol, marysia).
rodzic(julia, marian).
rodzic(janusz, antoni).
rodzic(antoni, jadwiga).

% Drzewo genealogiczne
% 
%  Pradziadkowie                Jadwiga
%                                 ┃
%                                 ┃
%  Dziadkowie                   Antoni                         Marian
%                                 ┃                               ┃
%                                 ┃                               ┃
%  Rodzice                      Janusz + Elżbieta                 ┃           
%                                 ┃         ┃                     ┃      
%                ┏━━━━━━━━━━━━━━━━┻━━━━┳━━━━┛                     ┃
%  Dzieci     Marysia    Ignacy     Natalia  +  Jan      +      Julia            
%                ┃         ┃           ┃         ┃                ┃             
%                ┗━━━━┳━━━━┛           ┗━━━━┳━━━━┻━━━━┳━━━━━━━━┳━━┛    
%  Wnuki            Karol                 Anna     Mateusz   Nikola
%

% Wyniki relacji
% Przykład 0)
% Mężczyzna
% mezczyzna(jan). - true
% mezczyzna(nikola). - false

% Przykład 1)
% Kobieta
% kobieta(julia). - true
% kobieta(mateusz). - false

% Przykład 2)
% Ojciec
% ojciec(jan, mateusz). - true
% ojciec(ignacy, jan). - false

% Przykład 3)
% Matka
% matka(julia, mateusz). - true
% matka(nikola, elzbieta). - false

% Przykład 4)
% Córka
% corka(anna, jan). - true
% corka(marysia, elzbieta). - false

% Przykład 5)
% Brat rodzony
% brat_rodzony(jan, ignacy). - true
% brat_rodzony(mateusz, janusz). - false

% Przykład 6)
% Brat przyrodni
% brat_przyrodni(mateusz, anna). - true
% brat_przyrodni(jan, ignacy). - false

% Przykład 7)
% Kuzyn
% kuzyn(mateusz, karol). - true
% kuzyn(julia, marysia). - false

% Przykład 8)
% Dziadek od strony ojca
% dziadek_od_strony_ojca(janusz, mateusz). - true
% dziadek_od_strony_ojca(marian, nikola). - false

% Przykład 9)
% Dziadek od strony matki
% dziadek_od_strony_matki(marian, nikola). - true
% dziadek_od_strony_matki(marian, anna). - false

% Przykład 10)
% Dziadek
% dziadek(janusz, mateusz). - true
% dziadek(jan, karol). - false

% Przykład 11)
% Babcia
% babcia(elzbieta, anna). - true
% babcia(julia, marysia). - false

% Przykład 12)
% Wnuczka
% wnuczka(elzbieta, anna). - true
% wnuczka(marian, marysia). - false

% Przykład 13)
% Przodek do dwóch pokoleń wstecz
% przodek_do2pokolenia_wstecz(antoni, mateusz). - true
% przodek_do2pokolenia_wstecz(antoni, ignacy). - false

% Przykład 14)
% Przodek do trzech pokoleń wstecz
% przodek_do3pokolenia_wstecz(jadwiga, anna). - true
% przodek_do3pokolenia_wstecz(jadwiga, julia). - false
