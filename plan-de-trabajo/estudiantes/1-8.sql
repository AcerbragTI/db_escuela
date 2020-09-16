-- qué alumnos integran los cursos tres y cuatro.
SELECT NOM_Y_APE
  FROM ESTUDIANTE
 WHERE ID_CURSO IN (3, 4);