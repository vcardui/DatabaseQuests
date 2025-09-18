-- +----------------------------------------------------------------------------+
-- | CARDUI WORKS v1.0.0
-- +----------------------------------------------------------------------------+
-- | Copyright (c) 2024 - 2025, CARDUI.COM (www.cardui.com)
-- | Vanessa Reteguín <vanessa@reteguin.com>
-- | Released under the MIT license
-- | www.cardui.com/carduiframework/license/license.txt
-- +----------------------------------------------------------------------------+
-- | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
-- | First release: September 10th, 2025
-- | Last update..: September 11th, 2025
-- | WhatIs.......: PetsRegistry - Scheme
-- | DBMS.........: MariaDB
-- +----------------------------------------------------------------------------+
/*
Descripción situación 1
El municipio de Aguascalientes desea realizar el registro de mascotas dando un
marco general pidiento Nombre, Dirección, CURP del dueño y Nombre, Raza, Edad y
vacunas aplicadas a las mascotas

P.D. Puede generar múltiples posibilidades para la solución

Nombre de la relación
Atributo
Tupla
Llave primaria
Llaves candidatas
Llaves alternas
Llave foránea
Dominio
Cardinalidad
Grado
Super Llave o llave compuesta
Defina o dibuje el esquema completo
 */
--
--
--
-- DROP TABLE IF EXISTS appliedvaccine;
CREATE TABLE
    appliedvaccine (
        idappliedvaccine INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        idvaccine INT UNSIGNED NOT NULL,
        batch VARCHAR(128) NOT NULL,
        idpet INT UNSIGNED NOT NULL,
        applieddate DATETIME NOT NULL,
        --
        comments VARCHAR(255),
        --
        PRIMARY KEY (idappliedvaccine),
        FOREIGN KEY (idvaccine) REFERENCES vaccine (idvaccine),
        FOREIGN KEY (idpet) REFERENCES pet (idpet)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS breed;
CREATE TABLE
    breed (
        idbreed INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        breedname VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idbreed)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS userowner;
CREATE TABLE
    userowner (
        iduserowner INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        ownerfirstname VARCHAR(64) NOT NULL,
        ownerlastname VARCHAR(64) NOT NULL,
        owneraddress VARCHAR(128) NOT NULL,
        curp VARCHAR(18) NOT NULL
        --
        PRIMARY KEY (iduserowner)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS pet;
CREATE TABLE
    pet (
        idpet INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        iduserowner INT UNSIGNED NOT NULL,
        petname VARCHAR(64) NOT NULL,
        idbreed INT UNSIGNED NOT NULL,
        birthdate DATETIME NOT NULL,
        --
        comments VARCHAR(255),
        --
        iduserowner PRIMARY KEY (idpet),
        FOREIGN KEY (iduserowner) REFERENCES userowner (iduserowner),
        FOREIGN KEY (idbreed) REFERENCES breed (idbreed)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS vaccine;
CREATE TABLE
    vaccine (
        idvaccine INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        vaccinename VARCHAR(128) NOT NULL,
        vaccinecommonname VARCHAR(128) NOT NULL,
        vaccinecode VARCHAR(16) NOT NULL,
        vaccinepriority ENUM ('essential', 'complementary') NOT NULL,
        --
        comments VARCHAR(255),
        --
        PRIMARY KEY (idvaccine)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;