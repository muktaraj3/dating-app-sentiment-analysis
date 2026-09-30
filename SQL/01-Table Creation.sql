-------------- Create Table
CREATE TABLE dating_reviews
(
	review_id SERIAL PRIMARY KEY,
	app_name VARCHAR(50) NOT NULL,
	review_text TEXT,
	rating SMALLINT CHECK (rating BETWEEN 1 AND 5),
	sentiment VARCHAR(20),
	is_satisfied SMALLINT CHECK(is_satisfied IN (0,1)),
	review_word_count INT,
	review_char_len	INT,
	thumbs_up INT DEFAULT 0,
	posted_at TIMESTAMP NOT NULL
);

SELECT * FROM dating_reviews;

COPY dating_reviews(app_name, review_text, rating, sentiment, is_satisfied,	review_word_count,
					review_char_len, thumbs_up,	posted_at)
FROM 'D:\mukta\Data Analyst\SQL+PowerBI\Dating App Reviews Tinder, Bumble & Hinge\dating_app_reviews_sentiment.csv'
WITH (FORMAT CSV, HEADER TRUE , DELIMITER ',');
					