--
-- +----------------------------------------------------------------------------+
-- | RETO FRAMEWORK v9.3.0
-- +----------------------------------------------------------------------------+
-- | Copyright (c) 2004 - 2025, RETOWARE.COM (www.retoware.com)
-- | Jorge Alberto Reteguin Pimentel <jorge.reteguin@retoware.com>
-- | Released under the MIT license
-- | www.retoware.com/retoframework/license/license.txt
-- +----------------------------------------------------------------------------+
-- | Author.......: Vanessa Reteguin <vanessa.reteguin@retoware.com>
-- | First release: October 29th, 2025
-- | Last update..: October 29th, 2025
-- | WhatIs.......: Vuela - Scheme
-- | DBMS.........: MariaDB
-- +----------------------------------------------------------------------------+
--
--
--
-- DROP TABLE IF EXISTS flight;
--
--
--

--  DROP TABLE IF EXISTS airline;
CREATE TABLE
    airline (
        idairline INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idairline),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;

--  DROP TABLE IF EXISTS airport;
CREATE TABLE
    airport (
        idairport INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        iatacode VARCHAR(3);
        --
        airportidgeocountry INT UNSIGNED,
        airportidgeocity INT UNSIGNED,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idairport),
        --
        FOREIGN KEY (airportidgeocountry) REFERENCES geocountry (idgeocountry),
        FOREIGN KEY (airportidgeocity) REFERENCES geocity (idgeocity),
        --
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;


--  DROP TABLE IF EXISTS boardingpriority;
CREATE TABLE
    boardingpriority (
        idboardingpriority INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idboardingpriority),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS securityscreening;
CREATE TABLE
    securityscreening (
        idsecurityscreening INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idsecurityscreening),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS terminal;
CREATE TABLE
    terminal (
        idterminal INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idterminal),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS gate;
CREATE TABLE
    gate (
        idgate INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idgate),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS aircraft;
CREATE TABLE
    aircraft (
        idaircraft INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        aircraftname VARCHAR(128) NOT NULL UNIQUE,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idaircraft),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS origin;
CREATE TABLE
    flightorigin (
        idorigin INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        originname VARCHAR(128) NOT NULL UNIQUE,
        --
        rentcontractname_sp VARCHAR(64) NOT NULL,
        rentcontractname_en VARCHAR(64) NOT NULL,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idorigin),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS destination;
CREATE TABLE
    flightdestination (
        idflightdestination INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        rentcontractname_sp VARCHAR(64) NOT NULL,
        rentcontractname_en VARCHAR(64) NOT NULL,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idflightdestination),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS flight;
CREATE TABLE
    flight (
        idflight INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        idflightnumber VARCHAR(64) NOT NULL UNIQUE,
        --
        rentcontractname_sp VARCHAR(64) NOT NULL,
        rentcontractname_en VARCHAR(64) NOT NULL,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idflight),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



--  DROP TABLE IF EXISTS reservation;
CREATE TABLE
    reservation (
        idreservation INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        rentcontractname_sp VARCHAR(64) NOT NULL,
        rentcontractname_en VARCHAR(64) NOT NULL,
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME NOT NULL,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idreservation),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;