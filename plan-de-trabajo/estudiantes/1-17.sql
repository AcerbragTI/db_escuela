-- cuánto pagan por mes para asistir
SELECT E.NOM_Y_APE,
       C.ID_CURSO,
       C.NOMBRE_CURSO,
       C.TURNO,
       C.CUOTA_ALUMNO
  FROM ESTUDIANTE E
  LEFT JOIN CURSO C
    ON E.ID_CURSO = C.ID_CURSO;