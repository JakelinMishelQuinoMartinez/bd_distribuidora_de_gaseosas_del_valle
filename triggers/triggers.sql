USE distribuidora_de_gaseosas_del_valle;
-- ====================================
-- TRIGGERS
-- ====================================

-- ======================================================================================================================================
--  1. Al insertar un detalle de pedido, descuenta automáticamente la cantidad vendida del stock.
-- ======================================================================================================================================
DELIMITER //
CREATE TRIGGER tr_after_actualizar_stock
AFTER INSERT ON detalles_pedidos FOR EACH ROW
BEGIN
    -- Actualizar el stock restando la cantidad vendida
    UPDATE productos
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id = NEW.id_producto;
END//
DELIMITER ;

-- 1. Ver el stock actual de un producto
SELECT id, nombre, stock_actual 
FROM productos 
WHERE id = 1;

-- 2. Insertar un nuevo detalle de pedido
INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unidad)
VALUES (1, 1, 5, 5.50);

-- 3. Verificar que el stock se descontó automáticamente
SELECT id, nombre, stock_actual 
FROM productos 
WHERE id = 1;

-- ======================================================================================================================================
--  2. Al actualizar el campo precio en la tabla productos, registra la fecha, el precio anterior y el nuevo en una tabla auditoria_precios.
-- ======================================================================================================================================
DELIMITER //
CREATE TRIGGER tr_after_auditar_cambio_precio
AFTER UPDATE ON productos FOR EACH ROW
BEGIN
    -- Solo auditar si el precio cambió realmente
    IF OLD.precio != NEW.precio THEN
        INSERT INTO auditoria_precios (
            id_producto,
            precio_anterior,
            precio_nuevo,
            fecha_modificacion
        ) VALUES (
            NEW.id,
            OLD.precio,
            NEW.precio,
            NOW()
        );
    END IF;
END;
DELIMITER ;


-- 1. Ver los precios actuales y la auditoría vacía
SELECT * FROM productos WHERE id = 1;
SELECT * FROM auditoria_precios;

-- 2. Actualizar el precio de un producto
UPDATE productos 
SET precio = 6.50 
WHERE id = 1;

-- 3. Verificar que el precio cambió
SELECT * FROM productos WHERE id = 1;

-- 4. Verificar que se registró en auditoría
SELECT * FROM auditoria_precios;
-- Debería aparecer: id_producto=1, precio_anterior=5.50, precio_nuevo=6.50

-- 5. Hacer otro cambio de precio
UPDATE productos 
SET precio = 7.00 
WHERE id = 1;

-- 6. Ver la auditoría con ambos cambios
SELECT * FROM auditoria_precios WHERE id_producto = 1;