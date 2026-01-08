# SleekData — OMS dbt Project

This repository contains a dbt project for the Order Management System (OMS) used by SleekData. It includes staging models, facts, and marts used to transform raw order data into analytics-ready tables.

**Project Structure**
- `models/` — dbt models and sources
	- `staging/` — staging models: `stg_customers.sql`, `stg_orderitems.sql`, `stg_orders.sql`
	- `Facts/` — fact tables: `fact_orders.sql`
	- `marts/` — marts and aggregated models: `customer_revenue.sql`
- `macros/` — project macros
- `seeds/`, `snapshots/`, `tests/`, and `target/`

**Key Models**
- `stg_customers` — cleans and standardizes customer data
- `stg_orders` — raw orders ingested and normalized
- `stg_orderitems` — individual order line items
- `fact_orders` — fact table for order-level analytics
- `customer_revenue` — aggregated revenue metrics per customer

**Quickstart**
Prerequisites: `dbt` (core or cloud), target warehouse configured in `profiles.yml`.


**Data Lineage diagram**

![Data Lineage](Images/Data-Lineage.png)

- Customers Revenue Analytics (PBIX): [Images/Customers-Revenue-Analytics.pbix](Images/Customers-Revenue-Analytics.pbix)



**OMS Dashboard preview**

![OMS Dashboard](Images/order_management_system_dashboard.png)

If you add further images, reference them from `Images/` and include them in this section using standard Markdown image syntax.




