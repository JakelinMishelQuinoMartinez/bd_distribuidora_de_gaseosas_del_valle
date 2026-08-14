# Requermentos del proyecto

## Requerimientos funcionales
1. **Gestión de Productos:**
Controlar actualizaciones de precio y stock.
Auditar cada cambio de precio en una tabla auditoria_precios.
2. **Gestión de Clientes** 
Permitir búsquedas por nombre o parte del nombre.
3. **Gestión de Sedes:**
Relacionar cada pedido con la sede desde la que se despacha.
4. **Gestión de Pedidos:**
Tabla intermedia detalle_pedido
Validar el stock disponible antes de confirmar el pedido.

## Funciones requeridas (CREATE FUNCTION)
- **fn_calcular_total_con_iva(id_pedido):**
 Calcula el total con IVA del pedido (12%) a partir de la suma de subtotales.
- **fn_validar_stock(id_producto, cantidad):**
 Retorna un mensaje indicando si hay suficiente stock antes de confirmar el pedido.

## Triggers requeridos (CREATE TRIGGER)
- **tr_actualizar_stock:** Al insertar un detalle de pedido, descuenta automáticamente la cantidad vendida del stock.
- **tr_auditar_cambio_precio:** Al actualizar el campo precio en la tabla productos, registra la fecha, el precio anterior y el nuevo en una tabla auditoria_precios.

## Consultas SQL requeridas
1. Consultar los productos con stock por debajo del mínimo.
2. Consultar los pedidos realizados entre dos fechas (BETWEEN).
3. Listar los productos más vendidos (con JOIN y GROUP BY).
4. Mostrar clientes y la cantidad de pedidos realizados.
5. Buscar clientes por nombre parcial usando LIKE.
6. Consultar productos de ciertas categorías usando IN.
7. Mostrar el cliente con mayor número de pedidos (subconsulta).
8. Consultar pedidos y sus totales agrupados por sede.

## Vistas requeridas (CREATE VIEW)
- **vista_resumen_pedidos_por_sede:** Muestra la cantidad total de pedidos y ventas por sede.
- **vista_productos_bajo_stock:** Lista productos con stock_actual <= stock_minimo.
- **vista_clientes_activos:** Muestra clientes con al menos un pedido registrado.