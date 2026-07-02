<div align="center">

# ⚡ Resumo — ES663

## Aula 01 · Introdução à Eletrônica de Potência

*Baseado na Aula 01 (Prof. Eric Fujiwara) — Unicamp/FEM/DSI*
**A ideia-mestra:** processar energia elétrica **sem desperdiçá-la** — e o segredo é usar o semicondutor como **chave** (liga/desliga), nunca como resistência.

</div>

---

## 🔑 0 · A chave que destrava a matéria inteira

> A eletrônica de potência tem **um único truque fundamental**, e todo o curso é ele repetido de formas cada vez mais espertas:

```text
  Para controlar energia SEM desperdiçar, NÃO se usa resistência.
  Usa-se uma CHAVE que ou está totalmente ligada (0 V nela)
  ou totalmente desligada (0 A nela).

  Em ambos os casos a potência dissipada na chave é ~ZERO:
      P = v · i  →  ligada: v=0 ⇒ P=0
                    desligada: i=0 ⇒ P=0
```

> 💡 Se você entender **por que a chave não desperdiça e o resistor sim**, entendeu o objetivo de toda a disciplina. Tudo depois (retificador, buck, inversor…) é escolher **quais chaves** e **quando ligá-las**.

<br>

---

## 🗺️ 1 · Mapa da disciplina — os 4 tipos de conversor

O curso todo gira em torno de **converter energia de um formato para outro**. Só existem 4 conversões possíveis:

| 🏷️ Conversão | Nome | Onde aparece | Aula |
|:---|:---|:---|:--:|
| **AC → DC** | Retificador | Carregar bateria, fonte DC | 02 e 03 |
| **DC → DC** | Chopper / conversor | Baixar/subir tensão DC (buck, boost) | 04 |
| **DC → AC** | Inversor | Solar, no-break, acionar motor | 05 |
| **AC → AC** | Inversor de frequências | Controle de velocidade de motor | 06 |

> 🎯 Guarde este mapa. Quando você abrir qualquer exercício, a primeira pergunta é sempre: **"que conversão é essa?"** — e ele cai numa dessas 4 linhas.

<br>

---

## 🤖 2 · Por que isto existe? (o sistema mecatrônico)

> **Objetivo de um sistema de controle:** fazer a saída seguir uma referência (setpoint) de forma autônoma.

```text
 setpoint    erro
    ───►(+)──────►[ Controlador ]──►[ Atuador ]──►[ Processo ]──► saída
         ▲ −                                                      │
         │                          [ Sensor ]◄───────────────────┘
```

> 🔧 O **atuador** (ex.: motor elétrico) precisa de **muita potência**, mas o **controlador** só produz um **sinalzinho de baixa potência**. Quem faz a ponte entre os dois é o **conversor de potência** — o objeto de estudo de ES663.

```text
  sinal de controle
  (baixa potência)
        │
        ▼
  entrada ──►[ CONVERSOR DE POTÊNCIA ]──► saída
  (alta pot.)                            (alta pot., ajustada)
```

<br>

---

## 🆚 3 · Eletrônica linear vs. Eletrônica de potência

Esta é a distinção conceitual mais importante da Aula 01:

| | **Eletrônica linear** | **Eletrônica de potência** |
|:---|:---|:---|
| Como opera o transistor | região **ativa** (saída proporcional, tipo potenciômetro) | como **chave** (só ON/OFF) |
| Eficiência | **baixa** — dissipa energia conduzindo | **alta** — perdas mínimas |
| Analogia | torneira meio aberta que esquenta | interruptor de luz |

```text
 Curva do transistor usada como CHAVE:

   iC ▲
      │   ON ●━━━━━━  (saturação: vCE≈0, conduz muita corrente)
      │    ┃
      │    ┃  ← só "passa" rapidinho por aqui (transição)
      │    ┃
      │  ━━●━━━━━━━► vCE
        OFF (corte: iC=0, bloqueia tensão)
```

> ⚠️ Na região ativa (linear) o transistor tem **v≠0 E i≠0 ao mesmo tempo** → `P = v·i` grande → **calor**. Como chave, ele evita esse ponto: fica só nos extremos.

<br>

---

## 🎛️ 4 · Chaves de potência: ideal vs. real

| Característica | Chave **ideal** | Chave **real** |
|:---|:---|:---|
| No bloqueio (OFF) | corrente **nula** | pequena corrente de **fuga** |
| Na condução (ON) | tensão **nula** | pequena **queda de tensão** (~0,5–1 V) |
| Transição ON↔OFF | **instantânea** | tem **atraso** (perdas de chaveamento) |

> 📌 Nos exercícios, quase sempre assumimos **chaves ideais** — assim as contas ficam limpas. Os efeitos reais (perdas) aparecem como "observação".

<br>

---

## 🔩 5 · Zoológico de dispositivos (só para reconhecer o nome)

| Família | Dispositivos | Como liga/desliga | Comutação |
|:---|:---|:---|:---|
| **Retificador não-controlado** | Diodo | sozinho, pela polaridade | natural |
| **Retificador controlado** | Tiristor (SCR), Triac | pulso de **gate** | natural (freq. da linha) |
| **Chaves de potência** | BJT, MOSFET, IGBT, GTO, MCT | sinal de **controle** externo | forçada (freq. externa) |

> 🧭 Duas palavras que voltam o curso inteiro:
> - **Comutação natural** = chaveia na frequência da **rede** (60 Hz). São os retificadores (Aulas 02–03) e o conversor AC-AC (Aula 06).
> - **Comutação forçada** = chaveia numa frequência **que eu escolho** (kHz). São os conversores DC-DC e inversores PWM (Aulas 04–05).

<br>

---

## 🧮 6 · O exemplo que resume tudo: divisor de tensão vs. chopper

> **Problema:** entregar `Vo = 150 V` a uma carga `Ro = 150 Ω` a partir de `Vs = 300 V`. Duas formas — e a diferença é o coração da matéria.

### 🅰️ Divisor de tensão (jeito "linear", ruim)

```text
        RD=150Ω
  Vs ──/\/\/\──┬──── 
  300V         │
              Ro=150Ω   → Vo = 150 V ✔ (funciona!)
               │
              ─┴─
```

```text
 i = Vs/(RD+Ro) = 300/300 = 1 A
 Potência na carga:  PR = Vo·i = 150 W
 Potência no RD:     PD = VD·i = 150 W  ← DESPERDIÇADA como calor!
```

> ❌ **Eficiência = 50%.** Metade da energia vira calor no resistor série. Péssimo.

### 🅱️ Chopper (jeito "chaveado", bom)

A chave liga/desliga a 50% do tempo (duty cycle D = 50%):

```text
      chave S
  Vs ──/ ──────┬────
  300V         │
              Ro=150Ω
               │
              ─┴─

 Chave ON  : Vo = Vs = 300 V,  i = 300/150 = 2 A
 Chave OFF : Vo = 0,           i = 0
```

Média por ciclo (metade ON, metade OFF):

```text
 V̄o = (300·½ + 0·½)          = 150 V   ✔
 P̄o = (300·2·½ + 0·0·½)      = 300 W   → TODA vai para a carga
 P̄chave = (0·2·½ + 300·0·½)  = 0 W     → chave ideal não dissipa!
```

> ✅ **Eficiência = 100%.** A chave nunca tem tensão e corrente ao mesmo tempo, então não esquenta. **Mesma tensão média na carga, zero desperdício.** Este é o "porquê" de toda a eletrônica de potência.

<br>

---

## 🔌 7 · Onde isto é usado (aplicações)

| Aplicação | Conversões envolvidas |
|:---|:---|
| **No-break (UPS)** | AC→DC (carrega bateria) + DC→AC (alimenta a carga) |
| **Painel solar** | DC→DC (link) + DC→AC (joga na rede) |
| **Energy harvesting** | DC→DC (colhe micro-energia) |
| **Veículo híbrido** | vários conversores (motor + bateria) |

<br>

---

## ✅ 8 · Checklist mental da Aula 01

- [ ] ⚡ O objetivo é **converter energia com alta eficiência**.
- [ ] 🔑 O truque é usar o semicondutor como **chave** (ON: v=0 · OFF: i=0 ⇒ P≈0), nunca como resistência.
- [ ] 🗺️ Existem **4 conversores**: AC→DC, DC→DC, DC→AC, AC→AC.
- [ ] 🆚 **Linear** = região ativa, ineficiente · **Potência** = chaveamento, eficiente.
- [ ] 🕐 **Comutação natural** (60 Hz da rede) vs. **forçada** (kHz que eu escolho).
- [ ] 🧮 Divisor de tensão desperdiça (η=50%); chopper não (η=100%).

<div align="center">

---

**Próxima:** [Aula 02 — Retificador de diodos](Resumo_Aula02_Retificador_Diodos.md) · começamos pela conversão AC→DC.

</div>
