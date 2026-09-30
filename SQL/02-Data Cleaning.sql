---------------------- Data Cleaning & Validation
---1. Sanity check counts per app
SELECT app_name , COUNT(*) AS row_count ,AVG(rating) AS raw_avg_rating
FROM dating_reviews
GROUP BY  app_name;

---2.Check for null or empty values
SELECT 
	COUNT(CASE WHEN review_text IS NULL OR TRIM(review_text) = '' THEN 1 END) AS missing_text,
	COUNT(CASE WHEN rating IS NULL THEN 1 END)AS missing_ratings,
	COUNT(CASE WHEN posted_at IS NULL THEN 1 END)AS missing_dates
FROM dating_reviews;

---3. Clean trailing whitespaces in strings if needed
UPDATE dating_reviews
SET app_name = TRIM(app_name),
	sentiment = TRIM(sentiment);

