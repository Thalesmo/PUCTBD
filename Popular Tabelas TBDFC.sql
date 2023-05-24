-- Populando a tabela `Clube`
INSERT INTO `TBDFC`.`Clube` (`CNPJ`, `Nome`) VALUES
(1, 'TBD FC');


-- Populando a tabela `Fornecedor`
INSERT INTO `TBDFC`.`Fornecedor` (`CNPJ`, `Nome`) VALUES
(2, 'Socio Torcedor'),
(3, 'Loja Online'),
(4, 'Bilheteria');

-- Populando a tabela `Clube/Fornecedor`
INSERT INTO `TBDFC`.`Clube/Fornecedor` (`Fornecedor_CNPJ`, `Clube_CNPJ`) VALUES
(2, 1),
(3, 1),
(4, 1);

-- Populando a tabela `Produto`
INSERT INTO `TBDFC`.`Produto` (`Código`, `Nome`, `Cor`, `Tamanho`, `Valor`) VALUES
(1, 'Torcedor Premium', NULL, NULL, 20.00),
(2, 'Torcedor Exclusivo', NULL, NULL, 10.00),
(3, 'Camisa', 'Roxo', 'G', 100.00),
(4, 'Caneca', 'Amarelo', NULL, 15.00),
(5, 'Boné', 'Roxo', 'M', 30.00),
(6, 'Bandeira', 'Roxo', NULL, 40.00),
(7, 'Cadeiras', NULL, NULL, 50.00),
(8, 'Arquibancadas', NULL, NULL, 25.00);

-- Populando a tabela `Fornecedor/Produto`
INSERT INTO `TBDFC`.`Fornecedor/Produto` (`Fornecedor_CNPJ`, `Produto_Código`) VALUES
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8);

-- Populando a tabela `Cliente`
INSERT INTO `TBDFC`.`Cliente` (`ClienteID`, `Nome`, `Sobrenome`, `CPF`, `Sexo`, `Telefone`, `Data de Nascimento`, `Rua`, `Bairro`, `Cidade`, `Nº`) VALUES
(1, 'João', 'Silva', 123456789, 'M', '(23)-99456-7890', '1990-01-01', 'Rua A', 'Bairro X', 'Cidade Y', '123'),
(2, 'Maria', 'Santos', 987654321, 'F', '(32)-99654-3210', '1995-02-02', 'Rua B', 'Bairro Y', 'Cidade Z', '456'),
(3, 'Pedro', 'Almeida', 555555555, 'M', '(61)-99555-5555', '1985-03-03', 'Rua C', 'Bairro Z', 'Cidade X', '789'),
(4, 'Carol', 'Oliveira', 888888888, 'F', '(61)-99566-5577', '1975-04-05', 'Rua D', 'Bairro O', 'Cidade X', '61'),
(5, 'José', 'Mattos', 452987631, 'M', '(61)-99588-5588', '2000-03-09', 'Rua E', 'Bairro P', 'Cidade Y', '52');

-- Populando a tabela `Pedido`
INSERT INTO `TBDFC`.`Pedido` (`Número`, `Data`, `Nota Fiscal`, `Cliente_ClienteID`) VALUES
(1, '2023-01-01', 'NF01', 1),
(2, '2023-01-02', 'NF02', 2),
(3, '2023-02-03', 'NF03', 3),
(4, '2023-02-04', 'NF04', 4),
(5, '2023-03-05', 'NF05', 5),
(6, '2023-03-06', 'NF06', 1),
(7, '2023-04-07', 'NF07', 2),
(8, '2023-04-08', 'NF08', 1),
(9, '2023-04-09', 'NF09', 4),
(10, '2023-04-10', 'NF10', 5),
(11, '2023-05-11', 'NF11', 1),
(12, '2023-05-12', 'NF12', 2);

-- Populando a tabela `Item`
INSERT INTO `TBDFC`.`Item` (`Pedido_Número`, `Produto_Código`, `Quantidade`) VALUES
(1 , 1, 2),
(1 , 2, 2),
(2 , 2, 2),
(3 , 3, 1),
(3 , 4, 4),
(4 , 6, 2),
(5 , 7, 2),
(5 , 8, 2),
(6 , 4, 4),
(7 , 6, 2),
(8 , 8, 2),
(9 , 7, 2),
(9 , 8, 2),
(10 , 3, 1),
(10 , 4, 4),
(10 , 5, 3),
(11 , 1, 1),
(12 , 4, 4),
(12 , 6, 2);

-- Populando a tabela `Cliente/Fornecedor`
INSERT INTO `TBDFC`.`Cliente/Fornecedor` (`Cliente_ClienteID`, `Fornecedor_CNPJ`) VALUES
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 3),
(3, 4),
(4, 3),
(4, 4),
(5, 3),
(5, 4);

-- Populando a tabela `Hobby`
INSERT INTO `TBDFC`.`Hobby` (`HobbyID`, `Nome`) VALUES
(1, 'Série'),
(2, 'Cinema'),
(3, 'Futebol');

-- Populando a tabela `Cliente/Hobby`
INSERT INTO `TBDFC`.`Cliente/Hobby` (`Hobby_HobbyID`, `Cliente_ClienteID`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 3),
(2, 4),
(1, 5);