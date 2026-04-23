DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;
USE  banco ;
SET sql_safe_updates= 0 ;


CREATE TABLE investigacao 
(
ID INT PRIMARY KEY ,
NOME VARCHAR(100),
IDADE INT ,
PROFISSAO VARCHAR(100) ,
CIDADE VARCHAR(100) ,
ESTAVA_NA_SALA_DO_COFRE BOOLEAN ,
HORARIO_VISTO TIME ,
POSSUI_ALIBI BOOLEAN,
QUANTIDADE_EVIDENCIAS INT,
NIVEL_SUSPEITA INT 
);

DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;
USE banco;
SET sql_safe_updates = 0;

CREATE TABLE investigacao (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100),
    IDADE INT,
    PROFISSAO VARCHAR(100),
    CIDADE VARCHAR(100),
    ESTAVA_NA_SALA_DO_COFRE BOOLEAN,
    HORARIO_VISTO TIME,
    POSSUI_ALIBI BOOLEAN,
    QUANTIDADE_EVIDENCIAS INT,
    NIVEL_SUSPEITA INT 
);

INSERT INTO investigacao VALUES (1, 'Arthur Carvalho', 45, 'Empresario', 'Sao Paulo', TRUE, '23:00:00', FALSE, 3, 4);
INSERT INTO investigacao VALUES (2, 'Beatriz Moura', 34, 'Curadora de Arte', 'Campinas', FALSE, '22:45:00', TRUE, 1, 2);
INSERT INTO investigacao VALUES (3, 'Carlos Nogueira', 52, 'Colecionador', 'Sao Paulo', TRUE, '23:00:00', FALSE, 4, 5);
INSERT INTO investigacao VALUES (4, 'Daniela Rocha', 29, 'Jornalista', 'Santos', FALSE, '23:10:00', FALSE, 2, 3);
INSERT INTO investigacao VALUES (5, 'Eduardo Lima', 41, 'Advogado', 'Campinas', TRUE, '22:55:00', FALSE, 2, 4);
INSERT INTO investigacao VALUES (6, 'Fernanda Alves', 38, 'Arquiteta', 'Santos', FALSE, '22:40:00', TRUE, 0, 1);
INSERT INTO investigacao VALUES (7, 'Gustavo Prado', 47, 'Artista', 'Sao Paulo', TRUE, '23:00:00', FALSE, 3, 4);
INSERT INTO investigacao VALUES (8, 'Helena Duarte', 31, 'Restauradora de Arte', 'Campinas', FALSE, '22:50:00', TRUE, 1, 2);


UPDATE investigacao SET nivel_suspeita=0 WHERE ID = 2 ;
UPDATE investigacao SET CIDADE = 'Santa Rita do Sapucai'  WHERE NOME ='Helena Duarte';
UPDATE investigacao SET nivel_suspeita=nivel_suspeita+1;

DELETE  FROM  investigacao WHERE POSSUI_ALIBI=TRUE AND QUANTIDADE_EVIDENCIAS = 0 AND  NIVEL_SUSPEITA  = 0 ;
DELETE FROM investigacao WHERE NIVEL_SUSPEITA = 2 ;

SELECT * FROM investigacao ;
SELECT NOME,PROFISSAO FROM investigacao;
SELECT * FROM investigacao ORDER BY IDADE DESC;

SELECT * FROM investigacao WHERE ESTAVA_NA_SALA_DO_COFRE = TRUE;
SELECT * FROM investigacao WHERE NIVEL_SUSPEITA>3;
SELECT * FROM investigacao WHERE IDADE BETWEEN 30 AND 50 ;

SELECT * FROM investigacao WHERE NOME LIKE ('A%');
SELECT * FROM investigacao WHERE NOME LIKE('%O');
SELECT * FROM investigacao WHERE PROFISSAO LIKE('%Art%');

SELECT * FROM investigacao WHERE CIDADE  IN ('Sao Paulo','Campinas','Santos');

SELECT PROFISSAO ,COUNT(*) AS QUANTIDADE FROM investigacao GROUP BY PROFISSAO;

SELECT CIDADE, ROUND(AVG(NIVEL_SUSPEITA)) AS Media_por_Cidade FROM investigacao GROUP BY CIDADE ;
