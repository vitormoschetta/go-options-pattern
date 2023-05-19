SELECT
    COUNT(*) AS total_channels,
    COUNT (CASE
               WHEN CAS_CONTACT_ORIGIN ='WebChat' THEN 1
        END
        ) AS total_web_chat,
    COUNT (CASE
               WHEN CAS_CONTACT_ORIGIN ='C2C' THEN 1
        END
        ) AS total_c2c,
    COUNT (CASE
               WHEN CAS_CONTACT_ORIGIN ='FORM' THEN 1
        END
        ) AS total_form
FROM
    SBOX_CX_BI_ADS_CORE.CX_STUDIO_TABLE_SAMPLE
WHERE
        CAS_CONTACT_ORIGIN IN('WebChat',
                              'C2C',
                              'FORM')
  AND INCOMING_CASE_DT BETWEEN