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