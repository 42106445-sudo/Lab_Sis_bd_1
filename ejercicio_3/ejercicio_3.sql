REATE Table Productos(
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto TEXT,
    cantidad_producto INT,
    precio_producto FLOAT,
    categoria_producto TEXT
);

CREATE Table Empleado(
    id_empleado int PRIMARY KEY AUTO_INCREMENT,
    nombre_empleado TEXT,
    edad_empleado int,
    direccion TEXT,
    telefono TEXT,
    email TEXT
)

Create Table Cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente TEXT
);

CREATE Table Proveedor(
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor TEXT,
    telefono TEXT
);

CREATE Table Compras(
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_producto INT,
    cantidad_producto INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);