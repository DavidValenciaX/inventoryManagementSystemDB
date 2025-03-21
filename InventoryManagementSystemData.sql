-- Insertar datos iniciales en status_categories
INSERT INTO status_categories (name, description) VALUES
('sales_order', 'Estados de órdenes de venta'),
('purchase_order', 'Estados de órdenes de compra'),
('purchase_order_product', 'Estados de productos en órdenes de compra'),
('user', 'Estados de usuarios');

-- Insertar datos iniciales en status_types
INSERT INTO status_types (name, category_id, description) VALUES

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

-- User statuses
('active', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario activo'),
('inactive', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario inactivo'),
('suspended', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario suspendido'),
('pending_confirmation', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario pendiente de confirmación'),
('locked', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario bloqueado por seguridad');

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