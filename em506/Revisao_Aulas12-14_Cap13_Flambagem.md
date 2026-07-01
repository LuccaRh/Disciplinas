(No terminal, rodar com glow)
<div align="center">

# 🧭 Revisão — EM506

## Aulas 12, 13 & 14 · Cap. 13 Hibbeler · **Flambagem e Instabilidade de Colunas**

`13.1` · `13.11` · `13.19` · `13.23` · `13.26` · `13.31` · `13.34`

*Baseado nas Aulas 12–14 (Prof. Daros) + Hibbeler Cap. 13*
**A ideia-mestra:** até o Cap. 10 a pergunta era *"a tensão passou do limite do material?"*. Agora é uma pergunta **geométrica e totalmente nova**: *"a coluna **entorta de repente** mesmo com tensão baixa?"* Isso é **flambagem** — uma falha por **forma (estabilidade)**, não por resistência.

</div>

---

## 🔑 0 · O que muda agora (e por que é um assunto "à parte")

Tudo que você viu até o Cap. 10 era sobre **resistência**: comparar uma tensão (σ, τ, σvm…) com um limite do material (σe, σr). A peça falhava quando a tensão era **alta demais**.

Flambagem é **outra coisa**:

```text
  Uma coluna longa e fina sob COMPRESSÃO pode, de repente, ENTORTAR
  lateralmente e desabar — mesmo com a tensão MUITO abaixo de σe.

  Não é o material que cede. É a FORMA reta que deixa de ser estável.
```

> 🎯 **A virada de chave:** flambagem **não depende de σe** (a princípio). Depende de **rigidez** (E), **geometria da seção** (I) e **comprimento** (L). É um problema de **estabilidade do equilíbrio**, parecido com equilibrar um lápis na ponta: o lápis não "quebra", ele **tomba**.

| Cap. 9–10 (resistência) | Cap. 13 (estabilidade) |
|:---|:---|
| Falha = tensão atinge σe ou σr | Falha = a coluna **entorta** (flamba) |
| Importa o **material** (σe) | Importa **E, I, L** (rigidez e forma) |
| Estado local de tensão | Comportamento **global** da peça |
| σ ≤ limite | P ≤ **Pcr** (carga crítica) |

E no fim a gente junta os dois: a coluna falha pelo que vier **primeiro** — flambar **ou** escoar.

<br>

---

## 🧱 1 · A intuição física: barra rígida + mola (modelo do Exercício 13.1)

Antes da coluna "de verdade", o Prof. mostra o modelo mais simples possível de instabilidade. **É exatamente o Exercício 13.1.**

Imagine uma **barra rígida** (não entorta, não dobra) de comprimento `L`, presa por um **pino na base A**, e segurada na vertical por uma **mola** de rigidez `k`. Aplica-se uma carga vertical `P` no topo.

```text
            P              • Barra RÍGIDA, pino em A (base).
            │              • Mola que resiste ao tombamento.
         ┌──┴──┐           • P empurra de cima para baixo.
         │ L/2 │
         ├─────┤ ← mola k (na metade da altura)
         │ L/2 │
         A═════╧═  (pino)
```

Dê um empurrãozinho: a barra gira um anguinho `θ`. Duas coisas competem:

```text
  MOMENTO que DERRUBA (P quer aumentar θ):   M_P  = P · (deslocamento) 
  MOMENTO que ENDIREITA (a mola reage):       M_k = k · (deformação da mola)
```

- Se `M_k > M_P` → a mola vence, a barra **volta**. **Equilíbrio estável.**
- Se `M_k < M_P` → `P` vence, a barra **tomba**. **Equilíbrio instável.**
- Na fronteira `M_k = M_P` → **equilíbrio neutro (indiferente)**. O `P` desse exato ponto é a **carga crítica `Pcr`**.

> 💡 **Carga crítica = o P em que o equilíbrio deixa de ser estável.** Abaixo dela a coluna reta é estável; acima, qualquer cutucão a derruba. É o mesmo conceito da coluna real — só que aqui dá para "ver na mão".

**Como montar (para θ pequeno: sen θ ≈ θ, cos θ ≈ 1):** tudo é **momento em torno do pino A**.

```text
  Mola no meio (altura L/2), deslocamento horizontal da mola = (L/2)·θ
     força da mola      = k·(L/2)·θ
     momento restaurador= [k·(L/2)·θ] · (L/2) = k·L²·θ/4

  Carga P no topo, deslocamento horizontal do topo = L·θ
     momento de tombamento = P · L · θ

  Equilíbrio neutro:  P·L·θ = k·L²·θ/4   →   Pcr = k·L/4
```

> ✅ Esse é o método de **TODO** problema de "barra rígida + mola": escreva `ΣM = 0` no pino, lineariza (θ pequeno), e o `Pcr` é o `P` que zera o termo em `θ`. (Onde a mola está e se é **mola de translação** `k` [N/m] ou **mola de torção** `kt` [N·m/rad] muda só a conta do momento restaurador.)

<br>

---

## 📐 2 · A coluna ideal de Euler (apoiada por pinos)

Agora a coluna **real**: reta, homogênea, carga no centro da seção, e que pode **fletir** (não é mais rígida). Apoiada por **pinos** nas duas pontas.

### 2.1 · De onde vem a fórmula (a deformada é uma senoide)

Quando ela flamba, fica curva. A curva `υ(x)` obedece à equação da linha elástica com o momento gerado pela própria carga `M = −P·υ`:

```text
   E·I · υ'' = M = −P·υ      →     υ'' + (P/EI)·υ = 0
```

Isso é a equação de um **oscilador** (igual massa-mola): a solução é seno/cosseno.

```text
   υ(x) = C1·sen(√(P/EI)·x) + C2·cos(√(P/EI)·x)
```

Aplicando os apoios (υ = 0 em x = 0 e em x = L):

```text
   υ(0)=0  →  C2 = 0
   υ(L)=0  →  C1·sen(√(P/EI)·L) = 0
```

Como `C1 = 0` daria a coluna reta (solução "trivial", sem flambagem), a **única** saída interessante é o seno zerar:

```text
   sen(√(P/EI)·L) = 0   →   √(P/EI)·L = n·π     (n = 1, 2, 3...)
```

Isolando P e pegando o **menor** valor (n = 1, o primeiro que aparece quando se aumenta a carga):

```text
   ┌─────────────────────────┐
   │           π² E I        │
   │   Pcr =  ─────────      │   ← CARGA CRÍTICA DE EULER (apoio por pinos)
   │            L²           │
   └─────────────────────────┘
```

> 🔑 Leia a fórmula: a coluna aguenta mais (`Pcr` maior) se for **mais rígida** (E grande), de **seção mais "gorda/espalhada"** (I grande) e **mais curta** (L pequeno). O `L` entra **ao quadrado** → dobrar o comprimento divide a carga crítica por **4**. Por isso coluna longa flamba fácil.

### 2.2 · ⚠️ Ponto que mais cai: ela flamba em torno do MENOR I

A coluna entorta para o lado **mais fácil** = o eixo da seção com o **menor momento de inércia**.

```text
   Na fórmula, use  I = I_mínimo  da seção (a não ser que os apoios
   travem aquele eixo — ver Seção 5, flambagem por eixo).
```

> 💡 Por isso **tubo** é ótima coluna: `Ix = Iy`, não há "lado fraco". Uma régua/barra chata flamba sempre achatando a menor espessura.

<br>

---

## 🔩 3 · Condições de contorno: o fator de comprimento efetivo K

Pinada-pinada foi só o primeiro caso. Engastar ou liberar as pontas muda a "cara" da deformada — e isso entra como um fator **K** que **substitui L por um comprimento efetivo `Le = K·L`**:

```text
   ┌──────────────────────────┐
   │          π² E I          │
   │  Pcr = ───────────       │      Le = K·L  (comprimento efetivo)
   │          (K·L)²          │
   └──────────────────────────┘
```

Os quatro casos clássicos (decore esta tabela — é a chave de metade dos exercícios):

```text
  APOIOS DA COLUNA                         K        Le = K·L
  ───────────────────────────────────────────────────────────
  Pino  – Pino       (rótula nas 2 pontas)  1,0      1,0·L
  Engaste – Engaste  (fixa nas 2 pontas)    0,5      0,5·L
  Engaste – Pino     (uma fixa, outra rótula) 0,7    0,7·L
  Engaste – Livre    (uma fixa, outra solta) 2,0      2,0·L
```

> 🧠 **Como lembrar:** quanto **mais travada** a coluna, **menor o K** e **maior** o `Pcr`. Engaste-engaste (K = 0,5) é a mais resistente: `Pcr` fica **4×** o da pino-pino (porque K² = 0,25). Engaste-livre (K = 2) é a pior: `Pcr` cai para **1/4**.

> ✔️ **Atalho:** entre dois casos, `Pcr ∝ 1/K²`. Engaste-engaste aguenta 4× a pino-pino; engaste-pino aguenta `(1/0,7)² ≈ 2×`.

<br>

---

## 📊 4 · Tensão crítica e índice de esbeltez (quando Euler vale)

Dividindo `Pcr` pela área, vira **tensão**. Usando o **raio de giração** `r` (definido por `I = A·r²`, ou seja `r = √(I/A)`):

```text
            Pcr      π² E
   σcr = ──────── = ─────────         L/r = ÍNDICE DE ESBELTEZ (adimensional)
             A       (KL/r)²
```

- `σcr` = tensão média na coluna **no instante da flambagem**.
- `KL/r` = **esbeltez**: o quanto a coluna é "longa-e-fina". Esbelta = `KL/r` grande = flamba fácil (σcr baixa).

> ⚠️ **A fronteira que decide se Euler vale:** a dedução de Euler supõe material **elástico**. Logo só vale enquanto `σcr ≤ σe`. Se a conta der `σcr > σe`, a coluna **escoa ANTES de flambar** — Euler não se aplica e a peça falha por **compressão simples** (`P = σe·A`). **Sempre confira `σcr` contra `σe` no fim.**

```text
   Receita de verificação (todo problema de coluna real):
     1) calcule Pcr (Euler, com o K certo e o I certo)
     2) σcr = Pcr / A
     3) σcr < σe ?  → SIM: flamba primeiro (Euler vale, resposta = Pcr)
                      NÃO: escoa primeiro (resposta = σe·A, "não atinge Pcr")
```

<br>

---

## 🧭 5 · Flambagem por EIXO: quando cada eixo tem K diferente

Caso mais "esperto" (Exercícios 13.26 e 13.34). Às vezes os apoios **travam um eixo de um jeito e o outro eixo de outro jeito**. Aí a coluna tem **duas cargas críticas** — uma para cada eixo — e flamba pela **MENOR**:

```text
   (Pcr)x = π² E Ix / (Kx·L)²        ← flambagem em torno de x
   (Pcr)y = π² E Iy / (Ky·L)²        ← flambagem em torno de y

   A coluna flamba pela MENOR das duas  →  Pcr = min{ (Pcr)x , (Pcr)y }
```

> 🔑 **Cuidado:** não basta pegar o menor I. O eixo "forte" (I grande) pode acabar governando se o seu K·L for muito maior (ex.: aquele eixo é pino-pino enquanto o fraco é engaste-engaste). **Calcule os dois e compare os Pcr.** Foi isso que decidiu o 13.26.

<br>

---

## 🏗️ 6 · Coluna que é PEÇA de uma treliça/mecanismo (13.23, 13.31, 13.34)

Muitos exercícios não dão a carga na coluna direto — dão uma carga `P` na **estrutura** e perguntam quanto ela aguenta antes de **uma barra** flambar. O procedimento tem **duas etapas**:

```text
   ETAPA 1 (ESTÁTICA — Cap. de treliças): ache a FORÇA de compressão na
            barra de interesse em função de P (nós / seções).
            → ex.: F_AB = (5/3)·P  (compressão)

   ETAPA 2 (FLAMBAGEM): essa força não pode passar do Pcr daquela barra
            (com o L e a seção dela). Iguale e isole P.
            → F_barra = Pcr   (ou  F_barra·FS = Pcr, se pedir fator de segurança)
```

> 💡 Só **barras comprimidas** flambam — barras tracionadas nunca. Identifique pelo sinal da força (compressão) qual barra checar.

**Projeto com fator de segurança** (achar o diâmetro, 13.31): a barra precisa de uma folga FS sobre a carga real:

```text
   Pcr ≥ FS · F_barra        e        Pcr = π² E I / (K L)²

   Para haste circular maciça:  I = π·d⁴/64   →   isolando o diâmetro:

        d = [ 64 · (FS·F) · (KL)² / (π³ · E) ] ^(1/4)

   depois ARREDONDA PARA CIMA até o múltiplo de 5 mm pedido.
```

<br>

---

## 🧮 7 · Propriedades de seção que você vai precisar

```text
  Haste circular MACIÇA (diâmetro d, raio r):
     A = π d²/4 = π r²            I = π d⁴/64 = π r⁴/4
  Tubo (externo do, interno di):
     A = π(do² − di²)/4          I = π(do⁴ − di⁴)/64
  Retângulo (base b, altura h):   [b = lado ⟂ ao eixo de flexão]
     I = b·h³/12       → o MENOR I usa o maior lado como "b" e o menor como "h"
  Raio de giração:  r = √(I/A)
  Perfis W (ex.: W250×67): pega A, Ix, Iy direto na TABELA do Apêndice B.
```

**Materiais que aparecem:**

```text
  Aço A-36:            E = 200 GPa,  σe = 250 MPa
  Aço-ferramenta L-2:  E = 200 GPa  (é aço → mesmo E)
  Alumínio:            E ≈ 70 GPa
  W250×67 (Apêndice B): A = 8.560 mm², Ix = 104×10⁶ mm⁴, Iy = 22,2×10⁶ mm⁴
```

<br>

---

## 🗺️ 8 · Mapa — a qual tipo pertence cada exercício

| 🏷️ Tipo | 📋 Problema | 🎯 O que pede | 🛠️ Ferramenta |
|:---|:---|:---|:---|
| **A** · Barra rígida + mola | `13.1` | Pcr (estabilidade) | ΣM no pino (Seção 1) |
| **B** · Coluna real + checar escoamento | `13.11` | Pcr e "escoa antes?" | Euler + σcr vs σe |
| **C** · Coluna real, K ≠ 1 | `13.19` | Pcr (engaste-pino) | Euler com Le = KL |
| **D** · Barra de treliça | `13.23` | P máx da estrutura | Estática → Euler |
| **E** · Coluna, 2 eixos com K diferente | `13.26` | P máx com FS | min dos dois Pcr |
| **F** · Projeto de haste (mecanismo) | `13.31` | diâmetro com FS | Estática → isola d |
| **G** · Barra de pórtico, 2 eixos | `13.34` | P máx | Estática → min dos Pcr |

<br>

---

## ✅ 9 · Resolução problema a problema (com gabaritos)

### 🅰️ Tipo A — Barra rígida + mola

> #### 🔸 13.1 — carga crítica da coluna rígida com mola
> **Modelo:** barra **rígida** de comprimento `L`, pino na base, **mola `k` na metade da altura** (Seção 1). Material "rígido" = não fletir, só tombar.
> ```text
>   ΣM no pino A (θ pequeno):
>      tombamento (P no topo):     P · L · θ
>      restaurador (mola no meio): k·(L/2)·θ · (L/2) = k·L²·θ/4
>      neutro:  P·L·θ = k·L²·θ/4
> ```
> ✅ **Gabarito:  Pcr = k·L / 4.**
> 💡 Note: **não tem E nem I** — a barra é rígida, quem segura é a mola. É o "esqueleto" conceitual da flambagem.

<br>

### 🅱️ Tipo B — Coluna real + checagem de escoamento

> #### 🔸 13.11 — W250×67 engastada nas 2 pontas: aguenta o Pcr sem escoar?
> **Dados:** W250×67, A-36 (E = 200 GPa, σe = 250 MPa), L = 4,5 m, **engaste-engaste → K = 0,5**. Flamba pelo eixo fraco → `Iy = 22,2×10⁶ mm⁴`.
> ```text
>   Le = K·L = 0,5·4,5 = 2,25 m
>   Pcr = π²E·Iy/(Le)² = π²(200×10⁹)(22,2×10⁻⁶)/(2,25)² ≈ 8,66×10³ kN
>          (gabarito do livro: 8.466,8 kN — usa Iy ≈ 21,7×10⁶ da tabela antiga)
> ```
> **Agora a pergunta-chave (escoa antes?):**
> ```text
>   Carga que causa escoamento puro:  P_esc = σe·A = 250×10⁶ · 8.560×10⁻⁶ = 2.140 kN
>   Como Pcr (≈8.500 kN)  >>  P_esc (2.140 kN), a coluna ESCOA muito antes
>   de chegar perto da carga de flambagem.
>   (σcr = Pcr/A ≈ 1.011 MPa, absurdamente acima de 250 MPa → Euler nem vale)
> ```
> ✅ **Gabarito:  NÃO** — ela não suporta a carga crítica sem escoar; falha por **compressão/escoamento** muito antes.
> 💡 Lição: quando a coluna é **curta/robusta** (esbeltez baixa), o escoamento manda, não a flambagem. Sempre cheque `σcr` vs `σe`. *(O 13.10 é a mesma coluna pino-pino: Pcr ≈ 2.117 kN e FS = 2.117/500 ≈ 4,23.)*

<br>

### 🅲 Tipo C — Coluna real com K ≠ 1

> #### 🔸 13.19 — tubo A-36 engastado na base, pino no topo
> **Dados:** tubo A-36, `do = 75 mm`, `t = 6 mm` → `di = 75 − 2·6 = 63 mm`, L = 3,6 m. **Engaste-pino → K = 0,7.**
> ```text
>   I = π(do⁴ − di⁴)/64 = π(75⁴ − 63⁴)/64 = 0,780×10⁶ mm⁴ = 0,780×10⁻⁶ m⁴
>   Le = K·L = 0,7·3,6 = 2,52 m
>   Pcr = π²E·I/(Le)² = π²(200×10⁹)(0,780×10⁻⁶)/(2,52)²
> ```
> ✅ **Gabarito:  Pcr = 242,4 kN.**
> 💡 Compare com o 13.18 (mesmo tubo, pino-pino, K = 1): Pcr = 118,8 kN. Engastar a base **dobrou** a capacidade — é o efeito do `1/K²` (1/0,7² ≈ 2).

<br>

### 🅳 Tipo D — Barra de treliça

> #### 🔸 13.23 — maior P na treliça sem flambar a barra AB (raio 50 mm)
> **ETAPA 1 — estática (acha a força em AB):** com a geometria da treliça (A na base, B no alto a 4 m horizontais e 3 m de altura → AB = 5 m), o equilíbrio do nó A dá:
> ```text
>   F_AB = (5/3)·P   (COMPRESSÃO)        comprimento  L_AB = 5 m
> ```
> **ETAPA 2 — flambagem** (haste maciça, raio r = 50 mm, pino-pino K = 1):
> ```text
>   I = π·r⁴/4 = π(0,05)⁴/4 = 4,909×10⁻⁶ m⁴
>   Pcr = π²E·I/L² = π²(200×10⁹)(4,909×10⁻⁶)/(5)² = 387,6 kN
>   Iguala:  F_AB = Pcr  →  (5/3)P = 387,6  →  P = 387,6·3/5
> ```
> ✅ **Gabarito:  P = 232,55 kN.**
> 💡 *(O 13.22 é a mesma treliça mas checando a barra BD: F_BD = (4/3)P, L = 4 m → Pcr = 605,6 kN → P = 454,2 kN. AB é a mais crítica.)*

<br>

### 🅴 Tipo E — Coluna com K diferente em cada eixo

> #### 🔸 13.26 — elo de aço-ferramenta L-2 (pino num eixo, engaste no outro)
> **Dados:** elo L = 600 mm, seção retangular **36 mm × 12 mm**, E = 200 GPa, **FS = 1,75**. Os pinos dos garfos deixam **girar em torno de um eixo (→ pino, K = 1)** mas **travam o outro (→ engaste, K = 0,5)**.
> ```text
>   Dois momentos de inércia da seção 36×12:
>      I_fraco = 36·12³/12 = 5.184 mm⁴      (eixo "fácil de entortar")
>      I_forte = 12·36³/12 = 46.656 mm⁴     (eixo "difícil")
>
>   O eixo FRACO é o ENGASTADO (K=0,5); o FORTE é o de PINO (K=1):
>      (Pcr)_fraco = π²E·I_fraco/(0,5·0,6)² = 113,7 kN
>      (Pcr)_forte = π²E·I_forte/(1,0·0,6)² = 255,8 kN
>      → governa o MENOR: Pcr = 113,7 kN
>
>   Carga admissível:  P = Pcr / FS = 113,7 / 1,75
> ```
> ✅ **Gabarito:  P = 64,97 kN.**
> 💡 **O pega:** o eixo fraco venceu mesmo sendo engastado (K = 0,5). Você **tem** que calcular os dois — nunca confie só no "menor I".

<br>

### 🅵 Tipo F — Projeto de diâmetro (mecanismo)

> #### 🔸 13.31 — diâmetro das hastes AB e BC (mecanismo, carga 4,5 kN, FS = 1,8)
> **ETAPA 1 — estática:** apex B no alto (3,6 m), A e C nas bases; peso de **4,5 kN** pendurado em B. Geometria: A=(0;0), B=(4,8; 3,6), C=(7,5; 0) → `AB = 6 m`, `BC = 4,5 m`. Equilíbrio do nó B:
> ```text
>   F_AB = 2,7 kN (compressão)      F_BC = 3,6 kN (compressão)
> ```
> **ETAPA 2 — projeto** (haste circular, pino-pino K = 1, A-36):
> ```text
>   d = [ 64·(FS·F)·L² / (π³·E) ]^(1/4) , arredonda ↑ p/ múltiplo de 5 mm
>
>   AB:  F=2,7 kN, L=6,0 m  →  d = 36,7 mm  →  40 mm   ← governa o tamanho
>   BC:  F=3,6 kN, L=4,5 m  →  d = 34,1 mm  →  35 mm
> ```
> ✅ **Gabarito:  dAB = 40 mm, dBC = 40 mm** (o livro padroniza as duas hastes pelo maior; AB é a crítica por ser a mais longa).
> 💡 Repare: a barra **mais comprida** (AB) precisa de mais diâmetro **mesmo carregando menos força** — porque `Pcr` cai com `L²`. Comprimento pesa mais que a força.

<br>

### 🅶 Tipo G — Barra de pórtico com 2 eixos

> #### 🔸 13.34 — maior P sem flambar a barra AB (seção 50×50, 2 eixos)
> **Dados:** AB de aço (E = 200 GPa), seção **quadrada 50×50 mm**, `L_AB = 6 m`. Apoios: **pino-pino no eixo y (K = 1)** e **engaste-engaste no eixo x (K = 0,5)**. Quadrado → `Ix = Iy = 50⁴/12 = 520,8×10³ mm⁴`.
> **ETAPA 1 — estática do pórtico:** com a carga horizontal `P` em A transferida pela barra inclinada, a compressão em AB vale:
> ```text
>   F_AB = (2/3)·P   (compressão)
> ```
> **ETAPA 2 — duas flambagens, a menor governa:**
> ```text
>   (Pcr)y = π²E·I/(1,0·6)²  = 28,6 kN     ← y (pino-pino) é o menor → GOVERNA
>   (Pcr)x = π²E·I/(0,5·6)²  = 114,2 kN
>
>   F_AB = (Pcr)_menor  →  (2/3)P = 28,6  →  P = 28,6·3/2
> ```
> ✅ **Gabarito:  P = 42,8 kN.**
> 💡 Aqui `Ix = Iy` (quadrado), então quem decide é **só o K**: o eixo pino-pino (K = 1) é o elo fraco. *(Confere com o 13.33: P = 18 kN → F_AB = 12 kN → FS = 28,6/12 = 2,38.)*

<br>

---

## 🧷 10 · Os erros clássicos (cole na parede)

```text
 ① Esquecer o K. "Engastada" NÃO é K=1. Engaste-engaste K=0,5; engaste-livre K=2.
 ② Usar o I errado. A coluna flamba pelo MENOR I — a menos que aquele eixo
    esteja mais travado (então compare os dois Pcr, Seção 5).
 ③ Não checar σcr vs σe. Se σcr > σe a coluna ESCOA antes; Euler não vale (13.11).
 ④ Em treliça/pórtico: achar a força na barra ANTES de aplicar Euler (2 etapas).
 ⑤ Confundir I = πd⁴/64 (maciço) com a fórmula do tubo (do⁴ − di⁴).
 ⑥ FS na flambagem é sobre a CARGA: P_adm = Pcr/FS  (não sobre a tensão).
 ⑦ Só barra COMPRIMIDA flamba. Barra tracionada nunca.
```

<br>

---

## 📋 11 · Checklist antes da prova

```text
 □ Sei o conceito: flambagem = perda de ESTABILIDADE (não é resistência)
 □ Modelo barra+mola: ΣM no pino, θ pequeno → Pcr (ex.: Pcr = kL/4)
 □ Euler: Pcr = π²EI/(KL)²   — sei a fórmula de cabeça
 □ Tabela do K: pino-pino 1 · eng-eng 0,5 · eng-pino 0,7 · eng-livre 2
 □ Flamba pelo MENOR I (ou menor Pcr, se K muda por eixo)
 □ σcr = π²E/(KL/r)² ; só vale se σcr ≤ σe (senão escoa antes)
 □ Treliça/mecanismo: ESTÁTICA (força na barra) → depois Euler
 □ Projeto de haste: d = [64·FS·F·(KL)²/(π³E)]^(1/4), arredonda ↑
 □ Propriedades: maciço πd⁴/64, tubo, retângulo bh³/12, perfil W na tabela
 □ FS de flambagem é sobre a carga: P_adm = Pcr/FS
```

<br>

---

## 📅 12 · Plano de estudo sugerido

```text
 1. 🧱 13.1 primeiro — fixa o CONCEITO (estabilidade, Pcr, equilíbrio neutro).
 2. 📐 13.19 — Euler puro com K≠1 (engaste-pino). Pega a mecânica da fórmula.
 3. 🧊 13.11 — Euler + a checagem σcr vs σe (quando a coluna escoa antes).
 4. 🏗️ 13.23 — treliça: treina a ETAPA 1 (estática) + ETAPA 2 (Euler).
 5. 🧭 13.26 e 13.34 — flambagem por EIXO (dois K, pega o menor Pcr).
 6. 🔧 13.31 — fecha com projeto: isola o diâmetro com FS, arredonda p/ cima.
```

<div align="center">

---

*EM506 · Resistência dos Materiais 2 · Aulas 12–14 · Cap. 13 Hibbeler*

</div>
