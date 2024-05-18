CREATE DATABASE desafio2_nicole_villarreal_185

\c desafio2_nicole_villarreal_185

CREATE TABLE INSCRITOS(
    cantidad INT,
    fecha DATE,
    fuente VARCHAR
);

INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (44, '2021-01-01', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (56, '2021-01-01', 'Página');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (39, '2021-01-02', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (81, '2021-01-02', 'Página');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (12, '2021-01-03', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (91, '2021-01-03', 'Página');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (48, '2021-01-04', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (45, '2021-01-04', 'Página');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (55, '2021-01-05', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (33, '2021-01-05', 'Página');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (18, '2021-01-06', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (12, '2021-01-06', 'Página');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (34, '2021-01-07', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (24, '2021-01-07', 'Página');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (83, '2021-01-08', 'Blog');
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES (99, '2021-01-08', 'Página');

1.	Cuantos registros hay? 
SELECT COUNT(*) AS total_registros FROM INSCRITOS;
 
2.	Cuantos inscritos hay en total?
SELECT SUM(cantidad) AS total_inscritos FROM INSCRITOS;
 
3.	Cual o cuantos son los registros de mayor antigüedad?
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);
 

4.	Cuantos inscritos hay por día?
SELECT fecha, SUM(cantidad) as total_por_dia FROM INSCRITOS GROUP BY fecha ORDER BY fecha; 


5.	Cuantos inscritos hay por fuentes?
SELECT fuente, SUM(cantidad) as total FROM INSCRITOS GROUP BY fuente ORDER BY total; 
6.	Que día se inscribió la mayor cantidad de personas? Y Cuantas personas se inscribieron en ese día? 
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY MAX(cantidad) DESC LIMIT 1; 
7.	Que dia se inscribieron la mayor cantidad de personas utilizando el blog? Cuantas personas fueron? 
SELECT * FROM INSCRITOS WHERE cantidad = (SELECT MAX(cantidad) FROM INSCRITOS WHERE fuente = 'Blog' LIMIT 1);
 
8.	Cuál es el promedio de personas inscritas por día? Toma en consideración que la base de datos tiene un registro de 8 días, es decir, se obtendrán 8 promedios. 
SELECT AVG(cantidad) FROM (SELECT SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha ) AS cantidad_dias;
 


9.	Que días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50;
 

10.	Cuál es el promedio por día de personas inscritas? Considerando solo calcular desde el tercer día.
SELECT AVG(cantidad) FROM (SELECT fecha, SUM(cantidad) as cantidad FROM inscritos GROUP BY fecha HAVING fecha >= date('2021-01-03')) AS avg_personas_por_dia;
