CREATE OR REPLACE TABLE `netflix-pipeline-30032026.netflix_analytical.fact_ratings` AS
WITH all_ratings AS (

  SELECT
    SAFE_CAST(NULLIF(userID, '') AS INT64) AS user_id,
    SAFE_CAST(NULLIF(movieID, '') AS INT64) AS movie_id,

    CASE
      WHEN SAFE_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS FLOAT64) BETWEEN 0 AND 5
        THEN SAFE_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS FLOAT64)
      ELSE NULL
    END AS rating,

    COALESCE(
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S%Ez', tstamp),
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', tstamp)
    ) AS rating_ts,

    'user_rating_history' AS src

  FROM `netflix-pipeline-30032026.netflix_raw.raw_user_rating_history`

  UNION ALL

  SELECT
    SAFE_CAST(NULLIF(userID, '') AS INT64) AS user_id,
    SAFE_CAST(NULLIF(movieID, '') AS INT64) AS movie_id,

    CASE
      WHEN SAFE_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS FLOAT64) BETWEEN 0 AND 5
        THEN SAFE_CAST(NULLIF(NULLIF(rating, 'NA'), '') AS FLOAT64)
      ELSE NULL
    END AS rating,

    COALESCE(
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S%Ez', tstamp),
      SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S', tstamp)
    ) AS rating_ts,

    'ratings_for_additional_users' AS src

  FROM `netflix-pipeline-30032026.netflix_raw.raw_ratings_for_additional_users`
)

SELECT
  user_id,
  movie_id,
  rating,
  rating_ts,
  src
FROM all_ratings
WHERE user_id IS NOT NULL
  AND movie_id IS NOT NULL
  AND rating IS NOT NULL
  AND rating_ts IS NOT NULL;
