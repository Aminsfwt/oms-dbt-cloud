
{{ config(materialized='view') }}

SELECT 
    CUSTOMERID,
    FIRSTNAME,
    LASTNAME,
    CONCAT(FIRSTNAME, ' ', LASTNAME) AS FULLNAME,
    EMAIL,
    PHONE,
    ADDRESS,
    CITY,
    STATE
    ZIPCODE,
    UPDATED_AT
FROM {{ source('raw_data', 'CUSTOMERS') }}   