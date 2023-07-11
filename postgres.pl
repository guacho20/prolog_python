abrir_conexion :-
    odbc_connect('PostgreSQL30',_,
		[user(postgres),
		password('postgres'),
		alias(postgresql),
		open(once)
		]).



datos(X):-
    abrir_conexion,
    odbc_query('postgresql','SELECT * FROM datos', X). 

es_padre(A,B,X) :-
    abrir_conexion,
    odbc_query('postgresql',
                'INSERT INTO datos(padre,hijo) VALUES (\'~w\', \'~w\')'-[A, B],
                affected(X)).