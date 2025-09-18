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
-- | WhatIs.......: AutoRepairShop - Scheme
-- | DBMS.........: MariaDB
-- +----------------------------------------------------------------------------+
/*
Descripción situación 3

Taller mecánico con la finalidad de dar un mejor servicio a sus clientes ha
decidido realizar un sistema cuenta con la siguiente información: RFC, Nombre,
dirección, Teléfono, Autos x marca, modelo, año, No de serie, No de placas.

P.D. Puede generar múltiples posibilidades para la solución
 */
--
--
--
-- DROP TABLE IF EXISTS model;
CREATE TABLE
    model (
        idmodel INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        modelname VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idmodel)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS brand;
CREATE TABLE
    brand (
        idbrand INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        brandname VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idbrand)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS client;
CREATE TABLE
    client (
        idclient INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        firstname VARCHAR(64) NOT NULL,
        lastname VARCHAR(64) NOT NULL,
        rfc VARCHAR(13) NOT NULL,
        clientaddress VARCHAR(128),
        phonenumber VARCHAR(32),
        --
        PRIMARY KEY (idclient)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS automobile;
CREATE TABLE
    automobile (
        idautomobile INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        idbrand INT UNSIGNED NOT NULL,
        idmodel INT UNSIGNED NOT NULL,
        modelyear SMALLINT UNSIGNED,
        serialnumbel VARCHAR(17),
        plate VARCHAR(16) NOT NULL,
        --
        PRIMARY KEY (iduserowner)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS automobileclient;
CREATE TABLE
    automobileclient (
        idautomobile INT UNSIGNED NOT NULL,
        --
        idclient INT UNSIGNED NOT NULL,
        --
        UNIQUE KEY (idautomobile, idclient),
        FOREIGN KEY (idautomobile) REFERENCES automobile (idautomobile),
        FOREIGN KEY (idclient) REFERENCES client (idclient)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;