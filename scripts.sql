-- Comando para selecionar o banco de dados;
USE sys;

-- Selecionar algumas colunas do meu BD
SELECT set_time, set_by  FROM sys_config;

-- Comando para secionar todos as colunas da tabela 
SELECT * FROM sys_config;