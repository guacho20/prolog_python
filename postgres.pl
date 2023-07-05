abrir_conexion:-
	odbc_connect('PostgreSQL30',_,
		[user(postgres),
		password('postgres'),
		alias(postgresql),
		open(once)
		]).
cerrar_conexion:-
	odbc_disconnect('PostgreSQL30').
inserta_datos(F):-
	odbc_query('postgresql',
		'INSERT INTO public.datos(padre, hijo) VALUES (\'ruben\', \'marco\')',
		affected(F)).
% Artificio para conseguir la cadena de Insercion para la tabla
cadenaPH(A,B,C):-concat(A,'","',Z),concat(Z,B,W),
                 concat('INSERT INTO datos(padre,hijo) VALUES("',W,D),
                 concat(D,'")',C).
				 
es_padre1(P,H,X) :-cadenaPH(P,H,Cadena),
	odbc_query('swiprolog',
	Cadena,
 	affected(X)).

es_padre(P,H,X) :-
        odbc_query('postgresql',
                   'INSERT INTO datos(padre,hijo) VALUES( \'juanito\', \'Pedrito\' )',
                   affected(X)).


datos(R) :-
    odbc_query('postgresql',
               'SELECT * FROM datos',
               R). 