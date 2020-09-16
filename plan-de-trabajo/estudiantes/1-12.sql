-- cuál es el promedio de edad general
SELECT AVG(DATEDIFF(YEAR, FECHA_NAC, GETDATE())) AS EDAD
  FROM ESTUDIANTE;