-- Comando para selecionar o banco de dados;
USE curso;


-- Criar a tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Inserir 50 usuários de exemplo
INSERT INTO usuarios (nome, email) VALUES ('Alice Johnson', 'alice.johnson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Bob Smith', 'bob.smith@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Charlie Brown', 'charlie.brown@example.com');
INSERT INTO usuarios (nome, email) VALUES ('David Lee', 'david.lee@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Emily Davis', 'emily.davis@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Frank Williams', 'frank.williams@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Grace Taylor', 'grace.taylor@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Henry Clark', 'henry.clark@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Isabella Moore', 'isabella.moore@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Jack Anderson', 'jack.anderson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Katherine Martin', 'katherine.martin@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Liam White', 'liam.white@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Mia Martinez', 'mia.martinez@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Noah Harris', 'noah.harris@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Olivia Davis', 'olivia.davis@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Patrick Johnson', 'patrick.johnson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Quinn Lee', 'quinn.lee@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Riley Clark', 'riley.clark@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Sophia Brown', 'sophia.brown@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Thomas Taylor', 'thomas.taylor@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Uma Wilson', 'uma.wilson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Victor Anderson', 'victor.anderson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Wendy Harris', 'wendy.harris@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Xavier Martinez', 'xavier.martinez@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Yara Davis', 'yara.davis@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Zane White', 'zane.white@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Amy Adams', 'amy.adams@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Benjamin Smith', 'benjamin.smith@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Chloe Johnson', 'chloe.johnson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Daniel Clark', 'daniel.clark@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Ella Taylor', 'ella.taylor@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Felix Brown', 'felix.brown@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Grace Miller', 'grace.miller@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Henry Davis', 'henry.davis@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Isabella Johnson', 'isabella.johnson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Jack Robinson', 'jack.robinson@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Katherine Adams', 'katherine.adams@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Liam Thomas', 'liam.thomas@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Mia Turner', 'mia.turner@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Noah Mitchell', 'noah.mitchell@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Olivia Bennett', 'olivia.bennett@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Patrick Reed', 'patrick.reed@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Quinn Carter', 'quinn.carter@example.com');
INSERT INTO usuarios (nome, email) VALUES ('Riley Harrison', 'riley.harrison@example.com');

-- Selecionar algumas colunas do meu BD
SELECT set_time, set_by  FROM sys_config;

-- Comando para secionar todos as colunas da tabela 
SELECT * FROM sys_config;

-- Comando para ordenar pela coluna
SELECT sc.set_time FROM sys_config sc ORDER BY sc.set_time;

-- Comando para fazer comparação do valor e assim realizar filtro
SELECT * from sys_config sc WHERE sc.variable = "diagnostics.allow_i_s_tables";
SELECT * from sys_config sc WHERE sc.value < 100;

-- Podemos também estar limitando quantas rows ele vai retornar
SELECT * from sys_config sc WHERE sc.value < 100 LIMIT 1;

-- Alterando tabela na exibição
SELECT id*10 as "Valor da compra", name FROM payments WHERE name == "Compra Carro";

-- WHERE
SELECT * FROM payments WHERE id*10 == 20;
SELECT * FROM payments WHERE id*10 > 20;
SELECT * FROM payments WHERE id*10 < 20;

-- WHERE AND ORDER BY
SELECT * FROM payments ORDER BY id DESC;
SELECT * FROM payments ORDER BY id ASC;

-- AND, OR,  NOT
SELECT * FROM payments WHERE id%2 <> 0 AND name == "Compra de moto";
SELECT * FROM payments WHERE id%2 <> 0 OR name == "Compra de Carro";
SELECT * FROM payments WHERE id%2 <> 0 AND NOT name == "Compra de moto";

-- IN
SELECT * FROM Shippings WHERE shipping_id IN (1, 3, 5);

-- BETWEEN
SELECT * FROM Shippings WHERE customer BETWEEN 2 AND 5;

-- LIKE
SELECT * FROM Shippings WHERE status LIKE "P%";

CREATE TABLE IF NOT EXISTS clientes (
	id INTEGER NOT NULL,
    name VARCHAR,
    PRIMARY KEY (id)
);

-- Inserindo vários valores
INSERT INTO clientes (id, name) VALUES (1, "RUan"),(2, "Carla"), (3, null)

-- Para fazer where com o null é necessário usar o is null e não == null
SELECT * FROM clientes WHERE name IS NULL;

-- Definindo limite de retorno de dados
SELECT * FROM clientes LIMIT 2;

-- Denindo limite e pulando o primeiro
SELECT * FROM clientes LIMIT 1, 3

-- Utilizando REGEXP(Regular Expression)

-- Tem a letra a 
SELECT * FROM clientes WHERE name REGEXP "a";

-- Começam com A e C
SELECT * FROM clientes WHERE name REGEXT "^a|^d"

-- Tem a combinação UA e CA
SELECT * FROM clientes WHERE name REGEXP "[uc]a"

-- Começa com ca ou ra
SELECT * FROM clientes WHERE name REGEXT "^[cr]a"

CREATE TABLE IF NOT EXISTS pagamentos (
  cliente_id INTEGER NOT NULL,
  observation VARCHAR
);

CREATE TABLE IF NOT EXISTS saldos (
  cliente_id INTEGER NOT NULL,
  valor FLOAT
);

INSERT INTO pagamentos (cliente_id, observation) VALUES (1, "Compra de carro");
INSERT INTO saldos (cliente_id, valor) VALUES (1, 1000.00);

-- Unindo tabelas com JOIN
SELECT * FROM clientes JOIN pagamentos ON clientes.id == pagamentos.cliente_id;

-- Unindo tabelas e definindo quais campos aparecerão
SELECT clientes.id, clientes.name, pagamentos.observation FROM clientes JOIN pagamentos ON clientes.id == pagamentos.cliente_id;

-- Adicionamento apelido (ALIAS) a nosso filtragem juntamente com o JOIN
SELECT c.id, c.name, p.observation FROM clientes c JOIN pagamentos p ON c.id == p.cliente_id;

-- Listando mais de 2 tabelas com o JOIN
SELECT 
c.id, c.name, p.observation, s.valor
FROM clientes c 
JOIN pagamentos p ON c.id == p.cliente_id
JOIN saldos s ON c.id == s.cliente_id;

CREATE table cidade (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

CREATE TABLE cidadao (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  id_cidade INTEGER
);

-- Várias Inserções
INSERT INTO cidade (name) VALUES ("araraquara"),("São carlos"),("Boa esperança do sul"),("Goianese");
INSERT INTO cidadao VALUES (DEFAULT, "Ruan", 2);

-- Realizando cópia de tabela	
CREATE TABLE cidade_backup AS SELECT * FROM cidade;

-- Realizando a remoção de uma tabela 
DROP TABLE cidade_backup;
-- Realizando a remoção de todos os dados da tabela
TRUNCATE TABLE cidade_backup;

-- Atualizando dados da tabela
UPDATE cidade SET name = "Ferreiro Rocher" WHERE id = 1;

-- Deletando dados da tabela
DELETE FROM cidade WHERE id = 1;

-- Maior Menor e Média
SELECT MAX(id) as "Maior ID" FROM cidade;
SELECT MIN(id) as "Menor ID" FROM cidade;
SELECT AVG(id) as "Média dos IDs" FROM cidade;

-- Soma dos IDS
SELECT SUM(id) as "Soma de IDS", COUNT(id) as "Número de cidades" FROM cidade;

-- Soma dos IDS com filtro de IDS maior que 2
SELECT SUM(id) as "Soma de IDS", COUNT(id) as "Número de cidades" FROM cidade WHERE id > 2;

INSERT INTO cidade VALUES (6, "araraquara"); 

-- Id de cada um vezes 1000 agrupados por id
SELECT id*1000 as "ID da galera" FROM cidade GROUP BY (id) ORDER BY id DESC;

-- JOIN
SELECT cidadao.id, cidadao.name, cidade.name as "Cidade do residente" FROM cidadao JOIN cidade ON cidadao.id_cidade = cidade.id;

-- HAVING filtrando com o having que ajuda na filtragem dos grupos
SELECT name FROM cidade GROUP BY (id) HAVING id > 4;

-- Criando banco de dados chamado relacionamentos
CREATE SCHEMA relacionamentos;

-- Selecionando o banco de dados criado
USE relacionamentos;

-- Criando a tabela de funcionarios
CREATE TABLE funcionarios(
  fun_id INT AUTO_INCREMENT,
  fun_nome VARCHAR(100) NOT NULL,
  fun_sexo ENUM("M", "F") NOT NULL DEFAULT "M",
  fun_salario DECIMAL(10, 2),
  
  PRIMARY KEY (fun_id)
);

DESC funcionarios;

-- Criando a tabela de conjuge
CREATE TABLE conjuge(
 conj_id INT AUTO_INCREMENT,
 conj_nome VARCHAR(100),
 conj_data_nasc DATE,
 fun_id int UNIQUE,
 
  PRIMARY KEY (conj_id),
  FOREIGN KEY(fun_id) REFERENCES funcionarios(fun_id),
  UNIQUE (fun_id)
);

DESC conjuge;

-- Criando Visualizações no SQL (views) - São consultas salvas em tabelas virtuais armazenadas.
USE sakila;
CREATE VIEW customers_view AS SELECT * FROM sakila.customer;
CREATE VIEW customers_actives AS SELECT * FROM sakila.customer WHERE active = 1;
CREATE VIEW customers_not_actives AS SELECT * FROM sakila.customer WHERE active != 1;

-- modificando view
CREATE OR REPLACE VIEW customer_actives AS SELECT * FROM sakila.customer WHERE active != 1;
SELECT * FROM customer_actives;

-- deletando view
DROP VIEW customers_not_actives;


-- Funções com Strings

-- Removendo espaços com a função TRIM()
SELECT TRIM('      Carros             ') as 'result';

-- Removendo espaços da esquerda com a função TRIM()
SELECT LTRIM('      Carros             ') as 'result';

-- Removendo espaços da direita com a função TRIM()
SELECT RTRIM('      Carros             ') as 'result';

-- Removendo todas Letras As do inicio
SELECT TRIM(BOTH 'a' FROM 'aaaaCarros') as 'result';

-- Removendo todas Letras As do inicio
SELECT TRIM(LEADING 'a' FROM 'aaaaCarrosaaaaaaaa') as 'result';

-- Removendo todas Letras As do final
SELECT TRIM(TRAILING 'a' FROM 'aaaaCarros') as 'result';

-- Procurando posição da letra o
SELECT LOCATE('o', 'Carros') as "Posição da letra O";

-- Deixando texto minúsculo
SELECT LCASE("CARROS") as "minúsculo";

-- Deixando texto maiúsculo
SELECT UCASE("carros") as "maiúsculo";

-- Descobrindo tamanho da string
SELECT LENGTH("carros");

-- Repetindo string
SELECT REPEAT("carros", 4);

-- Listando as 2 primeiras letras
SELECT LEFT("carros", 2);

-- Listando as 2 últimas letras
SELECT RIGHT("carros", 2);

-- Criando projeto de locadora de carros
CREATE DATABASE carros;

USE carros;

CREATE TABLE marcas (
	id INT NOT NULL AUTO_INCREMENT,
    nome_marca VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

DESCRIBE marcas;

ALTER TABLE marcas ADD origem VARCHAR(255);

CREATE TABLE inventario (
	id INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(255) NOT NULL,
    transmissao ENUM("manual", "automatico") NOT NULL,
    motor FLOAT NOT NULL,
    combustivel ENUM("gasolina", "alcool", "gas", "elétrico", "diesel", "flex"),
    marca_id INT NOT NULL,
    
    FOREIGN KEY (marca_id) REFERENCES marcas(id),
    PRIMARY KEY (id)
);

DESCRIBE inventario;

CREATE TABLE clientes (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    sobrenome VARCHAR(30),
    endereco VARCHAR(255),
    
    PRIMARY KEY (id)
);

DESCRIBE clientes;

INSERT INTO clientes (nome, sobrenome, endereco)
VALUES 
	("Ruan", "Rateira", "GPX / Rua das rosas / 106"),
	("Pedro", "Rafael", "GPX / Rua Rio de janeiro / 10"), 
    ("Gabriel", "Antonio", "GPX / Rua Minas gerais / 16"), 
	("Jonas", "Rateira", "GPX / Rua das rosas / 106"),  
    ("Edineia", "Rateira", "GPX / Rua das rosas / 106");


INSERT INTO marcas (nome_marca, origem)
VALUES
 ("BMW", "Alemanha"),
 ("Fiat", "ITaliana"),
 ("Mercedes-Benz", "Alemanha"),
 ("Renault", "França"),
 ("Jaguar", "Inglaterra"),
 ("Toyota", "Japão");

INSERT INTO inventario (modelo, transmissao, motor, combustivel, marca_id) VALUES
("Toyota Hilux", "manual", 2.3, "diesel", 6),
("Fiat Palio", "manual", 1.0, "gasolina", 2);

SELECT * FROM clientes;
