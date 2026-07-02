<div align="center">

# 🔧 Lista 01 · Exercício 8

## PONTE H · PWM bipolar · tensão de saída negativa

</div>

---

## 📋 Enunciado

> Uma **ponte H** com chaveamento **PWM bipolar** (`fs = 1 kHz`) é conectada a uma carga `R = 2 kΩ`. **Calcule o duty cycle** necessário para produzir uma tensão de saída `Vo = −50 V` a partir de uma alimentação `Vs = 250 V`. **Trace as formas de onda** dos sinais de controle e da tensão na carga.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Ponte H (Aula 04C). O ponto novo: ela consegue tensão **negativa** na carga (`vo = vA − vB`, flutuante). É o que permite `Vo = −50 V`.

```text
        SA+        SB+
   Vs ──┤    vo     ├──          vo = vA − vB
   250V │  ●────●   │
        SA−        SB−

  ⚠️ SA+ e SA− nunca ligam juntas; idem SB±.
  PWM bipolar: diagonais (SA+/SB−) e (SA−/SB+) ligam em conjunto.
```

<br>

---

## 🅰️ Passo 1 · Fórmula da ponte H (PWM bipolar)

```text
  V_DC = (2D − 1)·Vs         (D = duty cycle da diagonal SA+/SB−)
```

> 🔎 Sanidade: `D=0,5 → V_DC=0`; `D=1 → +Vs`; `D=0 → −Vs`. Como queremos negativo, esperamos `D < 0,5`.

<br>

---

## 🅱️ Passo 2 · Isolar o duty cycle

```text
  V_DC = (2D − 1)·Vs

           1    V_DC          1     −50
  D = ─── ·( ──── + 1 ) = ─── ·( ────── + 1 )
           2      Vs            2      250

    = ½ ·( −0,20 + 1 ) = ½ · 0,80 = 0,40
```

```text
  ┌────────────────┐
  │   D = 40 %      │   (< 50% → tensão negativa ✔)
  └────────────────┘
```

<br>

---

## 🅲 Passo 3 · Sinal de controle equivalente

> Alternativamente, via nível de controle (portadora triangular de amplitude `v̂Δ = 1`):

```text
              v_cont              V_DC     −50
  V_DC = ────── · Vs   →   v_cont = ──── = ────── = −0,20
                v̂Δ                       Vs      250

  (confere com D: v_cont = 2D − 1 = 2·0,40 − 1 = −0,20 ✔)
```

Corrente na carga:

```text
  Io = Vo / R = −50 / 2000 = −0,025 A = −25 mA
```

<br>

---

## 📊 Passo 4 · Formas de onda

```text
  Comparação de controle:  nível DC v_cont = −0,20  vs.  triangular vΔ

   +1 ┤  ╱╲    ╱╲    ╱╲    ╱╲        vΔ (portadora)
      │ ╱  ╲  ╱  ╲  ╱  ╲  ╱  ╲
    0 ┤╱────╲╱────╲╱────╲╱────╲
 −0,2 ┤─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─      v_cont (fica abaixo de vΔ a maior
   −1 ┤                              parte do tempo → vo=−Vs domina)
      └──────────────────────► t

  Tensão na carga (pula entre +Vs e −Vs, PWM bipolar):
  vo ▲
 250 ┤ ┌┐    ┌┐    ┌┐              t_on em +250V é curto (D=40%)
     │ ││    ││    ││
   0 ┼─┤├────┤├────┤├──── (média)
     │ ││    ││    ││              t em −250V é maior
−250 ┤─┘└────┘└────┘└───
     └──────────────────► t
       média = −50 V  ✔
```

> 📌 Como `D = 40% < 50%`, a chave passa **mais tempo** no estado `−Vs` do que no `+Vs`, e a média pende para o negativo.

<br>

---

## ✅ Gabarito

| Grandeza | Valor |
|:---|:---:|
| **Duty cycle** `D` | **`40 %`** |
| Nível de controle `v_cont` (v̂Δ=1) | `−0,20` |
| Tensão na carga `Vo` | `−50 V` (alvo) |
| Corrente na carga `Io` | `−25 mA` |

> 💡 **A grande vantagem da ponte H:** com 4 chaves ela dá tensão **positiva ou negativa** (e corrente idem) — "4 quadrantes". `D=0,5` é o ponto neutro; abaixo → negativo, acima → positivo.

<div align="center">

---

*ES663 · Lista 01 · Ex 8 · Aula 04 — Conversor DC-DC ([resumo](../Resumos/Resumo_Aula04_Conversor_DC_DC.md))*

</div>
