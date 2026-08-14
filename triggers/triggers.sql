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
            fecha
        ) VALUES (
            NEW.id,
            OLD.precio,
            NEW.precio,
            NOW()
        );
    END IF;
END;
DELIMITER ;