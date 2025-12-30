/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio NUMERIC
);

/*2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO Productos VALUES
(1,'Pelota', 30),
(2,'Camiseta', 80),
(3,'Botas', 150),
(4,'Espinilleras', 15),
(5,'Guantes', 45);

/*3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE Productos
SET precio = 35
WHERE id = 2;

/*4. Elimina un producto de la tabla "Productos".*/
DELETE FROM Productos
WHERE id=2;

/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/
CREATE TABLE Pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL
);

SELECT U.nombre, P.nombre
FROM Usuarios AS U
INNER JOIN Pedidos AS Pe
ON Pe.usuario_id = U.id
INNER JOIN Productos as P
ON P.id=Pe.producto_id;