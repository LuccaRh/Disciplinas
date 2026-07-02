<div align="center">

# 🔧 Lista 01 · Exercício 4

## Retificador CONTROLADO de onda completa · carga RL · α = 30°

</div>

---

## 📋 Enunciado

> Um retificador **controlado de onda completa** alimentado com `Vs = 120 Vrms @ 60 Hz` é conectado a uma carga `R = 100 Ω` e `L = 0,1 H`. **Plote as tensões** no resistor e na carga para `α = 30°`. Em seguida, **calcule a tensão média na carga**.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Ponte de **4 tiristores** (Aula 03B). Agora há um **ângulo de disparo** α: os SCRs só começam a conduzir 30° depois do cruzamento por zero.

```text
       T1        T3           T1,T2 disparam em α = 30°
  vs ──┤         ├──► R,L      T3,T4 disparam em α+180° = 210°
       T4        T2
```

<br>

---

## 🅰️ Passo 1 · Tensão de pico

```text
  Vp = Vrms · √2 = 120 · √2 = 169,71 V
```

<br>

---

## 🅲 Passo 2 · Qual fórmula usar? (o ponto delicado)

> Há duas fórmulas para onda completa controlada (ver [resumo Aula 03](../Resumos/Resumo_Aula03_Retificador_Controlado.md)):

```text
  Carga R / condução DESCONTÍNUA:   V_DC = (Vp/π)·(1 + cos α)
  Carga muito indutiva (CCM):       V_DC = (2Vp/π)·cos α
```

Vamos checar o L:

```text
  ωL = 2π·60·0,1 = 37,70 Ω    vs.   R = 100 Ω    →   φ = arctan(37,7/100) ≈ 20,7°
```

> 📌 `ωL` (37,7 Ω) é bem **menor** que `R` (100 Ω). O indutor é fraco demais para manter condução contínua → o conversor opera em **modo descontínuo (DCM)**. Usamos a fórmula do `(1+cos α)`. *(Este é o mesmo raciocínio do exemplo da Aula 03B, que com L=200 mH já classificava como DCM.)*

<br>

---

## 🅱️ Passo 3 · Tensão média na carga

```text
              Vp                  169,71
  V_DC = ──── ·(1 + cos α) = ────── · (1 + cos 30°)
              π                     π

       = 54,02 · (1 + 0,8660) = 54,02 · 1,8660 = 100,8 V
```

```text
  ┌──────────────────────────┐
  │   V_DC ≈ 100,8 V          │
  └──────────────────────────┘

  I_DC = V_DC/R = 100,8/100 = 1,008 A
```

> ✅ **Teste de sanidade:** se α=0, `V_DC = 2Vp/π = 108,0 V` (onda completa de diodo). Com α=30° dá um pouco menos (100,8 V) — coerente: atrasar o disparo reduz a tensão. ✔

<br>

---

## 📊 Passo 4 · Formas de onda (α = 30°)

```text
  vs ▲   ╱╲    ╱╲    ╱╲            fonte
     │  ╱  ╲  ╱  ╲  ╱
     └─────────────────► ωt

  vo ▲    ╱▓╲  ╱▓╲  ╱▓╲           CARGA: começa em α=30°, dobra o
     │   ╱ ▓ ╲╱ ▓ ╲╱ ▓           semi-ciclo negativo pra cima.
     │  ╱  ▓  ╱  ▓  ╱             Como é DCM, a corrente zera antes
     └──┼──────────────► ωt        do próximo disparo → pedaços de arco.
        α=30°

  vR ▲    ╱‾╲   ╱‾╲   ╱‾╲          RESISTOR: mesma forma da corrente
  (=Ri)│  ╱   ╲_╱   ╲_╱   ╲       (segue io, que atrasa ~20,7°)
     └───────────────────► ωt

  vL ▲   ╱╲    ╱╲    ╱╲            INDUTOR: derivada de i, média = 0
     └──╲─╱─╲──╲─╱─╲──► ωt
        vo = vR + vL
```

<br>

---

## ✅ Gabarito

| Grandeza | Valor |
|:---|:---:|
| Tensão de pico `Vp` | `169,71 V` |
| Modo de condução | **Descontínuo (DCM)** — usa `(1+cos α)` |
| **Tensão média na carga** `V_DC` | **`≈ 100,8 V`** |
| Corrente média `I_DC` | `≈ 1,01 A` |
| Defasagem `φ` | `≈ 20,7°` |

> 💡 **A pegadinha do Ex 4:** ter um L não significa automaticamente usar a fórmula `cos α`. Compare `ωL` com `R` — aqui o L é fraco (DCM), então vale `(1+cos α)`. Confirme no simulador (LTspice) que a corrente realmente zera entre os pulsos.

<div align="center">

---

*ES663 · Lista 01 · Ex 4 · Aula 03 — Retificador Controlado ([resumo](../Resumos/Resumo_Aula03_Retificador_Controlado.md))*

</div>
