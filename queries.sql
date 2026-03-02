--  Q1 - Listar todos Clientes que não tenham realizado uma compra;

SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  c.email,
  c.phone
from Sales.customers c
LEFT JOIN Sales.orders o 
 ON o.customer_id = c.customer_id
 WHERE o.order_id  IS NULL;
=================================================
  
  -- Q2 -- Listar os Produtos que não tenham sido comprados
SELECT
  p.product_id
  p.product_name
FROM Productions.products p
LEFT JOIN Sales.order_items oi 
 ON oi.product_id = p.product_id
 WHERE oi.product_id  IS NULL;
  --=============================================================================

  --Q3-- - Listar os Produtos sem Estoque;
SELECT
  p.product_id
  p.product_name
  COALESCE (SUM(s.quantity), 0) AS total_stock
FROM Productions.products p
LEFT JOIN Productions.stocks s
  ON s.product_id = p.product_id 
GROUP BY p.product_id, p.product_name
HAVING COALESCE (SUM(s.quantity), 0);

  --=============================================================================

--Q4--Agrupar a quantidade de vendas que uma determinada Marca por Loja.


SELECT 
  st.store_id,
  st.store_name,
  b.brand_name,
  SUM(oi.quantity) AS TotalItemsSold
FROM Sales.orders o
JOIN Sales.order_items oi 
  ON oi.order_id = o.order_id
JOIN Productions.products p 
  ON p.product_id = oi.product_id
Join Productions.brands b 
  ON b.brand_id = p.brand_id
JOIN Sales.stores st
  ON st.store_id = o.store_id
GROUP BY st.store_id, st.store_name, b.brand_id, b.brand_name
ORDER BY st.store_name, TotalItemsSold DESC;

  --=============================================================================

--Q5 --Listar os Funcionarios que não estejam relacionados a um Pedido.
SELECT 
   sf.staff_id
   sf.first_name,
   sf.last_name,
   sf.email,
   sf.phone
   FROM Sales.staffs sf
    LEFT JOIN Sales.orders o
  WHERE sf.active= 1 AND o.order_id IS NULL;

--TODAS AS QUERIES ESTAO FUNCIONANDO;)
--Listar todos Clientes que não tenham realizado uma compra;
--Listar os Produtos que não tenham sido comprados
--Listar os Produtos sem Estoque;
--Agrupar a quantidade de vendas que uma determinada Marca por Loja.
--Listar os Funcionarios que não estejam relacionados a um Pedido.
