DROP  DATABASE IF EXISTS bd;
CREATE DATABASE bd;
USE bd;

CREATE TABLE produtos(
ID INT PRIMARY KEY AUTO_INCREMENT ,
NOME VARCHAR (100) NOT NULL,
PRECO DECIMAL (10,2) NOT NULL ,
ESTOQUE INT NOT NULL ,
DESCRICAO TEXT
);

-- LETRA A 
CREATE USER 'dev_junior'@'%'  IDENTIFIED BY '1234';
-- LETRA B --
GRANT SELECT ON bd.* TO 'dev_junior'@'%';
-- LETRA C -- 
GRANT INSERT ON bd.* TO 'dev_junior'@'%';
-- LETRA D --
REVOKE SELECT,INSERT ON bd.* FROM 'dev_junior'@'%';

-- PARTE 2 A --
CREATE ROLE 'role_vendas';
-- LETRA B --
GRANT SELECT(nome,preco) ON bd.produtos to 'role_vendas';
-- LETRA C --
CREATE USER 'vendedor_1'@'%';
GRANT 'role_vendas' TO 'vendedor_1'@'%';
SET DEFAULT ROLE 'role_vendas' TO 'vendedor_1'@'%'; 
-- LETRA D --
-- Nao conseguira ter acesso a informacoes que  nao sejam da coluna nome e preco devido a isso vai ter um erro de acesso --

SHOW GRANTS FOR 'role_vendas'@'%';
SHOW GRANTS FOR 'vendedor_1'@'%';
