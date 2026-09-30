--- View 1:

CREATE OR REPLACE VIEW vw_dating_reviews_curated AS 
SELECT 
	review_id,
	app_name ,
	rating, 
	sentiment,
	is_satisfied,
	review_word_count,
	review_char_len,
	thumbs_up,
	posted_at,
	CAST (posted_at AS DATE) AS review_date,
	EXTRACT(HOUR FROM posted_at) AS review_hour,

	------------------------- Verbosity Segment -------------------------
	CASE
		WHEN review_word_count < 15 THEN 'Brief (<15 words)'
		WHEN review_word_count BETWEEN 15 AND 45 THEN 'Medium (15-45 words)'
		ELSE 'Detailed (>45 words)'
	END AS review_length_bucket,

	-------------- Voice-of-Customer Issue Flags(1 = mentioned , 0 = not mentioned)-------------------------
	CASE WHEN LOWER(review_text) ~ '(pay|money|cost|subscri|gold|platinum|refund|charge|price)'
		THEN 1 ELSE 0 END AS flag_monetization,

	CASE WHEN LOWER(review_text) ~ '(bot|fake|scam|catfish|ghost|inactive)'
		THEN 1 ELSE 0 END AS flag_bots_fakes,

	CASE WHEN LOWER(review_text) ~ '(ban|banned|block|suspend|verification|appeal)'
		THEN 1 ELSE 0 END AS flag_account_bans,

	CASE WHEN LOWER(review_text) ~ '(algorithm|match|matches|distance|location|show)'
		THEN 1 ELSE 0 END AS flag_algorithm_matching

FROM dating_reviews;

SELECT * FROM vw_dating_reviews_curated
LIMIT 10;