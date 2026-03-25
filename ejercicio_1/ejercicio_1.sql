CREATE TABLE Autor(
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR (60),
    Nacionalidad VARCHAR (40),
    biografia TEXT,
    email VARCHAR(50)
);

CREATE TABLE Libro(
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    nombre_libro VARCHAR (60),
    genero VARCHAR (40),
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Editorial(
    id_editorial INT PRIMARY KEY AUTO_INCREMENT,
    nombre_Editorial VARCHAR (60),
    direccion VARCHAR (40),
    telefono Varchar(20)
);

CREATE TABLE Usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usario VARCHAR (60),
    direcion VARCHAR (40),
    telefono VARCHAR(20)
);
