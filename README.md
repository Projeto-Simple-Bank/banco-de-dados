# Banco de dados
![image](https://github.com/user-attachments/assets/e6d47dec-e82f-40fe-a2f0-76d7db3e0c81)

# Documentação do Banco de dados

A seguir, uma descrição detalhada do que cada campo de cada tabela representa no banco de dados bancário:

1. Tabela: TB_USUARIO
Armazena os dados pessoais dos usuários do sistema bancário.

**Funções:** Enviar, receber e atualizar.
- Cadastrar o usuário (Admin e Cliente).
- Visualizar e alterar as informações usuário (Admin e Pefil Cliente).

**Coluna** 
- ID PRIMARY KEY IDENTITY Identificador da tabela usuário.
- NOME VARCHAR Representa o nome completo do usuário. 
- CPF VARCHAR (Cadastro de Pessoa Física) do usuário, registra o documento do usuário para o banco. 
- RG VARCHAR RG (Registro Geral) do usuário, registra o documento do usuário para o banco. 
- TELEFONE VARCHAR Número de telefone para contato do usuário. 
- EMAIL VARCHAR Endereço de e-mail do usuário, pode ser usado como outra forma de contato no caso do cliente e login do admin.
**O endereço não é campo obrigatório para o Admin**
- CEP VARCHAR Código de Endereçamento Postal do local de residência do usuário. 
- RUA VARCHAR Nome da rua onde o usuário reside. 
- BAIRRO VARCHAR Nome do bairro onde o usuário reside. 
- NUMERO INT Número da residência do usuário.
- CIDADE VARCHAR Cidade que o usuário reside.
- ESTADO VARCHAR Estado que o usuário reside.

2. Tabela: TB_ADMIN
Armazena os dados de login e senha dos administradores do sistema.

**Funções:** autenticar-enviar.
- Logar o usuário admin.

Coluna  
- ID PRIMARY KEY IDENTITY Identificador da tabela admin.
- ID_USUARIO INT Referência ao ID do usuário na tabela TB_USUARIO. Cada administrador é um usuário e pode criar um usuário cliente.
- SENHA VARCHAR Senha de acesso para o login do administrador no sistema.

3. Tabela: TB_CONTA
Armazena informações sobre a conta bancária do usuário cliente.

**Funções:** Enviar, autenticar, receber.
- Cadastrar a conta do cliente.
- Login do cliente.
- Visualizar a conta no dashboard/página inicial do cliente.
- Visualizar a conta na tela do admin vinculado com a tabela TB_USUARIOS. 

Coluna
- ID PRIMARY KEY IDENTITY Identificador da tabela conta.
- ID_USUARIO INT Referência ao ID do usuário na tabela TB_USUARIO. Cada conta é associada a um usuário cliente, a conta herda os dados do usuário cliente cadastrado.
- TIPO_CONTA INT Tipo de conta bancária: 1 para Conta Corrente e 2 para Conta Especial.
- AGENCIA INT Número da agência bancária onde a conta foi registrada.
- SALDO Float Valor total disponível na conta bancária. Representa o saldo atual.
- CONTA INT Número da conta bancária associada ao usuário.
- SENHA VARCHAR Senha de acesso para logar a conta bancária.

5. Tabela: TB_PIX
Armazena as chaves PIX associadas às contas bancárias dos usuários.

**Funções:** Enviar e receber.
- Transferir dinheiro.
- Emitir comprovante.

Coluna  
- ID INT Identificador único da tabela PIX.
- ID_CONTA INT Referência ao ID da tabela conta.
- CHAVE_PIX VARCHAR Chave PIX utilizada para realizar transferências, como e-mail, CPF ou celular.
- DESCRICAO VARCHAR Descrição opcional que detalha o propósito ou finalidade da transação, como "Pagamento de aluguel" ou "Transferência para Soraya".

5. Tabela: TB_BOLETO
Armazena os boletos gerados no sistema bancário.

**Funções:** Enviar e receber.
- Pagar boleto.
- Emitir comprovante do boleto.

Coluna  
- ID INT Identificador único da tabela boleto.
- ID_CONTA INT Referência ao ID da tabela conta.
- CODIGO_DE_BARRAS VARCHAR Código de barras gerado para o boleto, utilizado para pagamento.
- BENEFICIARIO VARCHAR Nome do beneficiário do boleto, ou seja, quem irá receber o pagamento.

6. Tabela: TB_TED
Armazena as transferências realizadas via TED (Transferência Eletrônica Disponível).

**Funções:** Enviar e receber.
- Transferir dinheiro.
- Emitir comprovante.

Coluna 
- ID INT Identificador único da tabela TED. 
- ID_CONTA INT Referência ao ID da tabela conta.
- TARIFA DECIMAL Valor da tarifa cobrada para a realização da transferência via TED.
- DESCRICAO VARCHAR Descrição do propósito do TED, como "Pagamento de fornecedor" ou "Doação para ONG".

## Resumo das Relações
- TB_USUARIO e TB_ADMIN: Cada administrador é associado a um usuário, seja para cadastrar um usuário cliente ou se cadastrar (referência pelo campo ID_USUARIO).
- TB_USUARIO e TB_CONTA: Cada conta bancária pertence a um usuário derivando os valores do usuário, identificado pelo campo ID_USUARIO.
- TB_CONTA e TB_PIX: Cada chave PIX pertence a uma conta bancária específica, identificada por ID_CONTA.
- TB_BOLETO e TB_TED: Cada Boleto ou TED pertence a uma conta bancária específica, identificada por ID_CONTA

Esses campos e as relações entre eles ajudam a estruturar um sistema bancário onde as informações sobre usuários, contas e transações financeiras (como PIX, TED e boletos) são bem organizadas e interconectadas.
