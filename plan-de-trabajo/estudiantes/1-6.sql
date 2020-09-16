-- qué alumnos ingresaron entre hasta hace 5 años atrás y pero no más de 10 años.
SELECT NOM_Y_APE
  FROM ESTUDIANTE
 WHERE FECHA_INGRESO BETWEEN '2010-01-01' AND '2015-03-01';