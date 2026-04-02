SELECT
  movie_id,
  title,
  genres,
  release_year,
  total_ratings,
  ROUND(avg_rating, 2) AS avg_rating
FROM `netflix-pipeline-30032026.netflix_analytical.view_movies_kpis`
WHERE
  total_ratings >= 20
  AND avg_rating BETWEEN 0 AND 5
  ORDER BY avg_rating DESC, total_ratings DESC
  LIMIT 10