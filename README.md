# Sistema de Gerenciamento de Recebimento de Documentos

Uma empresa precisa ter um melhor controle dos documentos recebidos vindos de outras instituições. Esta aplicação tem o objetivo de  ajudar aos administradores dessa empresa a ter um histórico dos documentos recebidos.

---

**User**

| Coluna | Descrição |
| --- | --- |
| name | Nome do usuário |

**Sector**

| Coluna | Descrição |
| --- | --- |
| name | Nome do setor |


**Institution**

| name | Descrição |
| --- | --- |
| name | Nome da instituição |
| sector_id | Chave estrangeira para o setor |

**DocumentType**

| Coluna | Descrição |
| --- | --- |
| name | Nome do documento |
| attributes | Informações Complementares no ato da entrega do documento |
| user_id | Pessoa que criou o cadastro do recebimento |
| institution_id | ID da instituição de recebimento |
| state | Estado do documento (recebido/não recebido) |

**StateTransitionDocument**

| Coluna | Descrição |
| --- | --- |
| document_id | ID do documento |
| from_state | Estado inicial de mudança |
| to_state | Novo estado |
| user_id | ID da pessoa que fez a alteração |

---
**Atividades Previstas**

[ ] View Formulário de Login
[ ] View Formulário de Sign Up
[ ] View Recuperação de Senha
[ ] Navbar da Home
[ ] Tabela para mostrar os documentos já recebidos
[ ] View para mostrar os detalhes de uma entrega
[ ] CRUD de Setor
[ ] CRUD de instituição
[ ] CRUD tipo de documento
