DROP DATABASE IF EXISTS bd ;
CREATE DATABASE bd;

CREATE TABLE bd.produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    descricao TEXT
);

CREATE USER 'dev_junior'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON bd.produtos TO 'dev_junior'@'localhost';
GRANT INSERT ON bd.produtos TO  'dev_junior'@'localhost';
REVOKE SELECT,INSERT ON bd.produtos FROM 'dev_junior'@'localhost';

CREATE ROLE 'role_vendas';
GRANT SELECT (nome,preco) ON bd.produtos TO 'role_vendas';
GRANT 'role_vendas' TO 'dev_junior'@'localhost';
SET DEFAULT ROLE 'role_vendas' TO 'dev_junior'@'localhost';


SHOW GRANTS FOR 'role_vendas';
SHOW GRANTS FOR 'dev_junior'@'localhost';

