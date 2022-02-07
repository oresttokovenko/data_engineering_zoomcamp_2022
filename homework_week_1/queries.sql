# Question 3

SELECT date_trunc('day', tpep_pickup_datetime) AS day, COUNT(index)
FROM yellow_taxi_data
GROUP BY day
ORDER BY day desc;

# Question 4

SELECT date_trunc('day', tpep_pickup_datetime) AS day, MAX(tip_amount) AS largest_tip
FROM yellow_taxi_data
GROUP BY day
ORDER BY largest_tip desc;

# Question 5

SELECT COUNT(ytd.index) AS count, dropoff."Zone" AS dropoff_zone
FROM yellow_taxi_data ytd
    JOIN taxi_zones pickup on ytd."PULocationID" = pickup."LocationID"
    JOIN taxi_zones dropoff on ytd."DOLocationID" = dropoff."LocationID"
WHERE pickup."Zone" = 'Central Park' AND date_trunc('day', tpep_pickup_datetime) = '2021-01-14 00:00:00.000000'
GROUP BY dropoff."Zone"
ORDER BY count DESC;

# Question 6

SELECT pickup."Zone" AS pickup_zone, dropoff."Zone" AS dropoff_zone, AVG(total_amount) as avg_total_amount
FROM yellow_taxi_data ytd
    JOIN taxi_zones pickup on ytd."PULocationID" = pickup."LocationID"
    JOIN taxi_zones dropoff on ytd."DOLocationID" = dropoff."LocationID"
GROUP BY pickup."Zone", dropoff."Zone"
ORDER BY AVG(total_amount) DESC;