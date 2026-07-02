<div align="center">

# ⚡ ES663 — Eletrônica para Automação Industrial

### Resumos das aulas + resoluções da Lista 01

*Unicamp · FEM · DSI · Prof. Eric Fujiwara*
**Dica:** leia no terminal com `glow` para ver as tabelas e diagramas formatados.

</div>

---

## 📖 A história da disciplina em uma frase

> **Como controlar energia elétrica sem desperdiçá-la?** Usando o semicondutor como **chave** (liga/desliga), nunca como resistência. A partir daí, montamos os **4 conversores** que transformam energia de um formato para outro.

```text
  AC ──[Retificador]──► DC ──[Conversor DC-DC]──► DC ──[Inversor]──► AC
   │      Aula 02/03           Aula 04                Aula 05         │
   └──────────────────[ Conversor AC-AC / Aula 06 ]──────────────────┘
```

---

## 📚 Resumos das aulas

| # | Aula | Assunto | Ideia-mestra |
|:--:|:---|:---|:---|
| 01 | [Introdução](Resumos/Resumo_Aula01_Introducao.md) | Eletrônica de potência, os 4 conversores | chave não desperdiça; resistor sim |
| 02 | [Retificador de Diodos](Resumos/Resumo_Aula02_Retificador_Diodos.md) | Meia-onda, onda completa, trifásico | quanto mais onda aproveito, melhor o DC |
| 03 | [Retificador Controlado](Resumos/Resumo_Aula03_Retificador_Controlado.md) | Tiristor (SCR), ângulo de disparo α | é o diodo com botão de "esperar" (α) |
| 04 | [Conversor DC-DC](Resumos/Resumo_Aula04_Conversor_DC_DC.md) | Chopper, buck, boost, buck-boost, ponte H | pico-e-corto no duty cycle D → média |
| 05 | [Inversor](Resumos/Resumo_Aula05_Inversor.md) | DC→AC, PWM, ma e mf, mono e trifásico | ponte H com controle senoidal → AC |
| 06 | [Conversor AC-AC](Resumos/Resumo_Aula06_Conversor_AC_AC.md) | Ciclo-conversor, inversor de frequências | junta retificador + link DC + inversor |

---

## 📝 Resoluções — Lista 01 (Aulas 01 a 06)

| Ex | Tema | Conversor | Aula |
|:--:|:---|:---|:--:|
| [1](Resolucoes_Lista01/Lista01_Ex01_Retificador_MeiaOnda.md) | Meia-onda, carga R, médio/rms | Retificador diodo | 02 |
| [2](Resolucoes_Lista01/Lista01_Ex02_Retificador_OndaCompleta_RL.md) | Onda completa, carga RL, tensão média | Retificador diodo | 02 |
| [3](Resolucoes_Lista01/Lista01_Ex03_Retificador_Trifasico.md) | Trifásico, carga R, médio/rms | Retificador diodo | 02 |
| [4](Resolucoes_Lista01/Lista01_Ex04_Retificador_Controlado_OndaCompleta.md) | Onda completa controlada, RL, α=30° | Retificador SCR | 03 |
| [5](Resolucoes_Lista01/Lista01_Ex05_Retificador_Trifasico_Controlado.md) | Trifásico controlado, achar α | Retificador SCR | 03 |
| [6](Resolucoes_Lista01/Lista01_Ex06_Conversor_Buck.md) | Buck: D + indutância limite | DC-DC | 04 |
| [7](Resolucoes_Lista01/Lista01_Ex07_Conversor_Boost.md) | Boost: D + L_b + C_min (ripple 10%) | DC-DC | 04 |
| [8](Resolucoes_Lista01/Lista01_Ex08_Ponte_H_PWM_Bipolar.md) | Ponte H PWM bipolar, Vo = −50 V | DC-DC | 04 |
| [9](Resolucoes_Lista01/Lista01_Ex09_Inversor_Monofasico_PWM_Unipolar.md) | Inversor mono PWM unipolar, 50 Vrms | Inversor | 05 |
| [10](Resolucoes_Lista01/Lista01_Ex10_Inversor_de_Frequencias.md) | Inversor de frequências completo | AC-AC | 06 |

---

## 🧮 Formulário-relâmpago (tudo num lugar)

### Retificadores (AC → DC)
```text
  Meia-onda diodo:      V_DC = Vp/π          V_rms = Vp/2
  Onda completa diodo:  V_DC = 2Vp/π         V_rms = Vp/2
  Trifásico diodo:      V_DC = 3√2/π·V_LL ≈ 1,35·V_LL

  Meia-onda controlado:  V_DC = (Vp/2π)(1+cos α)
  Onda comp. controlado: V_DC = (Vp/π)(1+cos α)   [R/DCM]
                         V_DC = (2Vp/π)cos α       [CCM]
  Trifásico controlado:  V_DC = (3√2/π)V_LL·cos α

  Sempre: Vp = V_rms·√2 · V_LL = √3·V_fase(rms) · φ = arctan(ωL/R)
```

### Conversores DC-DC
```text
  Buck/Chopper: V_DC = D·Vs          L_b = (1−D)R/(2fs)
  Boost:        V_DC = Vs/(1−D)       L_b = (1−D)²D·R/(2fs)
  Buck-Boost:   V_DC = D/(1−D)·Vs     L_b = (1−D)²R/(2fs)
  Ponte H:      V_DC = (2D−1)·Vs = (v_cont/v̂Δ)·Vs
```

### Inversores (DC → AC) — pico da fundamental V̂_o1
```text
  Mono linear:       V̂_o1 = ma·Vs         quadrada: (4/π)·Vs
  Tri fase linear:   V̂_o1 = ma·Vs/2       quadrada: (2/π)·Vs
  ma = V̂_cont/V̂Δ · mf = fs/f1 · V_rms = V̂_o1/√2
```

### Inversor de frequências (Aula 06)
```text
  Resolva EM CADEIA (de trás pra frente):
  saída → V̂_o1 (=Vo·√2) → V_DC (pelo inversor) → α (pelo retificador)
  f1 = frequência de controle do inversor
```

<div align="center">

---

*Material de estudo gerado a partir dos PDFs das Aulas 01–06 e da Lista 01. Confira sempre os sinais e valores no seu enunciado / simulador (LTspice, MATLAB/Simulink).*

</div>
