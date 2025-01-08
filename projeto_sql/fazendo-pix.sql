-- Debitar o saldo da conta 1
UPDATE TB_CONTA
SET SALDO = SALDO - 150.00
WHERE ID = 1;  -- Atualiza saldo do usuário 1

-- Creditar o saldo na conta 2
UPDATE TB_CONTA
SET SALDO = SALDO + 150.00
WHERE ID = 2;  -- Atualiza saldo do usuário 2

-- Consulta de saldo para a conta de João (ID 1)
SELECT CONTA, SALDO
FROM TB_CONTA
WHERE ID_USUARIO = 1;

-- Consulta de saldo para a conta de Maria (ID 2)
SELECT CONTA, SALDO
FROM TB_CONTA
WHERE ID_USUARIO = 2;
