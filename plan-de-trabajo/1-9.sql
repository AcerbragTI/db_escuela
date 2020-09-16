-- qué antiguedad tienen en la institución los alumnos del curso 4
SELECT NOM_Y_APE,
       Datediff(YEAR, FECHA_INGRESO, GETDATE()) AS ANTIGUEDAD
  FROM ESTUDIANTE
 WHERE ID_CURSO = 4;