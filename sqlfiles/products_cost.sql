SELECT
    NIVEL_1,
    BUSINESS_UNIT,
    COUNT(*) AS CASES,
    SUM(USD_INTERACTION_GESTION) AS TOTAL_USD
FROM
    SBOX_CX_BI_ADS_CORE.CX_STUDIO_TABLE_SAMPLE
WHERE
    NIVEL_1 IS NOT NULL
  AND INCOMING_CASE_DT BETWEEN