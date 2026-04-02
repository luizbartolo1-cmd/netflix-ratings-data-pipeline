# netflix-ratings-data-pipeline
End-to-end data pipeline for Netflix ratings analytics using BigQuery and Metabase
# Netflix Ratings Analytics

End-to-end data pipeline project built with Google Cloud Platform, BigQuery and Metabase to analyze movie ratings data.

## Overview
This project was designed to simulate a real-world analytics workflow, from raw data ingestion to business-oriented dashboards.

## Architecture
The pipeline follows a layered structure:

- **Bronze**: raw data ingestion and storage
- **Silver**: dimensional modeling with fact and dimension tables
- **Gold**: analytical views used for dashboards and insights

## Tech Stack
- Google Cloud Storage
- BigQuery
- SQL
- Metabase
- Docker

## Project Structure
```text
sql/
docs/
README.md
