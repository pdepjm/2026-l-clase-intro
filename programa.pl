% codigo guau

juegaEn(argentina, messi).
juegaEn(argentina, alvarez).
juegaEn(argentina, dePaul).
juegaEn(uruguay, vinia).
juegaEn(colombia, quintero).
juegaEn(interMiami, messi).
juegaEn(interMiami, dePaul).
juegaEn(river, montiel).
juegaEn(river, quintero).
juegaEn(river, vinia).
juegaEn(boca, paredes).

% juegaEn(pepito).

ultimoGanado(argentina, 2022).
ultimoGanado(uruguay, 1950).

ultimoGanado(2014, alemania).

jugador(Jugador):-
    juegaEn(_, Jugador).

jugador(gabriel).

fueCampeon(Jugador):-
    juegaEn(Equipo, Jugador),
    ultimoGanado(Equipo, _).

esCrack(messi).

esCrack(Jugador):-
    juegaEn(argentina, Jugador),
    juegaEn(interMiami, Jugador).

estadisticas(messi, 1140, 900).
estadisticas(quintero, 450, 75).
estadisticas(alvarez, 325, 130).
estadisticas(pepita, 1, 7).

% goles(messi, 900).
% partidos(messi, 1140).

goles(Jugador, Goles):-
    estadisticas(Jugador, _, Goles).

partidos(Jugador, Partidos):-
    estadisticas(Jugador, Partidos, _).

esValioso(Jugador):-
    masGolesQuePartidos(Jugador).

masGolesQuePartidos(Jugador):-
    estadisticas(Jugador, Partidos, Goles),
    Goles > Partidos.

masGolesQuePartidos(Jugador):-
    goles(Jugador, Goles),
    partidos(Jugador, Partidos),
    Goles >= Partidos.

esValioso(UnJugador):-
    comparteClub(UnJugador, OtroJugador),
    esCrack(OtroJugador).

comparteClub(UnJugador, OtroJugador):-
    juegaEn(Equipo, UnJugador),
    juegaEn(Equipo, OtroJugador),
    UnJugador \= OtroJugador.
