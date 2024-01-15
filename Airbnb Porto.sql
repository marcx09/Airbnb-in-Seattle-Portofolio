-- Top 10 Host with Highest Monthly Review Rating

SELECT TOP 10 host_name, name, review_scores_rating
FROM AirbnbPorto..Listings
WHERE review_scores_rating = 100

-- Which Place can Accomodates 2-3 people

SELECT name, accommodates
FROM AirbnbPorto..Listings
WHERE accommodates BETWEEN 2 AND 3

-- Which place that price per night range 50-70$ and rating 90+

SELECT name, price, review_scores_rating
FROM AirbnbPorto..Listings
WHERE review_scores_rating >= 90 AND price BETWEEN 50 AND 70 AND review_scores_rating is NOT NULL
ORDER BY review_scores_rating DESC

-- Show Reviewer that review Dirk&Jaq Places and Reviewer Comment

SELECT host_name, reviewer_name, comments
FROM AirbnbPorto..Listings lis
JOIN AirbnbPorto..Reviews rev
	ON lis.id = rev.listing_id
WHERE host_name = 'Rob and Carol'

-- Create Data for Data Visualization (AirBnb in Seattle)

SELECT 
	lis.id as ListingID, 
	name as PlaceName, 
	host_id as HostID,
	last_scraped as LastExtract,
	host_name as HostName,
	host_response_rate as HostResponseRate,
	host_acceptance_rate as HostAcceptanceRate,
	property_type as PropertyType,
	lis.price as Price,
	rev.reviewer_name as ReviewerName,
	review_scores_rating as ReviewRating,
	reviews_per_month as MonthlyRating,
	cal.date as BookedDate,
	cal.price as PaidPriceBook,
	city as City,
	state as State,
	country as Country,
	latitude as Latitude,
	longitude as Longitude
FROM AirbnbPorto..Listings lis
RIGHT JOIN AirbnbPorto..Calendar cal
	ON lis.id = cal.listing_id
RIGHT JOIN AirbnbPorto..Reviews rev
	ON lis.id = rev.listing_id
WHERE lis.id is NOT NULL AND cal.price is NOT NULL
ORDER BY lis.id

