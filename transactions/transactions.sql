USE distribuidora_de_gaseosas_del_valle;
-- ====================================
-- TRANSACCIONS
-- ====================================

DELIMITER //
CREATE PROCEDURE sp_comprar(
    IN p_cliente INT,
    IN p_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE precio DECIMAL(10,2);
    DECLARE stock INT;
    
    -- Si hay error, deshace todo
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en la compra' AS mensaje;
    END;
    
    -- Empezar transacción
    START TRANSACTION;
    
    -- Obtener datos del producto
    SELECT precio, stock_actual INTO precio, stock
    FROM productos WHERE id = p_producto;
    
    -- Verificar stock
    IF stock < p_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sin stock';
    END IF;
    
    -- Crear pedido
    INSERT INTO pedidos (id_cliente, id_sede, total_sin_iva, total_con_iva, estado)
    VALUES (p_cliente, 1, precio * p_cantidad, precio * p_cantidad * 1.12, 'pendiente');
    
    -- Guardar ID del pedido
    SET @id_pedido = LAST_INSERT_ID();
    
    -- Guardar detalle
    INSERT INTO detalles_pedidos (id_pedido, id_producto, cantidad, precio_unidad)
    VALUES (@id_pedido, p_producto, p_cantidad, precio);
    
    -- Descontar stock
    UPDATE productos SET stock_actual = stock_actual - p_cantidad
    WHERE id = p_producto;
    
    -- Guardar todo
    COMMIT;
    SELECT 'Compra exitosa' AS mensaje;
END //
DELIMITER ;

-- Comprar 2 unidades del producto #1 para el cliente #1
CALL sp_comprar(1, 1, 2);

-- Ver el pedido
SELECT * FROM pedidos ORDER BY id DESC LIMIT 1;

-- Ver el stock
SELECT id, nombre, stock_actual FROM productos WHERE id = 1;