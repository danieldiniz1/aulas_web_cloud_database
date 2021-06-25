-- 1� Listar o nome, sobrenome e email de todos os funcion�rios
SELECT f.nome, f.sobrenome, f.email FROM funcionarios f;

-- 2� Listar o nome, sobrenome e email de todos os funcion�rios que s�o representantes de vendas

SELECT f.nome, f.sobrenome, f.email FROM funcionarios f WHERE cargo Like '%Sales Rep%';

SELECT COUNT (*) FROM funcionarios f WHERE cargo = 'Sales Rep';

-- 3� Listar todos os cargos (sem repetir)

SELECT DISTINCT cargo FROM funcionarios f; 

-- 4� Listar todas as cidades (sem repetir) em que a empresa possui lojas

SELECT DISTINCT cidade FROM lojas l;

-- 5� Listar o nome, sobrenome e email , cidade, pa�s e telefone da loja do presidente da empresa

SELECT f.nome, f.sobrenome, f.email, l.cidade, l.pais, l.telefone 
FROM funcionarios f INNER JOIN lojas l 
ON f.codloja = l.codloja
WHERE f.cargo = 'President';

-- 6� Listar o produto com o maior pre�o
SELECT p.precosugerido FROM produtos p 
ORDER BY p.precosugerido DESC LIMIT 1;

-- 7� Listar o produto com menor pre�o
SELECT p.precosugerido FROM produtos p 
ORDER BY p.precosugerido LIMIT 1;

-- 8� Listar o produto com menor quantidade em estoque
SELECT p.nomeproduto FROM produtos p ORDER BY p.qtdestoque LIMIT 1;

-- 9� Listar o produto com maior quantidade em estoque
SELECT p.qtdestoque FROM produtos p ORDER BY p.qtdestoque DESC LIMIT 1;

-- 10� Listar produto e quantidade de vendas daquele produto

SELECT p.nomeproduto, SUM(d.quantidadepedida) AS QtdeVendas
FROM produtos p INNER JOIN detalhespedidos d 
ON p.codproduto = d.codproduto 
GROUP BY p.nomeproduto;


-- CHALLENGES
-- 1� Listar os clientes com maior quantidade de vendas. Exibir: Nome, Sobrenome, Cidade e Estado do Cliente e a quantidade de vendas dele

SELECT c.nomecliente, c.nomecontato, c.sobrenomecontato, c.cidade, c.estado, COUNT(p.numpedido) AS Qtdevendas
FROM clientes c INNER JOIN pedidos p 
ON c.numcliente = p.numcliente 
GROUP BY c.nomecliente, c.nomecontato, c.sobrenomecontato, c.cidade, c.estado 
ORDER BY COUNT(p.numpedido) DESC;

-- 2� Listar os produtos com maior quantidade de vendas. Exibir: Nome do Produto, Descri��o da Linha do Produto, Pre�o do Produto e Quantidade de Vendas

SELECT p.nomeproduto AS Produto, 
		p.descricaoproduto AS descricao,
		d.precounitario, SUM(d.quantidadepedida)
FROM produtos p INNER JOIN detalhespedidos d 
ON p.codproduto = d.codproduto 
GROUP BY p.nomeproduto, p.descricaoproduto, d.precounitario
ORDER BY SUM(d.quantidadepedida) DESC;

-- 3� Listar os funcion�rios que venderam mais (em quantidade pedidos). Exibir: Nome do funcion�rio, sobrenome, email e o superior dele.


