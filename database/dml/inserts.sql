USE distribuidora_de_gaseosas_del_valle;

-- ======================================================
-- 1. CATEGORÍAS
-- ======================================================
INSERT INTO categorias (nombre, descripcion) VALUES
('Cola', 'Gaseosas sabor cola tradicional y dietéticas'),
('Frutales', 'Gaseosas con sabores a frutas como naranja, limón, uva'),
('Energéticas', 'Bebidas con cafeína y taurina para energía'),
('Cítricas', 'Gaseosas con base de cítricos como lima-limón y pomelo'),
('Light/Zero', 'Gaseosas sin azúcar o bajas en calorías');

-- ======================================================
-- 2. PRODUCTOS
-- ======================================================
INSERT INTO productos (nombre, id_categoria, volumen_ml, precio, stock_actual, stock_minimo) VALUES
-- Cola (id_categoria = 1)
('Cola Original 355ml', 1, 355, 5.50, 120, 20),
('Cola Original 600ml', 1, 600, 8.00, 150, 30),
('Cola Original 2L', 1, 2000, 15.00, 80, 15),
('Cola Original 3L', 1, 3000, 20.00, 60, 10),
('Cola Diet 355ml', 1, 355, 5.50, 90, 15),
('Cola Diet 600ml', 1, 600, 8.00, 100, 20),
('Cola Diet 2L', 1, 2000, 15.00, 70, 10),
('Cola Zero 355ml', 1, 355, 5.50, 110, 20),
('Cola Zero 600ml', 1, 600, 8.00, 130, 25),
('Cola Zero 2L', 1, 2000, 15.00, 85, 15),
-- Frutales (id_categoria = 2)
('Naranja 355ml', 2, 355, 5.00, 140, 25),
('Naranja 600ml', 2, 600, 7.50, 160, 30),
('Naranja 2L', 2, 2000, 14.00, 90, 15),
('Uva 355ml', 2, 355, 5.00, 100, 20),
('Uva 600ml', 2, 600, 7.50, 120, 25),
('Uva 2L', 2, 2000, 14.00, 75, 10),
('Fresa 355ml', 2, 355, 5.00, 130, 20),
('Fresa 600ml', 2, 600, 7.50, 110, 20),
('Fresa 2L', 2, 2000, 14.00, 80, 15),
('Piña 355ml', 2, 355, 5.00, 95, 15),
('Piña 600ml', 2, 600, 7.50, 105, 20),
('Piña 2L', 2, 2000, 14.00, 70, 10),
('Mango 355ml', 2, 355, 5.50, 85, 15),
('Mango 600ml', 2, 600, 8.00, 95, 20),
('Mango 2L', 2, 2000, 15.00, 65, 10),
-- Energéticas (id_categoria = 3)
('Energy Original 250ml', 3, 250, 8.50, 80, 10),
('Energy Original 500ml', 3, 500, 12.00, 60, 10),
('Energy Sugar Free 250ml', 3, 250, 8.50, 70, 10),
('Energy Sugar Free 500ml', 3, 500, 12.00, 50, 8),
('Energy Tropical 250ml', 3, 250, 9.00, 65, 10),
('Energy Tropical 500ml', 3, 500, 13.00, 45, 8),
('Energy Blue 250ml', 3, 250, 9.00, 55, 8),
('Energy Blue 500ml', 3, 500, 13.00, 40, 5),
-- Cítricas (id_categoria = 4)
('Lima-Limón 355ml', 4, 355, 5.00, 150, 25),
('Lima-Limón 600ml', 4, 600, 7.50, 170, 30),
('Lima-Limón 2L', 4, 2000, 14.00, 100, 20),
('Pomelo 355ml', 4, 355, 5.50, 90, 15),
('Pomelo 600ml', 4, 600, 8.00, 110, 20),
('Pomelo 2L', 4, 2000, 15.00, 70, 10),
('Toronja 355ml', 4, 355, 5.50, 85, 15),
('Toronja 600ml', 4, 600, 8.00, 95, 20),
('Toronja 2L', 4, 2000, 15.00, 60, 10),
('Lima 355ml', 4, 355, 5.00, 120, 20),
('Lima 600ml', 4, 600, 7.50, 130, 25),
('Lima 2L', 4, 2000, 14.00, 80, 15),
-- Light/Zero (id_categoria = 5)
('Cola Light 355ml', 5, 355, 5.50, 100, 20),
('Cola Light 600ml', 5, 600, 8.00, 120, 25),
('Cola Light 2L', 5, 2000, 15.00, 75, 15),
('Naranja Zero 355ml', 5, 355, 5.00, 90, 15),
('Naranja Zero 600ml', 5, 600, 7.50, 100, 20),
('Naranja Zero 2L', 5, 2000, 14.00, 65, 10),
('Lima-Limón Zero 355ml', 5, 355, 5.00, 110, 20),
('Lima-Limón Zero 600ml', 5, 600, 7.50, 115, 20),
('Lima-Limón Zero 2L', 5, 2000, 14.00, 70, 15);

-- ======================================================
-- 3. DEPARTAMENTOS Y MUNICIPIOS (Guatemala)
-- ======================================================
INSERT INTO departamentos (nombre) VALUES
('Guatemala'),
('Sacatepéquez'),
('Escuintla'),
('Quetzaltenango'),
('Huehuetenango'),
('Alta Verapaz'),
('Izabal'),
('Petén'),
('Chimaltenango'),
('Sololá');

INSERT INTO municipios (nombre, id_departamento) VALUES
-- Guatemala (id=1)
('Guatemala', 1), ('Mixco', 1), ('Villa Nueva', 1), ('San Miguel Petapa', 1), ('Amatitlán', 1),
-- Sacatepéquez (id=2)
('Antigua Guatemala', 2), ('Jocotenango', 2), ('Sumpango', 2),
-- Escuintla (id=3)
('Escuintla', 3), ('Tiquisate', 3), ('Palín', 3),
-- Quetzaltenango (id=4)
('Quetzaltenango', 4), ('San Marcos', 4), ('Coatepeque', 4),
-- Huehuetenango (id=5)
('Huehuetenango', 5), ('Chiantla', 5), ('Aguacatán', 5),
-- Alta Verapaz (id=6)
('Cobán', 6), ('San Pedro Carchá', 6),
-- Izabal (id=7)
('Puerto Barrios', 7), ('Morales', 7),
-- Petén (id=8)
('Flores', 8), ('San Benito', 8),
-- Chimaltenango (id=9)
('Chimaltenango', 9), ('Tecpán', 9),
-- Sololá (id=10)
('Sololá', 10), ('Panajachel', 10);

-- ======================================================
-- 4. ENCARGADOS
-- ======================================================
INSERT INTO encargados (nombre_completo, identificacion, correo_electronico, nombre_usuario, contrasena, activo) VALUES
('Carlos Eduardo Ramírez', '1234567890101', 'carlos.ramirez@distribuidora.com', 'cramirez', 'Carlos2026', TRUE),
('María Fernanda López', '1234567890102', 'maria.lopez@distribuidora.com', 'mlopez', 'Maria2026', TRUE),
('José Miguel Hernández', '1234567890103', 'jose.hernandez@distribuidora.com', 'jhernandez', 'Jose2026', TRUE),
('Ana Lucía Morales', '1234567890104', 'ana.morales@distribuidora.com', 'amorales', 'Ana2026', TRUE);

-- ======================================================
-- 5. SEDES
-- ======================================================
INSERT INTO sedes (nombre, ubicacion, id_municipio, capacidad_almacenamiento, id_encargado) VALUES
('Sede Central Guatemala', 'Zona 10, 5ta Avenida', 1, 5000, 1),
('Sede Occidente Quetzaltenango', 'Calle Principal, Zona 1', 12, 4000, 2),
('Sede Sur Escuintla', 'Carretera CA-9, Km 40', 9, 3500, 3),
('Sede Norte Cobán', 'Carretera a Cobán, Km 150', 18, 3000, 4);

-- ======================================================
-- 6. CLIENTES
-- ======================================================
INSERT INTO clientes (nombre_completo, identificacion, direccion, id_municipio, telefono, correo_electronico) VALUES
('Juan Pérez Gómez', '1234567890121', 'Calle Real 1-23 Zona 1', 1, '50010001', 'juan.perez@gmail.com'),
('Ana María Díaz', '1234567890122', 'Avenida Reforma 2-34 Zona 10', 1, '50010002', 'ana.diaz@hotmail.com'),
('Luis Fernando Méndez', '1234567890123', '3ra Calle 4-56 Zona 2', 2, '50020003', 'luis.mendez@gmail.com'),
('Marta Elena Castillo', '1234567890124', '5ta Avenida 6-78 Zona 3', 2, '50020004', 'marta.castillo@outlook.com'),
('Rosa María Flores', '1234567890125', 'Calle Principal 7-89', 3, '50030005', 'rosa.flores@gmail.com'),
('Pedro Antonio Reyes', '1234567890126', 'Avenida Central 8-90', 3, '50030006', 'pedro.reyes@yahoo.com'),
('Claudia Beatriz Soto', '1234567890127', 'Calle del Comercio 9-10', 4, '50040007', 'claudia.soto@gmail.com'),
('Ricardo José Méndez', '1234567890128', 'Plaza Mayor 10-11', 4, '50040008', 'ricardo.mendez@hotmail.com'),
('Sandra Elizabeth González', '1234567890129', 'Calle de los Álamos 11-12', 5, '50050009', 'sandra.gonzalez@gmail.com'),
('Manuel Alejandro Morales', '1234567890130', 'Avenida de las Américas 12-13', 5, '50050010', 'manuel.morales@gmail.com'),
('Laura Cristina López', '1234567890131', 'Calle del Bosque 13-14', 6, '50060011', 'laura.lopez@outlook.com'),
('Carlos Eduardo Guerra', '1234567890132', 'Residencial Las Flores 14-15', 6, '50060012', 'carlos.guerra@gmail.com'),
('Marisol Elena Ramos', '1234567890133', 'Calle de los Pinos 15-16', 7, '50070013', 'marisol.ramos@gmail.com'),
('Roberto Carlos Martínez', '1234567890134', 'Avenida del Lago 16-17', 7, '50070014', 'roberto.martinez@hotmail.com'),
('Gabriela Alejandra Torres', '1234567890135', 'Calle del Sol 17-18', 8, '50080015', 'gabriela.torres@gmail.com'),
('Fernando José Chávez', '1234567890136', 'Avenida de la Luna 18-19', 8, '50080016', 'fernando.chavez@yahoo.com'),
('Diana Carolina Rodas', '1234567890137', 'Calle del Mar 19-20', 9, '50090017', 'diana.rodas@gmail.com'),
('Héctor Eduardo Sosa', '1234567890138', 'Avenida del Valle 20-21', 10, '50100018', 'hector.sosa@gmail.com'),
('Elena Raquel Pérez', '1234567890139', 'Calle de la Montaña 21-22', 10, '50100019', 'elena.perez@outlook.com'),
('Luis Arturo Aguilar', '1234567890140', 'Residencial Los Jardines 22-23', 11, '50110020', 'luis.aguilar@gmail.com');


-- ======================================================
-- 7. PEDIDOS y DETALLES_PEDIDOS
-- ======================================================

-- Generar 100 pedidos con fechas aleatorias en los últimos 30 días
-- Se usarán variables para simplificar la inserción
SET @fecha_base = NOW();

-- Se insertan 100 pedidos con estado variado
INSERT INTO pedidos (fecha, id_cliente, id_sede, total_sin_iva, total_con_iva, estado)
VALUES
-- Los primeros 20 pedidos
(NOW() - INTERVAL 1 DAY, 1, 1, 45.50, 50.96, 'entregado'),
(NOW() - INTERVAL 2 DAY, 2, 2, 32.00, 35.84, 'entregado'),
(NOW() - INTERVAL 3 DAY, 3, 3, 78.00, 87.36, 'entregado'),
(NOW() - INTERVAL 4 DAY, 4, 4, 55.50, 62.16, 'entregado'),
(NOW() - INTERVAL 5 DAY, 5, 1, 25.00, 28.00, 'entregado'),
(NOW() - INTERVAL 6 DAY, 6, 2, 90.00, 100.80, 'entregado'),
(NOW() - INTERVAL 7 DAY, 7, 3, 40.00, 44.80, 'entregado'),
(NOW() - INTERVAL 8 DAY, 8, 4, 68.50, 76.72, 'entregado'),
(NOW() - INTERVAL 9 DAY, 9, 1, 120.00, 134.40, 'entregado'),
(NOW() - INTERVAL 10 DAY, 10, 2, 34.50, 38.64, 'entregado'),
(NOW() - INTERVAL 11 DAY, 11, 3, 85.00, 95.20, 'entregado'),
(NOW() - INTERVAL 12 DAY, 12, 4, 56.00, 62.72, 'entregado'),
(NOW() - INTERVAL 13 DAY, 13, 1, 44.00, 49.28, 'entregado'),
(NOW() - INTERVAL 14 DAY, 14, 2, 72.50, 81.20, 'entregado'),
(NOW() - INTERVAL 15 DAY, 15, 3, 61.00, 68.32, 'entregado'),
(NOW() - INTERVAL 16 DAY, 16, 4, 38.00, 42.56, 'entregado'),
(NOW() - INTERVAL 17 DAY, 17, 1, 99.50, 111.44, 'entregado'),
(NOW() - INTERVAL 18 DAY, 18, 2, 47.00, 52.64, 'entregado'),
(NOW() - INTERVAL 19 DAY, 19, 3, 83.00, 92.96, 'entregado'),
(NOW() - INTERVAL 20 DAY, 20, 4, 52.50, 58.80, 'entregado'),
-- Pedidos 21-40
(NOW() - INTERVAL 1 DAY, 1, 2, 67.00, 75.04, 'entregado'),
(NOW() - INTERVAL 2 DAY, 2, 3, 41.50, 46.48, 'entregado'),
(NOW() - INTERVAL 3 DAY, 3, 4, 88.00, 98.56, 'entregado'),
(NOW() - INTERVAL 4 DAY, 4, 1, 33.00, 36.96, 'entregado'),
(NOW() - INTERVAL 5 DAY, 5, 2, 76.50, 85.68, 'entregado'),
(NOW() - INTERVAL 6 DAY, 6, 3, 54.00, 60.48, 'entregado'),
(NOW() - INTERVAL 7 DAY, 7, 4, 29.50, 33.04, 'entregado'),
(NOW() - INTERVAL 8 DAY, 8, 1, 62.00, 69.44, 'entregado'),
(NOW() - INTERVAL 9 DAY, 9, 2, 95.00, 106.40, 'entregado'),
(NOW() - INTERVAL 10 DAY, 10, 3, 48.50, 54.32, 'entregado'),
(NOW() - INTERVAL 11 DAY, 11, 4, 73.00, 81.76, 'entregado'),
(NOW() - INTERVAL 12 DAY, 12, 1, 39.00, 43.68, 'entregado'),
(NOW() - INTERVAL 13 DAY, 13, 2, 84.50, 94.64, 'entregado'),
(NOW() - INTERVAL 14 DAY, 14, 3, 57.00, 63.84, 'entregado'),
(NOW() - INTERVAL 15 DAY, 15, 4, 69.00, 77.28, 'entregado'),
(NOW() - INTERVAL 16 DAY, 16, 1, 42.50, 47.60, 'entregado'),
(NOW() - INTERVAL 17 DAY, 17, 2, 91.00, 101.92, 'entregado'),
(NOW() - INTERVAL 18 DAY, 18, 3, 64.00, 71.68, 'entregado'),
(NOW() - INTERVAL 19 DAY, 19, 4, 36.50, 40.88, 'entregado'),
(NOW() - INTERVAL 20 DAY, 20, 1, 77.00, 86.24, 'entregado'),
-- Pedidos 41-60
(NOW() - INTERVAL 1 DAY, 2, 1, 58.00, 64.96, 'en_proceso'),
(NOW() - INTERVAL 2 DAY, 4, 2, 43.50, 48.72, 'en_proceso'),
(NOW() - INTERVAL 3 DAY, 6, 3, 82.00, 91.84, 'en_proceso'),
(NOW() - INTERVAL 4 DAY, 8, 4, 31.00, 34.72, 'en_proceso'),
(NOW() - INTERVAL 5 DAY, 10, 1, 79.50, 89.04, 'en_proceso'),
(NOW() - INTERVAL 6 DAY, 12, 2, 46.00, 51.52, 'en_proceso'),
(NOW() - INTERVAL 7 DAY, 14, 3, 94.00, 105.28, 'en_proceso'),
(NOW() - INTERVAL 8 DAY, 16, 4, 37.50, 42.00, 'en_proceso'),
(NOW() - INTERVAL 9 DAY, 18, 1, 66.00, 73.92, 'en_proceso'),
(NOW() - INTERVAL 10 DAY, 20, 2, 53.00, 59.36, 'en_proceso'),
(NOW() - INTERVAL 11 DAY, 1, 3, 89.50, 100.24, 'pendiente'),
(NOW() - INTERVAL 12 DAY, 3, 4, 42.00, 47.04, 'pendiente'),
(NOW() - INTERVAL 13 DAY, 5, 1, 75.00, 84.00, 'pendiente'),
(NOW() - INTERVAL 14 DAY, 7, 2, 59.50, 66.64, 'pendiente'),
(NOW() - INTERVAL 15 DAY, 9, 3, 87.00, 97.44, 'pendiente'),
(NOW() - INTERVAL 16 DAY, 11, 4, 34.50, 38.64, 'pendiente'),
(NOW() - INTERVAL 17 DAY, 13, 1, 71.00, 79.52, 'pendiente'),
(NOW() - INTERVAL 18 DAY, 15, 2, 49.00, 54.88, 'pendiente'),
(NOW() - INTERVAL 19 DAY, 17, 3, 63.50, 71.12, 'pendiente'),
(NOW() - INTERVAL 20 DAY, 19, 4, 56.00, 62.72, 'pendiente'),
-- Pedidos 61-80
(NOW() - INTERVAL 3 DAY, 1, 4, 28.50, 31.92, 'cancelado'),
(NOW() - INTERVAL 5 DAY, 3, 1, 44.00, 49.28, 'cancelado'),
(NOW() - INTERVAL 7 DAY, 5, 2, 52.50, 58.80, 'cancelado'),
(NOW() - INTERVAL 9 DAY, 7, 3, 38.00, 42.56, 'cancelado'),
(NOW() - INTERVAL 11 DAY, 9, 4, 67.00, 75.04, 'cancelado'),
(NOW() - INTERVAL 2 DAY, 11, 1, 83.00, 92.96, 'enviado'),
(NOW() - INTERVAL 4 DAY, 13, 2, 61.50, 68.88, 'enviado'),
(NOW() - INTERVAL 6 DAY, 15, 3, 45.00, 50.40, 'enviado'),
(NOW() - INTERVAL 8 DAY, 17, 4, 79.00, 88.48, 'enviado'),
(NOW() - INTERVAL 10 DAY, 19, 1, 58.50, 65.52, 'enviado'),
(NOW() - INTERVAL 12 DAY, 2, 2, 92.00, 103.04, 'enviado'),
(NOW() - INTERVAL 14 DAY, 4, 3, 36.00, 40.32, 'enviado'),
(NOW() - INTERVAL 16 DAY, 6, 4, 74.50, 83.44, 'enviado'),
(NOW() - INTERVAL 18 DAY, 8, 1, 41.00, 45.92, 'enviado'),
(NOW() - INTERVAL 20 DAY, 10, 2, 68.00, 76.16, 'enviado'),
(NOW() - INTERVAL 22 DAY, 12, 3, 55.50, 62.16, 'enviado'),
(NOW() - INTERVAL 24 DAY, 14, 4, 43.00, 48.16, 'enviado'),
(NOW() - INTERVAL 26 DAY, 16, 1, 86.50, 96.88, 'enviado'),
(NOW() - INTERVAL 28 DAY, 18, 2, 49.50, 55.44, 'enviado'),
(NOW() - INTERVAL 30 DAY, 20, 3, 77.50, 86.80, 'enviado'),
-- Pedidos 81-100
(NOW() - INTERVAL 2 DAY, 1, 1, 63.00, 70.56, 'entregado'),
(NOW() - INTERVAL 4 DAY, 2, 2, 39.50, 44.24, 'entregado'),
(NOW() - INTERVAL 6 DAY, 3, 3, 81.00, 90.72, 'entregado'),
(NOW() - INTERVAL 8 DAY, 4, 4, 54.00, 60.48, 'en_proceso'),
(NOW() - INTERVAL 10 DAY, 5, 1, 47.50, 53.20, 'en_proceso'),
(NOW() - INTERVAL 12 DAY, 6, 2, 88.00, 98.56, 'pendiente'),
(NOW() - INTERVAL 14 DAY, 7, 3, 35.00, 39.20, 'pendiente'),
(NOW() - INTERVAL 16 DAY, 8, 4, 72.50, 81.20, 'cancelado'),
(NOW() - INTERVAL 18 DAY, 9, 1, 60.00, 67.20, 'cancelado'),
(NOW() - INTERVAL 20 DAY, 10, 2, 93.50, 104.72, 'enviado'),
(NOW() - INTERVAL 22 DAY, 11, 3, 40.50, 45.36, 'enviado'),
(NOW() - INTERVAL 24 DAY, 12, 4, 76.00, 85.12, 'entregado'),
(NOW() - INTERVAL 26 DAY, 13, 1, 51.00, 57.12, 'entregado'),
(NOW() - INTERVAL 28 DAY, 14, 2, 84.50, 94.64, 'entregado'),
(NOW() - INTERVAL 30 DAY, 15, 3, 37.00, 41.44, 'en_proceso'),
(NOW() - INTERVAL 3 DAY, 16, 4, 69.50, 77.84, 'en_proceso'),
(NOW() - INTERVAL 5 DAY, 17, 1, 56.00, 62.72, 'pendiente'),
(NOW() - INTERVAL 7 DAY, 18, 2, 43.50, 48.72, 'pendiente'),
(NOW() - INTERVAL 9 DAY, 19, 3, 80.00, 89.60, 'cancelado'),
(NOW() - INTERVAL 11 DAY, 20, 4, 62.50, 70.00, 'entregado');


-- ======================================================
-- 8. DETALLES DE PEDIDOS
-- ======================================================

-- Pedidos 1-20
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unidad) VALUES
(1, 1, 3, 5.50), (1, 5, 2, 5.50), (1, 11, 1, 5.00),
(2, 3, 1, 15.00), (2, 10, 2, 8.00), (2, 25, 1, 8.00),
(3, 2, 4, 8.00), (3, 15, 2, 7.50), (3, 30, 1, 12.00), (3, 40, 1, 8.00),
(4, 4, 2, 20.00), (4, 7, 1, 15.00), (4, 18, 3, 7.50),
(5, 8, 2, 5.50), (5, 22, 2, 7.50),
(6, 6, 3, 8.00), (6, 12, 2, 7.50), (6, 35, 1, 8.00), (6, 45, 2, 5.50),
(7, 9, 2, 5.50), (7, 19, 1, 14.00), (7, 28, 1, 13.00),
(8, 13, 2, 14.00), (8, 20, 3, 7.50), (8, 33, 2, 5.00), (8, 50, 1, 5.00),
(9, 1, 5, 5.50), (9, 14, 3, 5.00), (9, 26, 2, 8.50), (9, 38, 2, 15.00),
(10, 5, 2, 5.50), (10, 17, 2, 7.50), (10, 29, 1, 8.50),
(11, 3, 2, 15.00), (11, 11, 3, 5.00), (11, 21, 2, 14.00), (11, 48, 1, 7.50),
(12, 7, 2, 15.00), (12, 16, 1, 7.50), (12, 32, 2, 5.00),
(13, 10, 2, 8.00), (13, 23, 2, 5.50), (13, 41, 1, 5.00),
(14, 2, 3, 8.00), (14, 8, 2, 5.50), (14, 36, 1, 15.00), (14, 44, 2, 5.00),
(15, 4, 1, 20.00), (15, 13, 2, 14.00), (15, 25, 2, 8.00),
(16, 6, 2, 8.00), (16, 19, 2, 14.00), (16, 30, 1, 12.00),
(17, 1, 4, 5.50), (17, 9, 3, 5.50), (17, 22, 2, 7.50), (17, 34, 2, 8.00),
(18, 12, 2, 7.50), (18, 27, 2, 8.50), (18, 39, 1, 5.00),
(19, 5, 3, 5.50), (19, 15, 3, 7.50), (19, 20, 2, 7.50), (19, 46, 1, 14.00),
(20, 18, 2, 7.50), (20, 24, 2, 8.00), (20, 37, 1, 5.00);
-- Pedidios 21-40
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unidad) VALUES
(21, 2, 3, 8.00), (21, 14, 1, 5.00), (21, 31, 2, 12.00),
(22, 8, 2, 5.50), (22, 26, 2, 8.50), (22, 43, 1, 5.00),
(23, 3, 2, 15.00), (23, 11, 3, 5.00), (23, 29, 2, 8.50), (23, 47, 1, 7.50),
(24, 6, 2, 8.00), (24, 17, 2, 7.50), (24, 35, 1, 8.00),
(25, 1, 4, 5.50), (25, 10, 2, 8.00), (25, 22, 2, 7.50), (25, 49, 1, 7.50),
(26, 4, 1, 20.00), (26, 13, 2, 14.00), (26, 32, 1, 5.00),
(27, 9, 2, 5.50), (27, 20, 2, 7.50), (27, 40, 1, 8.00),
(28, 7, 1, 15.00), (28, 16, 2, 7.50), (28, 28, 2, 13.00), (28, 44, 1, 5.00),
(29, 5, 3, 5.50), (29, 12, 2, 7.50), (29, 30, 1, 12.00),
(30, 15, 2, 7.50), (30, 24, 2, 8.00), (30, 42, 1, 5.00), (30, 48, 1, 7.50),
(31, 3, 2, 15.00), (31, 19, 1, 14.00), (31, 33, 2, 5.00),
(32, 11, 3, 5.00), (32, 23, 2, 5.50), (32, 36, 1, 15.00),
(33, 2, 3, 8.00), (33, 8, 2, 5.50), (33, 27, 2, 8.50), (33, 45, 1, 5.50),
(34, 6, 2, 8.00), (34, 14, 1, 5.00), (34, 38, 1, 15.00),
(35, 1, 4, 5.50), (35, 10, 2, 8.00), (35, 25, 1, 8.00), (35, 50, 1, 5.00),
(36, 13, 2, 14.00), (36, 22, 2, 7.50), (36, 34, 1, 8.00),
(37, 4, 1, 20.00), (37, 18, 2, 7.50), (37, 29, 2, 8.50), (37, 47, 1, 7.50),
(38, 9, 2, 5.50), (38, 21, 1, 14.00), (38, 39, 1, 5.00),
(39, 7, 1, 15.00), (39, 16, 2, 7.50), (39, 31, 2, 12.00),
(40, 5, 3, 5.50), (40, 20, 2, 7.50), (40, 37, 1, 5.00);
-- Pedidos 41-60 
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unidad) VALUES
(41, 2, 3, 8.00), (41, 12, 2, 7.50), (41, 26, 1, 8.50),
(42, 8, 2, 5.50), (42, 15, 2, 7.50), (42, 30, 1, 12.00),
(43, 3, 2, 15.00), (43, 11, 3, 5.00), (43, 24, 1, 8.00), (43, 44, 1, 5.00),
(44, 6, 2, 8.00), (44, 17, 2, 7.50), (44, 35, 1, 8.00),
(45, 1, 4, 5.50), (45, 10, 2, 8.00), (45, 22, 2, 7.50), (45, 49, 1, 7.50),
(46, 4, 1, 20.00), (46, 13, 2, 14.00), (46, 32, 1, 5.00),
(47, 9, 2, 5.50), (47, 20, 2, 7.50), (47, 40, 1, 8.00),
(48, 7, 1, 15.00), (48, 16, 2, 7.50), (48, 28, 2, 13.00), (48, 44, 1, 5.00),
(49, 5, 3, 5.50), (49, 12, 2, 7.50), (49, 30, 1, 12.00),
(50, 15, 2, 7.50), (50, 24, 2, 8.00), (50, 42, 1, 5.00), (50, 48, 1, 7.50),
(51, 3, 2, 15.00), (51, 19, 1, 14.00), (51, 33, 2, 5.00),
(52, 11, 3, 5.00), (52, 23, 2, 5.50), (52, 36, 1, 15.00),
(53, 2, 3, 8.00), (53, 8, 2, 5.50), (53, 27, 2, 8.50), (53, 45, 1, 5.50),
(54, 6, 2, 8.00), (54, 14, 1, 5.00), (54, 38, 1, 15.00),
(55, 1, 4, 5.50), (55, 10, 2, 8.00), (55, 25, 1, 8.00), (55, 50, 1, 5.00),
(56, 13, 2, 14.00), (56, 22, 2, 7.50), (56, 34, 1, 8.00),
(57, 4, 1, 20.00), (57, 18, 2, 7.50), (57, 29, 2, 8.50), (57, 47, 1, 7.50),
(58, 9, 2, 5.50), (58, 21, 1, 14.00), (58, 39, 1, 5.00),
(59, 7, 1, 15.00), (59, 16, 2, 7.50), (59, 31, 2, 12.00),
(60, 5, 3, 5.50), (60, 20, 2, 7.50), (60, 37, 1, 5.00), (60, 46, 1, 14.00);
-- Pedidos 61-80
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unidad) VALUES
(61, 2, 2, 8.00), (61, 14, 2, 5.00), (61, 41, 1, 5.00),
(62, 8, 3, 5.50), (62, 19, 1, 14.00), (62, 32, 1, 5.00),
(63, 6, 2, 8.00), (63, 13, 2, 14.00), (63, 28, 1, 13.00),
(64, 1, 2, 5.50), (64, 11, 2, 5.00), (64, 24, 1, 8.00), (64, 43, 1, 5.00),
(65, 4, 2, 20.00), (65, 18, 2, 7.50), (65, 36, 1, 15.00),
(66, 9, 3, 5.50), (66, 22, 1, 7.50), (66, 33, 1, 5.00),
(67, 7, 1, 15.00), (67, 16, 2, 7.50), (67, 30, 2, 12.00), (67, 49, 1, 7.50),
(68, 5, 2, 5.50), (68, 12, 2, 7.50), (68, 27, 1, 8.50),
(69, 3, 2, 15.00), (69, 21, 2, 14.00), (69, 39, 1, 5.00),
(70, 10, 2, 8.00), (70, 20, 2, 7.50), (70, 35, 1, 8.00), (70, 46, 1, 14.00),
(71, 2, 3, 8.00), (71, 15, 2, 7.50), (71, 25, 1, 8.00),
(72, 8, 2, 5.50), (72, 17, 2, 7.50), (72, 38, 1, 15.00),
(73, 4, 1, 20.00), (73, 11, 3, 5.00), (73, 29, 2, 8.50), (73, 44, 1, 5.00),
(74, 6, 2, 8.00), (74, 14, 1, 5.00), (74, 31, 2, 12.00),
(75, 1, 5, 5.50), (75, 23, 2, 5.50), (75, 42, 1, 5.00),
(76, 3, 2, 15.00), (76, 13, 2, 14.00), (76, 34, 1, 8.00), (76, 48, 1, 7.50),
(77, 9, 3, 5.50), (77, 19, 2, 14.00), (77, 40, 1, 8.00),
(78, 5, 2, 5.50), (78, 16, 2, 7.50), (78, 28, 1, 13.00),
(79, 7, 1, 15.00), (79, 22, 2, 7.50), (79, 37, 1, 5.00), (79, 50, 1, 5.00),
(80, 10, 2, 8.00), (80, 18, 2, 7.50), (80, 32, 2, 5.00);
-- Pedidos 81-100
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unidad) VALUES
(81, 2, 3, 8.00), (81, 12, 2, 7.50), (81, 26, 1, 8.50), (81, 45, 1, 5.50),
(82, 8, 2, 5.50), (82, 15, 2, 7.50), (82, 33, 1, 5.00),
(83, 4, 2, 20.00), (83, 11, 3, 5.00), (83, 29, 1, 8.50),
(84, 6, 2, 8.00), (84, 14, 2, 5.00), (84, 38, 1, 15.00), (84, 49, 1, 7.50),
(85, 1, 3, 5.50), (85, 20, 2, 7.50), (85, 30, 1, 12.00),
(86, 3, 2, 15.00), (86, 19, 1, 14.00), (86, 36, 2, 15.00),
(87, 9, 3, 5.50), (87, 17, 2, 7.50), (87, 41, 1, 5.00), (87, 47, 1, 7.50),
(88, 5, 2, 5.50), (88, 13, 2, 14.00), (88, 24, 1, 8.00),
(89, 7, 1, 15.00), (89, 16, 2, 7.50), (89, 31, 2, 12.00), (89, 46, 1, 14.00),
(90, 10, 2, 8.00), (90, 22, 2, 7.50), (90, 35, 1, 8.00),
(91, 2, 3, 8.00), (91, 14, 1, 5.00), (91, 27, 2, 8.50),
(92, 8, 2, 5.50), (92, 18, 2, 7.50), (92, 40, 1, 8.00), (92, 50, 1, 5.00),
(93, 4, 1, 20.00), (93, 11, 3, 5.00), (93, 25, 2, 8.00),
(94, 6, 2, 8.00), (94, 13, 2, 14.00), (94, 34, 1, 8.00),
(95, 1, 4, 5.50), (95, 23, 2, 5.50), (95, 37, 1, 5.00), (95, 48, 1, 7.50),
(96, 9, 2, 5.50), (96, 16, 2, 7.50), (96, 32, 1, 5.00),
(97, 3, 2, 15.00), (97, 19, 1, 14.00), (97, 28, 2, 13.00), (97, 45, 1, 5.50),
(98, 5, 2, 5.50), (98, 15, 2, 7.50), (98, 30, 1, 12.00),
(99, 7, 1, 15.00), (99, 12, 2, 7.50), (99, 36, 2, 15.00), (99, 44, 1, 5.00),
(100, 10, 2, 8.00), (100, 20, 2, 7.50), (100, 39, 1, 5.00);