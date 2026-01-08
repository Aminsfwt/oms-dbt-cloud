
{{ config(materialized='view') }}

SELECT  
    ORDERID,
    ORDERDATE ,
    CUSTOMERID,
    EMPLOYEEID,
    STOREID,
    STATUS AS STATUSCD,
    CASE 
        WHEN STATUS = '01' THEN 'In_Progress'
        WHEN STATUS = '02' THEN 'Completed'
        WHEN STATUS = '03' THEN 'Cancelled'
        ELSE NULL
    END AS STATUSDESC, 
    CASE
        WHEN STOREID = 1000 THEN 'Online'
        ELSE 'In_Store'
    END AS ORDER_CHANNEL ,       
    UPDATED_AT,
    current_timestamp AS dbt_updated_at 
FROM {{source('raw_data', 'ORDERS')}}   

