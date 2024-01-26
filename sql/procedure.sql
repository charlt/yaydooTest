DELIMITER //
CREATE PROCEDURE mostrar_compras_por_cliente(IN branch_id INT)
BEGIN
    SELECT
        c.name AS nombre,
        c.age AS edad,
        c.email AS email,
        COUNT(
            CASE
                WHEN p.status = 'pagado' THEN 1
            END
        ) AS cantidad_compras_pagadas,
        SUM(
            CASE
                WHEN p.status = 'pagado' THEN p.total
                ELSE 0
            END
        ) AS total_compras_pagadas,
        COUNT(
            CASE
                WHEN p.status = 'cancelado' THEN 1
            END
        ) AS cantidad_compras_canceladas,
        SUM(
            CASE
                WHEN p.status = 'cancelado' THEN p.total
                ELSE 0
            END
        ) AS total_compras_canceladas,
        CASE
            WHEN COUNT(*) = 0 THEN 'No compras'
            WHEN COUNT(
                CASE
                    WHEN p.status = 'pagado' THEN 1
                END
            ) > COUNT(
                CASE
                    WHEN p.status = 'cancelado' THEN 1
                END
            ) THEN 'Excelente Comprador'
            ELSE 'No Excelente Comprador'
        END AS tipo_comprador
    FROM
        customer c
        LEFT JOIN purchase p ON c.id = p.customer_id
    WHERE
        c.branch_id = branch_id
    GROUP BY
        c.id;
END //
DELIMITER ;