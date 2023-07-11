from flask import Flask, request, render_template, flash, redirect, url_for
from pyswip import Prolog

# Application initializations
app = Flask(__name__)

# settings como va ir protegida la session
app.secret_key = "mysecretkey"

# prolog
prolog = Prolog()
prolog.consult("postgres.pl", True)


@app.route("/")
def Index():

    datos = list(prolog.query("datos(X)"))

    return render_template("index.html", data=datos)


@app.route("/add_padre", methods=["POST"])
def add_padre():
    if request.method == "POST":
        padre = request.form["padre"]
        hijo = request.form["hijo"]
        print(padre, hijo)

        insert = list(prolog.query("es_padre(" + padre + "," + hijo + ",X)"))

        print(insert)
        flash("Added successfully")

        return redirect(url_for("Index"))


# starting the app
if __name__ == "__main__":
    app.run(port=4000, debug=True)
