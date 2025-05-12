SELECT (new_customers / total_customers_beginning) * '100' AS acquisition_rate_percentage
FROM (
    (SELECT COUNT(DISTINCT customer_id) AS new_customers
	FROM `coffe shop sales`
	WHERE transaction_date BETWEEN '2019-04-15' AND '2019-04-30') AS new_customers ,

    (SELECT COUNT(DISTINCT customer_id) AS total_customers_beginning
	FROM `coffe shop sales`
	WHERE transaction_date < '2019-04-15'  ) AS total_customers_beginning
    );
    
    