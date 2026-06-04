# Northwind Enterprise Data Platform (dbt-core & BigQuery)

An end-to-end modern data stack platform designed to transform raw Northwind operational data into highly optimized, high-performance analytic assets. This project follows modern **Analytics Engineering (DataOps)** best practices and leverages **dbt-core**, **Google BigQuery**, and automated testing frameworks to deliver reliable, scalable analytics solutions.

---

## 🏗️ Architecture & Data Modeling

The platform transforms traditional relational source data into a modern analytical warehouse architecture optimized for BI tools such as Looker Studio.

### Staging Layer (`stg_northwind`)
- Ingests raw operational data.
- Standardizes data types and field naming conventions.
- Cleanses and normalizes source records without modifying business logic.

### Warehouse Layer (`dwh_northwind`)
Implements dimensional modeling principles through:

#### Fact Tables
- `fact_sales`
- `fact_inventory`
- `fact_purchase_order`

#### Dimension Tables
- `dim_customer`
- `dim_product`
- `dim_employees`

### Analytics OBT Layer (`analytics_obt`)
Builds high-performance **One Big Tables (OBTs)** by consolidating dimensional models into denormalized reporting structures.

Benefits include:
- Eliminates expensive runtime joins.
- Improves BI dashboard performance.
- Simplifies downstream data consumption.
- Reduces query latency and warehouse compute costs.

---

## 🛠️ Advanced Analytics Engineering Practices

### 1. High-Performance Physical Materialization

Critical OBT models are materialized as physical **tables** rather than **views** to optimize BigQuery performance.

Key advantages:
- Pre-computes complex multi-table joins during ETL execution.
- Provides sub-second query performance for BI tools.
- Minimizes repeated BigQuery scan costs.

### 2. Localized Deployment Resilience

To address regional deployment inconsistencies within Google Cloud's London region (`europe-west2`), selected models utilize localized Jinja configuration overrides.

Benefits:
- Prevents dataset location conflicts.
- Improves deployment stability.
- Ensures consistent schema behavior during large-scale transformations.

---

## 🧪 DataOps & Continuous Integration

The project adopts software engineering quality standards for data pipelines through automated testing and validation.

### Core Data Quality Tests

#### `not_null`
Applied to critical business keys such as:

- `customer_id`
- Transaction identifiers
- Primary business entities

Purpose:
- Detect orphan records.
- Prevent data loss during transformations.
- Ensure reporting completeness.

#### `unique`
Applied to dimension table primary keys.

Purpose:
- Prevent duplicate records.
- Enforce dimensional integrity.
- Maintain trusted analytical outputs.

---

## 🚀 Deployment & Execution

### Prerequisites

Activate your Python virtual environment and authenticate with Google Cloud:

```bash
source dbt-env/bin/activate
```

### 1. Validate Project Configuration

Check model configurations, YAML syntax, macros, and project structure:

```bash
dbt parse
```

### 2. Run Data Transformations

Materialize analytical models into BigQuery:

```bash
dbt run -s obt_sales_overview

dbt run -s obt_product_inventory

dbt run -s obt_customer_reporting
```

### 3. Execute Data Quality Tests

Run all configured dbt tests:

```bash
dbt test
```

---

## 🏁 Technical Stack

| Component | Technology |
|------------|------------|
| Data Transformation | dbt-core v1.11.11 |
| Data Warehouse | Google BigQuery |
| BigQuery Adapter | dbt-bigquery v1.11.1 |
| Cloud Environment | Google Cloud Shell |
| GCP Project | `single-patrol-497709-u6` |
| Deployment Region | `europe-west2` (London) |
| Version Control | Git & GitHub |
| Development Methodology | Analytics Engineering & DataOps |

---

## 📋 Common Commands

```bash
dbt parse

dbt run -s obt_sales_overview

dbt run -s obt_product_inventory

dbt run -s obt_customer_reporting

dbt test
```
