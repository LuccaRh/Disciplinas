<div align="center">

# 🔧 Lista 01 · Exercício 7

## Conversor BOOST · duty cycle + L limite + C mínimo (ripple 10%)

</div>

---

## 📋 Enunciado

> Um conversor **boost** alimentado com `Vs = 100 V` e chaveado a `1 kHz` é conectado a uma carga `R = 250 Ω`. **Calcule** o duty cycle, a indutância limite e a capacitância mínima (**ripple de 10 %**) para que o circuito produza `Vo = 300 V` em **condução contínua**. **Trace a forma de onda** da tensão na carga.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Boost = **step-up** (sobe). Aqui: 100 V → 300 V (triplica → só um boost faz isso). Três coisas a achar: `D`, `L_b`, `C_min`.

```text
  Vs ──[ L ]──┬──►|(D)──┬──── +
              │         │
             /S        R = 250 Ω   Vo
              │         │
  ────────────┴─────────┴──── −

  Dados:  Vs = 100 V,  fs = 1 kHz,  R = 250 Ω,  Vo = 300 V,  Vr/Vo = 10%
```

<br>

---

## 🅰️ Passo 1 · Duty cycle

> Fórmula do boost: `Vo = Vs/(1 − D)`. Isole D:

```text
              Vs           100         1
  1 − D = ──── = ────── = ─── = 0,3333
              Vo           300         3

  D = 1 − 0,3333 = 0,6667 = 66,7 %
```

```text
  ┌──────────────────┐
  │   D ≈ 66,7 %      │
  └──────────────────┘
```

<br>

---

## 🅱️ Passo 2 · Indutância limite (fronteira CCM/DCM)

```text
              (1 − D)²·D·R       (0,3333)²·0,6667·250
  L_b = ────────────── = ─────────────────────
                  2·fs                 2·1000

       = (0,1111·0,6667·250) / 2000 = 18,52 / 2000 = 0,00926 H
```

```text
  ┌──────────────────────────────┐
  │   L_b ≈ 9,26 mH               │   (use L ≥ L_b para CCM)
  └──────────────────────────────┘
```

<br>

---

## 🅲 Passo 3 · Capacitância mínima (ripple 10 %)

> Fórmula do boost (com `Vr/Vo = 0,10`):

```text
                  D           Vr  −1          0,6667             −1
  C_min = ─────── ·( ──── )   = ────────── · (0,10)
                R·fs        Vo             250·1000

          = (0,6667 / 250000) / 0,10 = 2,667×10⁻⁶ / 0,10 = 26,7 µF
```

```text
  ┌──────────────────────────────┐
  │   C_min ≈ 26,7 µF             │   (use C ≥ C_min p/ ripple ≤ 10%)
  └──────────────────────────────┘
```

> 📌 No boost o **capacitor é obrigatório**: enquanto a chave está ligada, a carga fica isolada da fonte — é o capacitor que sustenta `Vo` nesse intervalo.

<br>

---

## 📊 Passo 4 · Forma de onda da tensão na carga

```text
  vo ▲
     │    ╱‾╲   ╱‾╲   ╱‾╲          ripple de ~10% em torno de 300 V:
 330 ┤   ╱   ╲ ╱   ╲ ╱   ╲         sobe quando o diodo conduz (S off),
 300 ┤━━╱━━━━━╳━━━━━╳━━━━━━  ← média cai quando o capacitor alimenta a carga (S on)
 270 ┤ ╱      ╲     ╲
     └──────────────────────► t

  iL ▲  ╱╲    ╱╲    ╱╲             corrente no indutor: triangular,
     │ ╱  ╲  ╱  ╲  ╱               sempre > 0 → CONDUÇÃO CONTÍNUA ✔
     └──╱────╲╱────╲╱──► t         (bem maior que Io, pois o boost
        (nunca zera)                puxa corrente alta da fonte)
```

<br>

---

## ✅ Gabarito

| Grandeza | Valor |
|:---|:---:|
| **Duty cycle** `D` | **`≈ 66,7 %`** |
| **Indutância limite** `L_b` | **`≈ 9,26 mH`** |
| **Capacitância mínima** `C_min` | **`≈ 26,7 µF`** |
| Corrente média na carga `Io` | `Vo/R = 1,2 A` |

> 💡 **Boost × Buck:** no buck, `D` pequeno = tensão baixa; no boost é **ao contrário** — quanto **maior** o `D`, **maior** a tensão (`Vo = Vs/(1−D)`). E `D=1` é proibido (denominador → 0, tensão "explode").

<div align="center">

---

*ES663 · Lista 01 · Ex 7 · Aula 04 — Conversor DC-DC ([resumo](../Resumos/Resumo_Aula04_Conversor_DC_DC.md))*

</div>
