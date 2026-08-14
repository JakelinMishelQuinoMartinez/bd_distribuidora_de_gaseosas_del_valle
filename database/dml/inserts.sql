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
