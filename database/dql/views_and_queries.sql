USE distribuidora_de_gaseosas_del_valle;
-- ====================================
-- CONSULTAS
-- ====================================

-- ===================================================================================
-- 1. Consultar los productos con stock por debajo del mínimo.
-- ===================================================================================
SELECT *
FROM productos
WHERE stock_actual < stock_minimo;

-- ===================================================================================
-- 2. Consultar los pedidos realizados entre dos fechas (BETWEEN).
-- ===================================================================================
SELECT * 
FROM pedidos 
WHERE fecha BETWEEN '2026-08-10' AND '2026-08-13'; 

-- ===================================================================================
-- 3. Listar los productos más vendidos (con JOIN y GROUP BY).
-- ===================================================================================
SELECT p.nombre AS producto,
    SUM(dp.cantidad) AS total_vendido
FROM detalles_pedidos dp
JOIN productos p ON dp.id_producto = p.id
GROUP BY p.id, p.nombre
ORDER BY total_vendido DESC
LIMIT 10;

-- ===================================================================================
-- 4. Mostrar clientes y la cantidad de pedidos realizados.
-- ===================================================================================
SELECT 
    c.nombre_completo AS cliente,
    COUNT(p.id) AS cantidad_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.id, c.nombre_completo
ORDER BY cantidad_pedidos DESC;

-- ===================================================================================
-- 5. Buscar clientes por nombre parcial usando LIKE.
-- ===================================================================================
SELECT * 
FROM clientes 
WHERE nombre_completo LIKE '%Pérez%';

-- ===================================================================================
-- 6. Consultar productos de ciertas categorías usando IN.
-- ===================================================================================
SELECT * 
FROM productos 
WHERE id_categoria IN (1, 2, 3);

-- ===================================================================================
-- 7. Mostrar el cliente con mayor número de pedidos (subconsulta).
-- ===================================================================================
SELECT 
    c.nombre_completo AS cliente,
    COUNT(p.id) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.id, c.nombre_completo
HAVING COUNT(p.id) = (
    SELECT MAX(cantidad) 
    FROM (
        SELECT COUNT(id) AS cantidad 
        FROM pedidos 
        GROUP BY id_cliente
    ) AS subconsulta
);

-- ===================================================================================
-- 8. Consultar pedidos y sus totales agrupados por sede.
-- ===================================================================================
SELECT 
    s.nombre AS sede,
    COUNT(p.id) AS total_pedidos,
    SUM(p.total_con_iva) AS monto_total
FROM pedidos p
JOIN sedes s ON p.id_sede = s.id
GROUP BY s.id, s.nombre
ORDER BY monto_total DESC;

-- ====================================
-- VISTAS
-- ====================================

-- ===================================================================================
-- 1. Muestra la cantidad total de pedidos y ventas por sede.
-- ===================================================================================
USE distribuidora_de_gaseosas_del_valle;

DELIMITER //
CREATE VIEW vista_resumen_pedidos_por_sede AS
SELECT 
    s.id AS sede_id,
    s.nombre AS nombre_sede,
    s.ubicacion AS ubicacion_sede,
    COUNT(DISTINCT p.id) AS total_pedidos,
    IFNULL(SUM(p.total_con_iva), 0) AS total_ventas,
    IFNULL(AVG(p.total_con_iva), 0) AS promedio_venta
FROM sedes s
LEFT JOIN pedidos p ON s.id = p.id_sede
GROUP BY s.id, s.nombre, s.ubicacion
ORDER BY total_ventas DESC//
DELIMITER ;

-- Ver todas las sedes con su resumen
SELECT * FROM vista_resumen_pedidos_por_sede;

-- Ver solo sedes con ventas
SELECT * FROM vista_resumen_pedidos_por_sede WHERE total_ventas > 0;

-- Ver la sede con más ventas
SELECT * FROM vista_resumen_pedidos_por_sede ORDER BY total_ventas DESC LIMIT 1;


-- ===================================================================================
-- 2. Lista productos con stock_actual <= stock_minimo.
-- ===================================================================================
DELIMITER //
CREATE VIEW vista_productos_bajo_stock AS
SELECT 
    p.id AS producto_id,
    p.nombre AS nombre_producto,
    p.volumen_ml,
    p.precio,
    p.stock_actual,
    p.stock_minimo,
    c.nombre AS categoria,
    (p.stock_minimo - p.stock_actual) AS unidades_faltantes,
    ROUND((p.stock_actual / p.stock_minimo) * 100, 2) AS porcentaje_stock,
    CASE 
        WHEN p.stock_actual = 0 THEN 'CRÍTICO - SIN STOCK'
        WHEN (p.stock_minimo - p.stock_actual) >= 10 THEN 'URGENTE'
        WHEN (p.stock_minimo - p.stock_actual) >= 5 THEN 'BAJO'
        ELSE 'ATENCIÓN'
    END AS nivel_riesgo
FROM productos p
JOIN categorias c ON p.id_categoria = c.id
WHERE p.stock_actual <= p.stock_minimo
ORDER BY unidades_faltantes DESC //
DELIMITER ;

-- Ver todos los productos con stock bajo
SELECT * FROM vista_productos_bajo_stock;

-- Ver solo los críticos
SELECT * FROM vista_productos_bajo_stock WHERE nivel_riesgo = 'CRÍTICO - SIN STOCK';

-- Ver productos urgentes (faltan más de 10 unidades)
SELECT * FROM vista_productos_bajo_stock WHERE unidades_faltantes > 10;

-- Ver productos por categoría
SELECT * FROM vista_productos_bajo_stock WHERE categoria = 'Cola';


-- ===================================================================================
-- 3. Muestra clientes con al menos un pedido registrado.
-- ===================================================================================
DELIMITER //
CREATE VIEW vista_clientes_activos AS
SELECT 
    c.id AS cliente_id,
    c.nombre_completo AS nombre_cliente,
    c.identificacion AS identificacion_cliente,
    c.telefono AS telefono_cliente,
    c.correo_electronico AS correo_cliente,
    m.nombre AS municipio,
    d.nombre AS departamento,
    COUNT(p.id) AS total_pedidos,
    IFNULL(SUM(p.total_con_iva), 0) AS monto_total_gastado,
    IFNULL(AVG(p.total_con_iva), 0) AS promedio_por_pedido,
    MAX(p.fecha) AS ultimo_pedido,
    DATEDIFF(NOW(), MAX(p.fecha)) AS dias_desde_ultimo_pedido,
    CASE 
        WHEN COUNT(p.id) >= 10 THEN 'VIP'
        WHEN COUNT(p.id) >= 5 THEN 'FRECUENTE'
        WHEN COUNT(p.id) >= 2 THEN 'OCASIONAL'
        ELSE 'NUEVO'
    END AS tipo_cliente
FROM clientes c
JOIN municipios m ON c.id_municipio = m.id
JOIN departamentos d ON m.id_departamento = d.id
JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.id, c.nombre_completo, c.identificacion, c.telefono, 
         c.correo_electronico, m.nombre, d.nombre
ORDER BY total_pedidos DESC, monto_total_gastado DESC //
DELIMITER ;

-- Ver todos los clientes activos
SELECT * FROM vista_clientes_activos;

-- Ver solo clientes VIP
SELECT * FROM vista_clientes_activos WHERE tipo_cliente = 'VIP';

-- Ver clientes que no han comprado en los últimos 7 días
SELECT * FROM vista_clientes_activos WHERE dias_desde_ultimo_pedido > 7;

-- Ver clientes por departamento
SELECT * FROM vista_clientes_activos WHERE departamento = 'Guatemala';

-- Ver top 5 clientes
SELECT * FROM vista_clientes_activos LIMIT 5;