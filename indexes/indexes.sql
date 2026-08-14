USE distribuidora_de_gaseosas_del_valle;
-- ====================================
-- INDEXES
-- ====================================

-- 1. Índice para búsquedas de productos por nombre
CREATE INDEX idx_productos_nombre ON productos(nombre);

-- 2. Índice para JOIN con categorías
CREATE INDEX idx_productos_id_categoria ON productos(id_categoria);

-- 3. Índice compuesto para consultas de stock
CREATE INDEX idx_productos_stock ON productos(stock_actual, stock_minimo);

-- 4. Índice para búsquedas de pedidos por cliente
CREATE INDEX idx_pedidos_id_cliente ON pedidos(id_cliente);

-- 5. Índice para búsquedas de pedidos por sede
CREATE INDEX idx_pedidos_id_sede ON pedidos(id_sede);