-- Crear el usuario --
CREATE USER vdsj IDENTIFIED BY vdsj
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

-- Dar privilegios básicos para conectarse y tranajar con sus tablas --
GRANT CREATE SESSION TO vdsj; -- Permiso para hacer Login
GRANT CREATE TABLE TO vdsj; -- Permiso para crear tablas
GRANT CREATE SEQUENCE TO vdsj; -- Permiso para crear secuencias
GRANT CREATE VIEW TO vdsj; -- Permiso para crear pistas
GRANT CREATE TRIGGER TO vdsj; -- Permiso para crear Triggers
GRANT CREATE PROCEDURE TO vdsj; -- Permiso para crear funciones y procedimientos almacenados
GRANT CREATE MATERIALIZED VIEW TO vdsj; -- Permiso para crear vistas materializadas
GRANT CREATE DATABASE LINK TO vdsj; -- Permiso para crear databse link
GRANT CREATE SYNONYM TO vdsj; -- Permiso para crear sinónimos

-- Rol resource
GRANT RESOURCE TO vdsj;