SELECT product_id,
    SUM(line_item_amount) AS product_sales
FROM `coffe shop sales`
GROUP BY product_id
ORDER BY product_sales DESC;