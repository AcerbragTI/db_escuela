-- - 2.12: ¿Qué materias dictan?
SELECT NOM_DOCENTE, M.NOMBRE_MATERIA
  FROM DOCENTE
 INNER JOIN DICTA D ON DOCENTE.CUIL = D.CUIL
 INNER JOIN MATERIA M ON D.CODIGO_MATERIA = M.CODIGO_MATERIA
 GROUP BY NOM_DOCENTE, M.NOMBRE_MATERIA;
