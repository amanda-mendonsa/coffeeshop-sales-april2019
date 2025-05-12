SELECT
    o.sales_outlet_id,  -- The outlet where the order was placed
    o.transaction_date, -- The date of the transaction
    COUNT(DISTINCT i.customer_id) / COUNT(DISTINCT o.customer_id) * 100 AS percent_instore_orders
FROM
    -- Subquery for customers who ordered in-store
    (
        SELECT DISTINCT customer_id, sales_outlet_id, transaction_date
        FROM `coffe shop sales`
        WHERE instore_yn = 'Y'  -- Filter for in-store orders
    ) AS i

JOIN
    -- Subquery for all customers who placed any order (in-store or online)
    (
        SELECT DISTINCT customer_id, sales_outlet_id, transaction_date
        FROM `coffe shop sales`
    ) AS o
ON i.sales_outlet_id = o.sales_outlet_id  -- Join by sales_outlet_id
AND i.transaction_date = o.transaction_date  -- Ensure both outlet_id and transaction_date match
GROUP BY
    o.sales_outlet_id, o.transaction_date  -- Group by sales_outlet_id and transaction_date
ORDER BY
    o.transaction_date, o.sales_outlet_id;  -- Order by transaction_date and sales_outlet_id
    
    