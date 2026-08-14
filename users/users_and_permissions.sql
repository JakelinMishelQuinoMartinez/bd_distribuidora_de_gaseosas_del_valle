
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