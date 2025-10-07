-- Crear el procedimiento almacenado que genera la secuencia de folio de factura por año
CREATE OR REPLACE PROCEDURE SP_CREAR_SEQ_FOLIO_ANIO(
    p_anio IN NUMBER
)
IS 
    v_seq_name VARCHAR(30):= 'SEC_FOLIO_' || p_anio;
    v_count NUMBER := 0;
BEGIN
    -- Verificar si la secuencia existe
    SELECT COUNT (*) INTO v_count FROM ALL_SEQUENCES WHERE SEQUENCE_NAME = v_seq_name
    AND SEQUENCE_OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA');
    -- Si no existe la secuencia se debe de crear
    IF v_count = 0 THEN 
        EXECUTE IMMEDIATE 'CREATE SEQUENCE' || v_seq_name || 'START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
        DBMS_OUTPUT.PUT_LINE('Secuencia ' || v_seq_name || 'Creada.');
    END IF;
    EXCEPTION 
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error al crear la secuencia' || v_seq_name || ':' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE SP_INSERTAR_FACTURA (
    p_id_cliente IN NUMBER,
    p_monto_total IN NUMBER,
    p_fecha_factura IN DATE,
    p_id_factura OUT NUMBER
)
IS
BEGIN
    INSERT INTO FACTURAS (ID_CLIENTE, MONTO_TOTAL, FECHA_FACTURA)
    VALUES (p_id_cliente, p_monto_total,  p_fecha_factura) RETURNING ID_FACTURA INTO p_id_factura;
    
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;

-- Eliminar el INSERT:
-- DROP PROCEDURE SP_INSERTAR_FACTURA;

CREATE OR REPLACE PROCEDURE SP_INSERTAR_PAGO(
    p_id_factura IN NUMBER,
    p_monto IN NUMBER,
    p_fecha_pago IN DATE,
    p_id_pago OUT NUMBER
)
IS
BEGIN
    INSERT INTO PAGOS (ID_FACTURA, MONTO, FECHA_PAGO)
    VALUES (p_id_factura, p_monto, p_fecha_pago) RETURNING ID_PAGO INTO P_id_pago;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;



