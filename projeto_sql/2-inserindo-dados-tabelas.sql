USE DB_SIMPLE_BANK;

-- INSERINDO/CADASTRANDO DADOS NA TABELA TB_USUARIO
INSERT INTO TB_USUARIO (NOME, CPF, RG, TELEFONE, EMAIL, CEP, RUA, BAIRRO, NUMERO) VALUES
('João Silva', '060.922.800-51', '494569475', '(31) 98765-4321', 'silva.joao@gmail.com', '30123-000', 'Rua das Flores', 'Centro', 123),
('Maria Oliveira', '978.319.130-68', '298560239', '(11) 91234-5678', 'mariaoliveira123@gmail.com', '01310-200', 'Av. Paulista', 'Bela Vista', 456),
('Pedro Souza', '926.673.780-16', '147545456', '(21) 99876-5432', 'pedrinho94@yahoo.com', '22071-000', 'Rua Atlântica', 'Copacabana', 789),
('Ana Costa', '312.414.830-43', '267593624', '(71) 97765-4321', 'ana_costa01@hotmail.com', '40026-000', 'Rua Chile', 'Centro', 101),
('Carlos Lima', '563.236.650-26', '131919040', '(81) 93345-6789', 'carlos123lima@outlook.com', '50010-000', 'Av. Recife', 'Boa Viagem', 202);

-- INSERINDO/CADASTRANDO DADOS NA TABELA TB_ADMIN
INSERT INTO TB_ADMIN (ID_USUARIO, SENHA) VALUES
(1, 'admin123'),
(2, 'admin456'),
(3, 'admin789'),
(4, 'admin010'),
(5, 'admin071');

-- INSERINDO/CADASTRANDO DADOS NA TABELA TB_CONTA
INSERT INTO TB_CONTA (ID_USUARIO, TIPO_CONTA, AGENCIA, SALDO, CONTA, SENHA) VALUES
(1, 1, 1234, 5000.00, 1001, 'senha123'),
(2, 2, 5678, 3000.00, 1002, 'senha456'),
(3, 1, 1234, 7000.00, 1003, 'senha789'),
(4, 2, 5678, 2000.00, 1004, 'senha012'),
(5, 1, 1234, 10000.00, 1005, 'senha345');

-- INSERINDO/CADASTRANDO DADOS NA TABELA TB_PIX
INSERT INTO TB_PIX (ID, ID_CONTA, CHAVE_PIX, DESCRICAO) VALUES
(1, 1, 'joao@gmail.com', 'Pagamento de aluguel'),
(2, 2, '11977501234', 'Transferência para Soraya'),
(3, 3, 'studio_bellas@gmail.com', 'Pagamento Manicure'),
(4, 4, '88319298000148', 'Pagamento de mercado'),
(5, 5, 'carlos@outlook.com', 'Reserva de hotel');

-- NÃO PRECISA CRIAR A TABELA BOLETO E TED PARA MOSTRAR AO PROFESSOR
-- MAS SE QUISER TESTAR, ZERO PROBLEMAS.

-- INSERINDO/CADASTRANDO DADOS NA TABELA TB_BOLETO
INSERT INTO TB_BOLETO (ID, ID_CONTA, CODIGO_DE_BARRAS, BENEFICIARIO) VALUES
(1, 1, 123456789012, 'Vivo/SA'),
(2, 2, 987654321098, 'Universidade Paulista UNIP'),
(3, 3, 112233445566, 'Borracharia do Alemao - ME'),
(4, 4, 556677889900, 'Raimundo e Francisco Comercio de Bebidas Ltda'),
(5, 5, 998877665544, 'Enel Brasil/SA');

-- INSERINDO/CADASTRANDO DADOS NA TABELA TB_TED
INSERT INTO TB_TED (ID, ID_CONTA, TARIFA, DESCRICAO) VALUES
(1, 1, 8.00, 'Transferência para outra conta'),
(2, 2, 8.00, 'Pagamento de fornecedor'),
(3, 3, 8.00, 'Depósito em outra agência'),
(4, 4, 8.00, 'Pagamento de fatura'),
(5, 5, 8.00, 'Doação para ONG');



