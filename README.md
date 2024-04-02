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
- [ ] Deve ser possível criar uma sessão (SessionID) para cada login, dessa forma será possível identificar o usuário em futuras requisições após logado.
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

`studentName`: O nome do aluno.
`studentID`:O identificador único do aluno.
`className`: O nome da turma à qual o aluno está associado.
`classID`: O identificador único da turma.
`nameChar`:O nome do personagem do aluno no jogo.
`levelPlayer`: O nível atual do jogador.
`xpActual`: A quantidade de experiência atual do jogador.

#### Preferences

As preferências de configuração do jogo do aluno.
`saveVolume`: O volume de salvamento do jogo.
`saveVolumeMusic`: O volume da música do jogo.
`saveVolumeSFX`: O volume dos efeitos sonoros do jogo.

#### Analytics

Os dados analíticos do jogador.
`device`: O dispositivo utilizado pelo jogador (Windows ou Android).
`timePlayed`: O tempo total de jogo do jogador.

#### Progress

O progresso do aluno no jogo.
`isProgressControlled`: A variável "isProgressControlled" controla a progressão dos alunos no jogo. Quando esta opção estiver ativada no back-end, o jogo restringe a liberdade dos alunos para avançarem livremente, permitindo o progresso somente quando o professor liberar a aula. No front-end, se o professor habilitar essa opção para uma turma através de um checkbox, uma interface será exibida com as aulas disponíveis de 1 a N (sendo N o número total de aulas/missões). O professor pode selecionar uma aula e, se houver alunos que não tenham completado a missão, um aviso será exibido indicando isso. O professor poderá então optar por prosseguir mesmo assim, e assim irá sobrescrever o valor atual da missão (actualQuest) com a aula selecionada, porém não irá apagar os itens adquiridos pelos alunos. As aulas só serão liberadas sequencialmente pelo professor, uma por vez.

No jogo, se esta variável estiver ativada, é crucial garantir que todos os itens necessários estejam disponíveis para o aluno de acordo com a missão/quest selecionada, permitindo assim uma experiência de jogo adequada e coerente com a progressão controlada definida pelo professor. Por exemplo, se o professor selecionar Quest_03, o jogo irá liberar e salvar automaticamente os itens que o jogador teria inicialmente ao iniciar a Quest_03, sem sobrescrever outros itens que ele conquistou (por exemplo, itens coletados na Quest_04).

`actualQuest`: Representa a missão atual em que o aluno está. Os valores possíveis correspondem aos nomes das missões usadas internamente no jogo, seguindo o padrão de nomenclatura Quest_01, Quest_02, Quest_03, …Quest_N, onde N representa o número total de missões disponíveis no jogo.

`actualSecondaryQuest`: Indica o número da missão secundária atual. As missões secundárias são organizadas em uma array indexada, começando a partir do índice 0.

#### Inventory

O inventário do aluno no jogo determina os itens disponíveis para uso durante a partida. Se um item estiver disponível, o valor de "enabled" será definido como verdadeiro (true). No caso de itens consumíveis, será fornecida também a informação sobre a quantidade disponível. Essas informações serão utilizadas pelo jogo para garantir que o jogador inicie com acesso aos itens conforme configurado no inventário.
`weapons`: As armas disponíveis para o jogador.
`skills`: As habilidades disponíveis para o jogador.
`consumables`: Os itens consumíveis disponíveis para o jogador.
`chips`: Os chips disponíveis para o jogador.

### Dados de um aluno (Formato JSON)

```json
{
  "student": {
    "studentName": "string",
    "studentID": "string",
    "className": "string",
    "classID": "string",
    "levelPlayer": "number",
    "user_cfg": "byte",
    "analytics": {
      "device": "window | android",
      "timePlayed": "number"
    },
    "progress": {
      "isProgressControlled": "boolean",
      "actualQuest": "Quest_01 | Quest_02 | Quest_03 | Quest_04 | Quest_05 | Quest_06",
      "game_save": "byte"
    }
  }
}
```

## Instruções

Após fazer modificações no arquivo prisma.schema, rode para gerar a tipagem
`npx prisma generate`

Para rodar migrations no prisma, rode
`npx prisma migrate dev`
