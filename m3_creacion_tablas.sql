/* El siguiente ejercicio corresponde a la Pre-Entrega 3 del curso Data Analytics
 de Eduardo Franco */

CREATE DATABASE Ventas_Tech_DB;

-- Limpieza del Dataset

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- Creacion de tablas en el Dataset

CREATE TABLE categorias (
Id_categoria INT PRIMARY KEY IDENTITY (1,1),
Nombre_categoria  VARCHAR (50) NOT NULL,
Descripcion VARCHAR (200)
);

CREATE TABLE clientes (
Id_cliente INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR (100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Ciudad VARCHAR(50),
Fecha_registro DATE NOT NULL
);

CREATE TABLE productos(
Id_producto INT PRIMARY KEY IDENTITY (1,1),
Nombre_producto VARCHAR(100) NOT NULL,
Id_categoria INT
FOREIGN KEY REFERENCES categorias (Id_categoria),
Precio DECIMAL (10,2) NOT NULL,
Stock INT DEFAUlT 0,
Activo TINYINT DEFAULT 1
);

-- TINYINT no incluye () como indicaba la plataforma porque mandaba error

CREATE TABLE ventas(
Id_venta INT PRIMARY KEY IDENTITY (1,1),
Id_cliente INT
FOREIGN KEY REFERENCES clientes (Id_cliente),
Id_producto INT
FOREIGN KEY REFERENCES productos(Id_producto),
Cantidad INT NOT NULL,
Precio_unitario DECIMAL(10,2) NOT NULL,
Fecha_venta DATE NOT NULL
);

--Ahora se agregan Datos a las tablas

INSERT INTO categorias VALUES ('Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES ('Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES ('Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES ('Almacenamiento', 'Discos y memorias');

/* Al incluir IDENTITY en las primary keys el ID se genera de forma automatica por lo que no se puede 
incluir como en el ejemplo de la plataforma */

INSERT INTO clientes VALUES ('María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO clientes VALUES ('Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO clientes VALUES ('Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO clientes VALUES ('Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO clientes VALUES ('Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO productos VALUES ('Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO productos VALUES ('Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO productos VALUES ('Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO productos VALUES ('Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO productos VALUES ('SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO productos VALUES ('Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO ventas VALUES (  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas VALUES (  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas VALUES (  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas VALUES (  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas VALUES (  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas VALUES (  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas VALUES (  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas VALUES (  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas VALUES (  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas VALUES (  5, 3, 2,  450.00, '2024-03-15');

--Comprobacion de integridad

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;

