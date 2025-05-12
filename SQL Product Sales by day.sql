SELECT
    DATE(transaction_date) AS transaction_date,   
    product_id,                     
    SUM(line_item_amount) AS total_sales 
FROM sales_reciepts.`coffe shop sales`                       
GROUP BY
    DATE(transaction_date),                 
    product_id                       
ORDER BY
    transaction_date,                       
    product_id;     
 