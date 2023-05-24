-- Q01 - Identificar os 3 produtos mais vendidos 

SELECT Nome, 
		SUM(Quantidade) AS `Total de Vendas`
FROM Item 
JOIN Produto ON Produto_Código = Código
GROUP BY Produto_Código
ORDER BY `Total de Vendas` DESC
LIMIT 3;

-- Q02 - Identificar os 3 produtos menos vendidos

SELECT Nome, 
		SUM(Quantidade) AS `Total de Vendas`
FROM Item 
JOIN Produto ON Produto_Código = Código
GROUP BY Produto_Código
ORDER BY `Total de Vendas`
LIMIT 3;

-- Q03 - Visualizar os 3 pedidos mais caros

SELECT Número AS `Número do Pedido`, 
       CONCAT('R$ ', FORMAT(SUM(Quantidade * Valor), 2)) AS `Valor Total`
FROM Pedido 
JOIN Item ON Número = Pedido_Número
JOIN Produto pr ON Produto_Código = Código
GROUP BY Número
ORDER BY SUM(Quantidade * Valor) DESC
LIMIT 3;

-- Q04 - Visualizar o ticket médio de compras

SELECT CONCAT('R$ ', ROUND(AVG(`Valor Total`), 2)) AS `Ticket Médio`
FROM ( 
  SELECT Número AS `Número do Pedido`, 
			SUM(Quantidade * Valor) AS `Valor Total`
  FROM Pedido
  JOIN Item ON Número = Pedido_Número
  JOIN Produto ON Produto_Código = Código
  GROUP BY Número
) AS subquery;

-- Q05 - Identificar os 2 clientes que mais compram

SELECT Nome, 
		COUNT(`Cliente_ClienteID`) AS Compras
FROM Pedido
JOIN Cliente ON ClienteID = Cliente_ClienteID
GROUP BY Cliente_ClienteID
ORDER BY Compras DESC
LIMIT 2;

-- Q06 - Identificar os 2 clientes que menos compram

SELECT Nome, 
		COUNT(`Cliente_ClienteID`) AS Compras
FROM Pedido
JOIN Cliente ON ClienteID = Cliente_ClienteID
GROUP BY Cliente_ClienteID
ORDER BY Compras
LIMIT 2;

-- Q07 - Visualizar idade média de fãs

SELECT CONCAT(ROUND(AVG(TIMESTAMPDIFF(YEAR, `Data de Nascimento`, CURDATE()))), ' anos') AS IdadeMedia
FROM Cliente;


-- Q08 - Visualizar preferências de compra por faixa etária

SELECT
	CASE
    WHEN TIMESTAMPDIFF(YEAR, `Data de Nascimento`, CURDATE()) BETWEEN 18 AND 25 THEN '18-25'
    WHEN TIMESTAMPDIFF(YEAR, `Data de Nascimento`, CURDATE()) BETWEEN 26 AND 35 THEN '26-35'
    WHEN TIMESTAMPDIFF(YEAR, `Data de Nascimento`, CURDATE()) BETWEEN 36 AND 45 THEN '36-45'
    ELSE '46+'
  END AS FaixaEtaria,
  Produto.Nome AS Produto,
  COUNT(*) AS `Total de Pedidos`
FROM  Cliente
JOIN  Pedido  ON ClienteID = Cliente_ClienteID
JOIN  Item ON Número = Pedido_Número
JOIN  Produto ON Produto_Código = Código
GROUP BY  FaixaEtaria, Produto
ORDER BY  FaixaEtaria, `Total de Pedidos` DESC;

-- Q09 - Visualizar preferências de compra por sexo

SELECT Sexo,
		Produto.Nome AS Produto,
        COUNT(*) AS `Total de Pedidos`
FROM Cliente
JOIN Pedido ON ClienteID = Cliente_ClienteID
JOIN Item ON Número = Pedido_Número
JOIN Produto  ON Produto_Código = Código
GROUP BY Produto, Sexo
ORDER BY Sexo, `Total de Pedidos` DESC;


-- Q10 - Visualizar hobbies mais comuns entre fãs

SELECT Nome AS Hobby, 
		COUNT(*) AS `Total de Clientes`
FROM Hobby
JOIN `Cliente/Hobby` ON HobbyID = Hobby_HobbyID
GROUP BY Nome
ORDER BY `Total de Clientes` DESC;

-- Q11 - Visualizar total de compras por cidade

SELECT Cidade, 
		COUNT(*) AS `Total de Clientes`
FROM Cliente
JOIN Pedido ON ClienteID = Cliente_ClienteID 
GROUP BY Cidade
ORDER BY `Total de Clientes` DESC;


-- Q12 - Visualizar total de vendas por período

SELECT YEAR(`Data`) AS `Ano`,
       MONTH(`Data`) AS `Mês`,
       SUM(`Quantidade`) AS `Total de Vendas`
FROM Pedido
JOIN Item ON Número = Pedido_Número
GROUP BY YEAR(`Data`), MONTH(`Data`)
ORDER BY YEAR(`Data`), MONTH(`Data`);

-- Q13 - Visualizar valor de vendas por período

SELECT YEAR(`Data`) AS `Ano`,
       MONTH(`Data`) AS `Mês`,
       CONCAT('R$ ', FORMAT(SUM(`Quantidade` * `Valor`),2)) AS `Total de Vendas`
FROM Pedido
JOIN Item ON Número = Pedido_Número
JOIN Produto ON Produto_Código = Código
GROUP BY YEAR(`Data`), MONTH(`Data`)
ORDER BY YEAR(`Data`), MONTH(`Data`);

-- Q14 - Visualizar fornecedor com mais vendas

SELECT CNPJ,
		Nome, 
        SUM(Quantidade) AS `Total de Vendas`
FROM Fornecedor
JOIN `Fornecedor/Produto` ON CNPJ = Fornecedor_CNPJ
JOIN Item ON `Fornecedor/Produto`.Produto_Código = Item.Produto_Código
GROUP BY CNPJ, Nome
ORDER BY SUM(Quantidade) DESC;

-- Q15 - Visualizar fornecedor mais rentável

SELECT Fornecedor.Nome AS Fornecedor, 
		SUM(Quantidade * Valor) AS `Receita Total`
FROM Fornecedor
JOIN `Fornecedor/Produto` ON CNPJ = Fornecedor_CNPJ
JOIN Produto ON Produto_Código = Código
JOIN Item ON Código = item.Produto_Código
JOIN Pedido ON Pedido_Número = Número
GROUP BY Fornecedor
ORDER BY `Receita Total` DESC;

-- Q16 - Visualizar total de clientes por fornecedor

SELECT Nome AS Fornecedor, COUNT(Cliente_ClienteID) AS `Total de Clientes`
FROM Fornecedor
JOIN `Cliente/Fornecedor` ON CNPJ = Fornecedor_CNPJ
GROUP BY Nome
ORDER BY `Total de Clientes` DESC;
