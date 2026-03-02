--  Q1 - Listar todos Clientes que não tenham realizado uma compra;

SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  c.email,
  c.phone
from Sales.customers c
where not exists (
  select 1 
  from Sales.orders o
  where o.customer_id = c.customer_id
);
--===============================================================================
  
  -- Q2 -- Listar os Produtos que não tenham sido comprados
SELECT
  p.product_id
  p.product_name
FROM Productions.products p
WHERE NOT EXISTS (
  SELECT 1
  FROM Sales.order_items oi
  WHERE oi.product_id = p.product_id
);
  --=============================================================================

  --Q3-- - Listar os Produtos sem Estoque;
SELECT
  p.product_id
  p.product_name
  p.brand_name,
  SUM(s.quantity) AS TotalStock
FROM Productions.products p
JOIN Productions.stock s
  on s.product_id = p.product_id 
GROUP BY p.product_id, p.product_name
HAVING SUM(s.quantity) > 0
ORDER BY Totalstock DESC;

  --=============================================================================

--Q4--Agrupar a quantidade de vendas que uma determinada Marca por Loja.


SELECT 
  st.store_id,
  st.store_name,
  b.brand_name,
  SUM(oi.quantity) AS TotalItemsSold
FROM Sales.orders o
JOIN Sales.order_items oi ON oi.order_id = o.order_id
JOIN Productions.products p ON p.product_id = oi.product_is
Join Productions.brands b ON b.brand_id = p.brand_id
JOIN Sales.stores ON st.store_id = o.store_id
WHERE b.brand_id = "guid"
GROUP BY st.store_id, st.store_name, b.brand_name
ORDER BY st.store_name, TotalItemsSold DESC;

  --=============================================================================

--Q5 --Listar os Funcionarios que não estejam relacionados a um Pedido.
SELECT 
   sf.staff_id
   sf.first_name,
   sf.last_name,
   sf.email,
   sf.phone,
   FROM Sales.staff sf
  WHERE sf.active= 1 AND NOT EXISTS (
    SELECT 1
    FROM Sales.orders o
    WHERE o.staff_id = sf.staff_id
  );

--TODAS AS QUERIES ESTAO FUNCIONANDO;)
--Listar todos Clientes que não tenham realizado uma compra;
--Listar os Produtos que não tenham sido comprados
--Listar os Produtos sem Estoque;
--Agrupar a quantidade de vendas que uma determinada Marca por Loja.
--Listar os Funcionarios que não estejam relacionados a um Pedido.
