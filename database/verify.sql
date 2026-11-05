SELECT 'users' AS tabla, COUNT(*) AS registros FROM users
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
ORDER BY tabla;

SELECT id, nombre, precio, stock
FROM products
ORDER BY id;

SELECT
  o.id AS pedido,
  u.nombre AS clienta,
  o.estado,
  o.total,
  p.nombre AS producto,
  i.cantidad,
  i.precio_unitario
FROM orders AS o
JOIN users AS u ON u.id = o.user_id
JOIN order_items AS i ON i.order_id = o.id
JOIN products AS p ON p.id = i.product_id
ORDER BY o.id, i.id;