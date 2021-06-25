-- 1º Listar o nome, sobrenome e email de todos os funcionários
SELECT f.nome, f.sobrenome, f.email FROM funcionarios f;

-- 2º Listar o nome, sobrenome e email de todos os funcionários que são representantes de vendas

SELECT f.nome, f.sobrenome, f.email FROM funcionarios f WHERE cargo Like '%Sales Rep%';

SELECT COUNT (*) FROM funcionarios f WHERE cargo = 'Sales Rep';

-- 3º Listar todos os cargos (sem repetir)

SELECT DISTINCT cargo FROM funcionarios f; 

-- 4º Listar todas as cidades (sem repetir) em que a empresa possui lojas

SELECT DISTINCT cidade FROM lojas l;

-- 5º Listar o nome, sobrenome e email , cidade, país e telefone da loja do presidente da empresa

SELECT f.nome, f.sobrenome, f.email, l.cidade, l.pais, l.telefone 
FROM funcionarios f INNER JOIN lojas l 
ON f.codloja = l.codloja
WHERE f.cargo = 'President';

-- 6º Listar o produto com o maior preço
SELECT p.precosugerido FROM produtos p 
ORDER BY p.precosugerido DESC LIMIT 1;

-- 7º Listar o produto com menor preço
SELECT p.precosugerido FROM produtos p 
ORDER BY p.precosugerido LIMIT 1;

-- 8º Listar o produto com menor quantidade em estoque
SELECT p.nomeproduto FROM produtos p ORDER BY p.qtdestoque LIMIT 1;

-- 9º Listar o produto com maior quantidade em estoque
SELECT p.qtdestoque FROM produtos p ORDER BY p.qtdestoque DESC LIMIT 1;

-- 10º Listar produto e quantidade de vendas daquele produto

SELECT p.nomeproduto, SUM(d.quantidadepedida) AS QtdeVendas
FROM produtos p INNER JOIN detalhespedidos d 
ON p.codproduto = d.codproduto 
GROUP BY p.nomeproduto;


-- CHALLENGES
-- 1º Listar os clientes com maior quantidade de vendas. Exibir: Nome, Sobrenome, Cidade e Estado do Cliente e a quantidade de vendas dele

SELECT c.nomecliente, c.nomecontato, c.sobrenomecontato, c.cidade, c.estado, COUNT(p.numpedido) AS Qtdevendas
FROM clientes c INNER JOIN pedidos p 
ON c.numcliente = p.numcliente 
GROUP BY c.nomecliente, c.nomecontato, c.sobrenomecontato, c.cidade, c.estado 
ORDER BY COUNT(p.numpedido) DESC;

-- 2º Listar os produtos com maior quantidade de vendas. Exibir: Nome do Produto, Descrição da Linha do Produto, Preço do Produto e Quantidade de Vendas

SELECT p.nomeproduto AS Produto, 
		p.descricaoproduto AS descricao,
		d.precounitario, SUM(d.quantidadepedida)
FROM produtos p INNER JOIN detalhespedidos d 
ON p.codproduto = d.codproduto 
GROUP BY p.nomeproduto, p.descricaoproduto, d.precounitario
ORDER BY SUM(d.quantidadepedida) DESC;

-- 3º Listar os funcionários que venderam mais (em quantidade pedidos). Exibir: Nome do funcionário, sobrenome, email e o superior dele.


