-- Insertar datos iniciales en status_categories
INSERT INTO status_categories (name, description) VALUES
('sales_order', 'Estados de órdenes de venta'),
('purchase_order', 'Estados de órdenes de compra'),
('user', 'Estados de usuarios'),

-- Añadir categorías para estados de productos devueltos
('sales_return_product', 'Estados de productos devueltos por clientes');

-- Insertar datos iniciales en status_types
INSERT INTO status_types (name, category_id, description) VALUES

-- sales_order status
('pending', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Orden pendiente de confirmación'),
('confirmed', (SELECT id FROM status_categories WHERE name = 'sales_order'), 'Orden confirmada'),

-- Purchase order statuses
('pending', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden pendiente de confirmación'),
('confirmed', (SELECT id FROM status_categories WHERE name = 'purchase_order'), 'Orden confirmada'),

-- User statuses
('active', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario con acceso completo al sistema'),
('inactive', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario sin acceso actual al sistema'),
('pending', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario pendiente de confirmación'),
('blocked', (SELECT id FROM status_categories WHERE name = 'user'), 'Usuario bloqueado por razones administrativas o de seguridad'),

-- Estados para productos devueltos por clientes
('under_review', (SELECT id FROM status_categories WHERE name = 'sales_return_product'), 'Producto en revisión'),
('accepted', (SELECT id FROM status_categories WHERE name = 'sales_return_product'), 'Producto en buen estado para reintegro al inventario'),
('damaged', (SELECT id FROM status_categories WHERE name = 'sales_return_product'), 'Producto dañado que no puede reintegrarse al inventario');

-- Insertar los tipos de transacciones predefinidos
INSERT INTO transaction_types (name, description) VALUES
('confirmed purchase order', 'Ingreso de inventario por compra a proveedores'),
('cancelled purchase order', 'Cancelación de orden de compra'),
('confirmed sales order', 'Salida de inventario por venta a clientes'),
('cancelled sales order', 'Cancelación de orden de venta'),
('sale return', 'Ajuste de inventario por devolución de orden de venta'),
('cancelled sale return', 'Cancelación de devolución de venta'),
('purchase return', 'Ajuste de inventario por devolución de orden de compra'),
('cancelled purchase return', 'Cancelación de devolución de compra'),
('adjustment', 'Ajuste manual de inventario'),
('loss', 'Pérdida de productos');

-- Inicializar los tipos de medidas
INSERT INTO measurement_types (name, description) VALUES
('Length', 'Units for measuring distances and dimensions'),
('Weight', 'Units for measuring mass'),
('Volume', 'Units for measuring volume of liquids or solids'),
('Area', 'Units for measuring surface area'),
('Count', 'Units for counting individual items or pieces');

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

-- Area units
INSERT INTO units_of_measure (name, symbol, measurement_type_id) VALUES
('Square Meter', 'm²', (SELECT id FROM measurement_types WHERE name = 'Area')),
('Square Centimeter', 'cm²', (SELECT id FROM measurement_types WHERE name = 'Area')),
('Square Millimeter', 'mm²', (SELECT id FROM measurement_types WHERE name = 'Area')),
('Square Inch', 'in²', (SELECT id FROM measurement_types WHERE name = 'Area')),
('Square Foot', 'ft²', (SELECT id FROM measurement_types WHERE name = 'Area'));

-- Unidades para conteo
INSERT INTO units_of_measure (name, symbol, measurement_type_id) VALUES
('Unit', 'unit', (SELECT id FROM measurement_types WHERE name = 'Count')),
('Dozen', 'doz', (SELECT id FROM measurement_types WHERE name = 'Count')),
('Pack', 'pack', (SELECT id FROM measurement_types WHERE name = 'Count')),
('Case', 'case', (SELECT id FROM measurement_types WHERE name = 'Count')),
('Pallet', 'pallet', (SELECT id FROM measurement_types WHERE name = 'Count'));