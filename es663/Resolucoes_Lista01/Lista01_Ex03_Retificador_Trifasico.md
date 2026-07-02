<div align="center">

# 🔧 Lista 01 · Exercício 3

## Retificador TRIFÁSICO · carga R · valores médio e rms

</div>

---

## 📋 Enunciado

> Considere um retificador **trifásico** alimentado por uma fonte equilibrada `V_LL = 460 Vrms @ 60 Hz` e acoplado a uma carga `R = 2 kΩ`. **Plote a tensão na carga** e **calcule os valores médio e rms**.

<br>

---

## 🧭 Passo 0 · Reconhecer o problema

> Ponte de **6 diodos** (Aula 02C), o retificador "campeão": a saída é quase um DC puro (ripple ≈ 0).

```text
  Fonte 3Φ    D1  D3  D5      +
    A ─┬──────►|──►|──►|──┐
    B ─┤                  ├── R = 2 kΩ   vo
    C ─┤                  │
       └──|◄──|◄──|◄──────┘      −
          D4  D6  D2

  vo = (fase mais positiva) − (fase mais negativa) = maior tensão de linha
```

> ⚠️ Atenção: o dado é `V_LL` (tensão de **linha**, fase-fase), não de fase. As fórmulas do trifásico já usam `V_LL` direto.

<br>

---

## 🅰️ Passo 1 · Tensão média (DC)

```text
              3·√2            3·√2
  V_DC = ────── · V_LL = ────── · 460 = 1,3505 · 460 = 621,2 V
                π                π
```

```text
              V_DC     621,2
  I_DC = ──── = ────── = 0,311 A
                R       2000

  P_DC = V_DC · I_DC = 621,2 · 0,311 = 193,0 W
```

<br>

---

## 🅱️ Passo 2 · Tensão rms

> No trifásico o ripple é tão pequeno que `V_rms ≈ V_DC`. O valor exato (pico da linha `= √2·V_LL`, período de 60°):

```text
              ┌ 1     3√3 ┐½
  V_rms = │ ─── + ──── │ · √2·V_LL = 0,9558 · √2 · 460
              └ 2     4π  ┘

  V_rms ≈ 1,352 · V_LL = 621,7 V
```

```text
              V_rms     621,7
  I_rms = ──── = ────── = 0,311 A
                R        2000

  P_rms = V_rms · I_rms = 621,7 · 0,311 = 193,1 W
```

<br>

---

## 📊 Passo 3 · Forma de onda

```text
  Tensões de linha (pico = √2·460 = 650,5 V):
     ╱╲  ╱╲  ╱╲  ╱╲  ╱╲  ╱╲   6 arcos (vAB, vAC, vBC, vBA, vCA, vCB)

  vo ▲  ⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒⌒   ← "coroa": pega sempre o TOPO das linhas
     │ ╱                     ondula só entre ~563 V e 650 V (60°)
 621 ┤━━━━━━━━━━━━━━━━━━  ← média = 621 V (linha quase reta!)
     └────────────────────► ωt

  io tem o mesmo formato de vo (carga R): io = vo/R, pico ≈ 0,325 A
```

<br>

---

## ✅ Gabarito

| Grandeza | Médio (DC) | RMS |
|:---|:---:|:---:|
| **Tensão** | `621,2 V` | `≈ 621,7 V` |
| **Corrente** | `0,311 A` | `0,311 A` |
| **Potência** | `193,0 W` | `193,1 W` |

<br>

---

## 🔁 Bônus · Desempenho (por que é o melhor)

```text
  σ  = P_DC/P_rms ≈ 193,0/193,1 ≈ 99,9 %   → conversão quase perfeita
  FF = V_rms/V_DC ≈ 621,7/621,2 ≈ 1,00     → saída praticamente DC
  RF = √(FF² − 1) ≈ 0                       → ripple desprezível
```

> 💡 Note como **V_DC e V_rms são quase idênticos** — é a assinatura do trifásico. Compare com a meia-onda (Ex 1), onde V_rms era 57% maior que V_DC.

<div align="center">

---

*ES663 · Lista 01 · Ex 3 · Aula 02 — Retificador de Diodos ([resumo](../Resumos/Resumo_Aula02_Retificador_Diodos.md))*

</div>
