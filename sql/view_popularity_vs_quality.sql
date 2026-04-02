SELECT
  movie_id,
  title,
  genres,
  release_year,
  total_ratings,
  avg_rating
FROM `netflix-pipeline-30032026.netflix_analytical.view_movies_kpis`
WHERE total_ratings >= 50
