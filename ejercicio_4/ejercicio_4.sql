CREATE Table Area(
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

INSERT INTO Proveedor (nombre_proveedor, empresa, telefono, email, direccion, activo)
VALUES
('Carlos Soto', 'Lácteos del Norte', '4921111111', 'contacto@lacteosnorte.com', 'Zacatecas, Zac.', 1),
('Ana Ruiz', 'Abarrotes Central', '4922222222', 'ventas@abarrotescentral.com', 'Guadalupe, Zac.', 1),
('Luis Hernández', 'Panificadora La Espiga', '4923333333', 'pedidos@laespiga.com', 'Fresnillo, Zac.', 1),
('Mariana López', 'Bebidas del Centro', '4924444444', 'info@bebidascentro.com', 'Zacatecas, Zac.', 1);

INSERT INTO Producto (
  codigo_barras, nombre, descripcion,
  precio_venta, precio_compra, stock, stock_minimo, unidad_medida,
  fecha_caducidad, activo
)
VALUES
('750100000001', 'Arroz 1kg', 'Arroz extra', 28.00, 20.00, 40, 10, 'kg', '2026-11-30', 1),
('750100000002', 'Leche Entera 1L', 'Leche pasteurizada', 20.00, 14.00, 25, 8, 'lt', '2026-03-10', 1),
('750100000003', 'Detergente 1kg', 'Detergente en polvo', 52.00, 35.00, 2, 5, 'kg', NULL, 1),
('750100000004', 'Pan Blanco', 'Pan de caja', 28.00, 18.00, 30, 10, 'pz', '2026-02-25', 1),
('750100000005', 'Refresco 600ml', 'Bebida energetica', 16.00, 10.00, 60, 20, 'pz', '2026-08-01', 1),
('750100000006', 'Manzana', 'Fruta fresca', 45.00, 28.00, 20, 8, 'kg', '2026-02-22', 1),
('750100000007', 'Papas Fritas 50g', 'Snack', 10.00, 6.00, 80, 30, 'pz', '2026-09-15', 1),
('750100000008', 'Yogurt Natural 1L', 'Yogurt sin azúcar', 32.00, 22.00, 10, 6, 'lt', '2026-02-28', 1);

INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 1 FROM Producto p WHERE p.codigo_barras='750100000001'; -- Abarrotes
INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 2 FROM Producto p WHERE p.codigo_barras='750100000002'; -- Lácteos
INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 7 FROM Producto p WHERE p.codigo_barras='750100000003'; -- Limpieza
INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 4 FROM Producto p WHERE p.codigo_barras='750100000004'; -- Panadería
INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 3 FROM Producto p WHERE p.codigo_barras='750100000005'; -- Bebidas
INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 6 FROM Producto p WHERE p.codigo_barras='750100000006'; -- Frutas y Verduras
INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 9 FROM Producto p WHERE p.codigo_barras='750100000007'; -- Dulces y Botanas
INSERT INTO Producto_Categoria (id_producto, id_categoria)
SELECT p.id_producto, 2 FROM Producto p WHERE p.codigo_barras='750100000008'; -- Lácteos

INSERT INTO Compras (id_proveedor, id_empleado, fecha_compra, fecha_entrega, subtotal, impuestos, total, estado, notas)
SELECT pr.id_proveedor, 2, '2026-02-10 10:00:00', '2026-02-11', 250.00, 0.00, 250.00, 'RECIBIDA', 'CMP-001'
FROM Proveedor pr WHERE pr.empresa='Lácteos del Norte';

INSERT INTO Compras (id_proveedor, id_empleado, fecha_compra, fecha_entrega, subtotal, impuestos, total, estado, notas)
SELECT pr.id_proveedor, 2, '2026-02-12 09:15:00', '2026-02-12', 600.00, 0.00, 600.00, 'RECIBIDA', 'CMP-002'
FROM Proveedor pr WHERE pr.empresa='Abarrotes Central';

INSERT INTO Compras (id_proveedor, id_empleado, fecha_compra, fecha_entrega, subtotal, impuestos, total, estado, notas)
SELECT pr.id_proveedor, 2, '2026-02-14 08:30:00', NULL, 540.00, 0.00, 540.00, 'PENDIENTE', 'CMP-003'
FROM Proveedor pr WHERE pr.empresa='Panificadora La Espiga';

INSERT INTO Detalle_Compras (id_compra, id_producto, cantidad, precio_unitario, subtotal)
SELECT c.id_compra, p.id_producto, 10, 14.00, 140.00
FROM Compras c JOIN Producto p ON p.codigo_barras='750100000002'
WHERE c.notas='CMP-001';

INSERT INTO Detalle_Compras (id_compra, id_producto, cantidad, precio_unitario, subtotal)
SELECT c.id_compra, p.id_producto, 5, 22.00, 110.00
FROM Compras c JOIN Producto p ON p.codigo_barras='750100000008'
WHERE c.notas='CMP-001';

INSERT INTO Detalle_Compras (id_compra, id_producto, cantidad, precio_unitario, subtotal)
SELECT c.id_compra, p.id_producto, 15, 20.00, 300.00
FROM Compras c JOIN Producto p ON p.codigo_barras='750100000001'
WHERE c.notas='CMP-002';

INSERT INTO Detalle_Compras (id_compra, id_producto, cantidad, precio_unitario, subtotal)
SELECT c.id_compra, p.id_producto, 50, 6.00, 300.00
FROM Compras c JOIN Producto p ON p.codigo_barras='750100000007'
WHERE c.notas='CMP-002';

INSERT INTO Detalle_Compras (id_compra, id_producto, cantidad, precio_unitario, subtotal)
SELECT c.id_compra, p.id_producto, 30, 18.00, 540.00
FROM Compras c JOIN Producto p ON p.codigo_barras='750100000004'
WHERE c.notas='CMP-003';

INSERT INTO Ventas (id_cliente, id_empleado, fecha_venta, subtotal, impuestos, descuento, total, metodo_pago, estado, notas)
VALUES
(1, 1, '2026-02-16 12:10:00', 104.00, 0.00, 0.00, 104.00, 'EFECTIVO', 'COMPLETADA', 'VTA-001'),
(1, 1, '2026-02-16 18:40:00', 96.00, 0.00, 11.00, 85.00, 'TARJETA', 'COMPLETADA', 'VTA-002'),
(1, 2, '2026-02-17 09:05:00', 77.00, 0.00, 0.00, 77.00, 'TRANSFERENCIA', 'COMPLETADA', 'VTA-003'),
(1, 2, '2026-02-17 20:10:00', 0.00, 0.00, 0.00, 0.00, 'EFECTIVO', 'CANCELADA', 'VTA-004');

INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
SELECT v.id_venta, p.id_producto, 2, 28.00, 56.00
FROM Ventas v JOIN Producto p ON p.codigo_barras='750100000001'
WHERE v.notas='VTA-001';

INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
SELECT v.id_venta, p.id_producto, 3, 16.00, 48.00
FROM Ventas v JOIN Producto p ON p.codigo_barras='750100000005'
WHERE v.notas='VTA-001';

INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
SELECT v.id_venta, p.id_producto, 2, 28.00, 56.00
FROM Ventas v JOIN Producto p ON p.codigo_barras='750100000004'
WHERE v.notas='VTA-002';

INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
SELECT v.id_venta, p.id_producto, 2, 20.00, 40.00
FROM Ventas v JOIN Producto p ON p.codigo_barras='750100000002'
WHERE v.notas='VTA-002';

INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
SELECT v.id_venta, p.id_producto, 1, 45.00, 45.00
FROM Ventas v JOIN Producto p ON p.codigo_barras='750100000006'
WHERE v.notas='VTA-003';

INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
SELECT v.id_venta, p.id_producto, 1, 32.00, 32.00
FROM Ventas v JOIN Producto p ON p.codigo_barras='750100000008'
WHERE v.notas='VTA-003';

COMMIT;

SELECT * FROM cliente;
SELECT * FROM productos;
SELECT * FROM empleado;
SELECT * FROM proveedor;
SELECT * FROM compras;