<div align="center">

# 🔧 Lista 01 · Exercício 1

## Retificador de MEIA-ONDA · carga R · valores médio e rms

</div>

---

## 📋 Enunciado

> Seja um retificador de **meia onda** alimentado com `Vs = 200 Vrms @ 60 Hz` e conectado a uma carga `R = 400 Ω`. **Trace as formas de onda** de tensão e corrente na carga e **calcule os valores médio e rms**.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> É o caso mais básico da Aula 02: **1 diodo, carga resistiva**. O diodo deixa passar só o **semi-ciclo positivo**; o negativo é zerado.

```text
  Fonte AC        D          Carga
    vs ──────►|──────┬────
                     │
                    R = 400 Ω
                     │
    ─────────────────┴────
```

<br>

---

## 🅰️ Passo 1 · Tensão de pico

> ⚠️ As fórmulas usam o **pico** `Vp`, mas o enunciado deu o **rms**. Converta primeiro!

```text
  Vp = Vrms · √2 = 200 · √2 = 282,84 V
```

<br>

---

## 🅱️ Passo 2 · Valores MÉDIOS (DC)

```text
              Vp     282,84
  V_DC = ──── = ────── = 90,03 V
              π        π

  I_DC = V_DC / R = 90,03 / 400 = 0,225 A

  P_DC = V_DC · I_DC = 90,03 · 0,225 = 20,26 W
```

<br>

---

## 🅲 Passo 3 · Valores RMS (eficazes)

```text
              Vp     282,84
  V_rms = ──── = ────── = 141,42 V
              2        2

  I_rms = V_rms / R = 141,42 / 400 = 0,354 A

  P_rms = V_rms · I_rms = 141,42 · 0,354 = 50,0 W
```

<br>

---

## 📊 Passo 4 · Formas de onda

```text
  vs ▲   ╱╲        ╱╲        ╱╲          fonte (senóide completa)
     │  ╱  ╲      ╱  ╲      ╱  ╲
     │ ╱    ╲    ╱    ╲    ╱
     └───────╲──────────╲──────► ωt
              ╲╱          ╲╱

  vo ▲   ╱╲        ╱╲        ╱╲          carga: SÓ os morros positivos
  io │  ╱  ╲      ╱  ╲      ╱  ╲         (vo=vs no SCP, vo=0 no SCN)
     │ ╱    ╲    ╱    ╲    ╱    ╲
     └───────────────────────────► ωt
            (semi-ciclos negativos zerados)

  vD ▲ ───────╲        ╱───╲             diodo: bloqueia (vD=vs) no
     │         ╲      ╱     ╲            semi-ciclo negativo; vD=0 no
     │          ╲____╱       ╲___        positivo (conduzindo)
     └───────────────────────────► ωt
```

> 🎨 `io` tem exatamente o mesmo formato de `vo` (carga resistiva: `io = vo/R`), só que em escala de corrente (pico = 282,84/400 = 0,707 A).

<br>

---

## ✅ Gabarito

| Grandeza | Médio (DC) | RMS |
|:---|:---:|:---:|
| **Tensão** | `90,03 V` | `141,42 V` |
| **Corrente** | `0,225 A` | `0,354 A` |
| **Potência** | `20,26 W` | `50,0 W` |

<br>

---

## 🔁 Bônus · Confira com os parâmetros de desempenho

```text
  σ  = P_DC / P_rms = 20,26 / 50,0 = 40,5 %    ✔ (padrão da meia-onda)
  FF = V_rms / V_DC = 141,42 / 90,03 = 1,57    ✔
  RF = √(FF² − 1) = √(1,57² − 1) = 1,21        ✔
```

> 💡 Esses três números são **fixos** para qualquer meia-onda com carga R (não dependem de Vs nem de R). Se der diferente, tem erro na conta.

<div align="center">

---

*ES663 · Lista 01 · Ex 1 · Aula 02 — Retificador de Diodos ([resumo](../Resumos/Resumo_Aula02_Retificador_Diodos.md))*

</div>
