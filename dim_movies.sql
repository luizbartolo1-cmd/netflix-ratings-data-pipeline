CREATE OR REPLACE TABLE `netflix-pipeline-30032026.netflix_analytical.dim_movies` AS
SELECT
  SAFE_CAST(movieID AS INT64) AS movie_id,
  CAST(title AS STRING) AS title,
  CAST(genres AS STRING) AS genres,
  SAFE_CAST(REGEXP_EXTRACT(CAST(title AS STRING), r'\((\d{4})\)\s*$') AS INT64) AS release_year
FROM `netflix-pipeline-30032026.netflix_raw.raw_movies`;