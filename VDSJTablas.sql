-- ============================
-- CREACIÓN DE TABLAS ORACLE
-- ============================

--  TABLA: EMPRESA
CREATE TABLE EMPRESA (
    ID_EMPRESA NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    CIUDAD VARCHAR2(100)
);
COMMENT ON TABLE EMPRESA IS 'Tabla que contiene la información de las empresas';
COMMENT ON COLUMN EMPRESA.ID_EMPRESA IS 'Llave primaria de la tabla empresa';
COMMENT ON COLUMN EMPRESA.NOMBRE IS 'Nombre de la empresa';
COMMENT ON COLUMN EMPRESA.CIUDAD IS 'Ciudad donde se ubica la empresa';

--  TABLA: EMPLEADO
CREATE TABLE EMPLEADO (
    ID_EMPLEADO NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    PUESTO VARCHAR2(100),
    SALARIO NUMBER(10,2),
    ID_EMPRESA NUMBER,
    CONSTRAINT FK_EMPLEADO_EMPRESA FOREIGN KEY (ID_EMPRESA)
        REFERENCES EMPRESA(ID_EMPRESA)
);
COMMENT ON TABLE EMPLEADO IS 'Tabla que contiene la información de los empleados';
COMMENT ON COLUMN EMPLEADO.ID_EMPLEADO IS 'Llave primaria de la tabla empleado';
COMMENT ON COLUMN EMPLEADO.NOMBRE IS 'Nombre del empleado';
COMMENT ON COLUMN EMPLEADO.PUESTO IS 'Puesto que ocupa el empleado';
COMMENT ON COLUMN EMPLEADO.SALARIO IS 'Salario del empleado';
COMMENT ON COLUMN EMPLEADO.ID_EMPRESA IS 'Llave foránea que referencia a la empresa del empleado';

--  TABLA: PROYECTO
CREATE TABLE PROYECTO (
    ID_PROYECTO NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    PRESUPUESTO NUMBER(12,2),
    ID_EMPRESA NUMBER,
    CONSTRAINT FK_PROYECTO_EMPRESA FOREIGN KEY (ID_EMPRESA)
        REFERENCES EMPRESA(ID_EMPRESA)
);
COMMENT ON TABLE PROYECTO IS 'Tabla que contiene la información de los proyectos';
COMMENT ON COLUMN PROYECTO.ID_PROYECTO IS 'Llave primaria de la tabla proyecto';
COMMENT ON COLUMN PROYECTO.NOMBRE IS 'Nombre del proyecto';
COMMENT ON COLUMN PROYECTO.PRESUPUESTO IS 'Presupuesto asignado al proyecto';
COMMENT ON COLUMN PROYECTO.ID_EMPRESA IS 'Llave foránea que referencia a la empresa responsable del proyecto';

-- TABLA: ASIGNACION
CREATE TABLE ASIGNACION (
    ID_ASIGNACION NUMBER PRIMARY KEY,
    ID_EMPLEADO NUMBER,
    ID_PROYECTO NUMBER,
    HORAS NUMBER,
    CONSTRAINT FK_ASIGNACION_EMPLEADO FOREIGN KEY (ID_EMPLEADO)
        REFERENCES EMPLEADO(ID_EMPLEADO),
    CONSTRAINT FK_ASIGNACION_PROYECTO FOREIGN KEY (ID_PROYECTO)
        REFERENCES PROYECTO(ID_PROYECTO)
);
COMMENT ON TABLE ASIGNACION IS 'Tabla que relaciona empleados con proyectos y las horas asignadas';
COMMENT ON COLUMN ASIGNACION.ID_ASIGNACION IS 'Llave primaria de la tabla asignación';
COMMENT ON COLUMN ASIGNACION.ID_EMPLEADO IS 'Llave foránea que referencia al empleado asignado';
COMMENT ON COLUMN ASIGNACION.ID_PROYECTO IS 'Llave foránea que referencia al proyecto asignado';
COMMENT ON COLUMN ASIGNACION.HORAS IS 'Número de horas asignadas al empleado en el proyecto';
