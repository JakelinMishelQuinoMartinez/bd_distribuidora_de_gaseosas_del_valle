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

-- Calcular el total con IVA del pedido con ID = 1
SELECT fn_calcular_total_con_iva(1) AS total_con_iva;
-- Ver varios pedidos a la vez
SELECT 
    id, 
    total_sin_iva, 
    total_con_iva,
    fn_calcular_total_con_iva(id) AS total_calculado
FROM pedidos
WHERE id BETWEEN 1 AND 5;

-- ===================================================================================
--  2. Retorna un mensaje indicando si hay suficiente stock antes de confirmar el pedido.
-- ===================================================================================
DELIMITER //
CREATE FUNCTION fn_validar_stock(p_id_producto INT, p_cantidad INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    DECLARE mensaje VARCHAR(100);
    -- Obtener el stock actual del producto
    SELECT stock_actual INTO stock_actual
    FROM productos
    WHERE id = p_id_producto;
    -- Verificar si hay suficiente stock
    IF stock_actual >= p_cantidad THEN
        SET mensaje = CONCAT('Stock disponible. Cantidad solicitada: ', p_cantidad, '. Stock actual: ', stock_actual);
    ELSE
        SET mensaje = CONCAT('Stock insuficiente. Cantidad solicitada: ', p_cantidad, '. Stock actual: ', stock_actual);
    END IF;
    RETURN mensaje;
END;
DELIMITER ;

-- Validar si hay stock para el producto ID = 1 con cantidad 10
SELECT fn_validar_stock(1, 10) AS validacion;
-- Validar varios productos a la vez
SELECT 
    id,
    nombre,
    stock_actual,
    fn_validar_stock(id, 5) AS validacion_stock
FROM productos
WHERE id BETWEEN 1 AND 5;
DELIMITER ;