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