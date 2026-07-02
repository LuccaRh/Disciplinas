<div align="center">

# 🔧 Lista 01 · Exercício 5

## Retificador TRIFÁSICO CONTROLADO · achar o ângulo de disparo α

</div>

---

## 📋 Enunciado

> Um retificador **trifásico controlado** alimentado com `V_LL = 380 Vrms @ 60 Hz` é conectado a uma carga `R = 200 Ω`. **Determine o ângulo de disparo** necessário para que a tensão na carga seja `200 V` e **trace a respectiva forma de onda**.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Ponte de **6 tiristores** (Aula 03C). É um problema **inverso**: em vez de "dado α, ache V", é "dado V, ache α". Basta isolar `cos α` na fórmula.

```text
             T1  T3  T5      +
    A ─┬─────►|──►|──►|──┐
    B ─┤                 ├── R = 200 Ω
    C ─┤                 │
       └──|◄─|◄──|◄──────┘   −
          T4  T6  T2
     (6 pulsos de gate, defasados de 60°)
```

<br>

---

## 🅰️ Passo 1 · A fórmula do trifásico controlado

```text
             3·√2
  V_DC(α) = ────── · V_LL · cos α
                π
```

Primeiro, a tensão máxima disponível (α = 0, funciona como diodo):

```text
             3·√2
  V_DC(0) = ────── · 380 = 1,3505 · 380 = 513,2 V
                π
```

<br>

---

## 🅱️ Passo 2 · Isolar α

> Queremos `V_DC = 200 V`. Basta resolver para `cos α`:

```text
                    V_DC          200
  cos α = ───────── = ────── = 0,3897
              (3√2/π)·V_LL     513,2

  α = arccos(0,3897) = 67,1°
```

```text
  ┌────────────────────────┐
  │   α ≈ 67°               │
  └────────────────────────┘

  I_DC = V_DC/R = 200/200 = 1,0 A
```

> ✅ **Sanidade:** 200 V é ~39% de 513 V, e 67° é um atraso bem grande (perto de 90°, onde V_DC → 0). Coerente: para reduzir bastante a tensão, atrasa-se bastante o disparo. ✔

<br>

---

## ⚠️ Passo 3 · Observação importante (carga R pura)

> A fórmula `V_DC = (3√2/π)V_LL·cos α` é rigorosamente exata em **condução contínua** (carga muito indutiva). Com **carga R pura** e `α > 30°`, a corrente fica **descontínua** e o valor real desvia um pouco. Como a Lista dá só `R`, use a fórmula padrão do cos α para o **projeto** e depois **valide no simulador** (a Aula 03C mostra que, para carga R, o conversor não fica em CCM).
>
> 👉 Para a entrega, o essencial é: montar `V_DC = (3√2/π)V_LL·cos α`, isolar `α ≈ 67°`, e traçar a forma de onda.

<br>

---

## 📊 Passo 4 · Forma de onda (α ≈ 67°)

```text
  Tensões de linha (6 arcos por ciclo):
     ╱╲  ╱╲  ╱╲  ╱╲  ╱╲  ╱╲

  vo ▲       ▓▓      ▓▓       ← disparo atrasado 67° após o cruzamento
     │      ╱  ╲    ╱  ╲       natural → pega só um "pedaço tardio" de
     │     ╱    ╲  ╱    ╲      cada arco de linha; com R a corrente cai
 200 ┤ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─    a zero entre os pulsos (descontínua)
     └──┼──────────────────► ωt
       67°
     média = 200 V

  io tem o mesmo formato de vo (carga R): io = vo/R, média = 1,0 A
```

<br>

---

## ✅ Gabarito

| Grandeza | Valor |
|:---|:---:|
| Tensão máxima (α=0) | `513,2 V` |
| **Ângulo de disparo** | **`α ≈ 67°`** |
| Tensão na carga | `200 V` (alvo) |
| Corrente média | `1,0 A` |

> 💡 **Receita geral para "achar α":** escreva a fórmula de `V_DC(α)`, isole `cos α = V_alvo / V_DC(α=0)`, aplique `arccos`. Serve para meia-onda, onda completa e trifásico — muda só o `V_DC(α=0)`.

<div align="center">

---

*ES663 · Lista 01 · Ex 5 · Aula 03 — Retificador Controlado ([resumo](../Resumos/Resumo_Aula03_Retificador_Controlado.md))*

</div>
