-- 4.1: ¿Cuál es el egreso anual por remuneraciones de la institución?

-- tabla temporal para guardar el resultado del sp de horas.
DECLARE @tblHorasPorProfesor table (CUIL integer, HORAS integer);

-- insertar los datos de horas por profesor en la tabla temporal.
INSERT INTO @tblHorasPorProfesor (CUIL, HORAS)
EXEC usp_Horas_Dictadas;

-- recupera horas de clase efectivas por profesor entre un determinado rango de fechas.
SELECT Sum(REMUNERACION_TOTAL) FROM (
    SELECT d.SALARIO_BASE + (d.TARIFA_HORA * h.HORAS) as REMUNERACION_TOTAL
      FROM DOCENTE d
     INNER JOIN @tblHorasPorProfesor h
        ON h.CUIL = d.CUIL
) H;
