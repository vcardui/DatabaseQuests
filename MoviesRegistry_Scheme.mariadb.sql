-- +----------------------------------------------------------------------------+
-- | CARDUI WORKS v1.0.0
-- +----------------------------------------------------------------------------+
-- | Copyright (c) 2024 - 2025, CARDUI.COM (www.cardui.com)
-- | Vanessa Reteguín <vanessa@reteguin.com>
-- | Released under the MIT license
-- | www.cardui.com/carduiframework/license/license.txt
-- +----------------------------------------------------------------------------+
-- | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
-- | First release: September 11th, 2025
-- | Last update..: September 11th, 2025
-- | WhatIs.......: MoviesRegistry - Scheme
-- | DBMS.........: MariaDB
-- +----------------------------------------------------------------------------+
/*
# Descripción SITUACION 2

Empresa que se dedica a la producción de películas, la empresa tiene la siguiente
información: ID_Autor, RFC, Nombre, Apellido Paterno, Apellido Materno, Dirección,
Telefono, ID_Pelicula, Nombre de la película y año de producción.
P.D. Puede generar múltiples posibilidades para la solución

 */
--
--
--
-- DROP TABLE IF EXISTS movie;
CREATE TABLE
    movie (
        idmovie INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        movietitle INT UNSIGNED NOT NULL,
        productionyear DATETIME NOT NULL,
        --
        PRIMARY KEY (idmovie)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS author;
CREATE TABLE
    author (
        idauthor INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        firstname VARCHAR(64) NOT NULL,
        lastname VARCHAR(64) NOT NULL,
        motherslastname VARCHAR(64),
        rfc VARCHAR(13) NOT NULL,
        authoraddress VARCHAR(128),
        --
        PRIMARY KEY (idauthor)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS authormovie;
CREATE TABLE
    authormovie (
        idauthor INT UNSIGNED NOT NULL,
        --
        idmovie INT UNSIGNED NOT NULL,
        --
        UNIQUE KEY (idauthor, idmovie),
        FOREIGN KEY (idauthor) REFERENCES author (idauthor),
        FOREIGN KEY (idmovie) REFERENCES movie (idmovie)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;