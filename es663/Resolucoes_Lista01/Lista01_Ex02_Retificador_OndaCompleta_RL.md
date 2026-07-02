<div align="center">

# 🔧 Lista 01 · Exercício 2

## Retificador de ONDA COMPLETA · carga RL série · tensão média

</div>

---

## 📋 Enunciado

> Um retificador de **onda completa** com `Vs = 250 Vrms @ 60 Hz` é conectado a uma carga **RL em série** (`R = 100 Ω`, `L = 0,2 H`). **Trace as formas de onda** de tensão no resistor, no indutor e na carga. Em seguida, **estime a tensão média na carga**.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Ponte de 4 diodos (Aula 02B). A grande sacada:

```text
  Na onda COMPLETA, a saída é sempre vo = |vs|  (nunca negativa),
  porque a comutação entre os pares de diodos é instantânea.

  → O indutor NÃO consegue tornar vo negativo (diferente da meia-onda!).
  → Ele só ATRASA e SUAVIZA a corrente.
```

```text
       ┌──►|──┬──►|──┐        +
       │ D1   │  D3  │        L = 0,2 H
  vs ──┤      ●──────┤─── R = 100 Ω
       │ D4   │  D2  │
       └──|◄──┴──|◄──┘        −
```

<br>

---

## 🅰️ Passo 1 · Tensão de pico

```text
  Vp = Vrms · √2 = 250 · √2 = 353,55 V
```

<br>

---

## 🅱️ Passo 2 · Tensão média na carga (a estimativa pedida)

> 🧲 **Regra de ouro:** a tensão **média no indutor é zero** em regime. Logo, a tensão média na carga é a mesma de uma carga R pura — só depende da forma retificada `|vs|`:

```text
              2·Vp     2 · 353,55
  V_DC = ────── = ────────── = 225,08 V
                π          π
```

```text
  ┌──────────────────────────┐
  │   V_DC ≈ 225 V            │   (independe de L!)
  └──────────────────────────┘
```

Corrente média (o L não altera a média, pois V̄_L = 0):

```text
  I_DC = V_DC / R = 225,08 / 100 = 2,25 A
```

<br>

---

## 🅲 Passo 3 · Papel do indutor (por que ainda importa?)

O indutor não muda a **média**, mas muda o **formato** da corrente. O atraso é:

```text
  ωL = 2π·60·0,2 = 75,40 Ω

  φ = arctan(ωL/R) = arctan(75,40/100) = arctan(0,754) ≈ 37°
```

> 📐 A corrente atrasa ~37° em relação à tensão e fica **mais lisa** (o indutor "segura" a variação). Como `ωL = 75,4 Ω` é comparável a `R = 100 Ω`, há um alisamento moderado — mas `i` continua contínua e sempre positiva.

<br>

---

## 📊 Passo 4 · Formas de onda

```text
  vo = |vs| ▲  ╱╲  ╱╲  ╱╲  ╱╲          CARGA (R+L): sempre ≥ 0
            │ ╱  ╲╱  ╲╱  ╲╱  ╲         (os 2 semi-ciclos retificados)
            └────────────────────► ωt

  vR = R·i  ▲   ╱‾‾╲___╱‾‾╲___         RESISTOR: segue a CORRENTE
            │  ╱          ╲            (atrasada ~37° e alisada)
            └────────────────────► ωt

  vL=L di/dt▲  ╱╲    ╱╲    ╱╲          INDUTOR: segue a DERIVADA de i
            │ ╱  ╲  ╱  ╲  ╱            (média = 0 → área + = área −)
            └───╲──╱──╲──╱───► ωt
                 ╲╱    ╲╱

  Verificação:   vo = vR + vL   e   ∫vL d(ωt) = 0  ✔
```

<br>

---

## ✅ Gabarito

| Grandeza | Valor |
|:---|:---:|
| Tensão de pico `Vp` | `353,55 V` |
| **Tensão média na carga** `V_DC` | **`≈ 225 V`** |
| Corrente média `I_DC` | `2,25 A` |
| Defasagem da corrente `φ` | `≈ 37°` |

> 💡 **A moral do Ex 2:** para achar a **média** numa carga RL, ignore o L (V̄_L = 0) e use direto a fórmula da carga R. O L só interessa para o **desenho** da forma de onda.

<div align="center">

---

*ES663 · Lista 01 · Ex 2 · Aula 02 — Retificador de Diodos ([resumo](../Resumos/Resumo_Aula02_Retificador_Diodos.md))*

</div>
