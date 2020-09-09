-- =============================================
-- Author:		Hernan Santesteban
-- Create date: 27/08/2020
-- Description:	Liquidación de Salarios
-- =============================================
CREATE PROCEDURE [dbo].[usp_Salarios_Profesores] @strCUIT int = NULL, @dtDesde datetime = NULL, @dtHasta datetime = null

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- asigna fechas por defecto.
	IF @dtDesde IS NULL
	     SELECT @dtDesde = Min(FECHA) FROM CALENDARIO;
    IF @dtHasta IS NULL
         SELECT @dtHasta = Max(FECHA) FROM CALENDARIO;

	-- tabla temporal para guardar el resultado del sp de horas.
	DECLARE @tblHorasPorProfesor table (CUIL integer, HORAS integer);

	-- insertar los datos de horas por profesor en la tabla temporal.
	INSERT INTO @tblHorasPorProfesor (CUIL, HORAS)
	EXEC usp_Horas_Dictadas @strCUIT, @dtDesde, @dtHasta;

    -- recupera horas de clase efectivas por profesor entre un determinado rango de fechas.
    SELECT d.CUIL,
           d.SALARIO_BASE as REMUNERACION_BASE,
           h.HORAS as HORAS_DICTADAS,
           d.TARIFA_HORA * h.HORAS as RUMUNERACION_HORAS,
           d.SALARIO_BASE + (d.TARIFA_HORA * h.HORAS) as REMUNERACION_TOTAL
      FROM DOCENTE d
     INNER JOIN @tblHorasPorProfesor h
        ON h.CUIL = d.CUIL;

END
GO
