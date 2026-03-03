INSERT INTO autor(nombre, nacionalidad, biografia, email)
VALUES('Carlos', 'Venezuela', 'Hola soy carlos', 'carlos2@gmail.com');

INSERT INTO libro(nombre_libro, genero)
VALUES('El libro Troll','Romance');

INSERT INTO editorial(nombre_Editorial, direccion, telefono)
VALUES('A','Mi casa','16');

INSERT INTO usuario(nombre_usario, direcion, telefono) 
VALUES('Hector', 'Su casa', '4');

SELECT
    l.nombre_libro,
    a.nombre AS autor,
    a.nacionalidad
FROM libro l
JOIN libro_autor la ON l.id_libro = la.id_libro
JOIN autor a ON la.id_autor = a.id_autor;

SELECT 
    u.nombre_usario,
    l.nombre_libro,
    pr.fecha_prestamo,
    pr.fecha_devolucion
FROM Prestamos pr
JOIN Usuario u ON pr.id_usuario = u.id_usuario
JOIN Libro l ON pr.id_libro = l.id_libro;


INSERT INTO prestamos (id_libro, id_usuario, fecha_devolucion)
VALUES (1, 1, '2026-03-01');


INSERT INTO reserva (id_usuario, id_libro, fecha_reserva)
VALUES (1, 1, '2026-02-20');


INSERT INTO publicacion (id_libro, id_editorial)
VALUES (1, 1);

SELECT Nombre FROM autor ORDER BY id_autor;

SELECT * FROM autor;
SELECT * FROM libro;
SELECT * FROM editorial;
SELECT * FROM usuario;
SELECT * FROM libro_autor;
SELECT * FROM prestamos;
SELECT * FROM reserva;
SELECT * FROM publicacion;