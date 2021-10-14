CREATE LOCAL TEMP TABLE EntrestoPats ON COMMIT PRESERVE ROWS AS
SELECT 
    MasterPatient_ID, 
    MIN(DispenseCalendarDate) AS entrestoInitDate
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
WHERE 
    
    BrandName ILIKE '%ENTRESTO%'        
    AND MasterPatient_ID > 0
GROUP BY 
    MasterPatient_ID;

    

--- LastBB---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastBB
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel2Name = 'BETA BLOCKING AGENTS'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1

ORDER BY MasterPatient_ID;

--- LastCCB---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastCCB
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel2Name = 'CALCIUM CHANNEL BLOCKERS'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1

ORDER BY MasterPatient_ID;

--- LastARB---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastARB
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel3Name ILIKE '%ANGIOTENSIN II RECEPTOR BLOCKERS%'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1

ORDER BY MasterPatient_ID;

--- LastACEI---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastACEI
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel3Name ILIKE '%ACE INHIBITORS%'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1

ORDER BY MasterPatient_ID;

--- LastDIU---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastDIU
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel2Name = 'DIURETICS'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1

ORDER BY MasterPatient_ID;

--- LastLIP---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastLIP
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel2Name = 'LIPID MODIFYING AGENTS'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1
ORDER BY MasterPatient_ID;

--- LastCARDT---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastCARDT
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel2Name = 'CARDIAC THERAPY'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1

ORDER BY MasterPatient_ID;

--- LastANTIHYP---
SELECT m.MasterPatient_ID, DispenseCalendarDate AS LastANTIHYP
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
JOIN 
    EntrestoPats e 
ON 
    e.MasterPatient_ID = m.MasterPatient_ID

WHERE m.MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
AND ATCLevel2Name = 'ANTIHYPERTENSIVES'
AND DispenseCalendarDate BETWEEN ADD_MONTHS(entrestoInitDate, -24) AND entrestoInitDate - 1

ORDER BY MasterPatient_ID;