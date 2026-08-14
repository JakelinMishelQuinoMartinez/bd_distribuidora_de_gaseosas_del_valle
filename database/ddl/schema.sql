CREATE DATABASE distribuidora_de_gaseosas_del_valle;
USE distribuidora_de_gaseosas_del_valle;

-- ======================================================TABLA CATEGORIAS
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NULL
) ENGINE = InnoDB;

-- ======================================================TABLA PRODUCTOS
CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_categoria INT NOT NULL,
    volumen_ml INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
) ENGINE = InnoDB;

-- ======================================================TABLA AUDITORIA_PRECIOS
CREATE TABLE auditoria_precios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT NOT NULL,
    precio_anterior DECIMAL(10,2) NOT NULL,
    precio_nuevo DECIMAL(10,2) NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
) ENGINE = InnoDB;

-- ======================================================TABLA DEPARTAMENTOS (Guatemala)
CREATE TABLE departamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
) ENGINE = InnoDB;