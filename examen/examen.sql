
-- ===================================================================================
-- 1. EXAMEN 
-- Crear una función MySQL llamada calcular_promedio_pedidos_cliente que:
-- Reciba como parámetro el ID de un cliente.
-- Retorne el promedio del total (sin IVA) de todos los pedidos realizados por ese cliente.
-- Si el cliente no tiene pedidos, retorne 0.
-- ===================================================================================
DELIMITER //
CREATE FUNCTION calcular_promedio_pedidos_cliente(p_id_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_promedio DECIMAL(10,2);
    SELECT AVG(total_sin_iva) INTO v_promedio
    FROM pedidos
    WHERE id_cliente = p_id_cliente;
    IF v_promedio IS NULL THEN
        SET v_promedio = 0;
    END IF;
    RETURN v_promedio;
END//
DELIMITER ;

-- Probar la función con el cliente ID = 1
SELECT calcular_promedio_pedidos_cliente(1) AS promedio_pedidos_cliente;

-- ===================================================================================
-- 2. EXAMEN 
-- Crear una vista llamada vista_resumen_sedes que:
-- Muestre por cada sede:
-- Nombre de la sede
-- Cantidad total de pedidos despachados
-- Valor total vendido (sin IVA)
-- Promedio de valor por pedido
-- La vista debe usar JOIN entre pedidos y sedes, y agrupar correctamente los resultados.
-- ===================================================================================
DELIMITER //
CREATE VIEW vista_resumen_sedes AS
SELECT 
    s.nombre AS nombre_sede,
    COUNT(p.id) AS total_pedidos_despachados,
    IFNULL(SUM(p.total_sin_iva), 0) AS valor_total_vendido,
    IFNULL(AVG(p.total_sin_iva), 0) AS promedio_valor_por_pedido
FROM sedes s
LEFT JOIN pedidos p ON s.id = p.id_sede
GROUP BY s.id, s.nombre
ORDER BY valor_total_vendido DESC
END//
DELIMITER ;

SELECT * FROM vista_resumen_sedes;

SELECT * FROM vista_resumen_sedes WHERE total_pedidos_despachados > 0;

SELECT * FROM vista_resumen_sedes ORDER BY valor_total_vendido DESC LIMIT 1;

-- ===================================================================================
-- 3. EXAMEN
-- Realizar una consulta con subconsulta que:
-- Muestre el nombre del producto, categoría y stock
-- Solo incluya los productos cuyo precio sea mayor al promedio general de precios de todos los productos.
-- Crear un trigger llamado auditar_cambio_precio que:
-- Se ejecute después de un UPDATE en la tabla de productos.
-- ===================================================================================

-- Consulta con subconsulta: productos con precio mayor al promedio general
SELECT 
    p.nombre AS nombre_producto,
    c.nombre AS categoria,
    p.stock_actual AS stock
FROM productos p
JOIN categorias c ON p.id_categoria = c.id
WHERE p.precio > (SELECT AVG(precio) FROM productos)
ORDER BY p.precio DESC;

-- Trigger auditar_cambio_precio: se ejecuta después de un UPDATE en productos
DELIMITER //
CREATE TRIGGER auditar_cambio_precio
AFTER UPDATE ON productos FOR EACH ROW
BEGIN
    -- Solo registrar si el precio realmente cambió
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
END//
DELIMITER ;

-- ======================================================
-- 4. EXAMEN
-- Registre en una tabla auditoria_precios los campos:
-- id_producto, precio_anterior, precio_nuevo, fecha_modificacion.
-- Solo se debe registrar si el precio realmente cambió.
-- ======================================================

-- Verificar los precios actuales antes de registrar cambios
SELECT id, nombre, precio FROM productos WHERE id IN (1, 2, 3);

-- Registrar en auditoria_precios solo cuando el precio realmente cambió.
INSERT INTO auditoria_precios (id_producto, precio_anterior, precio_nuevo, fecha_modificacion) VALUES
(1, 5.50, 6.00, NOW()),
(2, 8.00, 8.50, NOW()),
(3, 15.00, 15.50, NOW());

-- Demostración del registro automático vía trigger: el precio cambia realmente
UPDATE productos SET precio = 8.80 WHERE id = 2 AND precio <> 8.80;

SELECT * FROM auditoria_precios;

SELECT * FROM auditoria_precios WHERE id_producto = 2;


