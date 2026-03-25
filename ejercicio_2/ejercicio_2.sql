CREATE Table Libro_Autor(
    id_autor INT,
    id_libro INT,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro)
);

CREATE TABLE Prestamos(
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_libro INT,
    id_usuario INT,
    fecha_prestamo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_devolucion DATE,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY(id_libro) REFERENCES libro(id_libro)
);

CREATE Table Reserva(
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_libro INT,
    fecha_reserva DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro)
);

CREATE TABLE Publicacion(
    id_libro INT,
    id_editorial INT,
    FOREIGN KEY(id_editorial) REFERENCES editorial(id_editorial),
    FOREIGN KEY(id_libro) REFERENCES libro(id_libro)
);