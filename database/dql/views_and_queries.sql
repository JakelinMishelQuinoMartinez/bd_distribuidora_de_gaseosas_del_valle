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