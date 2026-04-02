SELECT
  user_id,
  COUNT(*) AS total_ratings,
  COUNT(DISTINCT movie_id) AS distict_movies_rated,
  AVG(rating) AS avg_rating,
  STDDEV(rating) AS std_rating,
  MIN(rating_ts) AS first_activity_ts,
  MAX(rating_ts) AS last_activity_ts
FROM `netflix-pipeline-30032026.netflix_analytical.fact_ratings`
GROUP BY user_id
ORDER BY total_ratings DESC, avg_rating DESC
