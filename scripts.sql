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

