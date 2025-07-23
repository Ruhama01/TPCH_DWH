# TPC-H SF1 Data Warehouse with dbt

This dbt project showcases a dimensional data model built on the TPC-H Scale Factor 1 (SF1) dataset, available as a sample dataset within Snowflake. It transforms the raw TPC-H data into a star schema, comprising dimension and fact tables, suitable for analytical querying.

## 📊 Data Model Overview

This project implements a classic dimensional modeling approach, separating business entities into dimensions and measurements into facts.

### Dimensions

Dimension tables provide descriptive context for your business processes.

* `customer_dim`: Contains comprehensive information about customers, including their name, address, phone, account balance, market segment, and associated nation and region details.
* `date_dim`: A comprehensive date dimension, providing various time attributes (year, month, day, week, quarter) derived from order and line item dates.
* `part_dim`: Details about individual parts, such as name, manufacturer, brand, type, size, container, and retail price.
* `supplier_dim`: Information about suppliers, including their name, address, phone, account balance, and associated nation and region.

### Facts

Fact tables store the quantitative measurements of business events, linked to dimensions via foreign keys.

* `daily_sales_summary_fact`: Aggregates sales metrics (total sales amount, quantity sold, average discount, order count) at a daily and customer level.
* `order_fulfillment_fact`: Tracks the lifecycle of orders, including order dates, shipping dates, commit dates, receipt dates, total order amount, and calculated durations for fulfillment.
* `part_supplier_relationship_fact`: Captures the many-to-many relationship between parts and suppliers.
* `sales_lineitem_fact`: The most granular fact table, detailing individual line items from orders, including quantities, prices, discounts, taxes, and associated dates and keys to dimensions.

## 📦 Data Source

The data for this project is sourced from the **TPC-H Scale Factor 1 (SF1) dataset**, which is readily available as a free sample dataset within **Snowflake**.

To access this data, your Snowflake environment must have access to the `SNOWFLAKE_SAMPLE_DATA` database. You will reference the tables within the `TPCH_SF1` schema of this database.

Example source definition (in `sources.yml`):

```yaml
sources:
  - name: tpch_sf1
    database: SNOWFLAKE_SAMPLE_DATA
    schema: TPCH_SF1
    tables:
      - name: CUSTOMER
      - name: NATION
      - name: REGION
      - name: ORDERS
      - name: LINEITEM
      - name: PART
      - name: SUPPLIER
      - name: PARTSUPP