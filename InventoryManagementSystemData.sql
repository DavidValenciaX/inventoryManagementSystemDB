-- Insertar datos iniciales en status_categories
INSERT INTO status_categories (name, description) VALUES
('supplier', 'Estados de proveedores'),
('sales_order', 'Estados de órdenes de venta'),
('purchase_order', 'Estados de órdenes de compra'),
('purchase_order_product', 'Estados de productos en órdenes de compra'),
('return', 'Estados de devoluciones'),
('user', 'Estados de usuarios'),
('product', 'Estados de productos'),
('category', 'Estados de categorías'),
('customer', 'Estados de clientes'),
('sales_order_product', 'Estados de productos en órdenes de venta');

-- Insertar datos iniciales en status_types
INSERT INTO status_types (name, category_id, description) VALUES

-- Supplier statuses
('active', (SELECT id FROM status_categories WHERE name = 'supplier'), 'Proveedor activo'),
('inactive', (SELECT id FROM status_categories WHERE name = 'supplier'), 'Proveedor inactivo'),
('suspended', (SELECT id FROM status_categories WHERE name = 'supplier'), 'Proveedor suspendido'),

-- sales_order status
('pending', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Orden recibida'),
('processing', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'En preparación'),
('shipped', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Enviado'),
('delivered', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Entregado'),
('cancelled', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Cancelado'),

-- Purchase order statuses
('draft', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden en borrador'),
('ordered', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden realizada'),
('partial', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden parcialmente entregada'),
('delivered', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden entregada'),
('cancelled', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden cancelada'),

-- Purchase order product statuses
('pending', (SELECT id FROM status_categories WHERE name = 'purchase_order_product'), 'Ítem pendiente'),
('partial', (SELECT id FROM status_categories WHERE name = 'purchase_order_product'), 'Ítem parcialmente recibido'),
('complete', (SELECT id FROM status_categories WHERE name = 'purchase_order_product'), 'Ítem completado'),
('rejected', (SELECT id FROM status_categories WHERE name = 'purchase_order_product'), 'Ítem rechazado'),

-- Return statuses
('Return Requested', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución solicitada'),
('Return Pending', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución pendiente'),
('Return Processing', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución en proceso'),
('Return Approved', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución aprobada'),
('Return Completed', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución completada'),
('Partial Return', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución parcial'),
('Return Rejected', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución rechazada'),
('Return Received', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución recibida'),
('Return Quarantined', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución en cuarentena'),
('Return Restocked', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución reintegrada al inventario'),
('Return Discarded', (SELECT id FROM status_categories WHERE name = 'return'), 'Producto descartado por problemas de calidad'),
('Return Sent', (SELECT id FROM status_categories WHERE name = 'return'), 'Devolución enviada'),

-- User statuses
('active', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario activo'),
('inactive', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario inactivo'),
('suspended', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario suspendido'),
('pending_confirmation', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario pendiente de confirmación'),
('locked', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario bloqueado por seguridad'),

-- Product statuses
('active', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto activo y disponible'),
('inactive', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto inactivo'),
('discontinued', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto descontinuado'),
('out_of_stock', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto sin existencias'),
('low_stock', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto con inventario bajo'),
('backordered', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto con pedido pendiente'),
('reserved', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto reservado'),
('on_hold', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto en espera de aprobación'),
('damaged', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto dañado'),
('defective', (SELECT id FROM status_categories WHERE name = 'product'), 'Producto defectuoso'),

-- Category statuses
('active', (SELECT id FROM status_categories WHERE name = 'category'), 'Categoría activa'),
('inactive', (SELECT id FROM status_categories WHERE name = 'category'), 'Categoría inactiva'),
('featured', (SELECT id FROM status_categories WHERE name = 'category'), 'Categoría destacada'),

-- Customer statuses
('active', (SELECT id FROM status_categories WHERE name = 'customer'), 'Cliente activo'),
('inactive', (SELECT id FROM status_categories WHERE name = 'customer'), 'Cliente inactivo'),
('new', (SELECT id FROM status_categories WHERE name = 'customer'), 'Cliente nuevo'),
('vip', (SELECT id FROM status_categories WHERE name = 'customer'), 'Cliente VIP'),
('suspended', (SELECT id FROM status_categories WHERE name = 'customer'), 'Cliente suspendido'),

-- Order Product statuses
('pending', (SELECT id FROM status_categories WHERE name = 'sales_order_product'), 'Producto pendiente de despacho'),
('shipped', (SELECT id FROM status_categories WHERE name = 'sales_order_product'), 'Producto enviado'),
('delivered', (SELECT id FROM status_categories WHERE name = 'sales_order_product'), 'Producto entregado'),
('returned', (SELECT id FROM status_categories WHERE name = 'sales_order_product'), 'Producto devuelto'),
('cancelled', (SELECT id FROM status_categories WHERE name = 'sales_order_product'), 'Producto cancelado'),
('partial_return', (SELECT id FROM status_categories WHERE name = 'sales_order_product'), 'Devolución parcial del producto');

-- Insertar los tipos de transacciones predefinidos
INSERT INTO transaction_types (name, description) VALUES
('purchase', 'Ingreso de inventario por compra a proveedores'),
('sale', 'Salida de inventario por venta a clientes'),
('adjustment', 'Ajuste manual de inventario'),
('return', 'Devolución de productos'),
('donation', 'Donación de productos'),
('loss', 'Pérdida de productos'),
('Sale Return', 'Ajuste de inventario por devolución de orden de venta'),
('Purchase Return', 'Ajuste de inventario por devolución a proveedor'),
('Return Received', 'Productos devueltos recibidos en cuarentena'),
('Return Restocked', 'Productos aprobados y reintegrados al inventario'),
('Return Discarded', 'Productos descartados definitivamente');

-- Inicializar los tipos de medidas
INSERT INTO measurement_types (name, description) VALUES
('Length', 'Units for measuring distances and dimensions'),
('Weight', 'Units for measuring mass'),
('Volume', 'Units for measuring volume of liquids or solids'),
('Area', 'Units for measuring surface area'),
('Temperature', 'Units for measuring temperature');

-- Inicializar unidades de medida comunes
-- Length units
INSERT INTO units_of_measure (name, symbol, measurement_type_id, base_unit, conversion_factor, description) VALUES
('Meter', 'm', 1, TRUE, 1.0, 'Base unit for length'),
('Centimeter', 'cm', 1, FALSE, 0.01, '1/100 of a meter'),
('Millimeter', 'mm', 1, FALSE, 0.001, '1/1000 of a meter'),
('Inch', 'in', 1, FALSE, 0.0254, 'Imperial unit for length'),
('Foot', 'ft', 1, FALSE, 0.3048, 'Imperial unit for length');

-- Weight units
INSERT INTO units_of_measure (name, symbol, measurement_type_id, base_unit, conversion_factor, description) VALUES
('Kilogram', 'kg', 2, TRUE, 1.0, 'Base unit for weight'),
('Gram', 'g', 2, FALSE, 0.001, '1/1000 of a kilogram'),
('Pound', 'lb', 2, FALSE, 0.45359237, 'Imperial unit for weight'),
('Ounce', 'oz', 2, FALSE, 0.028349523125, 'Imperial unit for weight');

-- Volume units
INSERT INTO units_of_measure (name, symbol, measurement_type_id, base_unit, conversion_factor, description) VALUES
('Liter', 'L', 3, TRUE, 1.0, 'Base unit for volume'),
('Milliliter', 'mL', 3, FALSE, 0.001, '1/1000 of a liter'),
('Gallon (US)', 'gal', 3, FALSE, 3.78541, 'US unit for volume'),
('Fluid Ounce (US)', 'fl oz', 3, FALSE, 0.0295735, 'US unit for volume');