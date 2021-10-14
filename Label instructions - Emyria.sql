SELECT DISTINCT MasterPatient_ID, ATCLevel5Name, ATCLevel3Name
FROM
    DimProductMaster d
JOIN
    FactScript f
ON
    f.MasterProductId = d.MasterProductID
JOIN
    DimMAIU m
ON
    m.MAIU_ID = f.MAIUID

WHERE ATCLevel1Name ILIKE '%NERVOUS SYSTEM%'
AND ATCLevel2Name ILIKE '%PSYCHO%'
AND MasterPatient_ID > 0 AND MasterPatient_ID < 100000
ORDER BY ATCLevel5Name
