SELECT current_database();


--creo las tablas 
CREATE TABLE IF NOT EXISTS pokemon (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    tipo_id INTEGER NOT NULL,
    hp INTEGER NOT NULL,
    defensa INTEGER NOT NULL,
    velocidad INTEGER NOT NULL,
    poder INTEGER NOT NULL,
    CONSTRAINT fk_pokemon_tipo
        FOREIGN KEY (tipo_id)
        REFERENCES tipo_de_pokemon(id)
);

CREATE TABLE IF NOT EXISTS tipo_de_pokemon (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    generacion_id INTEGER NOT NULL,
    CONSTRAINT fk_tipo_generacion
        FOREIGN KEY (generacion_id)
        REFERENCES generacion(id)
);


CREATE TABLE IF NOT EXISTS generacion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);


--prueba de datos pokemon mas famoso


--GENERACION 1
-- Inserto solo la primera generación
INSERT INTO generacion (id, nombre) VALUES (1, 'Primera');


--TIPO ELECTRICO
-- Inserto el tipo "electrico"
INSERT INTO tipo_de_pokemon (id, nombre, generacion_id) VALUES (1, 'Eléctrico', 1);
--pokemon tipo "agua"
INSERT INTO tipo_de_pokemon (id, nombre, generacion_id) VALUES (2, 'Agua', 1);


--POKEMONES electricos 
--El famoso (Pikachu)
INSERT INTO pokemon (id, nombre, tipo_id, hp, defensa, velocidad, poder) 
VALUES (1, 'Pikachu', 1, 35, 40, 90, 55);

INSERT INTO pokemon (id, nombre, tipo_id, hp, defensa, velocidad, poder) 
VALUES (2, 'Electabuzz', 1, 65, 57, 105, 95);


--POKEMONES de agua 
INSERT INTO pokemon (id, nombre, tipo_id, hp, defensa, velocidad, poder) 
VALUES (4, 'Lapras', 2, 130, 80, 60, 85);

INSERT INTO pokemon (id, nombre, tipo_id, hp, defensa, velocidad, poder) 
VALUES (5, 'Squirtle', 2, 44, 65, 43, 48);


