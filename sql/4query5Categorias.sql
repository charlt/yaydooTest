SELECT
    b.name AS branch_name,
    cat.name AS category_name,
    COUNT(*) AS cantidad_vendida
FROM
    purchase p
    JOIN purchase_product pp ON p.id = pp.purchase_id
    JOIN product pr ON pp.product_id = pr.id
    JOIN category cat ON pr.category_id = cat.id
    JOIN customer c ON p.customer_id = c.id
    JOIN branch b ON c.branch_id = b.id
WHERE
    b.id = 375
GROUP BY
    b.name,
    cat.name
ORDER BY
    cantidad_vendida
LIMIT
    5;