<div align="center">

# ⚡ Resumo — ES663

## Aula 04 · Conversor DC-DC (Chopper, Buck, Boost, Buck-Boost, Ponte H)

*Baseado nas Aulas 04A, 04B e 04C (Prof. Eric Fujiwara) — Unicamp/FEM/DSI*
**A ideia-mestra:** pego uma tensão DC e a **pico-e-corto** (chaveio) num duty cycle `D`. A **média** disso é minha nova tensão DC. Com um **indutor**, consigo até *subir* a tensão.

</div>

---

## 🔑 0 · A chave que destrava o capítulo

> Um só conceito comanda toda a aula — o **duty cycle**:

```text
  D = (tempo ligado) / (período) = t_on / T = t_on/(t_on+t_off)

  A chave liga/desliga MUITO rápido (kHz). A carga só "sente" a MÉDIA.
  → controlando a fração D do tempo ligada, controlo a tensão média.
```

```text
  T = 1/fs    (fs = frequência de chaveamento, ex.: 1 kHz)

  vo ▲ ┌──┐   ┌──┐   ┌──┐        D = 80% → média alta
  Vs  │ │  │  ..│  │  ..│  │
      │ │  │__│  │__│  │__│
      └─┴──────────────────► t
        ←t_on→←toff→
```

> 💡 **Comutação forçada:** ao contrário do retificador (60 Hz da rede), aqui **eu escolho** a frequência de chaveamento. Um sinal PWM de baixa potência comanda tudo.

<br>

---

## 🎚️ 1 · O PWM (como se gera o duty cycle)

Compara-se um nível DC `v_cont` com uma **portadora dente-de-serra** `v_st`:

```text
   v_cont > v_st → chave ON ;  v_cont < v_st → chave OFF

              v_cont
   D = ───────         (v̂_st = amplitude da rampa)
              v̂_st
```

<br>

---

## 🟦 2 · Chopper DC (o mais simples — só abaixa)

```text
       S (chave)
  Vs ──/ ──────┬────
               │
              R
               │
              ─┴─

  Chave ON : vo = Vs
  Chave OFF: vo = 0
```

```text
  ┌────────────────────┐
  │   V_DC = D · Vs     │        0 ≤ D ≤ 1  →  0 ≤ V_DC ≤ Vs
  └────────────────────┘
```

> ⚠️ Chopper puro dá saída **quadrada** (muito ripple) e **só reduz** (V_DC ≤ Vs). Para melhorar, entra o indutor → conversor **buck**.

<br>

---

## 🔻 3 · Conversor BUCK (step-down, com filtro LC)

O indutor **suaviza** a corrente e o diodo de **roda livre** dá caminho quando a chave abre.

```text
  Vs ──/S──┬──[ L ]──┬──── +
           │         │
          (D)       R   vo    ← D = diodo de roda livre
           │         │
  ─────────┴─────────┴──── −
```

| Estado | Diodo | Tensão no indutor |
|:---|:---|:---|
| **S ON** | bloqueado | `vL = Vs − vo` (indutor carrega) |
| **S OFF** | conduz (roda livre) | `vL = −vo` (indutor descarrega na carga) |

```text
  ┌────────────────────┐
  │   V_DC = D · Vs     │   (igual ao chopper, mas AGORA com corrente lisa)
  └────────────────────┘
```

> 🧲 **Truque que gera todas as fórmulas DC-DC:** a **tensão média no indutor é ZERO** em regime. Iguale a área de `vL` no ON com a do OFF:
> ```text
>   (Vs − vo)·t_on + (−vo)·t_off = 0   →   vo = D·Vs
> ```

### 📐 Dimensionamento (buck)

```text
  Indutância limite (fronteira CCM/DCM):     L_b = (1−D)·R / (2·fs)
  Capacitor de filtro (ripple V_r):          C_min = (1−D)/(8·L·fs) · (V_r/V_DC)^−1
```

<br>

---

## 🔺 4 · Conversor BOOST (step-up — SOBE a tensão!)

Aqui o indutor fica **na entrada** e "chuta" energia extra pra saída.

```text
  Vs ──[ L ]──┬──►|(D)──┬──── +
              │         │
             /S        R   vo
              │         │
  ────────────┴─────────┴──── −
```

| Estado | Tensão no indutor |
|:---|:---|
| **S ON** | `vL = Vs` (indutor carrega da fonte, carga isolada) |
| **S OFF** | `vL = Vs − vo` (indutor **soma** sua energia à fonte → empurra pra carga) |

```text
  ┌──────────────────────┐
  │   V_DC = Vs/(1 − D)   │   D=0 → V_DC=Vs ; D↑ → V_DC↑↑ (sempre > Vs)
  └──────────────────────┘
```

> ⚠️ No boost, **S nunca pode ficar sempre ligada** (D=1) — a saída "explodiria". E o **capacitor é obrigatório** para segurar a tensão enquanto a chave carrega o indutor.

### 📐 Dimensionamento (boost)

```text
  Indutância limite:   L_b = (1−D)²·D·R / (2·fs)
  Capacitor mínimo:    C_min = D/(R·fs) · (V_r/V_DC)^−1
```

<br>

---

## 🔀 5 · Conversor BUCK-BOOST (faz os dois — mas inverte o sinal)

```text
  ┌──────────────────────┐
  │   V_DC = D/(1−D)·Vs   │   (note: a saída é INVERTIDA em polaridade)
  └──────────────────────┘

   0 ≤ D < 0,5  →  V_DC < Vs   (modo BUCK)
   D = 0,5      →  V_DC = Vs
   0,5 < D ≤ 1  →  V_DC > Vs   (modo BOOST)
```

```text
  Indutância limite:   L_b = (1−D)²·R / (2·fs)
  Capacitor mínimo:    C_min = D/(R·fs) · (V_r/V_DC)^−1
```

> 🧩 **Conversor Ćuk:** primo do buck-boost, mas armazena energia num **capacitor** em vez de indutor. Mesma fórmula `V_DC = D/(1−D)·Vs`.

<br>

---

## 🌉 6 · Ponte H (4 chaves — permite inverter tensão E corrente)

```text
        SA+        SB+
   Vs ──┤    vo     ├──
        │  ●────●   │        vo = vA − vB   (flutua, sem terra comum)
        SA−        SB−

  SA+ on → vA = Vs   |   SB+ on → vB = Vs
  SA− on → vA = 0    |   SB− on → vB = 0
```

> ⚠️ **Regra sagrada:** `SA+` e `SA−` **NUNCA** ligam juntas (curto na fonte!). Idem `SB±`. Sempre uma de cada braço.

Isto permite **operação em 4 quadrantes**: `vo` e `io` podem ser `+` ou `−`.

### 🔵 PWM Bipolar (chaves em diagonal ligam juntas)

`vo` só pode ser `+Vs` ou `−Vs`. Compara `v_cont` com portadora **triangular** `vΔ`:

```text
                    1        v_cont                  v_cont
  D = D1 = ─── ·( 1 + ────── )        V_DC = (2D−1)·Vs = ────── · Vs
                    2          v̂Δ                          v̂Δ

   0 ≤ D < 0,5  →  V_DC < 0
   D = 0,5      →  V_DC = 0
   0,5 < D ≤ 1  →  V_DC > 0
```

### 🟢 PWM Unipolar

Cada braço é comandado por `+v_cont` e `−v_cont` separadamente. **Mesma fórmula** de tensão média (`V_DC = v_cont/v̂Δ · Vs`), mas a forma de onda tem **degraus menores** (0 e ±Vs) → menos ripple.

> 📌 As duas fórmulas-chave da Ponte H (que caem na Lista):
> ```text
>   V_DC = (2D − 1)·Vs          ⇔     V_DC = (v_cont/v̂Δ)·Vs
> ```

<br>

---

## 📊 7 · Tabela-mestra dos conversores DC-DC

| Conversor | `V_DC` | Faz o quê |
|:---|:---|:---|
| **Chopper / Buck** | `D·Vs` | só **abaixa** (0…Vs) |
| **Boost** | `Vs/(1−D)` | só **sobe** (≥Vs) |
| **Buck-Boost** | `D/(1−D)·Vs` | abaixa **ou** sobe (invertido) |
| **Ponte H** | `(2D−1)·Vs` | abaixa e **inverte sinal** (4 quadrantes) |

<br>

---

## ✅ 8 · Checklist de prova

- [ ] 🎚️ `D = t_on/T` é o controle. `V_DC` depende só de `D` e `Vs`.
- [ ] 🟦 Buck/Chopper: `V_DC = D·Vs` (abaixa).
- [ ] 🔺 Boost: `V_DC = Vs/(1−D)` (sobe). Capacitor obrigatório, D≠1.
- [ ] 🔀 Buck-Boost: `V_DC = D/(1−D)·Vs` (D=0,5 é o divisor buck/boost).
- [ ] 🌉 Ponte H: `V_DC = (2D−1)·Vs`. Nunca ligar as duas chaves do mesmo braço.
- [ ] 🧲 Toda fórmula vem de **"tensão média no indutor = 0"**.
- [ ] 📐 Sabe achar `L_b` (fronteira CCM/DCM) e `C_min` (ripple) de cada um.

<div align="center">

---

**Anterior:** [Aula 03](Resumo_Aula03_Retificador_Controlado.md) · **Próxima:** [Aula 05 — Inversor](Resumo_Aula05_Inversor.md)
*Exercícios da Lista 01: `Ex 6` (buck), `Ex 7` (boost), `Ex 8` (ponte H).*

</div>
