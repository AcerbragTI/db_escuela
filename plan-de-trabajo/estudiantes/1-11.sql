-- cuál es el promedio de edad por curso
SELECT ID_CURSO,
       AVG(DATEDIFF(YEAR, FECHA_NAC, GETDATE())) AS EDAD
  FROM ESTUDIANTE
 GROUP BY ID_CURSO;
