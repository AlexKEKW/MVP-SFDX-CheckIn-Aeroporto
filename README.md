# Desafio Check-In

## 📋 Contexto

O dono do conglomerado de aviação Santos Dumont solicita um sistema de gerenciamento para sua companhia aérea. Como ponto de partida, é necessário desenvolver um **MVP** com funcionalidade de Check-In operacional.

---

## 🎯 Tarefas

### 1. Modelagem

Criação da estrutura de campos e objetos para suportar o MVP.

#### **Ticket 1** - Objeto Check-In
Criar objeto check-in com os seguintes campos:

| Campo | Tipo | Opções/Detalhes |
|-------|------|-----------------|
| **Cliente** | Relacionamento | Account (Conta) |
| **Status** | Seleção | Novo, Realizado, Não Realizado |
| **Aeroporto de Check-In** | Seleção | GRU, GIG, BSB, CWB, SSA, CNF, BEL, FLN, NAT, CGH, POA, MAO, REC, FOR, CGB |
| **Aeroporto de Destino** | Seleção | GRU, GIG, BSB, CWB, SSA, CNF, BEL, FLN, NAT, CGH, POA, MAO, REC, FOR, CGB |
| **Código do Voo** | A definir | - |
| **Horário do Voo** | A definir | - |
| **Horário de Check-In** | A definir | - |
| **Número do Assento** | A definir | - |

#### **Ticket 2** - Campos no Objeto Account
Adicionar campos no objeto Account:

| Campo | Tipo | Descrição |
|-------|------|-----------|
| **Número de Check-Ins no Ano** | A definir | Contador anual |
| **Número de Check-Ins Totais** | A definir | Contador total |
| **CPF** | A definir | Documento |
| **Data de Nascimento** | A definir | Data |
| **Necessita Cuidados Especiais** | A definir | Indica necessidade de cuidado extra |

---

### 2. Usuários

Configuração dos usuários do sistema.

#### **Ticket 1** - Perfil Agente de Viagens
- Criar perfil baseado em "Minimum Access"
- Conceder acesso completo para:
  - Visualização de Account e Check-In
  - Criação de Account e Check-In
  - Edição de Account e Check-In

#### **Ticket 2** - Usuários de Teste
Criar usuários para validação do sistema.

---

### 3. Organização

Estruturação do sistema para facilitar o uso pelos agentes.

#### **Ticket 1** - App 14-Bis
- Criar aplicativo "14-Bis"
- Incluir apenas recursos essenciais para:
  - Criação de Accounts
  - Criação de Check-Ins
- Definir como app padrão para agentes

#### **Ticket 2** - Layouts dos Objetos
Organizar layouts de Account e Check-In de forma intuitiva.

#### **Ticket 3** - Flexi Pages
Configurar Flexi Pages dos objetos Account e Check-In para otimizar a experiência do usuário.

---

### 4. Controle

Implementação de regras para garantir uso correto do sistema.

#### **Ticket 1** - Validação de CPF
Criar regra de validação para CPF no formato correto (com ou sem pontuação).

#### **Ticket 2** - Bloqueio de Check-In Tardio
Impedir realização de Check-In após o Horário do Voo.

#### **Ticket 3** - Proteção de Check-Ins Não Realizados
Impedir edição de Check-Ins com status "Não Realizado".

---

### 5. Melhorias

Automações para otimizar o uso do sistema.

#### **Ticket 1** - Contadores Automáticos
Automação para preenchimento dos campos de contagem:
- **Número de Check-Ins no Ano**: Contagem do ano atual
- **Número de Check-Ins Totais**: Contagem total histórica

#### **Ticket 2** - Botão de Check-In
Criar botão que automaticamente:
- Muda status para "Realizado"
- Define Horário de Check-In para momento atual

#### **Ticket 3** - Criação Rápida
Botão para criar check-in diretamente da conta do cliente.

#### **Ticket 4** - Atualização Automática de Status
Atualizar status para "Não Realizado" quando check-in não é feito antes do horário do voo.

---

### 6. Extra

#### **Ticket 1** - Sistema de Fidelidade
Enviar email de agradecimento e desconto quando cliente atingir:
- 10 Check-Ins (totais ou anuais)
- 50 Check-Ins (totais ou anuais)
- 100 Check-Ins (totais ou anuais)

---

## 🔄 Fluxo de Uso

### Processo Operacional

1. **Registro via Chamada Telefônica**
   - Agente recebe chamada do cliente
   - Verifica se cliente possui conta no sistema

2. **Criação/Verificação de Conta**
   - Se não possui conta: criar nova conta
   - Se possui conta: prosseguir para próximo passo

3. **Criação do Check-In**
   - Agente cria registro de check-in
   - Inclui dados do voo fornecidos pelo cliente

4. **Execução do Check-In no Aeroporto**
   - Cliente comparece no dia do voo
   - Agente confirma dados do cliente
   - Se dados estão corretos: pressiona botão para realizar check-in

### Resultado Final
Sistema automaticamente atualiza status e registra horário de realização do check-in.


# -----------------------------------------------


# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
