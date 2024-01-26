CREATE VIEW vista_producto_mas_vendido AS
SELECT
    b.id AS branch_id,
    DATE_FORMAT(p.created_at, '%Y') AS anio,
    DATE_FORMAT(p.created_at, '%m') AS mes,
    pr.id AS product_id,
    pr.name AS product_name,
    COUNT(*) AS cantidad_vendida
FROM
    purchase p
JOIN
    purchase_product pp ON p.id = pp.purchase_id
JOIN
    product pr ON pp.product_id = pr.id
JOIN
    customer c ON p.customer_id = c.id
JOIN
    branch b ON c.branch_id = b.id
GROUP BY
    b.id, DATE_FORMAT(p.created_at, '%Y'), DATE_FORMAT(p.created_at, '%m'), pr.id
ORDER BY
    cantidad_vendida DESC;