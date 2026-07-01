# Resolução — Lista de Exercícios ES670

**Projeto de Sistemas Embarcados — FEM/UNICAMP**
Prof. Rodrigo Moreira Bacurau · *Estudo para a prova*

> Cada questão traz **a resposta** seguida de um bloco **"Teoria"** que
> explica, de forma geral, o conceito cobrado — com base no material das aulas
> (dir. `aulas/`).

---

## Questão 1 — Tempo real processa mais rápido? *(1,0)*

**Não.** Um sistema de tempo real **não** processa, necessariamente, mais
rápido do que um sistema não-tempo real. A característica que define um sistema
de tempo real **não é a velocidade**, e sim o **cumprimento de restrições
temporais (deadlines) bem definidas**.

Em um sistema de tempo real a corretude do resultado depende **igualmente**
de dois fatores:

1. a **lógica** de computação estar correta; **e**
2. o resultado ser produzido **dentro do prazo** estabelecido.

Um resultado logicamente correto, porém entregue **fora do prazo**, é
considerado uma **falha**. Por isso o que importa é o **determinismo**
(previsibilidade do tempo de resposta), e não a rapidez bruta. Um PC comum
pode ter um throughput médio maior, mas, por não garantir prazos, não é
adequado a aplicações de tempo real críticas.

> 💡 Frase-chave da Aula 1: **"Tempo real *não* significa tempo de resposta rápido!"**

### 📚 Teoria — Sistemas de tempo real

- **Definição:** sistemas de computação que devem responder dentro de
  **restrições de tempo muito bem definidas**.
- **Classificação:**
  - **Soft real time** — restrições de tempo flexíveis; uma falha (perda de
    deadline) não causa grandes prejuízos. *Ex.: travamento de uma Smart TV,
    streaming de vídeo.*
  - **Hard real time** — restrições rígidas; a perda de um deadline pode causar
    prejuízos financeiros graves ou perda de vidas. *Ex.: controlador de voo de
    uma aeronave, injeção eletrônica.*
- Existe um **espectro contínuo**: `Não-tempo real → Soft real time → Hard real time`.
- **Sistema embarcado de tempo real** = interseção entre *sistema embarcado*
  (hardware+software acoplados para função específica) e *sistema de tempo real*.

---

## Questão 2 — Nome de uma variável (padrão de codificação) *(1,0)*

Pela **Regra #06** do padrão de codificação da disciplina, o nome de uma
variável deve:

- iniciar por um **prefixo, em minúsculo, que indica o tipo** da variável;
- seguir, no restante do nome, a **notação do camelo** (*camelCase*);
- ser **significativo** (descrever o que a variável representa).

**Exemplo:**

```c
// pitch gain definition
unsigned int uiPitchGain;
```

### Tabela de prefixos por tipo

| Tipo                       | Prefixo |
|----------------------------|:-------:|
| `char`                     | `c`     |
| `unsigned char`            | `uc`    |
| `int`                      | `i`     |
| `unsigned int`             | `ui`    |
| `long int`                 | `l`     |
| `unsigned long int`        | `ul`    |
| `short int`                | `s`     |
| `unsigned short int`       | `us`    |
| `long long`                | `ll`    |
| `unsigned long long`       | `ull`   |
| `float`                    | `f`     |
| `double`                   | `d`     |
| `long double`              | `ld`    |
| ponteiros                  | `p`     |
| outros tipos (struct, union, etc.) | `x` |

> Para um **ponteiro para struct**, combinam-se os prefixos: `px` (ex.: `pxPacket`).

### 📚 Teoria — Padrão de codificação (*Coding Standard*)

Conjunto de regras convencionadas para escrita padronizada de código-fonte.
O da disciplina é baseado no **MISRA C** (segurança/confiabilidade) e no
**Doxygen** (documentação a partir de comentários). Justificativas: facilita a
comunicação entre desenvolvedores, melhora a qualidade do código e induz boas
práticas. Outras regras importantes: nomes de **arquivos** em camelCase,
**constantes** em MAIÚSCULAS, indentação de **2 espaços**, máximo de **80
caracteres** por linha, comentários só de **uma linha** (`//`), e funções
nomeadas como `prefixoDeRetorno + nomeDoArquivo + Verbo+Substantivo`
(ex.: `fTemperatureSensorGetTemperature()`).

---

## Questão 3 — `struct`, ponteiro e protótipo de função *(2,0)*

**a) Declaração do tipo `struct`** (com um `float` e um vetor de 8 `unsigned char`):

```c
// Typedef da estrutura de dados
typedef struct
{
  float         fValue;       // variável float
  unsigned char ucData[8];    // vetor de 8 caracteres sem sinal
} dataPacket_t;
```

**b) Protótipo da função** (recebe a struct por referência/ponteiro):

```c
// Protótipo: retorno, nome e parâmetros de entrada
// (segue o padrão: prefixo de retorno 'v' (void) + arquivo + verbo+substantivo)
void vDataProcessorProcessPacket(dataPacket_t *pxPacket);
```

**c) Trecho onde a variável é declarada e enviada por referência:**

```c
dataPacket_t xMyPacket;                  // variável do tipo da struct (prefixo 'x')

// ... preenchimento dos campos ...
xMyPacket.fValue = 25.7f;

vDataProcessorProcessPacket(&xMyPacket); // envio por referência (endereço &)
```

### 📚 Teoria — `struct`, passagem por referência e `typedef`

- Uma **`struct`** agrupa, sob um único tipo, campos de tipos diferentes,
  permitindo tratar dados relacionados como uma só variável.
- **`typedef`** cria um nome de tipo (`dataPacket_t`), tornando o código mais
  legível e reutilizável.
- **Passagem por referência (ponteiro):** envia-se o **endereço** (`&xMyPacket`)
  em vez de uma cópia. Vantagens: (i) evita copiar toda a estrutura (mais
  eficiente em memória/tempo) e (ii) permite que a função **altere** o conteúdo
  original. Dentro da função, acessa-se os campos com o operador `->`
  (ex.: `pxPacket->fValue`).
- O acesso ao mesmo tipo em outro arquivo `.c` se faz declarando a variável
  global como `extern`.

---

## Questão 4 — Máquina de estados da "Máquina de Café" *(1,5)*

A comunicação entre o **PC (host)** e a **Máquina de Café (target)** é feita via
**UART** através de um protocolo de alto nível implementado como uma **máquina
de estados**. Considerando o cenário do laboratório (100 g de pó por bebida;
capacidade de 1000 g por reservatório), o protocolo deve permitir:

- **consultar** a quantidade *vendida* de cada café (individual ou todas);
- **consultar** a quantidade de *pó* disponível de cada café (em gramas);
- **definir** a quantidade de pó disponível de cada café (0 a 1000 g);
- **resetar** (zerar) a quantidade vendida de todos os cafés.

### Diagrama de máquina de estados (recepção de comandos)

Todo comando inicia com o caractere de sincronismo `#`. Estados:

```
                       (!= '#')
                        ┌────┐
                        │    │
                        ▼    │
        start ───────► [ IDLE ] ◄──────────────────────────────┐
                          │                                     │
                       '#'│                                     │
                          ▼                                     │
                      [ READY ]                                 │
              ┌────────────┼─────────────┬───────────┐         │
           'g'│         's'│           'r'│        (outro)      │
              ▼            ▼              ▼           └─────────┘
          [ GET ]      [ SET ]      (zera vendas)      (erro→IDLE)
              │            │          → resposta OK
   'v'/'p' +  │            │'p' + id          │
     id       │            ▼                  │
              │        [ VALUE ]              │
              ▼     (dígitos 0..1000)         │
        (responde valor)   │                  │
              │            ▼                  │
              │      (grava pó; OK)           │
              └─────────────┴────────────────┴──────────────► IDLE
```

### Comandos implementados (sintaxe do protocolo)

| Comando (ASCII)      | Ação                                   | Entrada            | Saída / Retorno                 | Faixa / Resolução |
|----------------------|----------------------------------------|--------------------|---------------------------------|-------------------|
| `#gv<id>`            | Obter vendas de **um** café            | `id` (0..N-1)      | nº de unidades (`unsigned char`)| 0–255 / 1 unid.   |
| `#gV`                | Obter vendas de **todos** os cafés     | —                  | lista de `unsigned char`        | 0–255 / 1 unid.   |
| `#gp<id>`            | Obter pó disponível de **um** café     | `id` (0..N-1)      | gramas (`unsigned short int`)   | 0–1000 g / 1 g    |
| `#sp<id><valor>`     | Definir pó disponível de um café       | `id` + `valor` (g) | confirmação (`OK`/`ERR`)        | 0–1000 g / 1 g    |
| `#r`                 | Resetar (zerar) vendas de todos        | —                  | confirmação (`OK`)              | —                 |

> A estrutura de dados é uma `struct` global (declarada em `main.c`, acessada
> como `extern` em `communicationStateMachine.c`) com a quantidade vendida de
> cada café em `unsigned char` e o pó disponível em `unsigned short int`.

### 📚 Teoria — Máquina de estados (FSM)

Uma **máquina de estados finitos** modela um sistema como um conjunto de
**estados**, **transições** (disparadas por eventos/entradas) e **ações**.
É a ferramenta natural para implementar **protocolos de comunicação**: cada
byte recebido pela UART (via interrupção, no `HAL_UART_RxCpltCallback`) provoca
uma transição. Vantagens: código organizado, determinístico e fácil de validar.
Notação: estados em elipses; transições em setas rotuladas com a
condição/evento. O padrão acima espelha a FSM do "Medidor de Energia" vista na
Aula 14 (`#` → comando → parâmetro → valor → volta a `IDLE`).

---

## Questão 5 — Semáforos *(1,5)*

**O que são:** um **semáforo** é um **objeto do kernel** (do RTOS) que **uma ou
mais tarefas podem adquirir (*take*) e devolver (*give/release*)** com o
objetivo de **sincronização de atividades** ou de **acesso a recursos
compartilhados**. Funciona como uma **"chave"** que autoriza a tarefa a
continuar sua execução ou a acessar um recurso.

**Para que servem:** coordenar a concorrência entre tarefas — garantir
**exclusão mútua** no acesso a recursos compartilhados (variáveis globais,
periféricos) e **sincronizar** a sequência de execução de tarefas/ISRs,
evitando que uma seção crítica seja interrompida e deixe o recurso em estado
inconsistente.

**Tipos:** binário (0/1 — disponível/indisponível), contador (conta vários
*tokens*; útil para contagem de eventos ou gerência de N instâncias de um
recurso) e **mutex** (semáforo binário especial, com posse, exclusão segura e
proteção contra inversão de prioridade).

### Exemplo no projeto (robô seguidor de linha)

Um **semáforo binário** para sincronização do tipo *wait-and-signal*:

- Um **timer** dispara uma interrupção periódica (ex.: a cada 5 ms) — o período
  de amostragem do controle.
- A **ISR do timer** faz `release` (give) de um semáforo binário (inicialmente
  indisponível, valor 0).
- A **tarefa de controle** (PID dos motores) fica bloqueada tentando `acquire`
  (take) o semáforo. Ao receber o sinal, ela acorda, **lê os sensores de
  linha**, calcula a correção e **atualiza o PWM dos motores**, voltando a
  bloquear.

Isso garante que o laço de controle execute em **intervalos determinísticos** —
exatamente o que um sistema de tempo real exige.

> *Variante (mutex):* se a leitura dos sensores e a tarefa de telemetria
> acessarem a mesma variável global de "posição da linha", protege-se esse
> recurso com um **mutex** para garantir exclusão mútua.

### 📚 Teoria — Sincronização e seção crítica

- **Seção crítica:** trecho de código onde um recurso compartilhado é acessado.
- O problema: uma operação como `contador += 10` **não é atômica** (vira
  LOAD/ADD/STORE em assembly); se a tarefa for interrompida no meio, outra
  tarefa pode corromper o valor. O mesmo vale para periféricos (ex.: duas
  tarefas escrevendo no LCD ao mesmo tempo geram texto embaralhado).
- A **exclusão mútua** garante que a seção crítica execute de forma **atômica**.
- Semáforo binário (estados *Available*/*Unavailable*) × Mutex (estados
  *Unlocked*/*Locked*, com **posse**): o mutex só pode ser liberado por quem o
  adquiriu; o semáforo pode ser liberado por qualquer tarefa/ISR.

---

## Questão 6 — Fila de mensagens *(1,0)*

**O que é:** uma **fila de mensagens** (*message queue*) é um objeto do kernel,
do tipo *buffer*, através do qual **tarefas e ISRs enviam e recebem mensagens**
para se comunicar e sincronizar **trocando dados** (preferencialmente por
valor). Cada fila tem um comprimento finito (*queue length*) e itens de tamanho
fixo (*item size*); os dados enviados são **copiados** para a fila (FIFO, por
padrão).

### Exemplo no projeto (robô seguidor de linha)

Comunicação **unidirecional, produtor → consumidor** (*non-interlocked,
one-way*):

- A **tarefa (ou ISR) de aquisição** lê o conjunto de sensores ópticos, calcula
  a **posição da linha** (erro em relação ao centro) e **envia esse valor como
  mensagem** para uma fila `qLinePosition`.
- A **tarefa de controle** fica bloqueada **lendo** a fila. Quando uma nova
  posição chega, ela é desbloqueada, processa o erro (PID) e atua nos motores.

Vantagens nesse caso:

- **Desacopla** produtor e consumidor (cada um roda na sua taxa);
- transfere dados **com segurança** (a cópia é atômica do ponto de vista da
  aplicação — não precisa de mutex para o dado em si);
- a tarefa consumidora **dorme** (estado *Blocked*) enquanto não há dados, sem
  desperdiçar CPU (sem *busy-wait*).

> Outro uso típico: uma **tarefa gatekeeper** que centraliza o envio de
> mensagens de status/telemetria por UART — várias tarefas postam mensagens de
> texto na fila e só o gatekeeper acessa o periférico (protege a seção crítica).

### 📚 Teoria — Filas de mensagens

- Não pertencem a nenhuma tarefa específica; várias tarefas podem escrever/ler.
- Ao **escrever** numa fila cheia, a tarefa pode entrar em *Blocked* (com
  *timeout* configurável) até abrir espaço; ao **ler** uma fila vazia, bloqueia
  até chegar um item.
- Ordenamento: **FIFO** (padrão), LIFO ou por prioridade.
- Escrever = **copiar byte a byte**. Se o dado for muito grande (vetores,
  structs grandes), o custo de cópia é proibitivo → recomenda-se usar uma
  **variável global protegida por mutex/semáforo**. **Não** se recomenda enviar
  *ponteiros* pela fila.
- Estados de uma fila: `Empty` ↔ `Not Empty` ↔ `Full`.

---

## Questão 7 — Fluxograma de um termômetro digital *(1,0)*

Termômetro digital para aferição de temperatura **em seres humanos**:
liga, lê o sensor, converte para temperatura, verifica faixa válida, exibe no
display e sinaliza febre quando aplicável.

### Símbolos (padrão ANSI/ISO)

```
( oval )  → início/fim      [ retângulo ] → processo
/ paralelogramo / → E/S     < losango >   → decisão
```

### Fluxograma

```
                ┌──────────────┐
                │   ( INÍCIO ) │
                └──────┬───────┘
                       ▼
              [ Inicializa HW: ADC, ]
              [ display, sensor     ]
                       ▼
              /  Aguarda acionar   /
              /  (botão liga/medir)/
                       ▼
              [ Lê valor do sensor ]
              [ (ADC)              ]
                       ▼
              [ Converte leitura   ]
              [ em temperatura (°C)]
                       ▼
                 < Leitura dentro >
                 < da faixa válida? > ──Não──┐
                 < (≈ 30–45 °C)    >         ▼
                       │ Sim          / Exibe "Erro/  /
                       ▼              / Reposicionar" /
              / Exibe temperatura /          │
              / no display        /          │
                       ▼                      │
                 < Temp ≥ 37,8 °C? >          │
                  │            │              │
                 Sim          Não             │
                  ▼            │              │
          [ Sinaliza febre     ]│             │
          [ (beep / LED / ícone)]│            │
                  └──────┬───────┘            │
                         ▼                     │
                  < Nova medição? > ◄──────────┘
                   │           │
                  Sim         Não
                   │           ▼
                   │    ┌──────────────┐
                   │    │  ( FIM /      │
                   │    │   desliga )   │
                   │    └──────────────┘
                   └───────────► (volta a "Lê valor do sensor")
```

### 📚 Teoria — Fluxogramas

Fluxogramas representam **algoritmos lineares**; ramificações só ocorrem em
comandos de **decisão** (losango), que podem ter **mais de duas saídas**
(equivalendo a `switch/case` ou `if` aninhados). **Não representam
paralelismo** — por isso, em sistemas com RTOS, cada **tarefa** e cada **ISR**
é desenhada em um fluxograma **separado**. Em geral todo fluxograma tem
`início` e `fim` (exceção: o laço infinito da `main`/tarefa, que não "termina").

---

## Questão 8 — Requisitos do robô seguidor de linha *(1,0)*

**Requisitos funcionais** = **funcionalidades** que o sistema deve realizar.
**Requisitos não funcionais** = **restrições** do projeto (tempo, recursos,
energia, custo, confiabilidade, etc.).

### Requisitos Funcionais (o que o robô faz)

| # | Requisito funcional |
|---|---------------------|
| RF1 | Detectar a linha no piso por meio de **sensores ópticos** (refletância). |
| RF2 | Calcular a **posição/erro** do robô em relação ao centro da linha. |
| RF3 | **Controlar os motores** (via PWM) para manter o robô sobre a linha (controle, ex. PID). |
| RF4 | **Seguir a linha** em retas e curvas, corrigindo o trajeto continuamente. |
| RF5 | Tratar **perda de linha** (ex.: parar ou executar manobra de busca). |
| RF6 | Permitir **iniciar/parar** a operação (botão ou comando). |
| RF7 | **Indicar o status** ao usuário (LEDs / display). |
| RF8 | Detectar **marcações de pista** (ex.: linha de chegada) e parar. |

### Requisitos Não Funcionais (restrições do projeto)

| # | Requisito não funcional |
|---|-------------------------|
| RNF1 | **Tempo real:** o laço de controle deve executar em período **determinístico** (ex.: a cada 5 ms) — restrição de tempo. |
| RNF2 | **Consumo de energia** reduzido (alimentação por **bateria**). |
| RNF3 | **Desempenho:** completar o percurso no **menor tempo** possível (velocidade). |
| RNF4 | **Custo, peso e tamanho** limitados. |
| RNF5 | **Confiabilidade/robustez** a variações de iluminação e do piso. |
| RNF6 | Usar a **plataforma definida** (microcontrolador STM32 / kit Nucleo). |
| RNF7 | Usar **RTOS (FreeRTOS)** para gerência das tarefas concorrentes. |
| RNF8 | Aderir ao **padrão de codificação** da disciplina (testabilidade/manutenibilidade). |

### 📚 Teoria — Levantamento de requisitos

- **Requisitos funcionais** definem as **funcionalidades** do sistema de forma
  completa e concisa (*o que* o sistema faz).
- **Requisitos não funcionais** referem-se às **restrições do projeto** que
  afetam as funcionalidades: restrições de tempo, uso de recursos, consumo de
  energia, custo, ambiente de operação, confiabilidade, desempenho, usabilidade,
  testabilidade, segurança, escalabilidade, etc.
- A dificuldade do levantamento vem da **comunicação usuário↔desenvolvedor** e
  do fato de o cliente nem sempre saber o que realmente deseja. A fase de
  **especificação** transforma necessidades em requisitos alinhados com o
  cliente — e é a etapa onde o **custo de corrigir um defeito** é mais baixo.

---

### Referências (material da disciplina)

- Aula 1 — *Conceitos básicos de sistemas embarcados e de tempo real*
- Aula 3 — *Padrão de codificação* (baseado em MISRA C / Doxygen)
- Aula 5/6 — *Máquina de estados* e *Implementação do protocolo de comunicação*
- Aula 9 — *Sincronização intertarefas* (semáforos, mutex)
- Aula 11 — *Comunicação intertarefas* (filas de mensagens)
- Aula 14 — *Introdução à modelagem de sistemas embarcados* (requisitos, FSM, fluxogramas)
