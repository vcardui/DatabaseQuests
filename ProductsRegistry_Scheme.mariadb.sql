-- +----------------------------------------------------------------------------+
-- | CARDUI WORKS v1.0.0
-- +----------------------------------------------------------------------------+
-- | Copyright (c) 2024 - 2025, CARDUI.COM (www.cardui.com)
-- | Vanessa Reteguín <vanessa@reteguin.com>
-- | Released under the MIT license
-- | www.cardui.com/carduiframework/license/license.txt
-- +----------------------------------------------------------------------------+
-- | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
-- | First release: September 25th, 2025
-- | Last update..: September 25th, 2025
-- | WhatIs.......: ProductsRegistry - Scheme
-- | DBMS.........: MariaDB
-- +----------------------------------------------------------------------------+
/*
 **Ejercicio 2**

Se tiene el siguiente esquema base id_pedido, id_producto, fecha_pedido,
nom_prod, nom_proveedor, costo_prod y se tiene una llave compuesta de los
atributos id_pedido y id_producto. Realice y aplique lo necesario p/obtener
la 2NF (lo más detallado posible)

id_pedido/id_producto
 */
--
--
--
-- DROP TABLE IF EXISTS pedido;
CREATE TABLE
    pedido (
        id_pedido INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        fecha_pedido DATETIME NOT NULL,
        --
        PRIMARY KEY (id_pedido)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS producto;
CREATE TABLE
    producto (
        id_producto INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        costo INT UNSIGNED NOT NULL,
        --
        PRIMARY KEY (id_producto)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS proveedor;
CREATE TABLE
    proveedor (
        id_proveedor INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        nombreproveedor VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (id_proveedor)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;



-- DROP TABLE IF EXISTS pedidoproducto;
CREATE TABLE
    pedidoproducto (
        id_pedido INT UNSIGNED NOT NULL,
        --
        id_producto INT UNSIGNED NOT NULL,
        --
        UNIQUE KEY (id_pedido, id_producto),
        FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
        FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;