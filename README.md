## Primeira Entrega (Abril)

### Requisitos Funcionais:

- [x] Deve ser possível a criação de contas de professores.
- [x] Deve ser possível a criação de contas de alunos.
- [ ] Deve ser possível realizar a autenticação de alunos.
- [x] Deve ser possível realizar a autenticação de professores.
- [x] Deve ser possível sair de uma sessão como professor.

### Requisitos Não-Funcionais:

- [x] A implementação do back-end será feita com Node.js e Fastify.
- [x] A configuração do banco de dados será com PostgreSQL e Prisma.
- [x] Os dados da aplicação precisam estar persistidos em um banco PostgreSQL
- [ ] A interface da conta do professor será um front-end com React+Vite.
- [x] A senha do usuário precisa estar criptografada
- [x] Deve ser possível criar uma sessão (SessionID) para cada login, dessa forma será possível identificar o usuário em futuras requisições após logado.
- [ ] Para um aluno, uma sessão só ficará ativa enquanto o jogo estiver em execução.
- [x] Para um professor, o cookie de sessão deve ter uma validade de 1 mês
- [ ] Desenvolvimento inicial da interface de criação de contas para professores.
- [ ] Criação do portal de login para professores.

### Regras de Negócio:

- [ ] Um aluno pode criar uma conta e jogar sem inserir um código de professor.
- [ ] Um aluno pode logar na sua conta sem inserir um código de professor.
- [ ] Um aluno pode logar na sua conta inserindo um código de professor.
- [ ] Não deve ser possível um aluno se autenticar se ele informar um código de turma inválido (inexistente)

Data de Entrega:
Final de Abril.

## Segunda Entrega (Maio)

### Requisitos Funcionais:

- [ ] Desenvolvimento do dashboard administrativo para professores. Será feito a implementação do sistema de acompanhamento de progresso dos alunos para professores.
- [ ] O professor deve ser capaz de criar uma turma
- [ ] O professor deve ser capaz de deletar uma turma
- [ ] Deve ser possível listar todas as turmas
- [ ] Deve ser possível exibir apenas uma turma
- [ ] Deve ser possível listar todos os alunos de uma turma
- [ ] Deve ser ṕossivel exibir apenas uma aluno de uma turma
- [ ] Deve ser possível a criação e gerenciamento de turmas.
- [ ] O professor pode terminar uma sessão no dashboard (deslogar)
- [ ] Implementação do sistema de salvamento de progresso dos alunos no servidor.

### Requisitos Não-Funcionais:

- [ ] Deve haver a Integração do front-end do dashboard com os dados do back-end.
- [ ] Deve haver a Integração do front-end do jogo com os dados do back-end.
- [ ] Deve haver um interface para criar e deletar turmas

### Regras de Negócio:

- [ ] Um professor pode criar uma conta e turmas, e receber um código para compartilhar com os alunos.
- [ ] Cada professor pode gerenciar múltiplas turmas.
- [ ] As turmas são exclusivas de cada professor.
- [ ] Um aluno pode estar a associado a várias turmas
- [ ] Cada turma de um professor deve possuir um código do professor único de 4 dígitos
- [ ] O progresso dos alunos deve ser associado corretamente às turmas e aos professores.

Data de Entrega:
Final de Maio.

## Terceira Entrega (Junho)

### Requisitos Funcionais:

- [ ] Deve ser possível exibir gráficos do desempenho de turmas
- [ ] Deve ser possível exibir gráficos do desempenho de alunos
- [ ] O professor pode controlar qual missão uma turma pode realizar
- [ ] Deve ser possível baixar um relatório dos alunos
- [ ] A aplicação deve possuir Testes Unitários
- [ ] Implementação e correções de bugs

### Requisitos Não-Funcionais:

- [ ] Estabilidade: Garantir que o sistema esteja livre de erros críticos e seja estável para uso em produção.
- [ ] O arquivo do relatório deve ser no formato CSV

Data de Entrega:
Final de Junho.

## Especificações Técnicas

- Back-end: Node.js, Fastify, PostgreSQL, Prisma, TypeScript.
- Front-end: React+Vite, Styled Components, MUI, TypeScript.
- Game Engine: Godot 3.5, GDScript usando protocolo HTTP para comunicação com back-end por meio de rotas da API.

## Descrição dos dados de um aluno

#### Root

`student_name`: O nome do aluno.
`student_id`:O identificador único do aluno.
`course_name`: O nome da turma à qual o aluno está associado.
`course_id`: O identificador único da turma.
`player_level`: O nível atual do jogador.
`user_cfg`: Arquivo binário com as opções do jogador para usro interno da engine do jogo.
`game_save`: O binário com o save do aluno, contém informações internas para a engine do
jogo consumir e utilizar.

#### Analytics

Os dados analíticos do jogador. Esta informação só é enviada para o professor com fins de métricas
e não para o jogo.
`device`: O dispositivo utilizado pelo jogador (Windows ou Android).
`total_time_played`: O tempo total de jogo do jogador.

#### Progress

O progresso do aluno no jogo.

`quests`: As quests que o aluno já completou ou está fazendo, contém métricas sobre a quest
como tempo de jogo na quest e se completou ou não.

### Contratos (Formato JSON)

Para um aluno se Autenticar ele deve passar o seguinte payload

```json
{
  "email": "string",
  "password": "string",
  "code": "string | null",
  "device": "windows | android" // Optional
}
```

Após um aluno se autenticar ou registrar no jogo ele receberá esta informação do servidor

```json
{
  "session_id": "string",
  "student_name": "string",
  "student_id": "string",
  "course_name": "string | null",
  "course_id": "string | null",
  "user_cfg": "byte",
  "game_save": "byte"
}
```

Ao listar um aluno no dashboard, essa será a informação recebida

```json
{
  "student": {
    "student_name": "string",
    "student_id": "string",
    "course_name": "string",
    "course_id": "string",
    "player_level": "number",
    "analytics": {
      "device": "windows | android",
      "total_time_played": "number",
      "quests": [
        {
          "quest_name": "Quest_01 | Quest_02 | Quest_03 | Quest_04 | Quest_05 | Quest_06",
          "quest_id": "string",
          "started_at": "string | null",
          "completed_at": "string | null",
          "time_played": "number",
          "completion_rate": "number"
        }
      ]
    }
  }
}
```

Para atualizar um save, o jogo deve passar o seguinte payload:

```json
{
  "student_id": "string",
  "session_id": "string",
  "course_id": "string | null",
  "user_cfg": "byte | null",
  "game_save": "byte | null",
  // Optional
  "quests": [
    {
      "quest_id": "string",
      "started_at": "string | null",
      "completed_at": "string | null",
      "time_played": "number | null",
      "completion_rate": "number | null"
    }
  ]
}
```

## Instruções

Após fazer modificações no arquivo prisma.schema, rode para gerar a tipagem
`npx prisma generate`

Para rodar migrations no prisma, rode
`npx prisma migrate dev`
