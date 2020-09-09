SELECT NOM_Y_APE,
       CASE
            WHEN NOM_Y_APE LIKE '%RINGO%' THEN 'Beatle'
            WHEN NOM_Y_APE LIKE '%LENNON%' THEN 'Beatle'
            WHEN NOM_Y_APE LIKE '%MCCARTNEY%' THEN 'Beatle'
            WHEN NOM_Y_APE LIKE '%HARRISON%' THEN 'Beatle'
            ELSE 'No Beatle'
        END AS BEATLE_FLAG
  FROM ESTUDIANTE;
