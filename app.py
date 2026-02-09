from flask import Flask, render_template
import psycopg2 

app = Flask(__name__)

# Conexión a la base de datos
def get_connection():
    return psycopg2.connect(
        host="localhost",
        port="5432", 
        database="pokemon",
        user="tu usuario",
        password="crea tu bd y coloca tu contra"
    )

# ruta raíz
@app.route("/")
def home():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
    SELECT 
        p.id,
        p.nombre,
        t.nombre AS tipo,
        g.nombre AS generacion,
        p.hp,
        p.defensa,
        p.velocidad,
        p.poder
    FROM pokemon p
    JOIN tipo_de_pokemon t ON p.tipo_id = t.id
    JOIN generacion g ON t.generacion_id = g.id
    ORDER BY p.id
    """)

    pokemons = cur.fetchall()
    
    cur.close()
    conn.close()

    return render_template("index.html", pokemons=pokemons)

if __name__ == "__main__":

    app.run(debug=True)
