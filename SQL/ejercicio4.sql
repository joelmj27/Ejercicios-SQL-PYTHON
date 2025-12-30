/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE Pedidos (
  id SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_producto INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
  FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/
INSERT INTO Pedidos VALUES
(1 ,1, 1),
(2 ,1, 3),
(3, 2, 2);

/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT U.nombre, COALESCE(P.nombre, 'Sin pedido') AS producto
FROM Usuarios AS U
LEFT JOIN Pedidos AS Pe 
ON Pe.id_usuario = U.id
LEFT JOIN Productos AS P
ON P.id = Pe.id_producto;

/*4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT U.nombre AS usuario
FROM Usuarios AS U
LEFT JOIN Pedidos AS Pe 
ON Pe.id_usuario = U.id;

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE Pedidos
ADD COLUMN cantidad INT;
UPDATE Pedidos
SET cantidad = 1;