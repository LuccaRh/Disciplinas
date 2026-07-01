<div align="center">

# 🔧 Exercício 9 — Lista EM506

## Critério de falha · RANKINE (tensão normal máxima) · Frágil com σut ≠ σuc · Fator de segurança

</div>

---

## 📋 Enunciado

> Na superfície de uma peça foi medido o seguinte campo de tensões:
> **σxx = 16,4 MPa**, **σyy = −26,5 MPa** e **τxy = 10,4 MPa**.
> O material é **frágil**, com **tensão última de tração σut = 30 MPa** e
> **tensão última de compressão σuc = −40 MPa**. Ache o **menor fator de segurança**
> da peça pelo **critério de Rankine**. (Obs.: FS < 1 implica falha.)

<br>

```text
 σxx = 16,4 MPa     σyy = −26,5 MPa     τxy = 10,4 MPa   (estado plano, na superfície)
 σut = +30 MPa   (resistência à TRAÇÃO)
 σuc = −40 MPa   (resistência à COMPRESSÃO)
 Material FRÁGIL → critério de RANKINE (tensão normal máxima)
```

> 🔑 **Novidade em relação ao 10.96:** lá o concreto tinha **uma só** resistência
> (σr = 28 nas duas pontas). Aqui o material tem resistências **diferentes** na tração
> (+30) e na compressão (−40) — então cada ponta é comparada com o **seu próprio** limite,
> e o FS sai **separado** para tração e compressão.

<br>

---

## 🧩 Passo 0 · A ideia de Rankine com σut ≠ σuc

```text
 Rankine (tensão normal máxima): a peça falha quando UMA das principais
 atinge a resistência NAQUELE sentido.

 Lado da TRAÇÃO:     σmáx atinge +σut   →   FS_tração     = σut / σmáx
 Lado da COMPRESSÃO: σmín atinge  σuc   →   FS_compressão = σuc / σmín

 FS da peça = MENOR dos dois  (a ponta mais "apertada" manda)
```

> 💡 Cada fator de segurança é "quantas vezes a resistência cabe na solicitação"
> daquele lado. O **menor** é o que governa — é a ponta que chega primeiro no limite.

<br>

---

## 🅰️ Passo 1 · Centro e raio do círculo de Mohr

Estado plano (σxx, σyy, τxy) → fórmula do Cap. 9:

```text
 σméd (centro) = (σxx + σyy)/2 = (16,4 + (−26,5))/2 = −10,1/2 = −5,05 MPa

 R (raio) = √{ [(σxx − σyy)/2]² + τxy² }
          = √{ [(16,4 − (−26,5))/2]² + (10,4)² }
          = √{ (42,9/2)² + 10,4² }
          = √{ (21,45)² + 108,16 }
          = √{ 460,1 + 108,16 } = √568,3 = 23,84 MPa
```

<br>

---

## 🅱️ Passo 2 · Tensões principais (as TRÊS)

```text
 No plano:   σ_A = σméd + R = −5,05 + 23,84 = +18,79 MPa   (tração)
             σ_B = σméd − R = −5,05 − 23,84 = −28,89 MPa   (compressão)

 Fora do plano (superfície livre):  0 MPa

 Ordenando:  σ1 = +18,79     σ2 = 0     σ3 = −28,89   (MPa)
```

> ⚠️ A peça está na **superfície** → a face externa é livre, logo uma das principais
> é **0** (fora do plano). As três são +18,79 ; 0 ; −28,89. A maior (tração) e a menor
> (compressão) são as do plano; o 0 fica no meio.

<br>

---

## 🅲 Passo 3 · Aplicar Rankine em cada ponta

```text
 LADO TRAÇÃO:      FS_tração = σut / σ1 = 30 / 18,79 = 1,597

 LADO COMPRESSÃO:  FS_compressão = σuc / σ3 = (−40) / (−28,89) = 1,385
                   (os sinais se cancelam → equivale a 40 / 28,89)
```

```text
 FS = min( 1,597 ; 1,385 ) = 1,385
```

> ✅ **Quem manda é a COMPRESSÃO** (FS menor). A peça está mais perto de **esmagar**
> (σ3 = −28,89 vs limite −40) do que de **romper por tração** (σ1 = 18,79 vs +30).

<br>

---

## 📊 Resumo

| Grandeza | Valor |
|:---|:---|
| σméd (centro) | **−5,05 MPa** |
| R (raio) | **23,84 MPa** |
| σ1 (tração) | **+18,79 MPa** |
| σ2 (fora do plano) | **0 MPa** |
| σ3 (compressão) | **−28,89 MPa** |
| FS tração = σut/σ1 | **1,597** |
| FS compressão = σuc/σ3 | **1,385** |
| **FS da peça (menor)** | **1,38** |

✅ **Gabarito:** FS = **1,38** (governado pela **compressão**). Como FS > 1, **não falha**.

<br>

---

## 🔁 Bônus · Por que a compressão "venceu" mesmo tendo limite maior

```text
 Tração:     σ1 = 18,79  contra  +30   →  sobra folga de 30/18,79 = 1,60×
 Compressão: σ3 = 28,89  contra   40   →  sobra folga de 40/28,89 = 1,38×
```

> 🎯 Embora o material aguente **mais** em compressão (40 > 30), a tensão de
> compressão no ponto também é **bem maior** (28,89 > 18,79). O que decide o FS não é
> o limite sozinho nem a tensão sozinha, e sim a **razão** entre eles em cada ponta —
> e a razão menor (mais apertada) é a da compressão. Por isso, em material frágil com
> σut ≠ σuc, **sempre** se checam as duas pontas separadamente.

<div align="center">

---

*EM506 · Resistência dos Materiais 2 · Aulas 10–11 · Cap. 10 Hibbeler*

</div>
