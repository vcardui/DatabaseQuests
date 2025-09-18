-- +----------------------------------------------------------------------------+
-- | CARDUI WORKS v1.0.0
-- +----------------------------------------------------------------------------+
-- | Copyright (c) 2024 - 2025, CARDUI.COM (www.cardui.com)
-- | Vanessa Reteguín <vanessa@reteguin.com>
-- | Released under the MIT license
-- | www.cardui.com/carduiframework/license/license.txt
-- +----------------------------------------------------------------------------+
-- | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
-- | First release: September 17th, 2025
-- | Last update..: September 17th, 2025
-- | WhatIs.......: Payroll - Scheme
-- | DBMS.........: MariaDB
-- +----------------------------------------------------------------------------+
/*
Descripción situación 4

En una empresa desean realizar una nomina de manera automatizada tomando como
base la información del usuario ( nombre, expediente, id de personal, tipo de
nomina, unidad organizacional, centro, departamento, puesto, pago, numero de
recibo, el salario mensual, días trabajados y los conceptos de percepción y
deducciones como son: Sueldo tabulado, antigüedad, Cuota IMSS, Prestamos, etc.


P.D. Puede generar múltiples posibilidades para la solución
 */
--
--
--
-- DROP TABLE IF EXISTS deductions;
CREATE TABLE
    deductions (
        iddeductions INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        deductionsname VARCHAR(128) NOT NULL,
        internalid VARCHAR(8),
        deductionsdescription VARCHAR(256) NOT NULL,
        --
        PRIMARY KEY (iddeductions)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS wagecompensation;
CREATE TABLE
    wagecompensation (
        idwagecompensation INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        wagecompensationname VARCHAR(128) NOT NULL,
        internalid VARCHAR(8),
        wagecompensationdescription VARCHAR(256) NOT NULL,
        --
        PRIMARY KEY (idwagecompensation)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS employeefile;
CREATE TABLE
    workedday (
        idworkedday INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        idemployee INT UNSIGNED NOT NULL,
        workeddaydate DATETIME,
        --
        PRIMARY KEY (idworkedday),
        FOREIGN KEY (idemployee) REFERENCES employee (idemployee)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS payrolltype;
CREATE TABLE
    payrolltype (
        idpayrolltype INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        payrolltypename VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idpayrolltype)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS employeefile;
CREATE TABLE
    employeefile (
        idemployeefile INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        fileroute VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idemployeefile)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS client;
CREATE TABLE
    employee (
        idemployee INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        firstname VARCHAR(64) NOT NULL,
        lastname VARCHAR(64) NOT NULL,
        idemployeefile INT UNSIGNED NOT NULL,
        organisationalunit VARCHAR(64) NOT NULL,
        center VARCHAR(64) NOT NULL,
        department VARCHAR(64) NOT NULL,
        position VARCHAR(64) NOT NULL,
        montlysalary INT UNSIGNED NOT NULL,
        --
        PRIMARY KEY (idclient),
        FOREIGN KEY (idemployeefile) REFERENCES employeefile (idemployeefile)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS paycheck;
CREATE TABLE
    paycheck (
        idpaycheck INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        idemployee INT UNSIGNED NOT NULL,
        quantity DECIMAL(19, 4) NOT NULL,
        reciptid VARCHAR(128),
        paycheckdate DATETIME,
        --
        PRIMARY KEY (idpaycheck),
        FOREIGN KEY (idemployee) REFERENCES employee (idemployee)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;