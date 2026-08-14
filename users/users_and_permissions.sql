
USE distribuidora_de_gaseosas_del_valle;
-- ====================================
-- USUARIOS
-- ====================================

-- ==========================================
-- 1. Usuario para Carlos Eduardo Ramírez (Sede Central Guatemala)
-- ==========================================
CREATE USER IF NOT EXISTS 'cramirez'@'localhost' IDENTIFIED BY 'Carlos2026';
GRANT ALL PRIVILEGES ON distribuidora_de_gaseosas_del_valle.* 
TO 'cramirez'@'localhost';

-- ==========================================
-- 2. Usuario para María Fernanda López (Sede Occidente Quetzaltenango)
-- ==========================================
CREATE USER IF NOT EXISTS 'mlopez'@'localhost' IDENTIFIED BY 'Maria2026';
GRANT ALL PRIVILEGES ON distribuidora_de_gaseosas_del_valle.* 
TO 'mlopez'@'localhost';

-- ==========================================
-- 3. Usuario para José Miguel Hernández (Sede Sur Escuintla)
-- ==========================================
CREATE USER IF NOT EXISTS 'jhernandez'@'localhost' IDENTIFIED BY 'Jose2026';
GRANT ALL PRIVILEGES ON distribuidora_de_gaseosas_del_valle.*
TO 'jhernandez'@'localhost';

-- ==========================================
-- 4. Usuario para Ana Lucía Morales (Sede Norte Cobán)
-- ==========================================
CREATE USER IF NOT EXISTS 'amorales'@'localhost' IDENTIFIED BY 'Ana2026';
GRANT ALL PRIVILEGES ON distribuidora_de_gaseosas_del_valle.*
TO 'amorales'@'localhost';

-- Ver los permisos de cada usuario
SHOW GRANTS FOR 'cramirez'@'localhost';
SHOW GRANTS FOR 'mlopez'@'localhost';
SHOW GRANTS FOR 'jhernandez'@'localhost';
SHOW GRANTS FOR 'amorales'@'localhost';