SELECT transaction_date,
    SUM(line_item_amount) AS total_sales
FROM `coffe shop sales`
GROUP BY transaction_date
ORDER BY transaction_date ASC;
