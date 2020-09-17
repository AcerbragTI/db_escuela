SELECT
       IIF (
           SUM (
               CASE
                    WHEN NOM_Y_APE LIKE '%RINGO%' THEN 1
                    WHEN NOM_Y_APE LIKE '%LENNON%' THEN 1
                    WHEN NOM_Y_APE LIKE '%MCCARTNEY%' THEN 1
                    WHEN NOM_Y_APE LIKE '%HARRISON%' THEN 1
                    ELSE 0
                END
           ) > 0,
           'Hay Beatle',
           'No hay Beatle'
       ) AS BEATLE_FLAG
  FROM ESTUDIANTE
 GROUP BY ID_CURSO;
