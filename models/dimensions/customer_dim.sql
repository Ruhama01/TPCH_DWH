-- DWH_DIM.CUSTOMER_DIM
SELECT
    MD5(C_CUSTKEY) AS CUSTOMER_SK, -- Surrogate Key
    C_CUSTKEY AS CUSTOMER_NK, -- Natural Key
    C_NAME,
    C_ADDRESS,
    C_PHONE,
    C_ACCTBAL,
    C_MKTSEGMENT,
    C_COMMENT,
    N_NAME AS NATION_NAME,
    R_NAME AS REGION_NAME
FROM {{ source('tpch_sf1', 'CUSTOMER') }} AS c
JOIN {{ source('tpch_sf1', 'NATION') }} AS n ON c.C_NATIONKEY = n.N_NATIONKEY 
JOIN {{ source('tpch_sf1', 'REGION') }} AS r ON n.N_REGIONKEY = r.R_REGIONKEY

