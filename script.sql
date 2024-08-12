--AQUÍ CREE LA TABLA USUARIOS--
CREATE TABLE Usuarios (Id serial, email Varchar, nombre Varchar, apellido Varchar, rol Varchar);

--ESTE COMANDO ES PARA VISUALIZAR LA TABLA USUARIOS--
SELECT * FROM Usuarios;

--LUEGO INSERTO LOS USUARIOS--

INSERT INTO USUARIOS (email, nombre, apellido, rol) VALUES 
('pablo@email.com', 'Pablo', 'Navarro', 'Administrador'),
('ignacio@email.com', 'Ignacio', 'Rojas', 'Usuario'),
('juliette@email.com', 'Juliette', 'Antonella', 'Administrador'),
('carolina@email.com', 'Carolina', 'Gaete', 'Usuario'),
('susana@email.com', 'Susana', 'Guerrero', 'Usuario');

--CREO LA SEGUNDA TABLA POSTS--
CREATE TABLE Posts (id serial, título Varchar, contenido Text, fecha_creación Timestamp, fecha_actualización Timestamp, destacado Boolean, usuario_id Bigint);

--VISUALIZAR TABLA POSTS--
SELECT * FROM Posts;

--CON ESTE COMANDO ELIMINO LA TABLA POSTS MAL CREADA--
DROP TABLE Posts;

--NUEVA TABLA POSTS--
CREATE TABLE Posts (id serial, titulo Varchar, contenido Text, fecha_creacion Timestamp, fecha_actualizacion Timestamp, destacado Boolean, usuario_id Bigint);

--AGREGAR NUEVOS COMENTARIOS--
INSERT INTO POSTS (id, titulo, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) VALUES 
(DEFAULT,'La noche', 'Curso SQL', '2024-07-23', '2024-09-13', true, 1),
(DEFAULT,'Academia Latam', 'Curso SQL', '2024-06-12', '2024-08-10', true, 3),
(DEFAULT,'Mercedes Benz', 'Curso SQL', '2024-02-10', '2024-06-20', false, 2),
(DEFAULT,'Renault', 'Curso SQL', '2024-01-15', '2024-08-16', false, 4),
(DEFAULT,'Great Wall', 'Curso SQL', '2024-12-15', '2024-03-16', false, null);

--CREO TABLA 3 COMENTARIOS--
CREATE TABLE Comentarios (id serial, contenido Varchar, fecha_creacion Timestap, Usuario_id BIGINT, post_id BIGINT);

--INSERTO NUEVOS COMENTARIOS TABLA 3--
INSERT INTO Comentarios (id, contenido, fecha_creacion, Usuario_id, post_id) VALUES (DEFAULT, 'Curso SQL', '2024-07-23', 1, 1),
(DEFAULT, 'Curso SQL', '2024-06-12', 2, 1),
(DEFAULT, 'Curso SQL', '2024-02-10', 3, 1),
(DEFAULT, 'Curso SQL', '2024-06-12', 2, 2),
(DEFAULT, 'Curso SQL', '2024-06-12', 2, 2);

--PARA CRUZAR LOS DATOS DE TABLA USUARIOS Y POSTS, MOSTRAR COLUMNAS NOMBRE Y EMAIL DEL USUARIO JUNTO AL TITULO Y CONTENIDO DEL POST.--
--CON EL INNER JOIN--

SELECT * FROM Usuarios, Posts
INNER JOIN Posts ON Usuarios.

--REQUERIMIENTOS DESAFÍO CONSULTAS EN MÚLTIPLES TABLAS--

2.	Cruza los datos de la tabla usuarios y posts, mostrando las siguientes columnas: nombre y email del usuario junto al título y contenido del post. 
RESPUESTA : SELECT * FROM Usuarios
INNER JOIN Posts ON Usuarios.id = Posts.id 

3.	Muestra el id, título y contenido de los posts de los administradores. a. El administrador puede ser cualquier id.
RESPUESTA: SELECT * FROM Usuarios
INNER JOIN Posts ON Usuarios.id = Posts.id
ORDER BY Usuarios.rol
LIMIT (1)

4.	Cuenta la cantidad de posts de cada usuario. a. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de posts de cada usuario.
RESPUESTA: SELECT Usuarios.email, COUNT (Posts.id) AS posts_count
FROM Usuarios
RIGHT JOIN Posts ON Usuarios.id = Posts.id
GROUP BY Usuarios.email
LIMIT 10;

5.	Muestra el email del usuario que ha creado más posts. a. Aquí la tabla resultante tiene un único registro y muestra solo el email.
RESPUESTA: SELECT Usuarios.email, COUNT (Posts.id) AS Posts_count
FROM Usuarios
INNER JOIN Posts ON Usuarios.id = Posts.id
GROUP BY Usuarios.email
ORDER BY Posts_count DESC
LIMIT 1;

6.	Muestra la fecha del último post de cada usuario.
RESPUESTA: SELECT Usuarios.nombre AS fecha_creacion, fecha_actualizacion
FROM Usuarios
INNER JOIN Posts ON Usuarios.id = Posts.id
ORDER BY Posts.fecha_creacion
LIMIT 5;

7.	Muestra el título y contenido del post (artículo) con más comentarios.
RESPUESTA: SELECT Usuarios.nombre AS titulo, contenido
FROM Posts
INNER JOIN Usuarios ON Usuarios.id = Posts.id
ORDER BY Posts.contenido
LIMIT 1;

8.	Muestra en una tabla el título de cada post, el contenido de cada post y el contenido de cada comentario asociado a los posts mostrados, junto con el email del usuario que lo escribió.
RESPUESTA: SELECT * 
 FROM Usuarios
 INNER JOIN Posts ON Usuarios.id = Posts.id
 INNER JOIN Comentarios ON Posts.id = Comentarios.id 
 LIMIT (5)

9.	Muestra el contenido del último comentario de cada usuario.
RESPUESTA: SELECT Usuarios.nombre AS titulo, contenido
FROM Posts
INNER JOIN Usuarios ON Usuarios.id = Posts.id
ORDER BY Posts.contenido
LIMIT 5;

10.	Muestra los emails de los usuarios que no han escrito ningún comentario.
RESPUESTA: SELECT Usuarios.nombre AS usuario_id, email
FROM Usuarios
INNER JOIN Posts ON Usuarios.id = Posts.id
WHERE usuario_id IS NULL
LIMIT 1;
