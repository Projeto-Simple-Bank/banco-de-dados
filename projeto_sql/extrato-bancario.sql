-- Inserindo dados na tabela de TB_TRANSACAO
-- Emitindo o extrato bancário
-- TIPO_TRANSACAO = 1 BOLETO, 2 PIX E 3 TED
-- TIPO_OPERACAO = 1 DÉBITO E 2 CRÉDITO
INSERT INTO TB_TRANSACAO (ID, ID_CONTA, TIPO_TRANSACAO, TIPO_OPERACAO, VALOR, DATA_TRANSACAO) VALUES
(1, 1, 2, 1, 150.00, GETDATE()),
(2, 2, 2, 2, 150.00, GETDATE())

-- Extrato da conta de João (ID 1)
SELECT T.ID, C.CONTA, C.AGENCIA, T.TIPO_TRANSACAO, T.TIPO_OPERACAO, T.VALOR, T.DATA_TRANSACAO
FROM TB_TRANSACAO T
JOIN TB_CONTA C ON C.ID = T.ID_CONTA
WHERE C.ID_USUARIO = 1 

-- Extrato da conta de Maria (ID 2)
SELECT T.ID, C.CONTA, C.AGENCIA, T.TIPO_TRANSACAO, T.TIPO_OPERACAO, T.VALOR, T.DATA_TRANSACAO
FROM TB_TRANSACAO T
JOIN TB_CONTA C ON C.ID = T.ID_CONTA
WHERE C.ID_USUARIO = 2 
