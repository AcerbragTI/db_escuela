-- cuáles son las edades de cada uno de ellos
SELECT NOM_Y_APE,
       Datediff(YEAR, FECHA_NAC, GETDATE()) AS EDAD
  FROM ESTUDIANTE;