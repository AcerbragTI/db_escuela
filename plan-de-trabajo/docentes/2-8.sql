-- ¿Qué antigüedad tienen en la institución?
SELECT NOM_DOCENTE,
       DATEDIFF(YEAR, FECHA_NAC, GETDATE()) AS EDAD
  FROM DOCENTE;