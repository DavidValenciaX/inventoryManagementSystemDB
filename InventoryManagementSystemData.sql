-- Insertar datos iniciales en status_categories
INSERT INTO status_categories (name, description) VALUES
('sales_order', 'Estados de órdenes de venta'),
('purchase_order', 'Estados de órdenes de compra'),
('user', 'Estados de usuarios');

-- Añadir categorías para devoluciones
INSERT INTO status_categories (name, description) VALUES
('sales_return', 'Estados de devoluciones de ventas'),
('purchase_return', 'Estados de devoluciones de compras');

-- Insertar datos iniciales en status_types
INSERT INTO status_types (name, category_id, description) VALUES

-- sales_order status
('pending', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Orden pendiente de confirmación'),
('confirmed', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Orden confirmada'),
('cancelled', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Orden cancelada'),

-- Purchase order statuses
('pending', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden pendiente de confirmación'),
('confirmed', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden confirmada'),
('cancelled', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden cancelada'),

-- User statuses
('active', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario con acceso completo al sistema'),
('inactive', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario sin acceso actual al sistema'),
('pending', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario pendiente de confirmación'),
('blocked', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario bloqueado por razones administrativas o de seguridad');

-- Añadir estados para devoluciones de ventas
INSERT INTO status_types (name, category_id, description) VALUES
-- Sales return statuses
('pending', (SELECT id FROM status_categories WHERE name = 'sales_return'), 'Devolución registrada pendiente de procesamiento'),
('approved', (SELECT id FROM status_categories WHERE name = 'sales_return'), 'Devolución aprobada en proceso'),
('completed', (SELECT id FROM status_categories WHERE name = 'sales_return'), 'Devolución completada y productos recibidos'),
('rejected', (SELECT id FROM status_categories WHERE name = 'sales_return'), 'Devolución rechazada'),
('refunded', (SELECT id FROM status_categories WHERE name = 'sales_return'), 'Reembolso emitido al cliente');

-- Añadir estados para devoluciones de compras
INSERT INTO status_types (name, category_id, description) VALUES
-- Purchase return statuses
('pending', (SELECT id FROM status_categories WHERE name = 'purchase_return'), 'Devolución al proveedor pendiente de procesamiento'),
('approved', (SELECT id FROM status_categories WHERE name = 'purchase_return'), 'Devolución aprobada por el proveedor'),
('shipped', (SELECT id FROM status_categories WHERE name = 'purchase_return'), 'Productos enviados al proveedor'),
('completed', (SELECT id FROM status_categories WHERE name = 'purchase_return'), 'Devolución completada y recibida por el proveedor'),
('rejected', (SELECT id FROM status_categories WHERE name = 'purchase_return'), 'Devolución rechazada por el proveedor');

-- Insertar los tipos de transacciones predefinidos
INSERT INTO transaction_types (name, description) VALUES
('purchase order', 'Ingreso de inventario por compra a proveedores'),
('sales order', 'Salida de inventario por venta a clientes'),
('sale return', 'Ajuste de inventario por devolución de orden de venta'),
('purchase return', 'Ajuste de inventario por devolución a proveedor'),
('adjustment', 'Ajuste manual de inventario'),
('loss', 'Pérdida de productos');

-- Inicializar los tipos de medidas
INSERT INTO measurement_types (name, description) VALUES
('Length', 'Units for measuring distances and dimensions'),
('Weight', 'Units for measuring mass'),
('Volume', 'Units for measuring volume of liquids or solids'),
('Area', 'Units for measuring surface area'),
('Temperature', 'Units for measuring temperature');

-- Inicializar unidades de medida comunes
-- Length units
INSERT INTO units_of_measure (name, symbol, measurement_type_id) VALUES
('Meter', 'm', (SELECT id FROM measurement_types WHERE name = 'Length')),
('Centimeter', 'cm', (SELECT id FROM measurement_types WHERE name = 'Length')),
('Millimeter', 'mm', (SELECT id FROM measurement_types WHERE name = 'Length')),
('Inch', 'in', (SELECT id FROM measurement_types WHERE name = 'Length')),
('Foot', 'ft', (SELECT id FROM measurement_types WHERE name = 'Length'));

-- Weight units
INSERT INTO units_of_measure (name, symbol, measurement_type_id) VALUES
('Kilogram', 'kg', (SELECT id FROM measurement_types WHERE name = 'Weight')),
('Gram', 'g', (SELECT id FROM measurement_types WHERE name = 'Weight')),
('Pound', 'lb', (SELECT id FROM measurement_types WHERE name = 'Weight')),
('Ounce', 'oz', (SELECT id FROM measurement_types WHERE name = 'Weight'));

-- Volume units
INSERT INTO units_of_measure (name, symbol, measurement_type_id) VALUES
('Liter', 'L', (SELECT id FROM measurement_types WHERE name = 'Volume')),
('Milliliter', 'mL', (SELECT id FROM measurement_types WHERE name = 'Volume')),
('Gallon (US)', 'gal', (SELECT id FROM measurement_types WHERE name = 'Volume')),
('Fluid Ounce (US)', 'fl oz', (SELECT id FROM measurement_types WHERE name = 'Volume'));