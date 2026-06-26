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
-- | WhatIs.......: Access Validation Module - Scheme
-- | DBMS.........: MariaDB
-- +----------------------------------------------------------------------------+
--
--
--
-- DROP TABLE IF EXISTS avmresetpwd;
-- DROP TABLE IF EXISTS avmsession;
-- DROP TABLE IF EXISTS avmprofileapplication;
-- DROP TABLE IF EXISTS avmapplication;
-- DROP TABLE IF EXISTS avmprofile;
-- DROP TABLE IF EXISTS avmuser;
--
--
--
-- DROP TABLE IF EXISTS avmuser;
CREATE TABLE
    avmuser (
        idavmuser INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        userlogin VARCHAR(64) UNIQUE NOT NULL,
        userpassword VARCHAR(96) NOT NULL,
        userstatus ENUM ('active', 'inactive') NOT NULL DEFAULT 'active',
        expirydate DATETIME NOT NULL,
        pwdexpirydate DATETIME NOT NULL,
        pwdrequireschange ENUM ('yes', 'no') NOT NULL DEFAULT 'yes',
        idavmprofile INT UNSIGNED NOT NULL,
        firstname VARCHAR(64) NOT NULL,
        lastname VARCHAR(64) NOT NULL,
        mothersmaidenname VARCHAR(64),
        email VARCHAR(128) NOT NULL,
        mobilenumber VARCHAR(20),
        officephonenumber VARCHAR(20),
        jobposition VARCHAR(64), ---
        --
        privacynoticedatetime DATETIME,
        privacynoticesource ENUM ('DESKTOP', 'MOBILE'),
        privacynoticeuseragent VARCHAR(255),
        privacynoticesourceip VARCHAR(64),
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME DEFAULT CURRENT_TIMESTAMP,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idavmuser),
        --
        INDEX idx_avmuser_1 (userlogin)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS avmprofile;
CREATE TABLE
    avmprofile (
        idavmprofile INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        codename VARCHAR(32) UNIQUE NOT NULL,
        profilename_sp VARCHAR(64) UNIQUE NOT NULL,
        profilename_en VARCHAR(64) UNIQUE NOT NULL,
        profilestatus ENUM ('active', 'disabled') NOT NULL DEFAULT 'active',
        description VARCHAR(255),
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME DEFAULT CURRENT_TIMESTAMP,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idavmprofile),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS avmapplication;
CREATE TABLE
    avmapplication (
        idavmapplication INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        codename VARCHAR(32) UNIQUE NOT NULL,
        applicationname_sp VARCHAR(64) UNIQUE NOT NULL,
        applicationname_en VARCHAR(64) UNIQUE NOT NULL,
        applicationstatus ENUM ('active', 'disabled') NOT NULL DEFAULT 'active',
        description VARCHAR(255),
        --
        creationuser INT UNSIGNED NOT NULL,
        updateuser INT UNSIGNED NOT NULL,
        creationdate DATETIME DEFAULT CURRENT_TIMESTAMP,
        updatedate TIMESTAMP,
        --
        PRIMARY KEY (idavmapplication),
        FOREIGN KEY (creationuser) REFERENCES avmuser (idavmuser),
        FOREIGN KEY (updateuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS avmprofileapplication;
CREATE TABLE
    avmprofileapplication (
        idavmprofile INT UNSIGNED NOT NULL,
        --
        idavmapplication INT UNSIGNED NOT NULL,
        --
        UNIQUE KEY (idavmprofile, idavmapplication),
        FOREIGN KEY (idavmapplication) REFERENCES avmapplication (idavmapplication),
        FOREIGN KEY (idavmprofile) REFERENCES avmprofile (idavmprofile)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- ALTER TABLE avmsession RENAME COLUMN source TO devicetype;
--
--
-- DROP TABLE IF EXISTS avmsession;
CREATE TABLE
    avmsession (
        idavmsession INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        --
        idavmuser INT UNSIGNED NOT NULL,
        sessionnumber VARCHAR(255) UNIQUE NOT NULL,
        sessioninterval TINYINT,
        --
        starttime DATETIME DEFAULT CURRENT_TIMESTAMP,
        endtime DATETIME,
        --
        devicetype ENUM ('DESKTOP', 'MOBILE'),
        useragent VARCHAR(255) NOT NULL,
        sourceip VARCHAR(255) NOT NULL,
        --
        lastsource ENUM ('DESKTOP', 'MOBILE'),
        lastuseragent VARCHAR(255) NOT NULL,
        lastsourceip VARCHAR(255) NOT NULL,
        --
        PRIMARY KEY (idavmsession),
        INDEX idx_avmsession_1 (idavmuser),
        INDEX idx_avmsession_2 (sessionnumber),
        FOREIGN KEY (idavmuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS avmresetpwd;
CREATE TABLE
    avmresetpwd (
        idavmresetpwd INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        idavmuser INT UNSIGNED NOT NULL,
        resetpwdtoken VARCHAR(255) UNIQUE NOT NULL,
        starttime DATETIME NOT NULL,
        endtime DATETIME NOT NULL,
        requestremoteipaddr VARCHAR(255),
        requesthttpuseragent VARCHAR(255),
        requestcreationdate DATETIME NOT NULL,
        responseremoteipaddr VARCHAR(255),
        responsehttpuseragent VARCHAR(255),
        responsecreationdate DATETIME,
        --
        PRIMARY KEY (idavmresetpwd),
        INDEX idx_avmresetpwd_1 (resetpwdtoken),
        FOREIGN KEY (idavmuser) REFERENCES avmuser (idavmuser)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;