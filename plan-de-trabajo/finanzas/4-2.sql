-- 4.2: ¿Es rentable la institución?

-- tabla temporal para guardar el resultado del sp de horas.
DECLARE @tblHorasPorProfesor table (CUIL integer, HORAS integer);

-- insertar los datos de horas por profesor en la tabla temporal.
INSERT INTO @tblHorasPorProfesor (CUIL, HORAS)
EXEC usp_Horas_Dictadas;

SELECT ING.INGRESOS_TOTALES, CTS.COSTOS_TOTALES, ING.INGRESOS_TOTALES - CTS.COSTOS_TOTALES AS RESULTADO
  FROM (
    SELECT SUM(CUOTA_ALUMNO) * 12 AS INGRESOS_TOTALES
      FROM (
        SELECT CUOTA_ALUMNO
          FROM CURSA
         INNER JOIN CURSO C ON CURSA.ID_CURSO = C.ID_CURSO
    ) INGRESOS
) ING
CROSS JOIN (
    SELECT Sum(REMUNERACION_TOTAL) AS COSTOS_TOTALES
      FROM (
        SELECT d.SALARIO_BASE + (d.TARIFA_HORA * h.HORAS) as REMUNERACION_TOTAL
          FROM DOCENTE d
         INNER JOIN @tblHorasPorProfesor h
            ON h.CUIL = d.CUIL
     ) COSTOS
) CTS;