<div align="center">

# ⚡ Resumo — ES663

## Aula 05 · Inversor (DC → AC)

*Baseado nas Aulas 05A e 05B (Prof. Eric Fujiwara) — Unicamp/FEM/DSI*
**A ideia-mestra:** é a **Ponte H da Aula 04**, mas agora o `v_cont` **não é constante** — é uma **senóide**. Isso faz a média da saída *balançar* como uma senóide → nasce uma tensão **AC** de amplitude e frequência que eu escolho.

</div>

---

## 🔑 0 · A chave que destrava o capítulo

> Um inversor é uma Ponte H com um controle senoidal. Só isso:

```text
  DC-DC (Aula 04):  v_cont = constante  →  saída DC constante
  INVERSOR (05):    v_cont = senóide    →  saída "DC" que varia como senóide
                                            = tensão AC!

  A senóide de controle tem:
    • amplitude V̂_cont  → controla a MAGNITUDE da saída AC
    • frequência f1      → vira a FREQUÊNCIA da saída AC
```

> 💡 O chaveamento é rápido (fs, kHz). A carga filtra o "picotado" e enxerga só a **harmônica fundamental** — uma senóide limpa de frequência `f1`.

<br>

---

## 🎚️ 1 · Os dois botões: `ma` e `mf`

Compara-se `v_cont` (senóide de controle) com `vΔ` (portadora **triangular**):

```text
  Razão de modulação de AMPLITUDE:              Razão de modulação de FREQUÊNCIA:

         V̂_cont                                          fs
   ma = ────────                                  mf = ────
           V̂Δ                                            f1

  ma controla a ALTURA da senóide de saída.     mf = quantas "picadas" por ciclo.
```

<br>

---

## 📈 2 · As 3 regiões de operação (o conceito central)

Tudo depende de quanto vale `ma`:

```text
  ma ≤ 1  → REGIÃO LINEAR
            V̂_o1 cresce PROPORCIONAL a ma → controle limpo e previsível

  ma > 1  → SOBREMODULAÇÃO
            V̂_o1 cresce, mas não-linearmente (a senóide "encosta" no topo)

  ma ≫ 1  → ONDA QUADRADA (saturação)
            V̂_o1 satura no máximo; a saída vira uma onda quadrada pura
```

```text
  V̂_o1 ▲
       │           ┌───── satura (onda quadrada) = (4/π)·Vs
       │        ╱‾‾
       │      ╱  ← sobremodulação
  Vs ──┼────╱
       │  ╱  ← linear (reta)
       │╱
       └──────────────────► ma
       0    1
```

<br>

---

## 1️⃣ 3 · Inversor MONOFÁSICO (ponte completa)

```text
       SA+        SB+          vo = vAN − vBN
   Vs ─┤   vo      ├─          (a carga fica entre os 2 braços)
       SA−        SB−
```

### 📐 Amplitude da fundamental (valor de **pico**)

| Região | `V̂_o1` (pico da fundamental) |
|:---|:---|
| **Linear** (ma ≤ 1) | `V̂_o1 = ma · Vs` |
| **Sobremodulação** | `Vs < V̂_o1 < (4/π)·Vs` |
| **Onda quadrada** (ma ≫ 1) | `V̂_o1 = (4/π)·Vs ≈ 1,27·Vs` |

> 🔎 O `4/π` é o **coeficiente de Fourier** da onda quadrada: a 1ª harmônica de uma onda quadrada de amplitude Vs tem pico `4Vs/π`. Decore esse número — ele reaparece o curso todo.

> 🔁 **Pico → rms:** `V_rms = V̂_o1/√2`.

### 🔵 PWM Bipolar vs. 🟢 Unipolar
- **Bipolar:** diagonais ligam juntas → `vo` pula entre `+Vs` e `−Vs`.
- **Unipolar:** braços independentes (`±v_cont`) → `vo` tem níveis `0` e `±Vs` → **menos harmônicas**, corrente mais lisa. A amplitude `V̂_o1` é a mesma.

### 🧩 Meia-ponte (só 2 chaves)
Tudo se divide por 2 (tem só `Vs/2` disponível): linear `V̂_o1 = ma·Vs/2`, quadrada `V̂_o1 = (4/π)·Vs/2`.

<br>

---

## 3️⃣ 4 · Inversor TRIFÁSICO (3 braços = 6 chaves)

Cada braço tem seu `v_cont` defasado de **120°** → gera 3 tensões equilibradas.

```text
      SA+   SB+   SC+
  Vs ─┤  A   ┤ B   ┤ C     controles:  vcontA, vcontB(−120°), vcontC(+120°)
      SA−   SB−   SC−
```

### 📐 Fórmulas (tensão de FASE e de LINHA)

Repare: no trifásico, a referência é `Vs/2` (por causa do divisor capacitivo).

| Região | Fase — pico `V̂_o1` | Linha — rms `V_LL1` |
|:---|:---|:---|
| **Linear** (ma ≤ 1) | `ma · Vs/2` | `ma · (√3/(2√2))·Vs` |
| **Onda quadrada** | `(4/π)·Vs/2` | `(√6/π)·Vs` |

> 🔗 **Ligação fase ↔ linha:** `V_LL1(rms) = √3 · V_fase1(rms)`, e `V_fase1(rms) = V̂_o1/√2`. Sabendo a fase, a linha sai de bandeja.

<br>

---

## 🔁 5 · Inversor de corrente (só citar)

Em vez de impor **tensão**, impõe **corrente** AC na saída (útil para cargas indutivas, com filtro capacitivo). Mesma lógica de `ma`, mas com `Î_o1`:

```text
  Linear:  Î_o1 = ma·√3/√2·Is        Quadrada: Î_o1 = (4/π)·√3/√2·Is
```

<br>

---

## 🧭 6 · Receita para QUALQUER exercício de inversor

```text
  1) Qual tensão de saída o enunciado quer? (rms ou pico? fase ou linha?)
  2) Converta para o PICO da fundamental V̂_o1  (se deu rms: V̂_o1 = V_rms·√2)
  3) Escolha a região:
        • quer controle fino / valor baixo → LINEAR → ache ma = V̂_o1/(fator·Vs)
        • quer o MÁXIMO possível → ONDA QUADRADA → V̂_o1 = (4/π)·(fator·Vs)
  4) A frequência de saída f1 = frequência do sinal de controle. Pronto.
```

> ⚠️ O "fator" muda: monofásico usa `Vs`; trifásico (fase) usa `Vs/2`. Preste atenção nisso — é o erro nº 1.

<br>

---

## ✅ 7 · Checklist de prova

- [ ] 🎚️ `ma = V̂_cont/V̂Δ` (magnitude) · `mf = fs/f1` (freq).
- [ ] 📈 Linear (ma≤1) · sobremodulação (ma>1) · onda quadrada (ma≫1).
- [ ] 1️⃣ Mono linear: `V̂_o1 = ma·Vs` · quadrada: `V̂_o1 = (4/π)·Vs`.
- [ ] 3️⃣ Tri fase linear: `V̂_o1 = ma·Vs/2` · quadrada: `(4/π)·Vs/2`.
- [ ] 🔗 `V_rms = V̂_o1/√2` e `V_LL = √3·V_fase(rms)`.
- [ ] 🕐 Frequência de saída `f1` = frequência do `v_cont`.
- [ ] 🟢 Unipolar tem menos ripple que bipolar (mesma amplitude).
- [ ] 🔢 O `4/π ≈ 1,27` é a 1ª harmônica de Fourier da onda quadrada.

<div align="center">

---

**Anterior:** [Aula 04](Resumo_Aula04_Conversor_DC_DC.md) · **Próxima:** [Aula 06 — Conversor AC-AC](Resumo_Aula06_Conversor_AC_AC.md)
*Exercícios da Lista 01: `Ex 9` (inversor monofásico PWM unipolar).*

</div>
