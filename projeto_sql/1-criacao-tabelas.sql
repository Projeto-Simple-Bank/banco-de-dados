CREATE DATABASE DB_SIMPLE_BANK;
USE DB_SIMPLE_BANK;
GO

-- FUNÇÃO (ENVIAR, RECEBER E ATUALIZAR)
-- CADASTRAR O USUÁRIO (ADMIN SE CADASTRA E CADASTRA O CLIENTE)
-- ADMIN ATUALIZA AS INFORMACOES DO CLIENTE
-- VISUALIZAR PERFIL CLIENTE
-- VISUALIZAR UM NOVO USUÁRIO NA TELA DE ADMIN (APROVAR OU RECUSAR O NOVO USUÁRIO)
CREATE TABLE TB_USUARIO (
	ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(), -- GERADOR DE ID
	NOME VARCHAR(100) NOT NULL,
	CPF VARCHAR(14) NOT NULL,
	RG VARCHAR(12) NOT NULL,
	TELEFONE VARCHAR(15) NOT NULL,
	TIPO_USUARIO INT NOT NULL, -- 1 ADMIN, 2 CLIENTE (NÃO TEM NA TABELA DO BACK)
	-- NAO PRECISA SER OBRIGATÓRIO, POR CAUSA DO ADMIN
	CEP VARCHAR(9),
	RUA VARCHAR(50),
	BAIRRO VARCHAR(50), 
	NUMERO INT,
	CIDADE VARCHAR(50),
	ESTADO VARCHAR(50)
)

-- FUNÇÃO (AUTENTICAR-ENVIAR)
-- LOGAR O ADM
CREATE TABLE TB_ADMIN (
	ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(), -- GERADOR DE ID
	ID_USUARIO UNIQUEIDENTIFIER,
	EMAIL VARCHAR(100) NOT NULL,
	SENHA VARCHAR(30) NOT NULL,
	FOREIGN KEY(ID_USUARIO) REFERENCES TB_USUARIO(ID)
)

-- FUNÇÃO (ENVIAR, AUTENTICAR, RECEBER)
-- CADASTRAR O CLIENTE
-- LOGIN DO CLIENTE
-- VISUALIZAR O USUÁRIO NO DASHBOARD/PAGINA PRINCIPAL
-- VISUALIZAR O USUÁRIO NA TELA DO ADMIN VINCULADO COM A TABELA TB_USUARIOS
CREATE TABLE TB_CONTA (
	ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	ID_USUARIO UNIQUEIDENTIFIER,
	-- TIPO_CONTA NÃO PRECISA SER OBRIGATÓRIO, PORQUE VAI LOGAR O USUÁRIO
	TIPO_CONTA INT, -- 1 SIMPLES, 2 ESPECIAL
	AGENCIA INT,
	ATIVA BIT DEFAULT 0,
	-- SALDO NÃO PRECISA SER OBRIGATÓRIO, PORQUE VAI LOGAR O USUÁRIO
	SALDO FLOAT DEFAULT 0.00,
	CONTA VARCHAR(100) NOT NULL,
	SENHA VARCHAR(30) NOT NULL,
	FOREIGN KEY(ID_USUARIO) REFERENCES TB_USUARIO(ID)
)

-- FUNÇÃO (ENVIAR E RECEBER)
-- VISUALIZAR UMA LISTA DE TRANSACOES
-- VISUALIZAR UM COMPROVANTE DE PAGAMENTO
-- EFETUAR UM PAGAMENTO (PIX E TED)
CREATE TABLE TB_TRANSACAO (
	ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	ID_CONTA UNIQUEIDENTIFIER,
	TIPO_TRANSACAO INT NOT NULL, -- DEFINE 1 BOLETO, 2 PIX E 3 TED
	TIPO_OPERACAO INT NOT NULL, -- DEFINE 1 DÉBITO, 2 CRÉDITO (NÃO TEM NA TABELA DO BACK)
	VALOR FLOAT NOT NULL,
	DESCRICAO VARCHAR(200),
	DATA_TRANSACAO varchar(10), 
	HORA varchar(5), -- NÃO TEM NA TABELA DO BACK
	FOREIGN KEY(ID_CONTA) REFERENCES TB_CONTA(ID)
)

-- FUNÇÃO (ENVIAR E RECEBER)
-- CRIAR BOLETO
-- PAGAR BOLETO
-- PROCURAR BOLETO PELO O CÓDIGO
-- EMITIR COMPROVANTE BOLETO
CREATE TABLE TB_BOLETO (
	ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	VALOR FLOAT NOT NULL, 
	STATUS_BOLETO BIT DEFAULT 0,
	DATA_VENCIMENTO varchar(10), -- not null?
	CODIGO_DE_BARRAS varchar(100) NOT NULL,
	BENEFICIARIO VARCHAR(100) NOT NULL,
)

-- FUNÇÃO (ENVIAR E RECEBER)
-- CRIAR CHAVE PIX
-- LISTAR CHAVE PIX
-- PROCURAR CHAVE PIX
CREATE TABLE TB_PIX (
	ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	ID_CONTA UNIQUEIDENTIFIER,
	CHAVE_PIX VARCHAR(200) NOT NULL,
	FOREIGN KEY(ID_CONTA) REFERENCES TB_CONTA(ID)
)

SELECT * FROM TB_USUARIO
SELECT * FROM TB_ADMIN
SELECT * FROM TB_CONTA
SELECT * FROM TB_TRANSACAO
SELECT * FROM TB_BOLETO
SELECT * FROM TB_PIX
