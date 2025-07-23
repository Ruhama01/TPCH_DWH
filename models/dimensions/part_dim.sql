{{ config(materialized='table') }}

SELECT
    MD5(CAST(P.P_PARTKEY AS STRING)) AS PART_SK,  -- Surrogate key
    P.P_PARTKEY AS PART_NK,                      -- Natural key
    P.P_NAME AS PART_NAME,
    P.P_MFGR AS MANUFACTURER,
    P.P_BRAND AS BRAND,
    P.P_TYPE AS PART_TYPE,
    P.P_SIZE AS PART_SIZE,
    P.P_CONTAINER AS CONTAINER,
    P.P_RETAILPRICE AS RETAIL_PRICE,
    P.P_COMMENT AS PART_COMMENT
FROM {{ source('tpch_sf1', 'PART') }} P
