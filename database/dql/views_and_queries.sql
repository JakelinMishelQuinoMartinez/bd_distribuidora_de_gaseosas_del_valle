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