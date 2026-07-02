<div align="center">

# 🔧 Lista 01 · Exercício 6

## Conversor BUCK · duty cycle + indutância limite (CCM)

</div>

---

## 📋 Enunciado

> Seja um conversor **buck** alimentado com `Vs = 500 V`, chaveado a `1 kHz` e conectado a uma carga `R = 250 Ω`. **Calcule o duty cycle** e a **indutância limite** para que o circuito produza uma tensão `Vo = 300 V` em **modo de condução contínua**. **Trace a forma de onda** da tensão na carga.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Buck = **step-down** (abaixa). Aqui: 500 V → 300 V (faz sentido, é redução). Duas coisas a achar: `D` (que fixa a tensão) e `L_b` (que garante CCM).

```text
  Vs ──/S──┬──[ L ]──┬──── +
           │         │
          (D)       R = 250 Ω   Vo
           │         │
  ─────────┴─────────┴──── −

  Dados:  Vs = 500 V,  fs = 1 kHz,  R = 250 Ω,  Vo = 300 V
```

<br>

---

## 🅰️ Passo 1 · Duty cycle

> Fórmula do buck: `Vo = D·Vs`. Isole D:

```text
              Vo     300
  D = ──── = ────── = 0,60 = 60 %
              Vs      500
```

```text
  ┌────────────────┐
  │   D = 60 %      │
  └────────────────┘
```

<br>

---

## 🅱️ Passo 2 · Indutância limite (fronteira CCM/DCM)

> Para operar **na fronteira** entre condução contínua e descontínua:

```text
              (1 − D)·R     (1 − 0,60)·250     0,40·250     100
  L_b = ────────── = ────────────── = ──────── = ──── = 0,050 H
                2·fs           2·1000            2000        2000
```

```text
  ┌──────────────────────────────┐
  │   L_b = 0,050 H = 50 mH       │
  └──────────────────────────────┘
```

> ⚠️ `L_b` é o **valor mínimo**. Para garantir CCM com folga, escolha **`L ≥ L_b = 50 mH`** (ex.: 60–100 mH).

<br>

---

## 🅲 Passo 3 · Verificações rápidas

```text
  Corrente média na carga:   Io = Vo/R = 300/250 = 1,2 A
  Período de chaveamento:    T = 1/fs = 1/1000 = 1 ms
  Tempo ligado:              t_on = D·T = 0,60·1 ms = 0,6 ms
```

<br>

---

## 📊 Passo 4 · Forma de onda da tensão na carga (com L ≥ L_b)

```text
  ANTES do filtro (no nó da chave)  →  DEPOIS do filtro LC (na carga):

  v_chave ▲ ┌───┐   ┌───┐            vo ▲
    500V  │ │   │   │   │              │   ~~~~~~~~~~~~~~   ← quase reta
          │ │   │   │   │          300 ┤━━━━━━━━━━━━━━━━━   média = 300 V
          │ │   │___│   │___             │  (só um ripplezinho)
          └─┴───────────────► t        └────────────────► t
            ←0,6ms→←0,4ms→

  io ▲     ╱╲    ╱╲    ╱╲              corrente do indutor: triangular,
     │    ╱  ╲  ╱  ╲  ╱               SEMPRE > 0 (nunca toca o zero)
 1,2 ┤━━━╱━━━━╲╱━━━━╲╱━━━            → confirma CONDUÇÃO CONTÍNUA ✔
     └────────────────────► t
```

<br>

---

## ✅ Gabarito

| Grandeza | Valor |
|:---|:---:|
| **Duty cycle** `D` | **`60 %`** |
| **Indutância limite** `L_b` | **`50 mH`** |
| Escolha para CCM | `L ≥ 50 mH` |
| Corrente na carga `Io` | `1,2 A` |

> 💡 **A lógica do buck:** `D` sozinho define a **tensão** (`Vo = D·Vs`); o **indutor** define só a **qualidade** (contínua vs. descontínua). São dois ajustes independentes.

<div align="center">

---

*ES663 · Lista 01 · Ex 6 · Aula 04 — Conversor DC-DC ([resumo](../Resumos/Resumo_Aula04_Conversor_DC_DC.md))*

</div>
