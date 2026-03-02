-- Q1 - Listar todos Clientes que não tenham realizado uma compra
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  c.email,
  c.phone
FROM Sales.customers c
LEFT JOIN Sales.orders o
  ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

-- Q2 - Listar os Produtos que não tenham sido comprados
SELECT
  p.product_id,
  p.product_name
FROM Production.products p
LEFT JOIN Sales.order_items oi
  ON oi.product_id = p.product_id
WHERE oi.product_id IS NULL;

-- Q3 - Listar os Produtos sem Estoque (somando todas as lojas)
SELECT
  p.product_id,
  p.product_name
FROM Production.products p
LEFT JOIN Production.stocks s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COALESCE(SUM(s.quantity), 0) = 0;

-- Q4 - Agrupar a quantidade de vendas de uma determinada marca por loja
-- "Quantidade de vendas" aqui = total de itens vendidos (SUM(quantity))
SELECT 
    st.store_id,
    st.store_name,
    COUNT(DISTINCT o.order_id) AS total_sales
FROM Sales.orders o
JOIN Sales.order_items oi  ON o.order_id = oi.order_id
JOIN Production.products p ON oi.product_id = p.product_id
JOIN Production.brands b   ON p.brand_id = b.brand_id
JOIN Sales.stores st       ON st.store_id = o.store_id
WHERE b.brand_id = 1
GROUP BY st.store_id, st.store_name
ORDER BY total_sales DESC;


-- Q5 - Listar os Funcionarios que não estejam relacionados a um Pedido
SELECT
  sf.staff_id,
  sf.first_name,
  sf.last_name,
  sf.email,
  sf.phone
FROM Sales.staffs sf
LEFT JOIN Sales.orders o
  ON o.staff_id = sf.staff_id
WHERE o.order_id IS NULL
AND sf.active = 1;
