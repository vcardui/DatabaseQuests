# Ejercicios con Enunciados Segunda Parte (3 y 4) REALIZADOS

Tipo: Tarea
Fecha: 21/09/2025 23:59 (CST)
Materia: Bases de datos
Status: Terminado

# Instrucciones

Analice información que se le proporciona y modele mediante el
modelo relacional una propuesta para solucionar la situación de la
descripción incluya, lo que se enlista:

- Nombre de la relación
- Atributo
- Tupla
- Llave primaria
- Llaves candidatas
- Llaves alternas
- Llave foránea
- Dominio
- Cardinalidad
- Grado
- Super llave o llave compuesta
- Defina o dibuje el esquema completo

# Descripción SITUACION 3

Taller mecánico con la finalidad de dar un mejor servicio a sus clientes ha
decidido realizar un sistema cuenta con la siguiente información: RFC, Nombre, dirección, Teléfono, Autos k marca, modelo, año, No de serie, No de placas.
P.D. Puede generar múltiples posibilidades para la solución.

## model

- **Nombre de la relación:** idmodel
- **Atributo:** idmodel, modelname
- Tupla: Ninguna. Ejemplo: {(1, ‘Model X Plaid’)}
- **Llave primaria:** idmodel
- **Llaves candidatas:** idmodel, modelname
- **Llaves alternas:** modelname
- **Llave foránea:** Ninguna
- **Dominio:**
    - idmodel: {Numérico, autoincremental, sólo enteros positivos}
    - modelname: {Alfanumérico, nombre comercial de modelo asignado por fabricante}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 2 (idmodel, modelname)
- **Super Llave o llave compuesta:** idmodel + modelname
- **Defina o dibuje el esquema completo:**

```sql
CREATE TABLE
    model (
        idmodel INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        modelname VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idmodel)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## brand

- **Nombre de la relación:** brand
- **Atributo:** idbrand, brandname
- Tupla: Ninguna. Ejemplo: {(1, ‘Tesla’)}
- **Llave primaria:** idbrand
- **Llaves candidatas:** idbrand, brandname
- **Llaves alternas:** brandname
- **Llave foránea:** Ninguna
- **Dominio:**
    - idbrand: {Numérico, autoincremental, sólo enteros positivos}
    - brandname: {Alfanumérico, nombre comercial de modelo asignado por fabricante}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 2 (idbrand, brandname)
- **Super Llave o llave compuesta:** idbrand + brandname
- **Defina o dibuje el esquema completo:**

```sql
CREATE TABLE
    brand (
        idbrand INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        brandname VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idbrand)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## client

- **Nombre de la relación:** client
- **Atributo:** idclient, firstname, lastname, rfc, clientaddress, phonenumber
- Tupla: Ninguna. Ejemplo: {(1, ‘Peter’, ‘Parker’, ‘VECJ880326XXX’, ‘500 S Buena Vista Street, Burbank, CA 91521, United States’, ‘+52 449 1300 1265’)}
- **Llave primaria:** idclient
- **Llaves candidatas:** idclient, rfc, clientaddress, phonenumber
- **Llaves alternas:** rfc, clientaddress, phonenumber
- **Llave foránea:** Ninguna
- **Dominio:**
    - idclient: {Numérico, autoincremental, sólo enteros positivos}
    - firstname: {Letras del alfabeto, nombre propio del cliente}
    - lastname: {Letras del alfabeto, apellido del cliente}
    - rfc: {Alfanumérico, Registro Federal de Contribuyentes}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 6 (idclient, firstname, lastname, rfc, clientaddress, phonenumber)
- **Super Llave o llave compuesta:** idclient + rfc
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## automobile

- **Nombre de la relación:** automobile
- **Atributo:** idautomobile, idbrand, idmodel, modelyear, serialnumbel, plate
- Tupla: Ninguna. Ejemplo: {(1, 3, 1, 2022, ‘1HGCM12345A654321’, ‘+52 449 1300 1265’, ‘AAA-123-A’)}
- **Llave primaria:** idautomobile
- **Llaves candidatas:** idautomobile, serialnumbel, plate
- **Llaves alternas:** serialnumbel, plate
- **Llave foránea:** idbrand, idmodel
- **Dominio:**
    - idautomobile: {Numérico, autoincremental, sólo enteros positivos}
    - idbrand: {Numérico, sólo enteros positivos, llave foranea}
    - idmodel: {Numérico, sólo enteros positivos, llave foranea}
    - modelyear: {Numérico, sólo enteros positivos, año de fabricación del automóvil}
    - serialnumbel: {Alfanumérico, número de serie del automóvil emitido por el fabricante}
    - **plate: {**Alfanumérico con símbolos especiales, placas del automóvil}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 6 (idautomobile, idbrand, idmodel, modelyear, serialnumbel, plate)
- **Super Llave o llave compuesta:** idautomobile + serialnumbel
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## automobileclient

Tabla para relacionar cada vehículo con su dueño

Legalmente, cada vehículo puede tener más de un dueño y cada persona puede poseer más de un vehículo. 

- **Nombre de la relación:** automobileclient
- **Atributo:** idautomobile, idclient
- Tupla: Ninguna. Ejemplo: {(1, 3)}
- **Llave primaria:** No aplica, existe llave única y dos foráneas
- **Llaves candidatas:** No aplica, existe llave única y dos foráneas
- **Llaves alternas:** No aplica, existe llave única y dos foráneas
- **Llave foránea:** idautomobile, idclient
- **Dominio:**
    - idautomobile: {Numérico, autoincremental, sólo enteros positivos}
    - idclient: {Numérico, autoincremental, sólo enteros positivos}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 2 (idautomobile, idclient)
- **Super Llave o llave compuesta:** idautomobile + idclient (llave única)
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

# **Descripción SITUACION 4**

En una empresa desean realizar una nomina de manera automatizada tomando como base la información del usuario (nombre, expediente, id de personal, tipo de nomina, unidad organizacional, centro, departamento, puesto, pago, numero de recibo, el salario mensual, días trabajados y los conceptos de percepción y deducciones como son: Sueldo tabulado, antigüedad, Cuota IMSS, Prestamos, etc.
P.D. Puede generar múltiples posibilidades para la solución

## deductions

- **Nombre de la relación:** deductions
- **Atributo:** iddeductions, deductionsname, internalid, deductionsdescription
- Tupla: Ninguna. Ejemplo: {(1, ‘Impuesto Sobre la Renta (ISR)’, ‘4321’, ‘Es la forma con la que la Secretaría de Hacienda y Crédito Público recauda impuestos de los salarios del trabajador. El monto varía de acuerdo al salario, siendo mayor para quienes perciben sueldos más altos.’} (Jaime, 2025)
- **Llave primaria:** iddeductions
- **Llaves candidatas:** iddeductions, deductionsname, internalid
- **Llaves alternas:** deductionsname, internalid
- **Llave foránea:** Ninguna
- **Dominio:**
    - iddeductions: {Numérico, autoincremental, sólo enteros positivos}
    - deductionsname: {Alfanumérico, palabras principalmente, nombre oficial de la deducción ante la ley}
    - internalid: {Alfanumérico, código de identificación de la deducción dentro de la organización}
    - deductionsdescription: {Alfanumérico, oraciones descriptivas al concepto de la deducción}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 4 (iddeductions, deductionsname, internalid, deductionsdescription)
- **Super Llave o llave compuesta:** iddeductions + internalid
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## wagecompensation

- **Nombre de la relación:** wagecompensation
- **Atributo:** idwagecompensation, wagecompensationname, internalid, wagecompensationdescription
- Tupla: Ninguna. Ejemplo: {(1, ‘Aguinaldo’, ‘5224’, ‘Prestación anual equivalente a 15 días de salario mínimo y debe pagarse antes del 20 de diciembre de cada año.’} (Hernández, 2024)
- **Llave primaria:** idwagecompensation
- **Llaves candidatas:** iddeductions, wagecompensationname, internalid
- **Llaves alternas:** wagecompensationname, internalid
- **Llave foránea:** Ninguna
- **Dominio:**
    - idwagecompensation: {Numérico, autoincremental, sólo enteros positivos}
    - wagecompensationname: {Alfanumérico, palabras principalmente, nombre oficial de la percepción ante la ley}
    - internalid: {Alfanumérico, código de identificación de la deducción dentro de la organización}
    - wagecompensationdescription: {Alfanumérico, oraciones descriptivas al concepto de la percepción}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 4 (idwagecompensation, wagecompensationname, internalid, wagecompensationdescription)
- **Super Llave o llave compuesta:** idwagecompensation + internalid
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## workedday

- **Nombre de la relación:** workedday
- **Atributo:** idworkedday, idemployee, workeddaydate
- Tupla: Ninguna. Ejemplo: {(1, 2, ‘5224’, ‘2022-03-11’)
- **Llave primaria:** idworkedday
- **Llaves candidatas:** idworkedday
- **Llaves alternas:** No aplica
- **Llave foránea:** idemployee
- **Dominio:**
    - idworkedday: {Numérico, autoincremental, sólo enteros positivos}
    - idemployee: {Numérico, sólo enteros positivos, llave foránea}
    - workeddaydate: {Dato tipo fecha, fecha en la que el empleado asiste a trabajar}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 3 (idworkedday, idemployee, workeddaydate)
- **Super Llave o llave compuesta:** No aplica, sólo llave primaria: idemployee
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## payrolltype

- **Nombre de la relación:** payrolltype
- **Atributo:** idpayrolltype, payrolltypename
- Tupla: Ninguna. Ejemplo: {(1, ‘Efectivo’)}
- **Llave primaria:** idpayrolltype
- **Llaves candidatas:** idpayrolltype, payrolltypename
- **Llaves alternas:** payrolltypename
- **Llave foránea:** No aplica
- **Dominio:**
    - idpayrolltype: {Numérico, autoincremental, sólo enteros positivos}
    - payrolltypename: {Caracteres del alfabeto, nombre del tipo de pago}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 2 (idpayrolltype, payrolltypename)
- **Super Llave o llave compuesta:** No aplica, sólo llave primaria: idpayrolltype
- **Defina o dibuje el esquema completo:**

```sql
CREATE TABLE
    payrolltype (
        idpayrolltype INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        payrolltypename VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idpayrolltype)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## employeefile

- **Nombre de la relación:** employeefile
- **Atributo:** idemployeefile, fileroute
- Tupla: Ninguna. Ejemplo: {(1, ‘/Users/vanessa/PayrollDocs/PeterParker.docx’)}
- **Llave primaria:** idemployeefile
- **Llaves candidatas:** idemployeefile, fileroute
- **Llaves alternas:** No aplica
- **Llave foránea:** No aplica
- **Dominio:**
    - idemployeefile: {Numérico, autoincremental, sólo enteros positivos}
    - fileroute: {Alfanumérico y caracteres especiales, ruta hacia un archivo}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 2 (idemployeefile, fileroute)
- **Super Llave o llave compuesta:** No aplica, sólo llave primaria: idpayrolltype
- **Defina o dibuje el esquema completo:**

```sql
CREATE TABLE
    employeefile (
        idemployeefile INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
        fileroute VARCHAR(128) NOT NULL,
        --
        PRIMARY KEY (idemployeefile)
    ) ENGINE = InnoDB DEFAULT CHARACTER
SET
    = utf8;
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## employee

- **Nombre de la relación:** employee
- **Atributo:** idemployee, firstname, lastname, idemployeefile, organisationalunit, center, department, position, montlysalary
- Tupla: Ninguna. Ejemplo: {(1, ‘Peter’, ‘Parker’, 2, ‘Ciudad de México’, ‘Centro de ciencias básicas’, ‘Física cuántica’, ‘Supervisor de laboratorio en jefe’, 65000.0000)}
- **Llave primaria:** idemployee
- **Llaves candidatas:** idemployee
- **Llaves alternas:** No aplica
- **Llave foránea:** idemployeefile
- **Dominio:**
    - idemployee: {Numérico, autoincremental, sólo enteros positivos}
    - firstname: {Letras del alfabeto, nombre propio del cliente}
    - lastname: {Letras del alfabeto, apellido del cliente}
    - idemployeefile: {Numérico, sólo enteros positivos, llave foránea}
    - organisationalunit: {Caracteres del alfabeto, ciudad donde se ubica la oficina}
    - center: {Caracteres del alfabeto, centro al que pertenece el empleado}
    - department: {Caracteres del alfabeto, departamento al que pertenece el empleado}
    - position: {Caracteres del alfabeto, cargo que ocupa el empleado}
    - montlysalary: {Cantidad decimal numérica, salario mensual del empleado}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 9 (idemployee, firstname, lastname, idemployeefile, organisationalunit, center, department, position, montlysalary)
- **Super Llave o llave compuesta:** No aplica, sólo llave primaria: idemployee
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## paycheck

- **Nombre de la relación:** paycheck
- **Atributo:** idpaycheck, idemployee, quantity, reciptid, paycheckdate
- Tupla: Ninguna. Ejemplo: {(1, 1, 35000.0000, ‘PPKCT’, ‘2025-09-12’)}
- **Llave primaria:** idpaycheck
- **Llaves candidatas:** idpaycheck, reciptid
- **Llaves alternas:** reciptid
- **Llave foránea:** idemployee
- **Dominio:**
    - idpaycheck: {Numérico, autoincremental, sólo enteros positivos}
    - idemployee: {Numérico, sólo enteros positivos, llave foránea}
    - quantity: {Cantidad decimal numérica, cantidad que se le pagó al empleado}
    - reciptid: {Alfanumérico, identificador interno de recibo relacionado a pago directo al empleado}
    - paycheckdate: {Dato tipo fecha, fecha en la que se le paga al empleado}
- **Cardinalidad:** n (número de registros que existan)
- **Grado:** 5 (idpaycheck, idemployee, quantity, reciptid, paycheckdate)
- **Super Llave o llave compuesta:** idpaycheck + reciptid
- **Defina o dibuje el esquema completo:**

```sql
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
```

- **Características (valores atómicos, no duplicados, no ordenados, etc):**
    - Valores atómicos
    - No duplicados
    - No ordenados {Atributos Tupla}
    - Datos de un solo tipo definidos en el dominio
    - Nombre de columna o atributo es único
    - Datos explícitos

## Referencias

Jaime, H. (2025, 4 septiembre). *¿Qué son las percepciones y deducciones de nómina? - Pandape*. Pandape. https://www.pandape.com/blog/percepciones-y-deducciones-de-nomina/

Hernández, K. (2024, 24 septiembre). Cuáles son las percepciones de nómina obligatorias en México. *Rankmi*. https://www.rankmi.com/blog/cuales-son-las-percepciones-de-nomina-obligatorias-en-mexico