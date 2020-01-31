------------------------------
-- Archivo de base de datos --
------------------------------

DROP TABLE IF EXISTS departamentos CASCADE;

CREATE TABLE departamentos
(
    id        bigserial    PRIMARY KEY
    , num_dep   numeric(2)   NOT NULL UNIQUE
    , dnombre   varchar(255) NOT NULL
    , localidad varchar(255) CONSTRAINT ck_localidad_no_vacia
    CHECK (localidad != '')
);

DROP TABLE IF EXISTS usuarios CASCADE;

CREATE TABLE usuarios
(
    id       bigserial    PRIMARY KEY
    , login    varchar(255) NOT NULL UNIQUE
    , password varchar(255) NOT NULL
    , email    varchar(255) CONSTRAINT email_no_vacia
    CHECK (email != '')
);

DROP TABLE IF EXISTS empleados CASCADE;

CREATE TABLE empleados
(
    id              bigserial    PRIMARY KEY
    , num_emp         numeric(4)   NOT NULL UNIQUE
    , nombre          varchar(255) NOT NULL
    , salario         numeric(6,2)
    , departamento_id bigint       NOT NULL REFERENCES departamentos (id)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP VIEW IF EXISTS v_departamentos CASCADE;

CREATE VIEW v_departamentos AS
SELECT d.*, COUNT(e.id) AS cantidad
FROM departamentos d
         LEFT JOIN empleados e
                   ON e.departamento_id = d.id
GROUP BY d.id;

INSERT INTO usuarios (login, password, email)
VALUES ('pepe', crypt('pepe', gen_salt('bf', 12)), 'pepe@pepe.com');

INSERT INTO departamentos (num_dep, dnombre, localidad)
VALUES (10, 'Contabilidad', 'Sanlúcar')
     , (20, 'Facturación', 'Chipiona')
     , (25, 'AtencionPublico', 'Chipiona')
     , (15, 'RRHH', 'Chipiona')
     , (35, 'Informatica', 'Jerez')
     , (31, 'VentasDos', 'Jerez')
     , (30, 'Ventas', 'Trebujena');

INSERT INTO empleados (num_emp, nombre, salario, departamento_id)
VALUES (5355, 'Pepe', 1400, 1)
     , (6166, 'Juan', 1700, 2)
     , (8848, 'María', 2100, 5)
     , (4444, 'Rosa', 1700, 5)
     , (6666, 'Juan', 1700, 2)
     , (8888, 'Hector', 2100, 2)
     , (3344, 'Rosario', 1700, 1)
     , (1111, 'Luis', 1700, 7)
     , (2312, 'Eva', 2100, 7)
     , (4561, 'David', 1700, 3)
     , (8765, 'Eduardo', 2100, 3)
     , (5643, 'Paqui', 1700, 1)
     , (2313, 'Jaime', 1700, 3)
     , (2317, 'Manulo', 2100, 4)
     , (4562, 'Soledad', 1700, 4)
     , (7777, 'Eugenia', 2100, 2);