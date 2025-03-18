-- Tabla para Categorías de Estado
CREATE TABLE status_categories (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para Tipos de Estado
CREATE TABLE status_types (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    category_id INTEGER NOT NULL REFERENCES status_categories(id),
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(name, category_id)
);

-- Tabla de Usuarios (modificada para eliminar dependencia de companies)
CREATE TABLE users (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    full_name VARCHAR(200) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(50),
    confirmation_token_hash VARCHAR(255),
    confirmation_token_expiration TIMESTAMP,
    password_reset_token_hash VARCHAR(255),
    password_reset_token_expiration TIMESTAMP,
    status_id INTEGER NOT NULL REFERENCES status_types(id),
    profile_image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Empresas (modificada para incluir referencia al propietario)
CREATE TABLE company (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL UNIQUE,
    user_id INTEGER NOT NULL REFERENCES users(id) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Clientes
CREATE TABLE customers (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para Tipos de Medidas
CREATE TABLE measurement_types (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para Unidades de Medida
CREATE TABLE units_of_measure (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    measurement_type_id INTEGER NOT NULL REFERENCES measurement_types(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(name, measurement_type_id),
    UNIQUE(symbol, measurement_type_id)
);

-- Tabla de Categorías
CREATE TABLE categories (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL UNIQUE,
    company_id INTEGER NOT NULL REFERENCES company(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Productos
CREATE TABLE products (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    unit_price DECIMAL(15, 2) NOT NULL,
    unit_cost DECIMAL(15, 2) NOT NULL,
    supplier_id INTEGER NOT NULL REFERENCES suppliers(id),
    image_url VARCHAR(255),
    category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    unit_of_measure_id INTEGER NOT NULL REFERENCES units_of_measure(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de ordenes/Pedidos
CREATE TABLE sales_orders (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    customer_id INTEGER NOT NULL REFERENCES customers(id),
    status_id INTEGER REFERENCES status_types(id),
    subtotal DECIMAL(15, 2) NOT NULL DEFAULT 0,
    total_amount DECIMAL(15, 2) NOT NULL DEFAULT 0,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Productos en una Orden
CREATE TABLE sales_order_products (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    sales_order_id INTEGER NOT NULL REFERENCES sales_orders(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(15, 2) NOT NULL CHECK (unit_price >= 0),
    returned_quantity INTEGER DEFAULT 0 CHECK (returned_quantity >= 0 AND returned_quantity <= quantity),
    return_reason TEXT,
    return_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (sales_order_id, product_id)
);

-- Tabla de Proveedores
CREATE TABLE suppliers (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Compras a Proveedores
CREATE TABLE purchase_orders (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    supplier_id INTEGER NOT NULL REFERENCES suppliers(id),
    status_id INTEGER REFERENCES status_types(id),
    subtotal DECIMAL(15, 2) NOT NULL DEFAULT 0,
    total_amount DECIMAL(15, 2) NOT NULL DEFAULT 0,
    purchase_order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Elementos de Compras
CREATE TABLE purchase_order_products (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    purchase_order_id INTEGER NOT NULL REFERENCES purchase_orders(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(15, 2) NOT NULL CHECK (unit_price >= 0),
    returned_quantity INTEGER DEFAULT 0 CHECK (returned_quantity >= 0 AND returned_quantity <= quantity),
    return_reason TEXT,
    return_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (purchase_order_id, product_id)
);

-- Eliminar tabla supplier_products que ya no es necesaria
-- (Esta tabla debe ser eliminada después de crear las tablas de transacciones 
-- pero antes de ser referenciada por ninguna otra tabla)
-- En su lugar, la relación directa entre productos y proveedores se establece
-- en la tabla products con la columna supplier_id

-- Tabla para Tipos de Transacciones de Inventario
CREATE TABLE transaction_types (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para Historial de Movimientos de Inventario
CREATE TABLE inventory_transactions (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity DECIMAL(12, 2) NOT NULL,
    transaction_type_id INTEGER NOT NULL REFERENCES transaction_types(id),
    sales_order_product_id INTEGER REFERENCES sales_order_products(id),
    purchase_order_product_id INTEGER REFERENCES purchase_order_products(id),
    previous_stock DECIMAL(12, 2) NOT NULL,
    new_stock DECIMAL(12, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);