{{ config(materialized='table') }}

SELECT
    --TO_BINARY(MD5(PS.PS_PARTKEY || PS.PS_SUPPKEY), 'HEX') AS PART_SUPPLIER_SK,
    TO_BINARY({{ dbt_utils.surrogate_key(['PS.PS_PARTKEY', 'PS.PS_SUPPKEY']) }}, 'HEX') AS PART_SUPPLIER_SK,
    COALESCE(PD.PART_SK, '-1') AS PART_SK,
    COALESCE(SD.SUPPLIER_SK, '-1') AS SUPPLIER_SK
FROM {{ source('tpch_sf1', 'PARTSUPP') }} PS
JOIN {{ ref('part_dim') }} PD ON PS.PS_PARTKEY = PD.PART_NK
JOIN {{ ref('supplier_dim') }} SD ON PS.PS_SUPPKEY = SD.SUPPLIER_NK