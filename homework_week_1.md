## Week 1 Homework

In this homework we'll prepare the environment
and practice with terraform and SQL

## Question 1. Google Cloud SDK

Install Google Cloud SDK. What's the version you have?

## Question 2. Terraform

Now install terraform and go to the terraform directory (`week_1_basics_n_setup/1_terraform_gcp/terraform`)

After that, run

* `terraform init`
* `terraform plan`
* `terraform apply`

Apply the plan and copy the output (after running `apply`) to the form

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

## Question 5. Most popular destination

What was the most popular destination for passengers picked up
in central park on January 14?

## Question 6. Pickup-Dropoff

What's the pickup-dropoff pair with the largest
average price for a ride (calculated based on `total_amount`)?


#
