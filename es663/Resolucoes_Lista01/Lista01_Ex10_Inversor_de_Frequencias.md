<div align="center">

# 🔧 Lista 01 · Exercício 10

## INVERSOR DE FREQUÊNCIAS · retif. 3Φ controlado + link DC + inversor 3Φ onda quadrada

</div>

---

## 📋 Enunciado

> Um **inversor de frequências** é constituído por um **retificador trifásico controlado** (assumir CCM), **link DC**, e **inversor trifásico em modo de onda quadrada** (`fs = 1 kHz`). O circuito é energizado com `V_LL = 460 Vrms @ 60 Hz` para alimentar uma carga trifásica **Y equilibrada** (`200 Ω`). **Determine os parâmetros** do conversor para produzir tensões de fase equilibradas `Vo = 115 Vrms @ 15 Hz`. **Trace as formas de onda** de tensão no link DC e na saída do inversor.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema (o "final de campeonato")

> Este exercício **junta o curso inteiro** (Aula 06). É uma cadeia de 3 blocos. Resolve-se **de trás pra frente**: da saída desejada, descubro o link DC, e do link DC descubro o α do retificador.

```text
   AC entrada           DC link          AC saída
  ┌───────────┐      ┌────────┐      ┌───────────┐
  │RETIFICADOR│ ──►  │ LINK DC │ ──►  │ INVERSOR  │ ──► carga Y
  │ 3Φ CONTROL│ V_DC │(filtra) │      │3Φ ONDA QDR│      200 Ω/fase
  └───────────┘      └────────┘      └───────────┘
   V_LL=460V           acha V_DC       f1 = 15 Hz
   acha α                              onda quadrada (saturado)

  Alvo: Vo = 115 Vrms por FASE, 15 Hz
```

> 🔑 **Quem controla o quê?** O inversor está fixo em **onda quadrada** (magnitude fixa), então **quem ajusta a tensão é o retificador**, via ângulo de disparo α. A frequência (15 Hz) é dada pelo controle do inversor.

<br>

---

## 🅰️ Passo 1 · Saída desejada → pico da fundamental

> A carga quer `115 Vrms` de **fase**. Converta para o **pico** da harmônica fundamental:

```text
  V̂_o1 = Vo,rms · √2 = 115 · √2 = 162,63 V
```

<br>

---

## 🅱️ Passo 2 · Inversor (onda quadrada) → tensão do link DC necessária

> Para o **inversor trifásico saturado** (onda quadrada), o pico da fundamental de **fase** é (Aula 06):

```text
              2
  V̂_o1 = ─── · V_DC          →  isole V_DC:
              π

              π              π
  V_DC = ─── · V̂_o1 = ─── · 162,63 = 255,4 V
              2              2
```

```text
  ┌──────────────────────────┐
  │   V_DC ≈ 255,4 V          │   (tensão que o link DC deve fornecer)
  └──────────────────────────┘
```

<br>

---

## 🅲 Passo 3 · Retificador 3Φ controlado → achar α

> O link é alimentado pelo **retificador trifásico controlado** (CCM):

```text
             3·√2
  V_DC = ────── · V_LL · cos α
                π
```

Tensão máxima disponível (α = 0):

```text
             3·√2
  V_DC(0) = ────── · 460 = 1,3505 · 460 = 621,2 V
                π
```

Isolando α:

```text
                 V_DC          255,4
  cos α = ──────── = ────── = 0,4112
             V_DC(0)         621,2

  α = arccos(0,4112) = 65,7°
```

```text
  ┌────────────────────────┐
  │   α ≈ 66°               │
  └────────────────────────┘
```

> ✅ **Sanidade:** 255 V é ~41% de 621 V, e α≈66° é um atraso grande (perto dos 90° onde V_DC→0). Coerente. ✔

<br>

---

## 🅳 Passo 4 · Parâmetros do inversor e carga

```text
  Frequência de saída:   f1 = 15 Hz   (dada pelo controle do inversor)
  Frequência de chaveam.: fs = 1 kHz
  Modo do inversor:      onda quadrada (saturação, ma ≫ 1)

  Corrente de fase na carga Y:
        Io = Vo,rms / R = 115 / 200 = 0,575 A por fase
```

As três tensões de fase de saída (fundamental):

```text
  vo_a = 162,63·sin(2π·15·t)          → 115 Vrms
  vo_b = 162,63·sin(2π·15·t − 120°)
  vo_c = 162,63·sin(2π·15·t + 120°)
```

<br>

---

## 📊 Passo 5 · Formas de onda

```text
  (1) LINK DC — saída do retificador 3Φ controlado (α≈66°, CCM):
  V_DC ▲
   255 ┤━━⌒⌒━━⌒⌒━━⌒⌒━━━  ← nível ~255 V com ripple pequeno (6 pulsos/ciclo)
       │  o capacitor do link alisa o restinho
       └────────────────────► t

  (2) SAÍDA DO INVERSOR — onda quadrada trifásica (fase a):
  vo_a ▲
  +Vs ┤┌──────┐        ┌────      degraus de onda quadrada, período 1/15s
      ││      │        │          (a fundamental de 15 Hz está "dentro")
    0 ┼┤      ├────────┤────► t
      ││      │        │
  −Vs ┤└──────┘        └────
      └──────────────────────
       fundamental vo_a1 = 162,63·sin(2π·15t)  (115 Vrms) ✔
       + defasadas de ±120° nas fases b e c
```

<br>

---

## ✅ Gabarito

| Parâmetro | Valor |
|:---|:---:|
| Pico da fundamental de fase `V̂_o1` | `162,63 V` |
| **Tensão do link DC** `V_DC` | **`≈ 255 V`** |
| **Ângulo de disparo do retificador** `α` | **`≈ 66°`** |
| **Frequência de saída** `f1` | **`15 Hz`** |
| Modo do inversor | **onda quadrada** (saturação) |
| Corrente de fase na carga | `0,575 A` |

<br>

---

## 🔁 Bônus · O método que resolve QUALQUER inversor de frequências

```text
  1) Saída pedida (rms) → pico da fundamental (·√2).
  2) Inversor: pela fórmula do modo (linear=ma·V_DC ou onda qdr.),
     ache o que falta:
        • se é onda quadrada (mag. fixa) → isole V_DC
        • se é de diodos no retificador (V_DC fixo) → isole ma
  3) Retificador: com o V_DC alvo, ache α (se controlado) ou V_DC (se diodos).
  4) f1 = frequência do controle do inversor. Fim.
```

> 💡 **A ideia central da Aula 06:** nenhuma fórmula nova — é só **encaixar em cadeia** o retificador (Aula 02/03) com o inversor (Aula 05), ligados pelo link DC. Domine essa costura e você resolve todos.

<div align="center">

---

*ES663 · Lista 01 · Ex 10 · Aula 06 — Conversor AC-AC / Inversor de Frequências ([resumo](../Resumos/Resumo_Aula06_Conversor_AC_AC.md))*

</div>
