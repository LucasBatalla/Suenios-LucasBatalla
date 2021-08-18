% Aquí va el código.

% PUNTO 1
cree(gabriel, campanita).
cree(gabriel, magoDeOz).
cree(gabriel, cavenaghi).

cree(juan, conejoDePascua).

cree(macarena, reyesMagos).
cree(macarena, magoCapria).
cree(macarena, campanita).


suenio(gabriel, ganarLoteria([5,9])).
suenio(gabriel, serFutbolista(arsenal)).

suenio(juan, serCantante(100000)).

suenio(macarena, serCantante(10000)).

equipoChico(arsenal).
equipoChico(aldosivi).

equipoGrande(boca).
equipoGrande(barcelona).
equipoGrande(realMadrid).

suenioPuro(serFutbolista(_)).
suenioPuro(serCantante(DiscosVendidos)):-
    DiscosVendidos < 200000.

amigo(campanita, reyesMagos).
amigo(campanita, conejoDePascua).
amigo(conejoDePascua, cavenaghi).

enfermo(campanita).
enfermo(conejoDePascua).


% PUNTO 2

ambicioso(Persona):-
    suenio(Persona,_),
    findall(Dificultad, (suenio(Persona, Suenio), dificultadSuenio(Suenio, Dificultad)), DificultadTotal),
    sumlist(DificultadTotal, Suma),
    Suma > 20.
    

dificultadSuenio(cantante(DiscosVendidos),6):-
     DiscosVendidos > 500000.

dificultadSuenio(cantante(DiscosVendidos), 4):-
    DiscosVendidos =< 500000.

dificultadSuenio(ganarLoteria(NumerosApostados), Dificultad):-
    length(NumerosApostados,Cant),
    Dificultad is 10 * Cant.
        
dificultadSuenio(serFutbolista(Equipo), 3):-
    equipoChico(Equipo). 

dificultadSuenio(serFutbolista(Equipo), 16):-
    equipoGrande(Equipo).             

% PUNTO 3

tieneQuimica(Personaje, Persona):-
    cree(Persona, Personaje),
    criterioQuimicaPersonaje(Personaje, Persona).

criterioQuimicaPersonaje(campanita, Persona):-
    suenio(Persona, Suenio),
    dificultadSuenio(Suenio, Dificultad),
    Dificultad < 5.

criterioQuimicaPersonaje(_, Persona):-
    forall(suenio(Persona, Suenio), suenioPuro(Suenio)),
    not(ambicioso(Persona)).


% PUNTO 4

alegra(Personaje, Persona):-
    suenio(Persona,_),
    tieneQuimica(Personaje, Persona),
    lazoSano(Personaje).


lazoSano(Personaje):-
    cree(_, Personaje),
    not(enfermo(Personaje)).

lazoSano(Personaje):-
    enfermo(Personaje),
    not((esAmigo(Personaje, Amigo), enfermo(Amigo))).

esAmigo(Persona, Amigo):-
    amigo(Persona, Amigo).

esAmigo(Persona, Amigo):-
    amigo(Persona, OtroAmigo),
    esAmigo(OtroAmigo, Amigo).


