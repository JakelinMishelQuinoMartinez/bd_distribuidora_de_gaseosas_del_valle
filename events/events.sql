USE distribuidora_de_gaseosas_del_valle;
-- ====================================
-- EVENTOS
-- ====================================

-- Activar los eventos (por si están apagados)
SET GLOBAL event_scheduler = ON;

-- Tabla para guardar los avisos del evento
CREATE TABLE IF NOT EXISTS logs_stock_bajo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    producto_id INT,
    mensaje VARCHAR(200)
);

-- Crear un evento que se ejecute CADA DÍA a las 8:00 AM
DELIMITER //
CREATE EVENT evento_revisar_stock
ON SCHEDULE EVERY 1 DAY 
STARTS '2026-08-14 08:00:00'
DO
BEGIN
    -- Solo va a guardar en una tabla los productos con stock bajo
    INSERT INTO logs_stock_bajo (producto_id, mensaje)
    SELECT 
        id,
        CONCAT('El producto ', nombre, ' tiene solo ', stock_actual, ' unidades')
    FROM productos
    WHERE stock_actual < stock_minimo;
END //
DELIMITER ;