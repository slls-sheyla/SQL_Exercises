-- 1) Quero como resultado uma tabela que contenha o id, país e estado de todos os nossos clientes.

SELECT id, country, state
FROM ecommerce.customers;


-- 2) Selecione os preços distintos de nossos produtos, mas ordenados de forma decrescente, utilizando o DISTINCT e ORDER BY.

SELECT DISTINCT(price)
FROM `ecommerce.products`
ORDER BY price DESC;


-- 3) Retorne a data (naquele formato ANO-MÊS-DIA) de criação dos primeiros 5 registros da tabela customers.

SELECT DATE(created_at) AS dia
FROM ecommerce.customers
GROUP BY dia
LIMIT 5;


-- 4) O time de marketing deseja fazer uma campanha em um estado específico. Para isso, eles te pedem os e-mails de todos os clientes que moram no Piauí.

SELECT email
FROM ecommerce.customers
WHERE state = 'Piauí';


-- 5) Vá até a tabela items e retorne o campo ‘total_price’ de forma distinta, mas utilizando o GROUP BY.

SELECT total_price
FROM ecommerce.items
GROUP BY total_price;


-- 6) Selecione todos os pedidos em que o status é cancelado OU entrega_pendente. Retorne também o mesmo resultado, mas utilizando o operador IN.

SELECT *
FROM `ecommerce.orders`
WHERE (status = 'cancelado' OR status = 'entrega_pendente');

SELECT *
FROM `ecommerce.orders`
WHERE status IN ('cancelado', 'entrega_pendente');


-- 7) Retorne todos os registros em que o campo ‘additionals’ é nulo na tabela customers.

SELECT *
FROM `ecommerce.customers`
WHERE additionals IS NULL;


-- 8) Utilize o join para trazer a informação de status do pedido juntamente das informações (colunas) da tabela de itens. 

SELECT
pedido.status AS status_pedido,
itens.id AS id_itens,
itens.order_id AS order_id_itens,
itens.product_id AS product_id_itens,
itens.quantity AS quantity_itens,
itens.total_price AS total_price_itens
FROM ecommerce.orders AS pedido
JOIN ecommerce.items AS itens ON pedido.id = itens.order_id;


-- 9) Na tabela de pedidos, além das colunas existentes, quero também informações de nome do cliente e seu telefone.

SELECT
pedidos.id AS id_pedido,
pedidos.created_at AS created_at_pedido,
pedidos.customer_id AS customer_id_pedido,
pedidos.status AS status_pedido,
clientes.id AS id_cliente,
CONCAT (clientes.first_name, ' ' ,clientes.last_name) AS nome_clientes,
clientes.cell_phone AS cell_phone_cliente
FROM ecommerce.orders AS pedidos
JOIN ecommerce.customers AS clientes ON pedidos.customer_id = clientes.id;


-- 10) DESAFIO: Pesquise sobre o comando like e retorne os nomes dos produtos que tenham somente 4 caracteres.

SELECT name
FROM `ecommerce.products`
WHERE name LIKE '____';
