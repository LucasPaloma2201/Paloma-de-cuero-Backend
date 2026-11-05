INSERT INTO users (id, nombre, email, password, rol) VALUES
  (1, 'Paloma', 'paloma@palomadecuero.com', 'admin123', 'admin'),
  (2, 'María López', 'maria.lopez@email.com', 'cliente123', 'cliente'),
  (3, 'Juan Pérez', 'juan.perez@email.com', 'cliente123', 'cliente'),
  (4, 'Lucía Fernández', 'lucia.fernandez@email.com', 'cliente123', 'cliente'),
  (5, 'Mateo García', 'mateo.garcia@email.com', 'cliente123', 'cliente'),
  (6, 'Sofía Ruiz', 'sofia.ruiz@email.com', 'cliente123', 'cliente');

INSERT INTO products (id, nombre, descripcion, precio, stock) VALUES
  (1, 'Cartera', 'Cartera de cuero hecha a mano', 85000.00, 6),
  (2, 'Bolsos', 'Bolso de cuero hecho a mano', 72000.00, 5),
  (3, 'Chalecos', 'Chaleco de cuero hecho a mano', 95000.00, 4),
  (4, 'Pechera', 'Pechera de cuero hecha a mano', 68000.00, 4),
  (5, 'Pollera', 'Pollera de cuero hecha a mano', 88000.00, 3),
  (6, 'Cintos', 'Cinto de cuero hecho a mano', 28000.00, 10),
  (7, 'Pollera con flecos', 'Pollera de cuero con flecos, hecha a mano', 99000.00, 3),
  (8, 'Fajas con flecos', 'Faja de cuero con flecos, hecha a mano', 35000.00, 8);

INSERT INTO orders (id, user_id, fecha, estado, total) VALUES
  (1, 2, '2026-10-02', 'pagado', 85000.00),
  (2, 3, '2026-10-08', 'pendiente', 100000.00),
  (3, 4, '2026-10-15', 'entregado', 95000.00),
  (4, 5, '2026-10-21', 'pagado', 99000.00),
  (5, 6, '2026-11-01', 'pendiente', 103000.00);

INSERT INTO order_items (id, order_id, product_id, cantidad, precio_unitario) VALUES
  (1, 1, 1, 1, 85000.00),
  (2, 2, 2, 1, 72000.00),
  (3, 2, 6, 1, 28000.00),
  (4, 3, 3, 1, 95000.00),
  (5, 4, 7, 1, 99000.00),
  (6, 5, 4, 1, 68000.00),
  (7, 5, 8, 1, 35000.00);

SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('products_id_seq', (SELECT MAX(id) FROM products));
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM orders));
SELECT setval('order_items_id_seq', (SELECT MAX(id) FROM order_items));