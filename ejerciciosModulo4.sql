---
-- Base de datos: `ejerciciosmodulo4`
---

-- --------------------------------------------------------

---
-- Estructura de tabla para la tabla `usuarios`
---

CREATE TABLE Usuarios (
  id int(11) NOT NULL,
  usuario varchar(20) DEFAULT NULL,
  nombre varchar(20) DEFAULT NULL,
  sexo varchar(1) DEFAULT NULL,
  nivel tinyint(4) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  telefono varchar(20) DEFAULT NULL,
  marca varchar(20) DEFAULT NULL,
  compania varchar(20) DEFAULT NULL,
  saldo float DEFAULT NULL,
  activo tinyint(1) DEFAULT NULL
) 

--
-- Volcado de datos para la tabla `usuarios`
INSERT INTO Usuarios 
VALUES 
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');

--
/* 1- Listar los nombres de los usuarios*/

SELECT nombre FROM Usuarios;

('BRENDA'),
('OSCAR'),
('JOSE'),
('LUIS'),
('LUIS'),
('DANIEL'),
('JAQUELINE'),
('ROMAN'),
('BLAS'),
('JESSICA'),
('DIANA'),
('RICARDO'),
('VALENTINA'),
('BRENDA'),
('LUCIA'),
('JUAN'),
('ELPIDIO'),
('JESSICA'),
('LETICIA'),
('LUIS'),
('HUGO');


/* 2- Calcular el saldo máximo de los usuarios de sexo "Mujer"*/

SELECT MAX(saldo) FROM Usuarios;
(500);


/* 3- Listar nombre y telefono de los usuarios con telefono NOKIA, BLACKBERRY o SONY */

SELECT nombre, telefono FROM Usuarios
WHERE marca
IN ('NOKIA', 'BLACKBERRY', 'SONY');

('JOSE', '655-143-3922'),
('LUIS', '655-100-8260'),
('DANIEL', '655-145-2586'),
('JAQUELINE', '655-330-5514'),
('DIANA', '655-143-3952'),
('VALENTINA', '655-137-4253'),
('LUCIA', '655-145-4992'),
('JESSICA', '655-330-5143'),
('LETICIA', '655-143-4019'),
('LUIS', '655-100-5085');


/* 4- Contar los usuarios sin saldo o inactivos */

SELECT COUNT(usuario) FROM Usuarios   /*SELECT COUNT(*) FROM usuarios WHERE NOT activo OR saldo <= 0; */
WHERE NOT activo OR saldo <= 0;

(7);


/* 5- Listar el login de los usuarios con nivel 1, 2 o 3 */

SELECT usuario FROM Usuarios              /*SELECT usuario FROM usuarios WHERE nivel IN(1, 2, 3); */
WHERE nivel = 1 OR nivel = 2 OR nivel = 3;

('BRE2271'),
('OSC4677'),
('JOS7086'),
('LUI7072'),
('ROM6520'),
('JES4752'),
('DIA6570'),
('RIC8283'),
('BRE8106'),
('LUC4982'),
('ELP2984'),
('JES9640'),
('LET4015'),
('LUI1076'),
('HUG5441');


/* 6- Listar los números de teléfono con saldo menor o igual a 300*/

SELECT telefono FROM Usuarios
WHERE saldo <= 300;

('655-330-5736'),
('655-143-4181'),
('655-143-3922'),
('655-137-1279'),
('655-100-8260'),
('655-145-2586'),
('655-330-5514'),
('655-330-3263'),
('655-330-3871'),
('655-143-3952'),
('655-145-6049'),
('655-137-4253'),
('655-100-1351'),
('655-145-4992'),
('655-100-6517'),
('655-330-5143'),
('655-143-4019'),
('655-100-5085');


/* 7- Calcular la suma de los saldos de los usuarios de la compania telefonica NEXTEL*/

SELECT SUM(saldo) FROM Usuarios
WHERE compania = 'NEXTEL';

(150);


/* 8- Contar el numero de usuarios por compania telefonica*/

SELECT COUNT(usuario) FROM Usuarios /* SELECT compania, COUNT(*) FROM usuarios GROUP BY compania;*/
GROUP BY compania;

(2),
(2),
(6),
(2),
(1),
(3),
(5);


/* 9- Contar el número de usuarios por nivel*/

SELECT nivel, COUNT(*) FROM Usuarios /* SELECT COUNT(usuario) FROM usuarios GROUP BY nivel; */
GROUP BY nivel;

(6),
(4),
(5),
(6);


/* 10- Listar el login de los usuarios con nivel 2*/

SELECT usuario FROM Usuarios
WHERE nivel = 2;

('BRE2271'),
('ROM6520'),
('RIC8283'),
('LET4015'),
('HUG5441');


/* 11- Mostrar el email de los usuarios que usan gmail*/

SELECT email FROM Usuarios
WHERE email LIKE '%@gmail%';  /* % COMODIN */

('oscar@gmail.com'),
('francisco@gmail.com'),
('roman@gmail.com'),
('brenda2@gmail.com'),
('lucia@gmail.com');


/* 12- Listar nombre y telefono de los usuarios con telefono LG, SAMSUNG o MOTOROLA*/

SELECT  nombre, telefono FROM Usuarios
WHERE marca
IN('LG', 'SAMSUNG', 'MOTOROLA');

('BRENDA', '655-330-5736'),
('OSCAR', '655-143-4181'),
('LUIS', '655-137-1279'),
('ROMAN', '655-330-3263'),
('BLAS', '655-330-3871'),
('JESSICA', '655-143-6861'),
('RICARDO', '655-145-6049'),
('BRENDA', '655-100-1351'),
('JUAN', '655-100-6517'),
('ELPIDIO', '655-145-9938'),
('HUGO', '655-137-3935');


/* 13- Listar nombre y telefono de los usuarios con telefono que no sea de la marca LG o SAMSUNG*/

SELECT nombre, telefono FROM  Usuarios
WHERE marca NOT IN('LG', 'SAMSUNG');

('JOSE', '655-143-3922'),
('LUIS', '655-100-8260'),
('DANIEL', '655-145-2586'),
('JAQUELINE', '655-330-5514'),
('DIANA', '655-143-3952'),
('RICARDO', '655-145-6049'),
('VALENTINA', '655-137-4253'),
('BRENDA', '655-100-1351'),
('LUCIA', '655-145-4992'),
('ELPIDIO', '655-145-9938'),
('JESSICA', '655-330-5143'),
('LETICIA', '655-143-4019'),
('LUIS', '655-100-5085'),
('HUGO', '655-137-3935');


/* 14- Listar el login y telefono de los usuarios con compania telefonica IUSACELL*/

SELECT usuario, telefono FROM Usuarios
WHERE compania = 'IUSACELL';

('BRE2271', '655-330-5736'),
('LUI7072', '655-100-8260'),
('ROM6520', '655-330-3263'),
('RIC8283', '655-145-6049'),
('LUC4982', '655-145-4992'),
('JES9640', '655-330-5143');


/* 15- Listar el login y telefono de los usuarios con compania telefonica que no sea TELCEL*/

SELECT usuario, telefono FROM Usuarios /* SELECT usuario, telefono FROM usuarios WHERE compania <> 'TELCEL';*/
WHERE compania != 'TELCEL';

('BRE2271', '655-330-5736'),
('JOS7086', '655-143-3922'),
('LUI7072', '655-100-8260'),
('DAN2832', '655-145-2586'),
('JAQ5351', '655-330-5514'),
('ROM6520', '655-330-3263'),
('BLA9739', '655-330-3871'),
('DIA6570', '655-143-3952'),
('RIC8283', '655-145-6049'),
('VAL6882', '655-137-4253'),
('BRE8106', '655-100-1351'),
('LUC4982', '655-145-4992'),
('JUA2337', '655-100-6517'),
('ELP2984', '655-145-9938'),
('JES9640', '655-330-5143'),
('LET4015', '655-143-4019'),
('LUI1076', '655-100-5085'),
('HUG5441', '655-137-3935');


/* 16- Calcular el saldo promedio de los usuarios que tienen telefono marca NOKIA*/

SELECT AVG(saldo) FROM Usuarios
WHERE marca = 'NOKIA';

(100);


/* 17- Listar el login y telefono de los usuarios con compania telefonica IUSACELL o AXEL*/

SELECT usuario, telefono FROM Usuarios
WHERE compania IN('IUSACELL', 'AXEL');

('BRE2271', '655-330-5736'),
('LUI7072', '655-100-8260'),
('JAQ5351', '655-330-5514'),
('ROM6520', '655-330-3263'),
('RIC8283', '655-145-6049'),
('LUC4982', '655-145-4992'),
('JUA2337', '655-100-6517'),
('JES9640', '655-330-5143');


/* 18- Mostrar el email de los usuarios que no usan yahoo*/

SELECT email FROM Usuarios  /*SELECT email FROM usuarios WHERE email NOT LIKE '%yahoo%';*/
WHERE email != '%yahoo%';

('brenda@live.com'),
('oscar@gmail.com'),
('francisco@gmail.com'),
('enrique@outlook.com'),
('luis@hotmail.com'),
('daniel@outlook.com'),
('jaqueline@outlook.com'),
('roman@gmail.com'),
('blas@hotmail.com'),
('jessica@hotmail.com'),
('diana@live.com'),
('ricardo@hotmail.com'),
('valentina@live.com'),
('brenda2@gmail.com'),
('lucia@gmail.com'),
('juan@outlook.com'),
('elpidio@outlook.com'),
('jessica2@live.com'),
('leticia@yahoo.com'),
('luis2@live.com'),
('hugo@live.com');


/* 19- Listar el login y telefono de los usuarios con compania telefonica que no sea TELCEL o IUSACELL*/

SELECT usuario, telefono FROM Usuarios
WHERE compania
NOT IN('TELCEL', 'IUSACELL');

('JOS7086', '655-143-3922'),
('DAN2832', '655-145-2586'),
('JAQ5351', '655-330-5514'),
('BLA9739', '655-330-3871'),
('DIA6570', '655-143-3952'),
('VAL6882', '655-137-4253'),
('BRE8106', '655-100-1351'),
('JUA2337', '655-100-6517'),
('ELP2984', '655-145-9938'),
('LET4015', '655-143-4019'),
('LUI1076', '655-100-5085'),
('HUG5441', '655-137-3935');


/* 20- Listar el login y telefono de los usuarios con compania telefonica UNEFON*/

SELECT usuario, telefono FROM Usuarios
WHERE compania = 'UNEFON';

('DAN2832', '655-145-2586'),
('BLA9739', '655-330-3871'),
('DIA6570', '655-143-3952'),
('LET4015', '655-143-4019'),
('LUI1076', '655-100-5085');


/* 21- Listar las diferentes marcas de celular en orden alfabetico descendentemente*/

SELECT DISTINCT marca FROM Usuarios DESC; /* DISTINCT  toma solo una vez la marca, sino saldrian 1 por registro*/

(SONY),
(SAMSUNG),
(NOKIA),
(MOTOROLA),
(LG),
(BLACKBERRY);


/* 22- Listar las diferentes companias en orden alfabetico aleatorio*/

SELECT DISTINCT compania FROM Usuarios
ORDER BY RAND();

(TELCEL),
(MOVISTAR),
(IUSACELL),
(AT&T),
(NEXTEL),
(AXEL),
(UNEFON);


/* 23- Listar el login de los usuarios con nivel 0 o 2*/

SELECT usuario FROM Usuarios
WHERE nivel IN (0, 2);

('BRE2271'),
('LUI6115'),
('DAN2832'),
('JAQ5351'),
('ROM6520'),
('BLA9739'),
('RIC8283'),
('VAL6882'),
('JUA2337'),
('LET4015'),
('HUG5441');

/* 24- Calcular el saldo promedio de los usuarios que tienen telefono marca LG*/

SELECT AVG(saldo) FROM Usuarios
WHERE marca = 'LG';

(50);


/* 25- Listar el login de los usuarios con nivel 1 o 3*/

SELECT usuario FROM Usuarios
WHERE nivel IN(1, 3);

('OSC4677'),
('JOS7086'),
('LUI7072'),
('JES4752'),
('DIA6570'),
('BRE8106'),
('LUC4982'),
('ELP2984'),
('JES9640'),
('LUI1076');


/* 26- Listar nombre y telefono de los usuarios con telefono que no sea de la marca BLACKBERRY*/

SELECT nombre, telefono FROM Usuarios /* SELECT nombre, telefono FROM usuarios WHERE marca <> 'BLACKBERRY';*/
WHERE marca != 'BLACKBERRY';

('BRENDA', '655-330-5736'),
('OSCAR', '655-143-4181'),
('JOSE', '655-143-3922'),
('LUIS', '655-137-1279'),
('LUIS', '655-100-8260'),
('DANIEL', '655-145-2586'),
('ROMAN', '655-330-3263'),
('BLAS', '655-330-3871'),
('JESSICA', '655-143-6861'),
('DIANA', '655-143-3952'),
('RICARDO', '655-145-6049'),
('BRENDA', '655-100-1351'),
('JUAN', '655-100-6517'),
('ELPIDIO', '655-145-9938'),
('JESSICA', '655-330-5143'),
('LUIS', '655-100-5085'),
('HUGO', '655-137-3935');


/* 27- Listar el login de los usuarios con nivel 3*/

SELECT usuario FROM Usuarios
WHERE nivel = 3;

('OSC4677'),
('JOS7086'),
('BRE8106'),
('LUC4982'),
('JES9640'),
('LUI1076');


/* 28- Listar el login de los usuarios con nivel 0 */

SELECT usuario FROM Usuarios
WHERE nivel = 0;

('LUI6115'),
('DAN2832'),
('JAQ5351'),
('BLA9739'),
('VAL6882'),
('JUA2337');


/* 29- Listar el login de los usuarios con nivel 1*/

SELECT usuario FROM Usuarios 
WHERE nivel = 1;

('LUI7072'),
('JES4752'),
('DIA6570'),
('ELP2984');

/* 30- Contar el nUmero de usuarios por sexo*/

SELECT sexo, COUNT(*) FROM Usuarios
GROUP BY sexo;

(H, 12),
(M, 9);


/* 31- Listar el login y telefono de los usuarios con compaNIa telefonica AT&T*/

SELECT usuario, telefono FROM Usuarios
WHERE compania = 'AT&T';

('VAL6882', '655-137-4253'),
('HUG5441', '655-137-3935');

/* 32- Listar las diferentes compaNIas en orden alfabetico descendentemente*/

SELECT DISTINCT compania FROM Usuarios /* DISTINCT sale una sola vez la compania*/
ORDER BY compania DESC;

(UNEFON),
(TELCEL),
(NEXTEL),
(MOVISTAR),
(IUSACELL),
(AXEL),
(AT&T);


/* 33- Listar el login de los usuarios inactivos*/

SELECT usuario FROM Usuarios
WHERE NOT activo;

('LUI7072'),
('DIA6570'),
('VAL6882'),
('JUA2337');


/* 34- Listar los numeros de telefono sin saldo*/

SELECT telefono FROM Usuarios
WHERE saldo <= 0;

('655-143-4181'),
('655-330-5514'),
('655-145-4992'),
('655-100-6517');


/* 35- Calcular el saldo minimo de los usuarios de sexo 'Hombre'*/

SELECT MIN(saldo) FROM Usuarios
WHERE sexo = 'H';

(0);


/* 36- Listar los numeros de telefono con saldo mayor a 300*/

SELECT telefono FROM Usuarios
WHERE saldo > 300;

('655-143-6861'),
('655-145-9938'),
('655-137-3935');


/* 37- Contar el numero de usuarios por marca de telefono*/

SELECT COUNT(marca) FROM Usuarios
GROUP BY marca;

(BLACKBERRY, 4),
(LG, 3),
(MOTOROLA, 4),
(NOKIA, 2),
(SAMSUNG, 4),
(SONY, 4);


/* 38- Listar nombre y telefono de los usuarios con telefono que no sea de la marca LG*/

SELECT nombre, telefono FROM Usuarios  
WHERE marca != 'LG';

('BRENDA', '655-330-5736'),
('JOSE', '655-143-3922'),
('LUIS', '655-137-1279'),
('LUIS', '655-100-8260'),
('DANIEL', '655-145-2586'),
('JAQUELINE', '655-330-5514'),
('JESSICA', '655-143-6861'),
('DIANA', '655-143-3952'),
('RICARDO', '655-145-6049'),
('VALENTINA', '655-137-4253'),
('BRENDA', '655-100-1351'),
('LUCIA', '655-145-4992'),
('JUAN', '655-100-6517'),
('ELPIDIO', '655-145-9938'),
('JESSICA', '655-330-5143'),
('LETICIA', '655-143-4019'),
('LUIS', '655-100-5085'),
('HUGO', '655-137-3935');


/* 39- Listar las diferentes compaNIas en orden alfabetico ascendentemente*/

SELECT DISTINCT compania FROM Usuarios
ORDER BY compania ASC;

(AT&T),
(AXEL),
(IUSACELL),
(MOVISTAR),
(NEXTEL),
(TELCEL),
(UNEFON);


/* 40- Calcular la suma de los saldos de los usuarios de la compaNIa telefonica UNEFON*/

SELECT SUM(saldo) FROM Usuarios
WHERE compania = 'UNEFON';

(550);


/* 41- Mostrar el email de los usuarios que usan hotmail*/

SELECT email FROM Usuarios
WHERE email LIKE '%hotmail%';

('luis@hotmail.com'),
('blas@hotmail.com'),
('jessica@hotmail.com'),
('ricardo@hotmail.com');


/* 42- Listar los nombres de los usuarios sin saldo o inactivos*/

SELECT nombre FROM Usuarios
WHERE saldo <= 0 AND NOT activo;

('OSCAR'),
('LUIS'),
('JAQUELINE'),
('DIANA'),
('VALENTINA'),
('LUCIA'),
('JUAN');


/* 43- Listar el login y telefono de los usuarios con compaNIa telefonica IUSACELL o TELCEL*/

SELECT usuario, telefono FROM Usuarios
WHERE compania = 'IUSACELL' OR compania = 'TELCEL';

('BRE2271', '655-330-5736'),
('OSC4677', '655-143-4181'),
('LUI6115', '655-137-1279'),
('LUI7072', '655-100-8260'),
('ROM6520', '655-330-3263'),
('JES4752', '655-143-6861'),
('RIC8283', '655-145-6049'),
('LUC4982', '655-145-4992'),
('JES9640', '655-330-5143');


/* 44- Listar las diferentes marcas de celular en orden alfabetico ascendentemente*/

SELECT DISTINCT marca FROM Usuarios     /*Recordar DISTINCT es para que no salga repetida la marca en este caso*/
ORDER BY marca ASC;

(BLACKBERRY),
(LG),
(MOTOROLA),
(NOKIA),
(SAMSUNG),
(SONY);


/* 45- Listar las diferentes marcas de celular en orden alfabetico aleatorio*/

SELECT DISTINCT marca FROM Usuarios
ORDER BY marca RAND;

(LG),
(BLACKBERRY),
(NOKIA),
(MOTOROLA),
(SAMSUNG),
(SONY);


/* 46- Listar el login y telefono de los usuarios con compaNIa telefonica IUSACELL o UNEFON*/

SELECT usuario, telefono FROM Usuarios      /* Otra manera seria SELECT usuario, telefono FROM usuarios WHERE compania IN('IUSACELL', 'UNEFON');*/
WHERE compania = 'IUSACELL' OR compania = 'UNEFON';

('BRE2271', '655-330-5736'),
('LUI7072', '655-100-8260'),
('DAN2832', '655-145-2586'),
('ROM6520', '655-330-3263'),
('BLA9739', '655-330-3871'),
('DIA6570', '655-143-3952'),
('RIC8283', '655-145-6049'),
('LUC4982', '655-145-4992'),
('JES9640', '655-330-5143'),
('LET4015', '655-143-4019'),
('LUI1076', '655-100-5085');


/* 47- Listar nombre y telefono de los usuarios con telefono que no sea de la marca MOTOROLA o NOKIA*/

SELECT nombre, telefono FROM Usuarios
WHERE marca !IN('MOTOROLA', 'NOKIA');

('BRENDA', '655-330-5736'),
('OSCAR', '655-143-4181'),
('LUIS', '655-137-1279'),
('DANIEL', '655-145-2586'),
('JAQUELINE', '655-330-5514'),
('ROMAN', '655-330-3263'),
('BLAS', '655-330-3871'),
('JESSICA', '655-143-6861'),
('DIANA', '655-143-3952'),
('VALENTINA', '655-137-4253'),
('LUCIA', '655-145-4992'),
('JUAN', '655-100-6517'),
('JESSICA', '655-330-5143'),
('LETICIA', '655-143-4019'),
('LUIS', '655-100-5085');


/* 48- Calcular la suma de los saldos de los usuarios de la compaNIa telefonica TELCEL*/

SELECT SUM(saldo) FROM Usuarios
WHERE compania = 'TELCEL';

(550);


/*

*/

--

