<div align="center">

# ⚡ Resumo — ES663

## Aula 06 · Conversor AC-AC e Inversor de Frequências

*Baseado nas Aulas 06A e 06B (Prof. Eric Fujiwara) — Unicamp/FEM/DSI*
**A ideia-mestra:** para controlar a **velocidade de um motor AC**, preciso variar **tensão E frequência**. Duas formas: fazer a conversão AC→AC direto (ciclo-conversor) ou passar por um **DC no meio** (inversor de frequências = retificador + link DC + inversor).

</div>

---

## 🔑 0 · A chave que destrava o capítulo

> Motor AC gira numa velocidade proporcional à **frequência** que recebe. Para controlá-lo, preciso de uma fonte AC de **frequência ajustável**. Três abordagens:

```text
  1) Conversor bidirecional  → muda só a MAGNITUDE (frequência = a da rede)
  2) Ciclo-conversor         → muda magnitude E frequência, AC→AC direto
  3) Inversor de frequências → AC→DC→AC : "quebra" tudo e remonta do zero
                                (o mais usado — junta TODAS as aulas anteriores!)
```

> 💡 A grande sacada da Aula 06: o **inversor de frequências** é só encaixar os blocos que você já estudou. Nenhuma fórmula nova — só combiná-las.

<br>

---

## 🔄 1 · Conversor bidirecional (AC-AC monofásico)

Dois SCRs em antiparalelo (ou um **Triac**) picotam a senóide da rede:

```text
       T1 →
  vs ──┤ ├──── carga        T1 conduz no semi-ciclo +  (disparo α)
       ← T2                 T2 conduz no semi-ciclo −  (disparo α+180°)
```

```text
                           ┌  α    sin 2α ┐½
  V_o,rms = V_rms · │ 1 − ─── + ────── │
                           └  π      2π   ┘

   α = 0   → V_o,rms = V_rms = Vp/√2  (máximo, igual a um fio)
   α = 180°→ V_o,rms = 0
```

> ⚠️ **Limitação-chave:** controla só a **amplitude**. A **frequência de saída é sempre a da rede** (não dá para mudar). Serve para dimmer de lâmpada, aquecedor — não para controlar velocidade de motor.

> 🔺 Versão **trifásica**: três desses juntos. Pode ter **neutro comum** (fases independentes) ou **neutro isolado** (correntes fluem entre fases, com modos 2/3, 2/2, 0/2 conforme α). Guarde o conceito, não os detalhes.

<br>

---

## 🌀 2 · Ciclo-conversor (AC-AC com frequência menor)

Duas pontes controladas (P e N) em antiparalelo: uma faz o semi-ciclo `+` da saída, a outra o `−`.

```text
   Ponte P → gera vo positivo        Ponte N → gera vo negativo
   Empilhando VÁRIOS ciclos retificados da rede, monto uma senóide
   de frequência MENOR que a da rede.
```

```text
  Ex.: retifica 3 ciclos da rede por semi-onda → f1 = f/3
  vo ▲  ⌒⌒⌒            ⌒⌒⌒         (uma senóide "grossa" de baixa freq.)
     │ ▓▓▓▓▓          ▓
     └──────────╲▓▓▓▓▓──────► t
                (ponte N assume aqui)
```

> 🎛️ **Modulação de fase:** variando α ao longo do ciclo (180°→90°→0°→90°→180°) a saída fica **senoidal** de verdade. Com carga RL, opera nos **4 quadrantes** (aciona motor em ambos os sentidos).
> 🚫 **Limitação:** só produz `f1 < f_rede`. Não sobe a frequência.

Versões: **1Φ→1Φ**, **3Φ→1Φ** (disparo a 60°) e **3Φ→3Φ** (três ciclo-conversores, para acionar motor AC).

<br>

---

## 🏭 3 · INVERSOR DE FREQUÊNCIAS (VVVF) — o grande final

**VVVF** = *Variable Voltage Variable Frequency*. A arquitetura que junta o curso inteiro:

```text
   AC entrada          DC link          AC saída (V e f ajustáveis)
  ┌──────────┐      ┌────────┐      ┌──────────┐
  │RETIFICADOR│ ──► │ LINK DC │ ──► │ INVERSOR │ ──► motor
  │ (AC→DC)   │  V_DC│(filtra) │     │ (DC→AC)  │
  └──────────┘      └────────┘      └──────────┘
   Aula 02/03        capacitor        Aula 05
```

| Bloco | Função | Vem da Aula |
|:---|:---|:---|
| **1. Retificador** | AC→DC (controlado ou não, 1Φ ou 3Φ) | 02 / 03 |
| **2. Link DC** | filtra o ripple → `V_DC` bem reto | (capacitor) |
| **3. Inversor** | DC→AC (linear ou onda quadrada, 1Φ ou 3Φ) | 05 |

> 🧩 **Como resolver:** é uma conta em **cadeia**. Ache `V_DC` na saída do retificador; jogue esse `V_DC` como entrada do inversor. Nenhuma fórmula nova.

### 📐 O "cardápio" de fórmulas (escolha 1 de cada estágio)

**Estágio retificador → produz `V_DC`:**
```text
  Diodos 1Φ:        V_DC = (2/π)·Vp
  Diodos 3Φ:        V_DC = (3√2/π)·V_LL
  Controlado 1Φ:    V_DC = (1+cos α)/π · Vp
  Controlado 3Φ:    V_DC = (3√2/π)·V_LL·cos α
```

**Estágio inversor → usa `V_DC`, produz `V̂_o1` (pico da fundamental):**
```text
  Mono linear:      V̂_o1 = ma·V_DC
  Mono saturado:    V̂_o1 = (4/π)·V_DC
  Tri (fase) linear:V̂_o1 = (ma/2)·V_DC
  Tri (fase) satur.:V̂_o1 = (2/π)·V_DC
```

> ⏱️ A **frequência de saída** `f1` é a frequência do sinal de controle PWM do inversor — **independente** de tudo o resto. É isso que dá o "V variável **e** f variável".

### 🔋 Frenagem regenerativa (bônus)
Para o motor devolver energia à rede ao frear, usa-se um **2º retificador em antiparalelo** que conduz corrente negativa. O inversor opera nos 4 quadrantes.

<br>

---

## 🧭 4 · Receita do inversor de frequências (a que cai na Lista)

```text
  1) Leia o que a saída pede: V_o (rms? pico? fase?) e f1.
  2) Trabalhe DE TRÁS PRA FRENTE:
       a) converta V_o para o PICO da fundamental → V̂_o1 = V_o·√2
       b) do inversor, isole o V_DC necessário
          (ou o ma, se V_DC já é fixo pelo retificador)
  3) Do retificador, ache V_DC (ou o α, se controlado).
  4) f1 = frequência de controle do inversor. Fim.
```

> 🎯 Dica: se o inversor é **onda quadrada** (magnitude fixa), quem ajusta a tensão é o **retificador controlado** (via α). Se o retificador é **de diodos** (V_DC fixo), quem ajusta a tensão é o **inversor** (via ma).

<br>

---

## ✅ 5 · Checklist de prova

- [ ] 🔄 Bidirecional/Triac: controla **só amplitude**; freq = rede. `V_o,rms` com a fórmula do `α`.
- [ ] 🌀 Ciclo-conversor: AC→AC direto, só produz `f1 < f_rede`; 4 quadrantes com RL.
- [ ] 🏭 Inversor de frequências = **Retificador + Link DC + Inversor** (VVVF).
- [ ] 🔗 Resolva **em cadeia**: `V_DC` do retificador → entrada do inversor.
- [ ] ⏱️ `f1` de saída = frequência de controle do inversor (independente).
- [ ] 🎛️ Ajuste da tensão: via `ma` (inversor) **ou** via `α` (retificador controlado).
- [ ] 📇 Tenha o "cardápio" de fórmulas dos 2 estágios na ponta da língua.

<div align="center">

---

**Anterior:** [Aula 05](Resumo_Aula05_Inversor.md) · **Volta ao índice:** [README](../README.md)
*Exercícios da Lista 01: `Ex 10` (inversor de frequências trifásico completo).*

</div>
