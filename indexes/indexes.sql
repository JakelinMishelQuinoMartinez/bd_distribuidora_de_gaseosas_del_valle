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

-- 6. Índice para consultas por fecha
CREATE INDEX idx_pedidos_fecha ON pedidos(fecha);

-- 7. Índice para filtros por estado
CREATE INDEX idx_pedidos_estado ON pedidos(estado);

-- 8. Índice compuesto para pedidos frecuentes (cliente + estado)
CREATE INDEX idx_pedidos_cliente_estado ON pedidos(id_cliente, estado);

-- 9. Índice para JOIN de detalles con pedidos
CREATE INDEX idx_detalles_id_pedido ON detalles_pedidos(id_pedido);

-- 10. Índice para JOIN de detalles con productos
CREATE INDEX idx_detalles_id_producto ON detalles_pedidos(id_producto);