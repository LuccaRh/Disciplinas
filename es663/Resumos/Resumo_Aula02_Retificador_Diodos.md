<div align="center">

# ⚡ Resumo — ES663

## Aula 02 · Retificador de Diodos (AC → DC)

*Baseado nas Aulas 02A, 02B e 02C (Prof. Eric Fujiwara) — Unicamp/FEM/DSI*
**A ideia-mestra:** o diodo é uma **válvula de mão única** para corrente. Se eu só deixo passar a parte "certa" da senóide, sobra um sinal que tem **média DC** — pronto, retifiquei.

</div>

---

## 🔑 0 · A chave que destrava o capítulo

> Todo retificador de diodos é a **mesma ideia** com mais ou menos válvulas:

```text
  O diodo conduz SÓ quando o ânodo está mais positivo que o cátodo.
  → ele "corta" ou "espelha" pedaços da senóide da rede.
  → o que sobra tem um VALOR MÉDIO (DC) diferente de zero.

  Meia-onda  → deixa passar 1 semi-ciclo   (½ da onda)   → DC fraco
  Onda comp. → espelha os 2 semi-ciclos    (onda toda)   → DC bom
  Trifásico  → soma 3 fases defasadas       → DC quase perfeito
```

> 💡 Quanto **mais pedaços da onda** eu aproveito, **mais "reto" (DC)** fica o resultado e **melhor a eficiência**. É literalmente essa a progressão da aula.

<br>

---

## 🚪 1 · O diodo de potência (a válvula)

```text
        ânodo (A) ──►|── cátodo (K)
                     diodo
        vD = vA − vK

  vA > vK  →  CONDUZ  (polarização direta):   vD = 0,  iD > 0
  vA < vK  →  BLOQUEIA (polarização reversa):  vD < 0,  iD = 0
```

| Parâmetro (diodo **real**) | O que é |
|:---|:---|
| Tensão direta `vF` | quedinha ao conduzir (~0,5–1 V) |
| Tensão de ruptura `vBD` | máxima tensão reversa suportada (passar disso = queima) |

> 📌 **Diodo ideal** (o que usamos nas contas): conduz sem queda (vD=0), bloqueia sem fuga (iD=0), comuta na hora. Uma válvula perfeita.

<br>

---

## 🌗 2 · Retificador de MEIA-ONDA (1 diodo)

```text
  Fonte AC        D           Carga
    vs ──────►|──────┬────
                     │
                    R (carga)
                     │
    ─────────────────┴────

  vs = Vp·sin(ωt)
```

| Semi-ciclo da fonte | Diodo | Tensão na carga |
|:---|:---|:---|
| **Positivo** (vs > 0) | conduz (vD=0) | `vo = vs` |
| **Negativo** (vs < 0) | bloqueia (iD=0) | `vo = 0` |

```text
 vo ▲   ╱╲        ╱╲        ╱╲       ← só os "morros" positivos passam
    │  ╱  ╲      ╱  ╲      ╱  ╲
    │ ╱    ╲    ╱    ╲    ╱    ╲
    └───────────────────────────► ωt
             (vales negativos = zerados)
```

### 📐 Fórmulas de meia-onda (DECORE a estrutura, não os números)

```text
              Vp                        Vp
  V_DC = ─────         V_rms = ─────
              π                          2

  I_DC = V_DC/R        I_rms = V_rms/R

  P_DC = V_DC·I_DC     P_rms = V_rms·I_rms
```

> 🔎 De onde vem? `V_DC` é a **média** da meia-senóide (integra de 0 a π, divide por 2π). `V_rms` é o valor eficaz de meia-senóide, que dá `Vp/2`.

<br>

---

## 🌕 3 · Retificador de ONDA COMPLETA (ponte de 4 diodos)

```text
       ┌──►|──┬──►|──┐        +
       │ D1   │  D3  │
  vs ──┤      ●──────┤──── R (carga)  vo
       │ D4   │  D2  │
       └──|◄──┴──|◄──┘        −
```

| Semi-ciclo | Diodos conduzindo | Tensão na carga |
|:---|:---|:---|
| **Positivo** | D1 e D2 | `vo = vs` |
| **Negativo** | D3 e D4 | `vo = vs` (repare: a ponte **inverte** o negativo!) |

```text
 vo ▲  ╱╲  ╱╲  ╱╲  ╱╲  ╱╲   ← o vale negativo é "dobrado" para cima
    │ ╱  ╲╱  ╲╱  ╲╱  ╲╱  ╲
    └────────────────────────► ωt
       vo(t) = |vs(t)|   (sempre positivo!)
```

### 📐 Fórmulas de onda completa

```text
              2·Vp                       Vp
  V_DC = ──────        V_rms = ─────
               π                          2

  → o V_DC DOBRA em relação à meia-onda (aproveita os 2 semi-ciclos)
  → o V_rms é o MESMO (Vp/√2)
```

<br>

---

## 🎚️ 4 · Cargas diferentes de R (o que o indutor e o capacitor fazem)

Isto cai muito. O **tipo de carga** muda a forma de onda:

| Carga | Efeito físico | O que acontece |
|:---|:---|:---|
| **R** | resistiva pura | corrente segue a tensão, em fase |
| **RL** | indutor guarda energia | o indutor vira **fonte de corrente**: a corrente **atrasa** e **continua positiva** mesmo quando vs fica negativo → o diodo conduz "de graça" um pouco mais |
| **RC** | capacitor guarda tensão | o capacitor **descarrega** na carga quando vs cai → **reduz o ripple** (vo mais reto) |
| **RLE** | RL + fonte DC (ex.: motor) | o diodo só liga quando `vs > E` (tem que "vencer" a força contra-eletromotriz) |

```text
 Carga RL (meia-onda):
   vs ▲   ╱╲                     vo pode ficar NEGATIVO
      │  ╱  ╲___                 (mas i sempre > 0)
      │ ╱   ╱ ╲  ← i atrasa, "arrasta" a condução
      └──────────────► ωt        além do semi-ciclo positivo
```

> 🧲 **Regra de ouro do indutor:** `vL = L·di/dt`. A **tensão média no indutor é sempre zero** (num regime periódico). Logo, em média, `V_DC(carga) = V_DC(resistor)`. Use isso para achar médias rápido!

> 🔋 **Fórmula do defasamento** (carga RL): a corrente atrasa da tensão por
> ```text
>   φ = arctan(ωL / R)
> ```

<br>

---

## 🔺 5 · Retificador TRIFÁSICO (6 diodos) — o campeão

Alimentado por 3 fases defasadas de 120°:

```text
  Tensões de FASE (relativas ao neutro):
    v_AN = Vp·sin(ωt)
    v_BN = Vp·sin(ωt − 120°)
    v_CN = Vp·sin(ωt + 120°)

  Tensões de LINHA (fase − fase),  V_LL = √3·V_rms(fase):
    v_AB, v_BC, v_CA   → amplitude de pico = √2·V_LL
```

```text
  Fonte 3Φ    D1  D3  D5      +
    A ─┬──────►|──►|──►|──┐
    B ─┤                  ├── R  vo
    C ─┤                  │
       └──|◄──|◄──|◄──────┘      −
          D4  D6  D2
```

> ⚙️ **Como funciona:** os diodos de cima (D1,D3,D5) pegam sempre a fase **mais positiva**; os de baixo (D4,D6,D2) a **mais negativa**. A carga vê `vo = (fase mais positiva) − (fase mais negativa)` = sempre a **maior tensão de linha do momento**.

```text
 vo ▲  ⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒   ← "coroa" quase reta feita dos topos das linhas
    │ ╱                 (só ondula 60°, mal desce)
    └────────────────► ωt      ripple minúsculo!
```

### 📐 Fórmulas do trifásico

```text
            3·√2
  V_DC = ────── · V_LL  ≈  1,35 · V_LL       V_rms ≈ V_DC
              π
```

<br>

---

## 📊 6 · Tabela comparativa (a que a prova adora)

> Três parâmetros medem **"quão bom é o DC"** que sai:

```text
  σ  (fator de retificação) = P_DC / P_rms     → quer 100% (eficiência)
  FF (fator de forma)       = V_rms / V_DC     → quer 1,00 (puro DC)
  RF (fator de ripple)      = √(FF² − 1)       → quer 0,00 (sem ondulação)
```

| Retificador | σ (retificação) | FF (forma) | RF (ripple) |
|:---|:---:|:---:|:---:|
| **Meia-onda** | 40,5 % | 1,57 | 1,21 |
| **Onda completa** | 81 % | 1,11 | 0,48 |
| **Trifásico** | ≈ 100 % | ≈ 1,00 | ≈ 0,00 |

> 🎯 **A moral:** quanto mais pedaços da onda você aproveita, mais o sinal se aproxima de um DC perfeito. Meia-onda é o pior, trifásico é o melhor.

<br>

---

## ✅ 7 · Checklist de prova

- [ ] 🚪 Diodo conduz só com `vA > vK`. Ideal: vD=0 conduzindo, iD=0 bloqueado.
- [ ] 🌗 Meia-onda: `V_DC = Vp/π`, `V_rms = Vp/2`.
- [ ] 🌕 Onda completa: `V_DC = 2Vp/π` (dobra!), `V_rms = Vp/2` (igual).
- [ ] 🔺 Trifásico: `V_DC = 3√2/π · V_LL ≈ 1,35·V_LL`, ripple ≈ 0.
- [ ] 🧲 Indutor: tensão média **zero** → `V_DC` da carga = `V_DC` do R.
- [ ] 🎚️ RL atrasa corrente (`φ=arctan(ωL/R)`) · RC reduz ripple · RLE só conduz se `vs>E`.
- [ ] 🔁 Sempre converta `Vp = V_rms·√2` **antes** de aplicar as fórmulas.

<div align="center">

---

**Anterior:** [Aula 01](Resumo_Aula01_Introducao.md) · **Próxima:** [Aula 03 — Retificador Controlado](Resumo_Aula03_Retificador_Controlado.md)
*Exercícios relacionados na Lista 01: `Ex 1` (meia-onda), `Ex 2` (onda completa RL), `Ex 3` (trifásico).*

</div>
