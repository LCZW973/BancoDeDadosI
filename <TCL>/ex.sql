-- Exercícios

-- ================================================
-- BANCO: financeiro
-- ================================================
DROP DATABASE financeiro;
CREATE DATABASE financeiro;
USE financeiro;

CREATE TABLE contas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titular VARCHAR(100),
    saldo NUMERIC(10,2)
);

INSERT INTO contas (titular, saldo) VALUES
    ('Alice', 1500.00),
    ('Bruno', 200.00),
    ('Carla', 800.00);

-- Exercício 1 — COMMIT e ROLLBACK
-- Alice vai transferir R$ 300,00 para Bruno. Escreva a transação, confirme com COMMIT e consulte os saldos. Depois, refaça o exercício mas use ROLLBACK no final — o que muda?
   SET autocommit = 0 ;
   START TRANSACTION;
   SAVEPOINT inicio ;
   UPDATE  contas SET saldo = saldo - 300 WHERE id = 1 ;
   UPDATE  contas SET saldo = saldo + 300 WHERE id = 2 ;
   SELECT * FROM contas ;
   ROLLBACK TO inicio;
   
-- Exercício 2 — SAVEPOINT
-- Carla vai transferir R$ 100,00 para Alice e R$ 100,00 para Bruno. Crie um SAVEPOINT entre as duas operações. Desfaça apenas a segunda transferência com ROLLBACK TO e confirme o restante.

START TRANSACTION;
   SAVEPOINT inicio ;
   UPDATE  contas SET saldo = saldo -100 WHERE id = 3 ;
   UPDATE  contas SET saldo = saldo + 100 WHERE id = 1 ;
   SAVEPOINT meio ;
   UPDATE  contas SET saldo = saldo -100 WHERE id = 3 ;
   UPDATE  contas SET saldo = saldo + 100 WHERE id = 2 ; 
   SELECT * FROM contas ;
   ROLLBACK TO meio ;
