# BIKE STORES SQL CHALLENGE - COODESH

## Sobre o projeto
Este projeto consiste em solucionar o desafio técnico utilizando a base de dados  BIKE STORES, com objetivo de gerar métricas relevantes para a equipe de marketing e comercial.
As consultas foram desenvolvidas utilzando SQL,aplicando conceitos como Join, Group By, Order by e etc, utilizei agregações e filtros para permitir a busca com condicionais.
O foco principal foi demonstrar organização, clareza lógica e boas práticas na construção dessas consultas para que sejam realizadas de forma eficiente.


## TECNOLOGIAS UTILIZADAS
-DQL
-BANCO DE DADOS BIKE STORES
-GIT
-GITHUB

## OBJETIVO DAS CONSULTAS

Construir as seguintes consultas:

- Listar todos Clientes que não tenham realizado uma compra;
- Listar os Produtos que não tenham sido comprados
- Listar os Produtos sem Estoque;
- Agrupar a quantidade de vendas que uma determinada Marca por Loja. 
- Listar os Funcionarios que não estejam relacionados a um Pedido.

### PROCESSO DE INVESTIGAÇÃO

Para a construção da consulta foi realizada uma analise da  do modelo relacional da base da Bike Stores

-Relações da Customers com a Orders
-Relações entre a Orders e a Order_Items
-Relação entre a Products, Brands e Stocks
-Relaçãp entre Staffs e Orders

As Decisões incluíram :
-Utilização de 'Not Exists' para melhor performance
-Uso de JOIN e agregações como SUM, COUNT, para cálculos das métricas
-Aplicação de filtros como 'Active =1'
-Organização das consultas em um único arquivo 'queries.sql'


## COMO EXECUTAR
1.Ter acesso ao banco de dados da Bike Stores.
2.Abrir o arquivo'queries.sql'.
3.Executar as consultas em um client SQL( exemplo: Dbeaver, Datagrip ou algum similar).
