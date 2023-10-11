-- Comando para selecionar o banco de dados;
USE sys;

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
SELECT * from sys_config sc WHERE sc.value < 100;