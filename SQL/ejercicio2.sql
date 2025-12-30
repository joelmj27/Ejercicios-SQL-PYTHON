/* 1. Crea una base de datos llamada "MiBaseDeDatos".*/
CREATE DATABASE MiBaseDeDatos;

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT
);
/*3. Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO Usuarios VALUES
(1,'Joel', 27),
(2,'Ruben', 22);

/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE Usuarios
SET edad = 23
WHERE id = 2;

/*5. Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM usuarios
WHERE id = 2;

/*1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE Ciudades(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  pais VARCHAR(255) NOT NULL
);

/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO Ciudades VALUES
(1,'Madrid', 'España'),
(2,'Brujas', 'Belgica'),
(3,'Roma','Italia');

/*3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE Usuarios
ADD COLUMN ciudad_id INT;
ALTER TABLE Usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id)
REFERENCES Ciudades(id);
/*4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT U.nombre,C.nombre,C.pais FROM usuarios AS U 
LEFT JOIN ciudades AS C 
ON C.id=U.Ciudad_id;
/*5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT U.nombre, C.nombre FROM usuarios AS U 
INNER JOIN ciudades AS C
ON C.id=U.Ciudad_id;