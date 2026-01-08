

{{ config(materialized='table') }}

WITH fact_orders AS
(
    select 
        o.ORDERID,
        o.ORDERDATE ,
        o.CUSTOMERID,
        o.EMPLOYEEID,
        o.STOREID,
        o.STATUSDESC,    
        o.UPDATED_AT,
        COUNT(DISTINCT o.ORDERID) AS ORDERCOUNT,
        SUM(oi.TOTALPRICE) AS REVENUE
    FROM 
        {{ ref('stg_orders') }} o
    JOIN
        {{ ref('stg_orderitems') }} oi
    ON
        o.ORDERID = oi.ORDERID    
    GROUP BY 
        o.ORDERID,
        o.ORDERDATE ,
        o.CUSTOMERID,
        o.EMPLOYEEID,
        o.STOREID,
        o.STATUSDESC,    
        o.UPDATED_AT     
)

SELECT 
    * 
FROM fact_orders    
