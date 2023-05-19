WITH TOTAL_FCR_INFO AS (
    SELECT
        STRING(DATE_TRUNC(INCOMING_CASE_DT, MONTH)) AS INCOMING_DATE,
        SUM(IF( FCR_FLAG = 1,1,0)) AS TOTAL_FCR,
        SUM(IF( FCR_FLAG = 0,0,1)) TOTAL_NO_FCR,
        SUM(IF(FCR_FLAG = 1,1,0)) + SUM(IF(FCR_FLAG = 0,0,1)) AS TOTAL_CASES,
        SUM(IF( FCR_FLAG = 1 ,USD_INTERACTION_GESTION,0)) AS TOTAL_COST_FCR,
        SUM(IF( FCR_FLAG = 0 ,USD_INTERACTION_GESTION,0)) AS TOTAL_COST_NO_FCR,
    FROM
             SBOX_CX_BI_ADS_CORE.CX_STUDIO_TABLE_SAMPLE
    WHERE
        INCOMING_CASE_DT  BETWEEN '{{dateFrom}}' AND '{{dateTo}}'
    {{otherFilters}}
GROUP BY 1 ORDER BY 1 )
SELECT
    TOTAL_FCR_INFO.*,
    SAFE_DIVIDE(TOTAL_FCR,TOTAL_CASES)*100 AS SHARE_COUNT_FCR,
    SAFE_DIVIDE(TOTAL_NO_FCR,TOTAL_CASES)*100 AS SHARE_COUNT_NO_FCR,
    SAFE_DIVIDE(TOTAL_COST_FCR,TOTAL_COST_FCR+TOTAL_COST_NO_FCR)*100 AS SHARE_FCR_COST,
    SAFE_DIVIDE(TOTAL_COST_NO_FCR,TOTAL_COST_FCR+TOTAL_COST_NO_FCR)*100 AS SHARE_NO_FCR_COST,
FROM
         TOTAL_FCR_INFO ORDER BY INCOMING_DATE DESC