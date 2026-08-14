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

-- ======================================================TABLA MUNICIPIOS (Guatemala)
CREATE TABLE municipios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
) ENGINE = InnoDB;

-- ======================================================TABLA CLIENTES
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(120) NOT NULL,
    identificacion CHAR(13) UNIQUE NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    id_municipio INT NOT NULL,
    telefono VARCHAR(15) UNIQUE NOT NULL,
    correo_electronico VARCHAR(60) UNIQUE NOT NULL,
    FOREIGN KEY (id_municipio) REFERENCES municipios(id)
)ENGINE = InnoDB;

-- ======================================================TABLA ENCARGADOS 
CREATE TABLE encargados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(120) NOT NULL,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    correo_electronico VARCHAR(60) UNIQUE NOT NULL,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
) ENGINE = InnoDB;

-- ======================================================TABLA SEDES
CREATE TABLE sedes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(120) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL,
    id_municipio INT NOT NULL, 
    capacidad_almacenamiento INT NOT NULL,
    id_encargado INT NOT NULL,
    FOREIGN KEY (id_municipio) REFERENCES municipios(id),
    FOREIGN KEY (id_encargado) REFERENCES encargados(id)
)ENGINE = InnoDB;