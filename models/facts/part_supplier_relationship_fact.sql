{{ config(materialized='table') }}

SELECT
    MD5(PS.PS_PARTKEY || PS.PS_SUPPKEY) AS PART_SUPPLIER_SK,
    COALESCE(PD.PART_SK, -1) AS PART_SK,
    COALESCE(SD.SUPPLIER_SK, -1) AS SUPPLIER_SK
FROM {{ source('tpch_sf1', 'PARTSUPP') }} PS
LEFT JOIN {{ ref('part_dim') }} PD ON PS.PS_PARTKEY = PD.PART_NK
LEFT JOIN {{ ref('supplier_dim') }} SD ON PS.PS_SUPPKEY = SD.SUPPLIER_NK