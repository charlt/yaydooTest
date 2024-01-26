CREATE DATABASE IF NOT EXISTS testYaydoo;

USE testYaydoo;

CREATE TABLE IF NOT EXISTS branch (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    branch_id INT,
    age INT,
    email VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL,
    FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE IF NOT EXISTS category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE IF NOT EXISTS purchase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    total DECIMAL(10, 2) NOT NULL,
    status ENUM('vigente', 'pagado', 'cancelado') NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE IF NOT EXISTS purchase_product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT,
    product_id INT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    deleted_at DATETIME DEFAULT NULL,
    FOREIGN KEY (purchase_id) REFERENCES purchase(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO
    branch (name, created_at, updated_at)
VALUES
    ('Sucursal A', NOW(), NOW()),
    ('Sucursal B', NOW(), NOW()),
    ('Sucursal C', NOW(), NOW()),
    ('Sucursal D', NOW(), NOW()),
    ('Sucursal E', NOW(), NOW()),
    ('Sucursal F', NOW(), NOW());

INSERT INTO
    category (name, created_at, updated_at)
VALUES
    ('Electrónicos', NOW(), NOW()),
    ('Ropa', NOW(), NOW()),
    ('Hogar', NOW(), NOW()),
    ('Blancos', NOW(), NOW()),
    ('Deporte', NOW(), NOW()),
    ('Perfume', NOW(), NOW());

INSERT INTO
    product (name, price, category_id, created_at, updated_at)
VALUES
    ('Producto 1', 25, 1, NOW(), NOW()),
    ('Producto 2', 50, 2, NOW(), NOW()),
    ('Producto 3', 75, 3, NOW(), NOW()),
    ('Producto 4', 100, 4, NOW(), NOW()),
    ('Producto 5', 125, 5, NOW(), NOW()),
    ('Producto 6', 150, 2, NOW(), NOW()),
    ('Producto 7', 175, 1, NOW(), NOW()),
    ('Producto 8', 200, 6, NOW(), NOW()),
    ('Producto 9', 225, 3, NOW(), NOW()),
    ('Producto 10', 250, 4, NOW(), NOW()),
    ('Producto 11', 275, 5, NOW(), NOW()),
    ('Producto 12', 300, 2, NOW(), NOW());

INSERT INTO
    customer (
        name,
        branch_id,
        age,
        email,
        created_at,
        updated_at
    )
VALUES
    (
        'Cliente 1',
        1,
        30,
        'cliente1@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 2',
        2,
        25,
        'cliente2@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 3',
        3,
        35,
        'cliente3@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 4',
        1,
        25,
        'cliente4@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 5',
        2,
        30,
        'cliente5@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 6',
        3,
        35,
        'cliente6@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 7',
        1,
        28,
        'cliente7@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 8',
        2,
        22,
        'cliente8@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 9',
        3,
        40,
        'cliente9@example.com',
        NOW(),
        NOW()
    ),
    (
        'Cliente 10',
        1,
        27,
        'cliente10@example.com',
        NOW(),
        NOW()
    );

INSERT INTO
    purchase (
        customer_id,
        total,
        status,
        created_at,
        updated_at
    )
VALUES
    (1, 100.00, 'cancelado', NOW(), NOW()),
    (2, 50.00, 'pagado', NOW(), NOW()),
    (3, 75.00, 'vigente', NOW(), NOW()),
    (4, 125.00, 'pagado', NOW(), NOW()),
    (5, 150.00, 'vigente', NOW(), NOW()),
    (6, 175.00, 'cancelado', NOW(), NOW()),
    (7, 200.00, 'pagado', NOW(), NOW()),
    (8, 225.00, 'vigente', NOW(), NOW()),
    (9, 250.00, 'cancelado', NOW(), NOW()),
    (10, 275.00, 'pagado', NOW(), NOW()),
    (1, 300.00, 'vigente', NOW(), NOW()),
    (2, 325.00, 'cancelado', NOW(), NOW()),
    (3, 350.00, 'pagado', NOW(), NOW()),
    (4, 375.00, 'vigente', NOW(), NOW()),
    (5, 400.00, 'cancelado', NOW(), NOW()),
    (6, 425.00, 'pagado', NOW(), NOW()),
    (7, 450.00, 'vigente', NOW(), NOW()),
    (8, 475.00, 'cancelado', NOW(), NOW()),
    (9, 500.00, 'pagado', NOW(), NOW()),
    (10, 525.00, 'vigente', NOW(), NOW()),
    (1, 550.00, 'cancelado', NOW(), NOW()),
    (2, 575.00, 'pagado', NOW(), NOW()),
    (3, 600.00, 'vigente', NOW(), NOW()),
    (4, 625.00, 'cancelado', NOW(), NOW()),
    (5, 650.00, 'pagado', NOW(), NOW()),
    (6, 675.00, 'vigente', NOW(), NOW()),
    (7, 700.00, 'cancelado', NOW(), NOW()),
    (8, 725.00, 'pagado', NOW(), NOW()),
    (9, 750.00, 'vigente', NOW(), NOW()),
    (10, 775.00, 'cancelado', NOW(), NOW());

INSERT INTO
    purchase_product (purchase_id, product_id, created_at, updated_at)
VALUES
    (1, 1, now(), now()),
    (1, 1, now(), now()),
    (1, 1, now(), now()),
    (1, 1, now(), now()),
    (2, 2, now(), now()),
    (3, 2, now(), now()),
    (3, 1, now(), now()),
    (4, 4, now(), now()),
    (4, 1, now(), now()),
    (5, 4, now(), now()),
    (5, 2, now(), now()),
    (6, 7, now(), now()),
    (7, 4, now(), now()),
    (7, 4, now(), now()),
    (8, 5, now(), now()),
    (8, 4, now(), now()),
    (9, 10, now(), now()),
    (10, 3, now(), now()),
    (10, 8, now(), now()),
    (11, 12, now(), now()),
    (12, 7, now(), now()),
    (12, 6, now(), now()),
    (13, 10, now(), now()),
    (13, 4, now(), now()),
    (14, 11, now(), now()),
    (14, 4, now(), now()),
    (15, 8, now(), now()),
    (15, 8, now(), now()),
    (16, 9, now(), now()),
    (16, 8, now(), now()),
    (17, 10, now(), now()),
    (17, 8, now(), now()),
    (18, 11, now(), now()),
    (18, 8, now(), now()),
    (19, 10, now(), now()),
    (19, 10, now(), now()),
    (20, 10, now(), now()),
    (20, 10, now(), now()),
    (20, 1, now(), now()),
    (21, 6, now(), now()),
    (21, 8, now(), now()),
    (21, 8, now(), now()),
    (22, 11, now(), now()),
    (22, 12, now(), now()),
    (23, 12, now(), now()),
    (23, 12, now(), now()),
    (24, 12, now(), now()),
    (24, 12, now(), now()),
    (24, 1, now(), now()),
    (25, 12, now(), now()),
    (25, 12, now(), now()),
    (25, 2, now(), now()),
    (26, 12, now(), now()),
    (26, 12, now(), now()),
    (26, 3, now(), now()),
    (27, 8, now(), now()),
    (27, 8, now(), now()),
    (27, 8, now(), now()),
    (27, 4, now(), now()),
    (28, 12, now(), now()),
    (28, 12, now(), now()),
    (28, 5, now(), now()),
    (29, 12, now(), now()),
    (29, 12, now(), now()),
    (29, 6, now(), now()),
    (30, 12, now(), now()),
    (30, 12, now(), now()),
    (30, 7, now(), now());


-- Mejorar performance de consultas con indices
CREATE INDEX idx_purchase_product_id ON purchase_product (product_id);
CREATE INDEX idx_purchase_purchase_id ON purchase_product (purchase_id);