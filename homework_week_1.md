# Week 1 Homework

## Question 1. Google Cloud SDK

Install Google Cloud SDK. What's the version you have?

```
Google Cloud SDK 368.0.0
bq 2.0.72
core 2022.01.07
gsutil 5.6
```

## Question 2. Terraform

Now install terraform and go to the terraform directory (`week_1_basics_n_setup/1_terraform_gcp/terraform`)

After that, run

* `terraform init`
* `terraform plan`
* `terraform apply`

Apply the plan and copy the output (after running `apply`) to the form

```
placeholder
```

## Question 3. Count records

How many taxi trips were there on January 15?

Consider only trips that started on January 15.

```
SELECT date_trunc('day', tpep_pickup_datetime) AS day, COUNT(index)
FROM yellow_taxi_data
GROUP BY day
ORDER BY day desc;
```

```
2021-01-15 00:00:00.000000 - 53024
```

## Question 4. Average

Find the largest tip for each day.
On which day it was the largest tip in January?

```
SELECT date_trunc('day', tpep_pickup_datetime) AS day, MAX(tip_amount) AS largest_tip
FROM yellow_taxi_data
GROUP BY day
ORDER BY largest_tip desc;
```

```
2021-01-20 00:00:00.000000 - 1140.44
```

## Question 5. Most popular destination

What was the most popular destination for passengers picked up
in central park on January 14?

```
SELECT COUNT(ytd.index) AS count, dropoff."Zone" AS dropoff_zone
FROM yellow_taxi_data ytd
    JOIN taxi_zones pickup on ytd."PULocationID" = pickup."LocationID"
    JOIN taxi_zones dropoff on ytd."DOLocationID" = dropoff."LocationID"
WHERE pickup."Zone" = 'Central Park' AND date_trunc('day', tpep_pickup_datetime) = '2021-01-14 00:00:00.000000'
GROUP BY dropoff."Zone"
ORDER BY count DESC;
```

```
97 - Upper East Side South
```

## Question 6. Pickup-Dropoff

What's the pickup-dropoff pair with the largest
average price for a ride (calculated based on `total_amount`)?

```
SELECT pickup."Zone" AS pickup_zone, dropoff."Zone" AS dropoff_zone, AVG(total_amount) as avg_total_amount
FROM yellow_taxi_data ytd
    JOIN taxi_zones pickup on ytd."PULocationID" = pickup."LocationID"
    JOIN taxi_zones dropoff on ytd."DOLocationID" = dropoff."LocationID"
GROUP BY pickup."Zone", dropoff."Zone"
ORDER BY AVG(total_amount) DESC;
```

```
unknown/Alphabet City
```
