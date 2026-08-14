CREATE DATABASE distribuidora_de_gaseosas_del_valle;
USE distribuidora_de_gaseosas_del_valle;

-- ======================================================TABLA CATEGORIAS
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NULL
) ENGINE = InnoDB;