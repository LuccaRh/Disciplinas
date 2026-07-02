<div align="center">

# 🔧 Lista 01 · Exercício 9

## INVERSOR monofásico · PWM unipolar · saída AC (rms)

</div>

---

## 📋 Enunciado

> Considere um **inversor monofásico** alimentado com `Vs = 100 V` e chaveado via **PWM unipolar** (`fs = 1 kHz`). O conversor é conectado a uma carga `R = 100 Ω`. **Determine os parâmetros de controle** para produzir uma saída `Vo = 50 Vrms @ 120 Hz`. **Trace as formas de onda** dos sinais de controle e da tensão na carga.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Inversor (Aula 05): converte DC → AC. O controle é uma **senóide** `v_cont`, comparada com a triangular `vΔ`. Precisamos achar **`ma`** (magnitude) e **`f1`** (frequência).

```text
       SA+        SB+          vo = vAN − vBN → senóide AC
   Vs ─┤   vo      ├─          controle: v_cont senoidal (unipolar: ±v_cont)
  100V  SA−        SB−

  Alvo:  Vo = 50 Vrms,  f = 120 Hz
```

<br>

---

## 🅰️ Passo 1 · Converter rms → pico da fundamental

> ⚠️ As fórmulas do inversor dão o **pico** `V̂_o1`. O enunciado deu o **rms**. Converta:

```text
  V̂_o1 = Vo,rms · √2 = 50 · √2 = 70,71 V
```

<br>

---

## 🅱️ Passo 2 · Escolher a região e achar `ma`

> Pico máximo disponível no modo linear é `V̂_o1 = ma·Vs`, com `ma ≤ 1` valendo até `V̂_o1 = Vs = 100 V`. Como precisamos de 70,71 V (< 100 V), estamos **na região linear**. 

```text
  V̂_o1 = ma · Vs

              V̂_o1     70,71
  ma = ────── = ────── = 0,707
                Vs        100
```

```text
  ┌────────────────────┐
  │   ma ≈ 0,707        │   (≤ 1 → região linear, confirmado ✔)
  └────────────────────┘
```

<br>

---

## 🅲 Passo 3 · Frequência e demais parâmetros

```text
  Frequência de saída = frequência do sinal de controle:
        f1 = 120 Hz

  Razão de modulação de frequência:
        mf = fs / f1 = 1000 / 120 ≈ 8,33

  Corrente na carga (rms):
        Io,rms = Vo,rms / R = 50 / 100 = 0,5 A
```

> 📌 A tensão de controle senoidal fica: `v_cont(t) = 0,707·v̂Δ · sin(2π·120·t)` (com `v̂Δ` a amplitude da triangular).

<br>

---

## 📊 Passo 4 · Formas de onda (PWM unipolar)

```text
  Controle unipolar: DUAS moduladoras ±v_cont contra a triangular vΔ:

     ▲   vΔ ╱╲  ╱╲  ╱╲            +v_cont e −v_cont (senóides de 120 Hz,
   1 ┤    ╱  ╲╱  ╲╱  ╲            opostas), amplitude 0,707
     │  ⌒⌒⌒        +v_cont
   0 ┼─╳───────────╳──────► t
     │      ⌒⌒⌒   −v_cont
  −1 ┤
     └────────────────────

  Tensão de saída (unipolar → níveis 0 e ±Vs, "degraus menores"):
  vo ▲
 100 ┤   ▮▮▮                       largura dos pulsos MODULADA pela
     │  ▮▮▮▮▮      ___              senóide → a MÉDIA local desenha
   0 ┼─▮▮▮▮▮▮▮────▮▮▮▮▮───► t       uma senóide de 120 Hz
     │            ▮▮▮▮▮
−100 ┤             ▮▮▮
     └────────────────────
       fundamental vo1 = 70,71·sin(2π·120·t)  → 50 Vrms  ✔
```

> 🟢 **Por que unipolar?** A saída tem níveis `0` e `±Vs` (em vez de pular `+Vs↔−Vs` como no bipolar) → harmônicas menores, **corrente mais lisa**. A amplitude da fundamental `V̂_o1 = ma·Vs` é a mesma dos dois modos.

<br>

---

## ✅ Gabarito

| Parâmetro | Valor |
|:---|:---:|
| Pico da fundamental `V̂_o1` | `70,71 V` |
| **Razão de modulação** `ma` | **`≈ 0,707`** (região linear) |
| **Frequência de controle** `f1` | **`120 Hz`** |
| `mf = fs/f1` | `≈ 8,33` |
| Corrente na carga `Io,rms` | `0,5 A` |

> 💡 **Receita do inversor:** (1) rms → pico (`·√2`); (2) linear? então `ma = V̂_o1/Vs`; (3) `f1` = frequência que você quer na saída. Três passos, sempre.

<div align="center">

---

*ES663 · Lista 01 · Ex 9 · Aula 05 — Inversor ([resumo](../Resumos/Resumo_Aula05_Inversor.md))*

</div>
