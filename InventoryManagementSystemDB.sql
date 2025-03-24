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

-- Tabla de Usuarios
CREATE TABLE users (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    full_name VARCHAR(200) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(50),
    company_name VARCHAR(255),
    confirmation_token_hash VARCHAR(255),
    confirmation_token_expiration TIMESTAMP,
    password_reset_token_hash VARCHAR(255),
    password_reset_token_expiration TIMESTAMP,
    status_id INTEGER NOT NULL REFERENCES status_types(id),
    profile_image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Clientes
CREATE TABLE customers (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(email, user_id)
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
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Proveedores
CREATE TABLE suppliers (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(email, user_id)
);

-- Tabla de Productos
CREATE TABLE products (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    unit_price DECIMAL(15, 2) NOT NULL,
    unit_cost DECIMAL(15, 2) NOT NULL,
    quantity DECIMAL(12, 2) NOT NULL DEFAULT 0,
    image_url VARCHAR(255),
    barcode VARCHAR(50),
    category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    unit_of_measure_id INTEGER NOT NULL REFERENCES units_of_measure(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, barcode)
);

-- Tabla de ordenes/Pedidos
CREATE TABLE sales_orders (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    customer_id INTEGER NOT NULL REFERENCES customers(id),
    status_id INTEGER REFERENCES status_types(id),
    total_amount DECIMAL(15, 2) NOT NULL DEFAULT 0,
    notes TEXT,
    sales_order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (sales_order_id, product_id)
);

-- Tabla de Compras a Proveedores
CREATE TABLE purchase_orders (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    supplier_id INTEGER NOT NULL REFERENCES suppliers(id),
    status_id INTEGER REFERENCES status_types(id),
    total_amount DECIMAL(15, 2) NOT NULL DEFAULT 0,
    notes TEXT,
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
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (purchase_order_id, product_id)
);

-- Tabla de Devoluciones de Ventas
CREATE TABLE sales_returns (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    sales_order_id INTEGER NOT NULL REFERENCES sales_orders(id),
    return_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    status_id INTEGER REFERENCES status_types(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Items de Devolución de Ventas
CREATE TABLE sales_return_products (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    sales_return_id INTEGER NOT NULL REFERENCES sales_returns(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (sales_return_id, product_id)
);

-- Tabla de Devoluciones de Compras
CREATE TABLE purchase_returns (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    purchase_order_id INTEGER NOT NULL REFERENCES purchase_orders(id),
    return_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    status_id INTEGER REFERENCES status_types(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Items de Devolución de Compras
CREATE TABLE purchase_return_products (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    purchase_return_id INTEGER NOT NULL REFERENCES purchase_returns(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (purchase_return_id, product_id)
);

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
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
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