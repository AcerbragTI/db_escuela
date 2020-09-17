-- =============================================
-- Author:		Hernan Santesteban
-- Create date: 27/08/2020
-- Description:	Horas dictadas de clase por profesor
-- =============================================
CREATE PROCEDURE [dbo].[usp_Horas_Dictadas] @strCUIT int = NULL, @dtDesde datetime = NULL, @dtHasta datetime = null

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

	-- asigna fechas por defecto.
	IF @dtDesde IS NULL
	     SELECT @dtDesde = Min(FECHA) FROM CALENDARIO;
    IF @dtHasta IS NULL
         SELECT @dtHasta = Max(FECHA) FROM CALENDARIO;

    -- recupera horas de clase efectivas por profesor entre un determinado rango de fechas.
    SELECT d.CUIL, Sum(Datediff(HH, HORA_DESDE, HORA_HASTA)) as HORAS
      FROM CALENDARIO c
     INNER JOIN DICTA d
        ON c.DIA_SEMANA = d.ID_DIA
     WHERE c.FERIADO = 0 AND c.JORNADA = 0 AND c.VACACIONES = 0
       AND d.CUIL = ISNULL(@strCUIT, d.CUIL)
       AND c.FECHA BETWEEN @dtDesde AND @dtHasta
     GROUP BY CUIL;

END
GO

