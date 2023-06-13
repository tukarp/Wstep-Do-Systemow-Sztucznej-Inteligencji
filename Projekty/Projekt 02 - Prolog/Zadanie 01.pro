% Wstęp do Systemów Sztucznej Inteligencji
% Projekt 02 - Prolog
% Zadanie 1

% Notatka - W definicji dziecko jest pierwsze, a rodzic jest drugi
% Przykład
% Y jest rodzicem X
% rodzic(X, Y).

% Przykład A)
% X i Y są rodzeństwem
% (((A jest rodzicem X) i (B jest rodzicem X)) i ((A jest rodzicem Y) i (B jest rodzicem Y)))
% (żadne z wartości nie mogą być sobie równe)
rodzenstwo(X, Y):- 
    (
    	(
    		(
            	(rodzic(X, A)),
       			(rodzic(X, B))
            ),
       		(
            	(rodzic(Y, A)),  
    			(rodzic(Y, B))
        	)
        ),
        (
        	(A \= X),
            (A \= Y),
            (B \= X),
            (B \= Y),
            (A \= B),
            (X \= Y)
        )
    ).

% Przykład B)
% X i Y są kuzynostwem
% (((B jest rodzicem X) i (B jest rodzicem A)) i ((C jest rodzicem Y) i (A jest rodzicem C)))
% (żadne z wartości nie mogą być sobie równe)
kuzynostwo(X, Y):-
    (
    	(
        	(rodzic(X, B)),
            (rodzic(A, B))
        ),
        (
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

% Przykład C)
% X i Y są dziadkami z dwóch stron rodziny
% (((X jest rodzicem B) i (B jest rodzicem A)) i ((Y jest rodzicem C) i (C jest rodzicem A)))
% (żadne z wartości nie mogą być sobie równe)
dziadkowie_z_dwoch_stron(X, Y):-
    (   
    	(
        	(rodzic(B, X)),
            (rodzic(A, B))
        ),
        (
        	(rodzic(C, Y)),
            (rodzic(A, C))
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

% Przykład D)
% Y jest ojczymem X
% ((A jest rodzicem X) i ((B jest rodzicem Y) i (B jest rodzicem A)))
% (żadne z wartości nie mogą być sobie równe)
ojczym(X, Y):-
    (
    	(
        	(rodzic(X, A))
    	),
    	(
        	(rodzic(B, Y)),
            (rodzic(B, A))
        ),
        (
        	(A \= X),
            (A \= Y),
            (B \= X),
            (B \= Y),
            (A \= B),
            (X \= Y)
        )
    ).


% Przykład E)
% X i Y są przyrodnim rodzeństwem
% (((A jest rodzicem X) i (B jest rodzicem X)) i ((B jest rodzicem Y) i (C jest rodzicem Y)))
% (żadne z wartości nie mogą być sobie równe)
przyrodnie_rodzenstwo(X, Y):-
    (
    	(
        	(rodzic(X, A)),
            (rodzic(X, B))
        ),
    	(
        	(rodzic(Y, B)),
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

% Przykład F)
% Y jest szwagrem X
% ((X jest rodzicem C) i (B jest rodzicem C) i (A jest rodzicem B) i (A jest rodzicem Y))
% (żadne z wartości nie mogą być sobie równe)
szwagier(X, Y):-
    (
    	(
        	(rodzic(C, X)),
        	(rodzic(C, B)),
            (rodzic(B, A)),
        	(rodzic(Y, A))
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

% Przykład G)
% X jest wujkiem Y
% (((A jest rodzicem X) i (B jest rodzicem X)) i (A jest rodzicem C) i (C jest rodzicem Y))
% (żadne z wartości nie mogą być sobie równe)
wujek(X, Y):-
	(
   		(
        	(rodzic(X, A)),
            (rodzic(X, B))
        ),
    	(
        	(rodzic(C, A))
        ),
        (
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

% Utworzenie osób i relacji
% Przykład A)
% Rodzeństwo
% Adam jest rodzeństwem Adrianny
rodzic(adam, anna).
rodzic(adam, albert).
rodzic(adrianna, anna).
rodzic(adrianna, albert).

% Przykład B)
% Kuzynostwo
% Bartosz jest kuzynem Beaty
rodzic(borys, barbara).
rodzic(beata, bernadeta).
rodzic(bartosz, barbara).
rodzic(bernadeta, borys).

% Przykład C)
% Dziadkowie z dwóch stron rodziny
% Cezary i Cecylia są dziadkami z dwóch stron rodziny
rodzic(celina, cezary).
rodzic(czeslaw, celina).
rodzic(cyprian, cecylia).
rodzic(czeslaw, cyprian).

% Przykład D)
% Ojczym
% Damian jest ojczymem Dawida
rodzic(dawid, danuta).
rodzic(dominika, damian).
rodzic(dominika, danuta).

% Przykład E)
% Przyrodnie rodzeństwo
% Edward jest przyrodnim rodzeństwem Eliny
rodzic(elina, ewa).
rodzic(elina, eryk).
rodzic(edward, eryk).
rodzic(edward, emilia).

% Przykład F)
% Szwagier
% Filip jest szwagrem Feliksa
rodzic(franciszka, fabian).
rodzic(franciszka, filip).
rodzic(fabian, felicja).
rodzic(feliks, felicja).

% Przykład G)
% Wujek
% Grzegorz jest wujkiem Glorii
rodzic(gloria, genowefa).
rodzic(gloria, gabriel).
rodzic(greta, genowefa).
rodzic(grzegorz, greta).

% Wyniki relacji
% Przykład A)
% Rodzeństwo
% rodzenstwo(adam, adrianna). - true
% rodzenstwo(albert, anna). - false

% Przykład B)
% Kuzynostwo
% kuzynostwo(bartosz, beata). - true
% kuzynostwo(barbara, bernadeta). - false

% Przykład C)
% Dziadkowie z dwóch stron rodziny
% dziadkowie_z_dwoch_stron(cezary, cecylia). - true
% dziadkowie_z_dwoch_stron(czeslaw, celina). - false

% Przykład D)
% Ojczym
% ojczym(dawid, damian). - true
% ojczym(dominika, damian). - false

% Przykład E)
% Przyrodnie rodzeństwo
% przyrodnie_rodzenstwo(edward, elina). - true
% przyrodnie_rodzenstwo(edward, ewa). - false

% Przykład F)
% Szwagier
% szwagier(filip, feliks). - true
% szwagier(feliks, fabian). - false

% Przykład G)
% Wujek
% wujek(gloria, grzegorz). - true
% wujek(gabriel, genowefa). - false
