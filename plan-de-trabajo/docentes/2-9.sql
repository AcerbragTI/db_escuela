-- 2.9: ¿Cuál es el promedio de edad?
SELECT AVG(DATEDIFF(YEAR, FECHA_NAC, GETDATE())) AS EDAD_PROMEDIO
  FROM DOCENTE;