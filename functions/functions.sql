USE distribuidora_de_gaseosas_del_valle;
-- ====================================
-- FUNCIONES
-- ====================================

-- ===================================================================================
-- 1. Calcula el total con IVA del pedido (12%) a partir de la suma de subtotales.
-- ===================================================================================
DELIMITER //
CREATE FUNCTION fn_calcular_total_con_iva(p_id_pedido INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_sin_iva DECIMAL(10,2);
    DECLARE total_con_iva DECIMAL(10,2);
    -- Calcular el subtotal del pedido
    SELECT SUM(cantidad * precio_unidad) INTO total_sin_iva
    FROM detalles_pedidos
    WHERE id_pedido = p_id_pedido;
    -- Si no hay detalles, el total es 0
    IF total_sin_iva IS NULL THEN
        SET total_sin_iva = 0;
    END IF;
    -- Aplicar IVA del 12%
    SET total_con_iva = total_sin_iva * 1.12;
    RETURN total_con_iva;
END;
DELIMITER ;