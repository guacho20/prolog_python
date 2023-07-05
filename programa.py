from pyswip import Prolog

prolog = Prolog()
prolog.consult("postgres.pl", True)
c= bool(list(prolog.query("abrir_conexion")));
print(c);