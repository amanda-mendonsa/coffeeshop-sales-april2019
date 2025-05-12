SELECT
    SUM(line_item_amount) / COUNT(transaction_id) AS average_order_value
FROM `coffe shop sales`
WHERE
    transaction_date BETWEEN '2019-04-01' AND '2019-04-30';
