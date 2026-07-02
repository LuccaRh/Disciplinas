<div align="center">

# ⚡ Resumo — ES663

## Aula 03 · Retificador Controlado (Tiristor / SCR)

*Baseado nas Aulas 03A, 03B e 03C (Prof. Eric Fujiwara) — Unicamp/FEM/DSI*
**A ideia-mestra:** é o **mesmo retificador da Aula 02**, mas trocando o diodo por um **diodo com botão de "esperar"**. Eu decido *quando* no ciclo ele começa a conduzir → assim eu **controlo a tensão média** de saída.

</div>

---

## 🔑 0 · A chave que destrava o capítulo

> Você já sabe retificar (Aula 02). Agora só acrescentamos **um controle**:

```text
  Diodo:    liga sozinho assim que fica polarizado direto.
  Tiristor: fica polarizado direto MAS ESPERA um pulso de gate para ligar.

  → esse "atraso" é o ÂNGULO DE DISPARO α.
  → atrasar o disparo = pegar menos pedaço da onda = MENOS tensão média.

     α = 0°   →  liga na hora  →  igual a um diodo (tensão máxima)
     α → 180° →  liga tarde    →  quase nada de tensão
```

> 💡 **Toda fórmula desta aula é a da Aula 02 multiplicada por um fator que depende de α.** Se α=0, ela vira a fórmula do diodo. Sempre confira por aí.

<br>

---

## 🎛️ 1 · O tiristor (SCR) — o "diodo com gatilho"

3 terminais: ânodo (A), cátodo (K) e **gate (G)**.

```text
        A ──►|┤── K       (o ┤ com a perninha G é o gate)
              G

  3 modos:
   1) BLOQUEIO DIRETO   : vAK>0 mas SEM pulso de gate  → iA = 0  (espera!)
   2) BLOQUEIO REVERSO  : vAK<0                         → iA = 0
   3) CONDUÇÃO DIRETA   : disparou o gate (iG)          → vT = 0, conduz
```

> 🔒 **LATCHING (a característica que define o SCR):**
> ```text
>   Depois de disparado, o SCR CONTINUA conduzindo
>   mesmo que você tire o pulso de gate.
>   Só desliga quando a corrente cai a zero (ou inverte a polaridade vAK).
> ```
> Ou seja: o gate **só liga**, nunca desliga. Para desligar, o circuito externo tem que forçar `iA → 0`.

> 🔧 **GTO (Gate Turn-Off thyristor):** versão especial que **também desliga** pelo gate (com pulso negativo). Guarde só o nome.

<br>

---

## ⏱️ 2 · O ângulo de disparo α (o conceito central)

```text
   α = atraso, em graus, dentro do semi-ciclo (180°), até disparar o gate.

   Tempo real de disparo:   t_α = α / (2πf)      (f = 60 Hz da rede)
```

```text
 vs ▲   ╱╲            ← a fonte fica positiva desde 0°
    │  ╱  ╲
 vo │ ╱▓▓╲            ← mas a carga só recebe a partir de α
    │╱  ▓▓ ╲            (a parte ▓ é o que sobra)
    └──┼──────► ωt
       α
```

> 🕐 Como o disparo é **sincronizado com a rede** (uma vez por ciclo, a 60 Hz), o retificador controlado é de **comutação natural**. Ele não escolhe a frequência — só o *momento* dentro do ciclo da rede.

> 🔌 Na prática, um CI (TCA785) compara uma **rampa dente-de-serra** com um **nível de controle** `v_cont` para gerar o pulso no tempo certo:
> ```text
>   α = 180° · (v_cont / v̂_st)
> ```

<br>

---

## 🌗 3 · Meia-onda controlada (1 SCR)

Igual à meia-onda de diodo, mas conduz só de α até π:

```text
              Vp
  V_DC(α) = ──── · (1 + cos α)          ⚠️ note o 2π no denominador
             2π
```

> ✅ **Teste de sanidade:** α=0 → `(1+cos0)=2` → `V_DC = Vp·2/(2π) = Vp/π` = fórmula do diodo meia-onda. Perfeito.

<br>

---

## 🌕 4 · Onda completa controlada (4 SCRs) — o mais importante

```text
       T1        T3          disparo:
  vs ──┤         ├──► carga     T1,T2 juntos no ângulo α
       T4        T2            T3,T4 juntos em α+180°
```

### 📐 Fórmula com carga R (ou condução descontínua)

```text
              Vp
  V_DC(α) = ──── · (1 + cos α)          ← agora SEM o 2 (denominador = π)
              π
```

> ✅ α=0 → `V_DC = 2Vp/π` = fórmula do diodo onda completa. ✔

### ⚡ Fórmula com carga MUITO indutiva (CCM — condução contínua)

Quando L é grande, a corrente **nunca zera** e a tensão muda de cara:

```text
              2·Vp
  V_DC(α) = ────── · cos α        ← fórmula do "modo CCM"
                π
```

> 🔀 **Retificação vs. Inversão (o pulo do gato do CCM):**
> ```text
>    0 ≤ α < 90°   →  V_DC > 0  →  energia FONTE→CARGA  (RETIFICAÇÃO)
>    α = 90°       →  V_DC = 0
>   90° < α ≤ 180° →  V_DC < 0  →  energia CARGA→FONTE  (INVERSÃO!)
> ```
> Com α>90° e carga que sustenta corrente, a potência **volta para a rede**. É assim que um motor "freia" devolvendo energia. Só possível se a carga (indutor/motor) mantiver a corrente fluindo.

<br>

---

## 🔺 5 · Trifásico controlado (6 SCRs)

6 pulsos de gate, defasados de **60°** entre si.

```text
             3·√2
  V_DC(α) = ────── · V_LL · cos α        (modo CCM)
                π
```

> ✅ α=0 → `V_DC = 3√2/π·V_LL ≈ 1,35·V_LL` = trifásico de diodo. ✔
> 🔀 Mesma história: α<90° retifica, α=90° zera, α>90° inverte (energia volta pra rede).

### 🧩 Variações que aparecem
| Topologia | O que muda |
|:---|:---|
| **Semi-controlado** | metade SCR, metade diodo → só 3 gates, mas **não inverte** |
| **Com diodo de roda livre** | um diodo dá caminho pra corrente no lado DC; desacopla fonte/carga |

<br>

---

## 🧯 6 · Efeitos reais (comutação) — só para citar

Na prática a troca entre SCRs **não é instantânea**:

```text
  μ (ângulo de comutação) : os 4 SCR conduzem juntos por um instante
                            → durante ele, vo = 0
  γ (ângulo de extinção)  : tempo pro SCR realmente desligar
  → limite prático:   α_max = 180° − μ − γ
```

<br>

---

## 📊 7 · Resumo das fórmulas (todas num lugar)

| Retificador controlado | `V_DC(α)` | Vira o diodo quando α=0? |
|:---|:---|:---:|
| Meia-onda (R) | `(Vp/2π)(1+cos α)` | → `Vp/π` ✔ |
| Onda completa (R / DCM) | `(Vp/π)(1+cos α)` | → `2Vp/π` ✔ |
| Onda completa (CCM, L↑) | `(2Vp/π)·cos α` | → `2Vp/π` ✔ |
| Trifásico (CCM) | `(3√2/π)·V_LL·cos α` | → `1,35·V_LL` ✔ |

> 🧠 **Como decidir qual usar?** Carga R pura ou L pequeno → fórmula `(1+cos α)`. Carga com L grande (condução contínua) → fórmula `cos α`. Se o enunciado fala em "modo de inversão", é `cos α`.

<br>

---

## ✅ 8 · Checklist de prova

- [ ] ⏱️ `α` = atraso do disparo no semi-ciclo. `t_α = α/(2πf)`.
- [ ] 🔒 SCR tem **latching**: gate só liga; desliga quando a corrente zera.
- [ ] 🌗 Meia-onda: `(Vp/2π)(1+cos α)` · 🌕 Onda completa R: `(Vp/π)(1+cos α)`.
- [ ] ⚡ CCM (L grande): usa `cos α` — e permite **inversão** (α>90°).
- [ ] 🔺 Trifásico: `(3√2/π)V_LL·cos α`, 6 gates a 60°.
- [ ] ✅ Sempre teste α=0: tem que virar a fórmula do diodo (Aula 02).
- [ ] 🔁 Para **achar α** dado V_o: isole `cos α = ...` e faça `α = arccos(...)`.

<div align="center">

---

**Anterior:** [Aula 02](Resumo_Aula02_Retificador_Diodos.md) · **Próxima:** [Aula 04 — Conversor DC-DC](Resumo_Aula04_Conversor_DC_DC.md)
*Exercícios relacionados na Lista 01: `Ex 4` (onda completa controlada RL), `Ex 5` (trifásico controlado).*

</div>
