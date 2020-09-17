-- 2.7: ¿Qué profesores tienen un nombre que comienza con la letra ‘A’ o un salario superior a 400$ la hora?
SELECT *
  FROM DOCENTE
 WHERE NOM_DOCENTE LIKE 'A%'
   AND TARIFA_HORA > 400;