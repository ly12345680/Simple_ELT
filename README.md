# Custom ELT Project with DBT and Airflow

This repository contains a custom Extract, Load, Transform (ELT) project that utilizes Docker, PostgreSQL, DBT, and Apache Airflow to demonstrate a modern, automated ELT pipeline.

## Repository Structure

1. **`docker-compose.yaml`**: Configuration for Docker Compose to orchestrate multiple containers:
   - `source_postgres`: Source PostgreSQL database with sample data.
   - `destination_postgres`: Destination PostgreSQL database.
   - `elt_script`: Python service to perform raw EL (Extract & Load) steps.
   - `airflow`: Apache Airflow service to schedule and orchestrate the ELT pipeline.
   - `dbt`: Contains transformation logic using DBT, executed during the Airflow DAG run.

2. **`elt_script/`**:
   - `Dockerfile`: Sets up the Python environment and PostgreSQL client tools.
   - `elt_script.py`: Python script that extracts data from the source DB using `pg_dump` and loads it into the destination DB using `psql`.

3. **`source_db_init/init.sql`**: SQL script to initialize the source PostgreSQL database with sample tables and data.

4. **`dbt_project/`**: DBT project containing models to transform loaded data inside the destination PostgreSQL database.

5. **`airflow/dags/elt_pipeline.py`**: Defines the Airflow DAG that automates the ELT process:
   - Extract & Load step via the `elt_script` service.
   - Transform step via DBT models.

## How It Works

1. **Extract & Load**:
   - The `elt_script.py` waits for the source DB to become available.
   - It then uses `pg_dump` to export data from the source DB.
   - Finally, it uses `psql` to import the dumped SQL into the destination DB.

2. **Transform (via DBT)**:
   - After loading the raw data, DBT is triggered via Airflow to run SQL-based transformation models on the destination DB.

3. **Orchestration (via Apache Airflow)**:
   - The entire ELT pipeline is orchestrated through a single DAG in Airflow.
   - Tasks are run in order: Extract → Load → Transform.

## Getting Started

### Prerequisites
- Docker
- Docker Compose

### Steps to Run

1. Clone this repository:
   ```bash
   git clone <repo-url>
   cd <repo-directory>
2. Initialize Airflow:
  docker compose up init-airflow -d

4. Start all services (Airflow, PostgreSQL, ELT script, etc.):
   docker compose up
5. Open Airflow UI:
Navigate to http://localhost:8080

Login with default credentials:

Username: airflow

Password: airflow
