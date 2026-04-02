WITH base AS (
  SELECT
    r.rating,
    SPLIT(COALESCE(m.genres, ''), '|')[SAFE_OFFSET(0)] AS main_genre
  FROM `netflix-pipeline-30032026.netflix_analytical.fact_ratings` r
  JOIN `netflix-pipeline-30032026.netflix_analytical.dim_movies` m
    ON m.movie_id = r.movie_id
)
SELECT
  main_genre,
  COUNT(*) AS total_ratings,
  AVG(rating) AS avg_rating,
  STDDEV(rating) AS std_rating
FROM base
WHERE main_genre IS NOT NULL
  AND main_genre != ''
  AND main_genre != '(no genres listed)'
GROUP BY main_genre
ORDER BY total_ratings DESC, avg_rating DESC
