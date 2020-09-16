-- dividir a los alumnos en al menos cuatro grupos de edad.

-- solución sin tablas derivadas.
SELECT NOM_Y_APE,
       DATEDIFF(YEAR, FECHA_NAC, GETDATE()) AS EDAD,
       CASE
           WHEN DATEDIFF(YEAR, FECHA_NAC, GETDATE()) BETWEEN 0 AND 25 THEN 'Grupo A'
           WHEN DATEDIFF(YEAR, FECHA_NAC, GETDATE()) BETWEEN 25 AND 50 THEN 'Grupo B'
           WHEN DATEDIFF(YEAR, FECHA_NAC, GETDATE()) BETWEEN 50 AND 75 THEN 'Grupo C'
           WHEN DATEDIFF(YEAR, FECHA_NAC, GETDATE()) BETWEEN 75 AND 100 THEN 'Grupo D'
           ELSE 'Grupo E'
       END as GRUPO_EDAD
  FROM ESTUDIANTE;

-- solución con tablas derivadas.
SELECT NOM_Y_APE,
       EDAD,
       CASE
           WHEN TBL_EDAD.EDAD BETWEEN 0 AND 25 THEN 'Grupo A'
           WHEN TBL_EDAD.EDAD BETWEEN 25 AND 50 THEN 'Grupo B'
           WHEN TBL_EDAD.EDAD BETWEEN 50 AND 75 THEN 'Grupo C'
           WHEN TBL_EDAD.EDAD BETWEEN 75 AND 100 THEN 'Grupo D'
           ELSE 'Grupo E'
       END AS GRUPO_EDAD
  FROM (
    SELECT NOM_Y_APE,
           DATEDIFF(YEAR, FECHA_NAC, GETDATE()) AS EDAD
      FROM ESTUDIANTE
  ) AS TBL_EDAD;