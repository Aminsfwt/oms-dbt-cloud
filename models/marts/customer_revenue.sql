{{ config(materialized='table') }}


select 
    c.CUSTOMERID,
    c.FULLNAME AS CUSTOMERNAME,
    SUM(o.ORDERCOUNT) AS ORDERCOUNT,
    SUM(o.REVENUE) AS REVENUE
FROM 
    {{ ref('stg_customers') }} c  
JOIN 
    {{ ref('fact_orders') }} o
ON c.CUSTOMERID = o.CUSTOMERID
GROUP BY c.CUSTOMERID, FULLNAME 
ORDER BY REVENUE DESC 

