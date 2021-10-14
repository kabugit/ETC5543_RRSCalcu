--This script extracts all cardiac drug classes as binary variables.

-- First, a temp table for Entresto patients
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
    
----Entresto patients with cardiac drug classes

SELECT DISTINCT MasterPatient_ID, 
CASE WHEN ATCLevel2Name = 'BETA BLOCKING AGENTS' THEN ('1') END AS BB,
CASE WHEN ATCLevel2Name = 'CARDIAC THERAPY' THEN ('1') END AS CARDT,
        CASE WHEN ATCLevel2Name = 'CALCIUM CHANNEL BLOCKERS' THEN ('1') END AS CCB,
        CASE WHEN ATCLevel2Name = 'VASOPROTECTIVES' THEN ('1') END AS VASOP,
        CASE WHEN ATCLevel2Name = 'ANTIHYPERTENSIVES' THEN ('1') END AS ANTIHYP,
        CASE WHEN ATCLevel2Name = 'LIPID MODIFYING AGENTS' THEN ('1') END AS LIP,
        CASE WHEN ATCLevel2Name = 'PERIPHERAL VASODILATORS' THEN ('1') END AS PERIVASO,
        CASE WHEN ATCLevel2Name = 'DIURETICS' THEN ('1') END AS DIU,
        CASE WHEN ATCLevel3Name ILIKE '%ACE INHIBITORS%' THEN ('1') END AS ACEI,
        CASE WHEN ATCLevel3Name ILIKE '%ANGIOTENSIN II RECEPTOR BLOCKERS%' THEN ('1') END AS ARB
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
WHERE MasterPatient_ID IN (SELECT MasterPatient_ID FROM EntrestoPats)
ORDER BY MasterPatient_ID;

----non-Entresto patients with cardiac drug classes

SELECT DISTINCT MasterPatient_ID, 
CASE WHEN ATCLevel2Name = 'BETA BLOCKING AGENTS' THEN ('1') END AS BB,
CASE WHEN ATCLevel2Name = 'CARDIAC THERAPY' THEN ('1') END AS CARDT,
        CASE WHEN ATCLevel2Name = 'CALCIUM CHANNEL BLOCKERS' THEN ('1') END AS CCB,
        CASE WHEN ATCLevel2Name = 'VASOPROTECTIVES' THEN ('1') END AS VASOP,
        CASE WHEN ATCLevel2Name = 'ANTIHYPERTENSIVES' THEN ('1') END AS ANTIHYP,
        CASE WHEN ATCLevel2Name = 'LIPID MODIFYING AGENTS' THEN ('1') END AS LIP,
        CASE WHEN ATCLevel2Name = 'PERIPHERAL VASODILATORS' THEN ('1') END AS PERIVASO,
        CASE WHEN ATCLevel2Name = 'DIURETICS' THEN ('1') END AS DIU,
        CASE WHEN ATCLevel3Name ILIKE '%ACE INHIBITORS%' THEN ('1') END AS ACEI,
        CASE WHEN ATCLevel3Name ILIKE '%ANGIOTENSIN II RECEPTOR BLOCKERS%' THEN ('1') END AS ARB
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
    DispenseCalendarDate BETWEEN '2018-09-01' AND '2020-08-31' -- 1 year look-ahead to confirm 
    -- that they are NOT entresto patients.
AND BrandName NOT ILIKE '%ENTRESTO%'
AND MasterPatient_ID NOT IN 
    (   SELECT 
            DISTINCT MasterPatient_ID 
        FROM 
            EntrestoPats)
AND MasterPatient_ID > 0 AND MasterPatient_ID <= 100000
ORDER BY MasterPatient_ID;