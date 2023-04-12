/* 1) Retorne em uma só consulta os valores de média, máximo, mínimo, contagem e soma do campo ‘total_price’ da tabela items. */

SELECT
AVG(total_price) AS media,
MAX(total_price) AS maximo,
MIN(total_price) AS minimo,
COUNT(total_price) AS contagem,
SUM(total_price) AS soma
FROM ecommerce.items;

/* 2) Retorne a quantidade de pedidos de cada status por dia, ordenando pelo dia, de forma decrescente. */

SELECT DATE(created_at) AS dia, status, COUNT(id) AS qtd_pedidos,
FROM `total-zodiac-379114.ecommerce.orders`
GROUP BY dia, status
ORDER BY dia DESC;

/* 3) Retorne a quantidade total de itens por pedido. */

SELECT COUNT(id) AS qtd_pedidos, order_id
FROM `ecommerce.items`
GROUP BY 2
ORDER BY order_id ASC;


/* 4) Na base de dados ‘covid19_italy’ e tabela ‘data_by_region’ encontre a coluna ‘new_total_confirmed_cases’. Retorne a soma de novos casos confirmados no dia 2021-06-11 (considerando todas as regiões). */

SELECT SUM(new_total_confirmed_cases) total_novos_casos_confirmados
FROM `bigquery-public-data.covid19_italy.data_by_region`
WHERE DATE(date) = "2021-06-11";
