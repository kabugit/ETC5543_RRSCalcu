SELECT 
    MasterPatient_ID, 
    GenericIngredientName, 
    COUNT(*) AS DispNumb
FROM
    (   SELECT 
            DISTINCT ATCLevel5Code,
            CASE
                WHEN (
                        ATCLevel5Code >= 'C01DA02'
                    AND ATCLevel5Code <= 'C01DA14')
                OR  ATCLevel5Code = 'C01DX16'
                OR  ATCLevel5Code = 'C08EX02'
                THEN UPPER('Ischemic Heart Disease: Angina')
                WHEN (
                        ATCLevel5Code >= 'B01AA03'
                    AND ATCLevel5Code <= 'B01AB06')
                OR  ATCLevel5Code = 'B01AE07'
                OR  ATCLevel5Code = 'B01AF01'
                OR  ATCLevel5Code = 'B01AF02'
                OR  ATCLevel5Code = 'B01AX05'
                THEN UPPER('Anticoagulants')
                WHEN ATCLevel5Code >= 'B01AC04'
                AND ATCLevel5Code <= 'B01AC30'
                THEN UPPER('Antiplatelets')
                WHEN ATCLevel5Code >= 'C01BA01'
                AND ATCLevel5Code <= 'C01BD01'
                OR  ATCLevel5Code = 'C01AA05'
                OR  ATCLevel5Code = 'C07AA07'
                THEN UPPER('Arrhythmia')
                WHEN (
                        ATCLevel5Code >= 'R03AC02'
                    AND ATCLevel5Code <= 'R03DC03')
                OR  ATCLevel5Code = 'R03DX05'
                THEN UPPER('Chronic airways disease')
                WHEN (
                        ATCLevel5Code >= 'C03DA02'
                    AND ATCLevel5Code <= 'C03DA99')
                OR  (
                        ATCLevel5Code >= 'C03CA01'
                    AND ATCLevel5Code <= 'C03CC01')
                OR  (
                        ATCLevel5Code >= 'C09AA01'
                    AND ATCLevel5Code <= 'C09AX99')
                OR  (
                        ATCLevel5Code >= 'C09CA01'
                    AND ATCLevel5Code <= 'C09CX99')
                OR  ATCLevel5Code = 'C07AB02'
                OR  ATCLevel5Code = 'C07AB02'
                OR  ATCLevel5Code = 'C07AB07'
                OR  ATCLevel5Code = 'C07AG02'
                OR  ATCLevel5Code = 'C07AB12'
                OR  ATCLevel5Code = 'C03DA04'
                THEN UPPER('Congestive heart failure')
                WHEN (
                        ATCLevel5Code >= 'C03AA01'
                    AND ATCLevel5Code <= 'C03BA11')
                OR  (
                        ATCLevel5Code >= 'C09BA02'
                    AND ATCLevel5Code <= 'C09BA09')
                OR  (
                        ATCLevel5Code >= 'C09DA02'
                    AND ATCLevel5Code <= 'C09DA08')
                OR  (
                        ATCLevel5Code >= 'C02AB01'
                    AND ATCLevel5Code <= 'C02AC05')
                OR  (
                        ATCLevel5Code >= 'C02DB02'
                    AND ATCLevel5Code <= 'C02DB99')
                OR  (
                        ATCLevel5Code >= 'C03CA01'
                    AND ATCLevel5Code <= 'C03CCO1')
                OR  (
                        ATCLevel5Code >= 'C02DB02'
                    AND ATCLevel5Code <= 'C09CX99')
                OR  ATCLevel5Code = 'C03DB01'
                OR  ATCLevel5Code = 'C03DB99'
                OR  ATCLevel5Code = 'C03EA01'
                THEN UPPER('Hypertension')
                WHEN ATCLevel5Code >= 'C02KX01'
                AND ATCLevel5Code <= 'C02KX05'
                THEN UPPER('Pulmonary Hypertension')
                WHEN (
                        ATCLevel5Code >= 'C07AA01'
                    AND ATCLevel5Code <= 'C07AA06')
                OR  (
                        ATCLevel5Code >= 'C07AA08'
                    AND ATCLevel5Code <= 'C07AB01')
                OR  (
                        ATCLevel5Code >= 'C08CA01'
                    AND ATCLevel5Code <= 'C08DB01')
                OR  (
                        ATCLevel5Code >= 'C09DB01'
                    AND ATCLevel5Code <= 'C09DB04')
                OR  (
                        ATCLevel5Code >= 'C09BB02'
                    AND ATCLevel5Code <= 'C09BB10')
                OR  ATCLevel5Code = 'C07AB02'
                OR  ATCLevel5Code = 'C07AG01'
                OR  ATCLevel5Code = 'C09DX01'
                OR  ATCLevel5Code = 'C07AB03'
                OR  ATCLevel5Code = 'C09DX03'
                OR  ATCLevel5Code = 'C10BX03'
                THEN UPPER('Ischaemic heart disease: Hypertension')
                WHEN ATCLevel5Code >= 'N07BB01'
                AND ATCLevel5Code <= 'N07BB99'
                THEN UPPER('Alcohol dependency')
                WHEN ( 
                        ATCLevel5Code >= 'R01AC01' 
                    AND ATCLevel5Code <= 'R01AD60')
                OR  ( 
                        ATCLevel5Code >='R06AD02' 
                    AND ATCLevel5Code <= 'R06AX27')
                OR  ATCLevel5Code = 'R06AB04' 
                THEN UPPER('Allergies')
                WHEN ( 
                        ATCLevel5Code >= 'N05BA01' 
                    AND ATCLevel5Code <= 'N05BA12')
                OR  ( 
                        ATCLevel5Code = 'N05BE01') 
                THEN UPPER('Anxiety')
                WHEN ( 
                        ATCLevel5Code >= 'G04CA01' 
                    AND ATCLevel5Code <= 'G04CA99')
                OR  ( 
                        ATCLevel5Code = 'G04CB01')
                OR  ( 
                        ATCLevel5Code = 'G04CB02') 
                THEN UPPER('Benign prostatic hyperplasia')
                WHEN ATCLevel5Code >= 'N05AN01' 
                THEN UPPER('Bipolar disorder')
                WHEN ( 
                        ATCLevel5Code >= 'N06DA02' 
                    AND ATCLevel5Code <= 'N06DA04')
                OR  ( 
                        ATCLevel5Code = 'N06DX01') 
                THEN UPPER('Dementia')
                WHEN ( 
                        ATCLevel5Code >= 'N06AA01' 
                    AND ATCLevel5Code <= 'N06AG02')
                OR  ( 
                        ATCLevel5Code >= 'N06AX03' 
                    AND ATCLevel5Code <= 'N06AX11')
                OR  ( 
                        ATCLevel5Code >= 'N06AX13' 
                    AND ATCLevel5Code <= 'N06AX18')
                OR  ( 
                        ATCLevel5Code >= 'N06AX21' 
                    AND ATCLevel5Code <= 'N06AX26') 
                THEN UPPER('Depression')
                WHEN ( 
                        ATCLevel5Code >= 'A10AA01' 
                    AND ATCLevel5Code <= 'A10BX99') 
                THEN UPPER('Diabetes')
                WHEN ( 
                        ATCLevel5Code >= 'N03AA01' 
                    AND ATCLevel5Code <= 'N03AX99') 
                THEN UPPER('Epilepsy')
                WHEN ( 
                        ATCLevel5Code >= 'S01EA01' 
                    AND ATCLevel5Code <= 'S01EB03')
                OR  ( 
                        ATCLevel5Code = 'S01EC03' 
                    AND ATCLevel5Code = 'S01EX99') 
                THEN UPPER('Glaucoma')
                WHEN ( 
                        ATCLevel5Code >= 'A02BA01' 
                    AND ATCLevel5Code <= 'A02BX05') 
                THEN UPPER('Gastrooesophageal reflux disease')
                WHEN ( 
                        ATCLevel5Code >= 'M04AA01' 
                    AND ATCLevel5Code <= 'M04AC01') 
                THEN UPPER('Gout')
                WHEN ATCLevel5Code = 'J05AF08' 
                OR  ATCLevel5Code = 'J05AF10' 
                OR  ATCLevel5Code = 'J05AF11' 
                THEN UPPER('Hepatitis B')
                WHEN ( 
                        ATCLevel5Code >= 'J05AE11' 
                    AND ATCLevel5Code <= 'J05AE12')
                OR  ATCLevel5Code = 'J05AB54'
                OR  ATCLevel5Code = 'L03AB10'
                OR  ATCLevel5Code = 'L03AB11'
                OR  ATCLevel5Code = 'L03AB60'
                OR  ATCLevel5Code = 'L03AB61'
                OR  ATCLevel5Code = 'J05AE14'
                OR  ATCLevel5Code = 'J05AX14'
                OR  ATCLevel5Code = 'J05AX15'
                OR  ATCLevel5Code = 'J05AX65'
                OR  ATCLevel5Code = 'J05AB04' 
                THEN UPPER('Hepatitis C')
                WHEN ( 
                        ATCLevel5Code >= 'J05AE01' 
                    AND ATCLevel5Code <= 'J05AE10')
                OR  ( 
                        ATCLevel5Code >= 'J05AF12' 
                    AND ATCLevel5Code <= 'J05AG05')
                OR  ( 
                        ATCLevel5Code >= 'J05AR01' 
                    AND ATCLevel5Code <= 'J05AR99')
                OR  ( 
                        ATCLevel5Code >= 'J05AX07' 
                    AND ATCLevel5Code <= 'J05AX09')
                OR  ( 
                        ATCLevel5Code >= 'J05AF01' 
                    AND ATCLevel5Code <= 'J05AF07')
                OR  ATCLevel5Code = 'J05AX12'
                OR  ATCLevel5Code = 'J05AF09' 
                THEN UPPER('HIV')
                WHEN ( 
                        ATCLevel5Code = 'V03AE01') 
                THEN UPPER('Hyperkalaemia')
                WHEN ( 
                        ATCLevel5Code = 'C10AA01' 
                    AND ATCLevel5Code = 'C10BX09') 
                OR  ATCLevel5Code = 'A10BH03' 
                THEN UPPER('Hyperlipidaemia')
                WHEN ATCLevel5Code = 'H03BA02' 
                OR  ATCLevel5Code = 'H03BB01' 
                THEN UPPER('Hyperthyroidism')
                WHEN ( 
                        ATCLevel5Code >= 'A07EC01' 
                    AND ATCLevel5Code <= 'A07EC04')
                OR  ( 
                        ATCLevel5Code >= 'A07EA01' 
                    AND ATCLevel5Code <= 'A07EA02')
                OR  ATCLevel5Code = 'A07EA06' 
                OR  ATCLevel5Code = 'L04AA33' 
                THEN UPPER('Irritable bowel syndrome')
                WHEN ATCLevel5Code >= 'G04BD01' 
                AND ATCLevel5Code >= 'G04BD99' 
                THEN UPPER('Incontinence')
                WHEN ATCLevel5Code >= 'M01AB01' 
                AND ATCLevel5Code >= 'M01AH06' 
                THEN UPPER('Inflammation/pain')
                WHEN ATCLevel5Code = 'A06AD11' 
                OR  ATCLevel5Code = 'A07AA11' 
                THEN UPPER('Liver failure')
                WHEN ATCLevel5Code >= 'L01AA01' 
                AND ATCLevel5Code >= 'L01XX41' 
                THEN UPPER('Malignancies')
                WHEN ATCLevel5Code >= 'B05BA01' 
                AND ATCLevel5Code >= 'B05BA10' 
                THEN UPPER('Malnutrition')
                WHEN ATCLevel5Code >= 'N02CA01' 
                AND ATCLevel5Code >= 'N02CX01' 
                THEN UPPER('Migraine')
                WHEN ( 
                        ATCLevel5Code >= 'M05BA01' 
                    AND ATCLevel5Code <= 'M05BB05')
                OR  ATCLevel5Code = 'M05BX03' 
                OR  ATCLevel5Code = 'M05BX04'
                OR  ATCLevel5Code = 'G03XC01' 
                OR  ATCLevel5Code = 'H05AA02' 
                THEN UPPER('Osteoporosis/Paget’s')
                WHEN ( 
                        ATCLevel5Code >= 'N02AA01' 
                    AND ATCLevel5Code <= 'N02AX02')
                OR  ATCLevel5Code = 'N02AX06' 
                OR  ATCLevel5Code = 'N02AX52'
                OR  ATCLevel5Code = 'N02BE51' 
                THEN UPPER('Pain')
                WHEN ( 
                        ATCLevel5Code = 'A09AA02') 
                THEN UPPER('Pancreatic insufficiency')
                WHEN ATCLevel5Code >= 'N04AA01' 
                AND ATCLevel5Code <= 'N04BX02' 
                THEN UPPER('Parkinson’s disease')
                WHEN ( 
                        ATCLevel5Code >= 'D05AA01' 
                    AND ATCLevel5Code <= 'D05AA99')
                OR  ( 
                        ATCLevel5Code >= 'D05AC01' 
                    AND ATCLevel5Code <= 'D05AC51')
                OR  ATCLevel5Code = 'D05BB01' 
                OR  ATCLevel5Code = 'D05BB02'
                OR  ATCLevel5Code = 'D05AX02' 
                OR  ATCLevel5Code = 'D05AX52' 
                THEN UPPER('Psoriasis')
                WHEN ( 
                        ATCLevel5Code >= 'N05AA01' 
                    AND ATCLevel5Code <= 'N05AB02')
                OR  ( 
                        ATCLevel5Code >= 'N05AB06' 
                    AND ATCLevel5Code <= 'N05AL07')
                OR  ( 
                        ATCLevel5Code >= 'N05AX07' 
                    AND ATCLevel5Code <= 'N05AX13') 
                THEN UPPER('Psychotic illness')
                WHEN ( 
                        ATCLevel5Code >= 'B03XA01' 
                    AND ATCLevel5Code <= 'B03XA03')
                OR  ( 
                        ATCLevel5Code >= 'A11CC01' 
                    AND ATCLevel5Code <= 'A11CC04')
                OR  ATCLevel5Code = 'V03AE02' 
                OR  ATCLevel5Code = 'V03AE03'
                OR  ATCLevel5Code = 'V03AE05' 
                THEN UPPER('Renal disease')
                WHEN ( 
                        ATCLevel5Code >= 'N07BA01' 
                    AND ATCLevel5Code <= 'N07BA03')
                OR  ATCLevel5Code = 'N06AX12' 
                THEN UPPER('Smoking cessation')
                WHEN ATCLevel5Code >= 'H02AB01' 
                AND ATCLevel5Code <= 'H02AB10' 
                THEN UPPER('Steroid-responsive disease')
                WHEN ATCLevel5Code = 'L04AA06' 
                OR  ATCLevel5Code = 'L04AA10'
                OR  ATCLevel5Code = 'L04AA18' 
                OR  ATCLevel5Code = 'L04AD01'
                OR  ATCLevel5Code = 'L04AD02' 
                THEN UPPER('Transplant')
                WHEN ( 
                        ATCLevel5Code >= 'J04AC01' 
                    AND ATCLevel5Code <= 'J04AC51')
                OR  ( 
                        ATCLevel5Code >= 'J04AM01' 
                    AND ATCLevel5Code <= 'J04AM99') 
                THEN UPPER('Tuberculosis')
                ELSE '0'
            END AS ATCComorbCateg, 
            MasterPatient_ID, 
            GenericIngredientName
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
            DispenseCalendarDate BETWEEN add_months('2021-07-31', -24) AND '2021-07-31'
        AND ATCComorbCateg <> '0'
        AND MasterPatient_ID = 33
        GROUP BY 
            MasterPatient_ID, 
            ATCComorbCateg, 
            ATCLevel5Code, 
            GenericIngredientName
        ORDER BY 
            ATCLevel5Code) a
GROUP BY 
    MasterPatient_ID, 
    GenericIngredientName