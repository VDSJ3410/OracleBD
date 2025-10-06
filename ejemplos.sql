-- Crear el usuario --
CREATE USER ejemplos IDENTIFIED BY ejemplo
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

-- Dar privilegios básicos para conectarse y tranajar con sus tablas --
GRANT CREATE SESSION TO ejemplos; -- Permiso para hacer Login
GRANT CREATE TABLE TO ejemplos; -- Permiso para crear tablas
GRANT CREATE SEQUENCE TO ejemplos; -- Permiso para crear secuencias
GRANT CREATE VIEW TO ejemplos; -- Permiso para crear pistas
GRANT CREATE TRIGGER TO ejemplos; -- Permiso para crear Triggers
GRANT CREATE PROCEDURE TO ejemplos; -- Permiso para crear funciones y procedimientos almacenados

-- Rol resource
GRANT RESOURCE TO ejemplos; 

