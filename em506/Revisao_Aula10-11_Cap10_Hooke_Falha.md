(No terminal, rodar com glow)
<div align="center">

# 🧭 Revisão — EM506

## Aulas 10 & 11 · Cap. 10 Hibbeler · Lei de Hooke **3D**, Energia de Deformação & **Critérios de Falha**

`10.46` · `10.48` · `10.56` · `10.81` · `10.86` · `10.92` · `10.96`

*Baseado nas Aulas 10 e 11 (Prof. Daros) + Hibbeler Cap. 10*
**A ideia-mestra:** até agora foi tudo **geometria** (girar tensão/deformação). Agora entram o **MATERIAL** (como σ e ε se relacionam em 3D) e a pergunta final: **quando ele quebra?**

</div>

---

## 🔑 0 · O que muda agora (e por que você já tem 80% pronto)

Até o capítulo de Mohr 3D, tudo era **transformação**: dado um estado, girar e achar σ1, σ2, σ3, τabs. **Nada disso falava do material** — um círculo de Mohr é igual para borracha ou aço.

Estas duas aulas adicionam **duas camadas novas** por cima do que você já sabe:

```text
  CAMADA 1 (Aula 10) — LIGAR tensão e deformação em 3D
     "se eu sei as tensões, quais são as deformações?" (e vice-versa)
     → Lei de Hooke generalizada (efeito de Poisson nas 3 direções)

  CAMADA 2 (Aula 11) — decidir se o material FALHA
     "esse estado de tensão quebra/escoa o material?"
     → Critérios de falha (Tresca, von Mises, tensão normal máxima)
```

> 🎯 **A ponte que destrava a Aula 11:** todo critério de falha é só **pegar σ1, σ2, σ3 (que você já acha de olhos fechados pelo Mohr) e comparar com um número do material (σe ou σr).** Você já sabe a parte difícil (achar as principais). Falta só a "regra de comparação". É isso.

| O que você já domina | O que estas aulas acrescentam |
|:---|:---|
| Achar σ1, σ2, σ3 de qualquer estado | Achar **ε** a partir de σ (Hooke 3D) |
| τabs pelo Mohr 3D | Usar τabs como **critério de escoamento** (Tresca) |
| σ = Eε, τ = Gγ (1D) | A versão **3D** com Poisson acoplando as direções |
| — | Dizer **se falha** e calcular o **fator de segurança** |

<br>

---

## 🗺️ 1 · Mapa — a qual família pertence cada problema

| 🏷️ Família | 📋 Problemas | 🎯 O que pede | 🛠️ Ferramenta |
|:---|:---|:---|:---|
| **A** · Hooke 3D (σ→ε ou ε→σ) | `10.46` | deformações a partir das tensões | Bloco 2 |
| **B** · Dilatação / variação de volume | `10.56` | mudança de volume δV | Bloco 3 |
| **C** · Vaso de pressão + Hooke + Mohr 3D | `10.48` | pressão, τmáx no plano e τabs | Bloco 2 + 3 + Mohr 3D |
| **D** · Falha **dúctil** | `10.81` `10.86` `10.92` | FS ou σe mínimo (Tresca / von Mises) | Bloco 5 |
| **E** · Falha **frágil** | `10.96` | se falha (tensão normal máxima) | Bloco 6 |

<br>

---

## 🧪 2 · Lei de Hooke generalizada (o coração da Aula 10)

### 2.1 · De onde vem (efeito de Poisson em 3 direções)

Você já sabe que puxar numa direção **alonga** nela (σx/E) **e encolhe** nas outras duas (efeito de Poisson, `εlat = −ν·εlong`). Em 3D, **cada** tensão normal mexe nas **três** deformações. Somando as três contribuições:

```text
   εx = (1/E)·[ σx − ν(σy + σz) ]
   εy = (1/E)·[ σy − ν(σx + σz) ]      ← LEI DE HOOKE GENERALIZADA
   εz = (1/E)·[ σz − ν(σx + σy) ]
```

> 📖 Como ler: a deformação em x é "o que σx faz sozinho (σx/E)" **menos** o aperto de Poisson que σy e σz causam (−ν·σy/E e −ν·σz/E).

E o cisalhamento é **desacoplado** — cada τ só distorce o seu plano:

```text
   γxy = τxy / G      γyz = τyz / G      γxz = τxz / G
```

> ⚠️ Cisalhamento **não** tem Poisson: τxy não causa γyz. Só mexe no seu próprio ângulo.

### 2.2 · A relação mágica entre E, G e ν

As três constantes **não são independentes**:

```text
            E
   G = ───────────              (decora esta — cai direto)
        2(1 + υ)
```

> 💡 Para metais ν ≈ 1/3, então G ≈ 3E/8 ≈ 0,375·E.

### 2.3 · Invertendo (ε → σ), quando o problema te dá deformação

Se medirem ε e pedirem σ, ou você resolve o sistema 3×3, ou usa a forma já invertida (Hibbeler eq. 10.18). Na prática, na **maioria** dos exercícios você só precisa dos casos simples:

```text
  • Uniaxial (só σx):      εx = σx/E ,  εy = εz = −ν·σx/E
  • Biaxial igual (σx=σy=σ, σz=0):  ε = (σ/E)(1−ν)
  • Cisalhamento puro:     ε(a 45°) = τ/(2G) = τ(1+ν)/E
```

> 🔧 **Constantes de aço (A-36, L2, aço-máquina):** E = 200 GPa, G = 75 GPa, ν ≈ 0,32.

<br>

---

## 🧊 3 · Dilatação e módulo de compressibilidade

### 3.1 · Dilatação (variação relativa de volume)

Um cubinho 1×1×1 deformado vira (1+εx)(1+εy)(1+εz). Multiplicando e jogando fora os produtos minúsculos:

```text
              δV
   e (dilatação) = ─── = εx + εy + εz
              dV
```

> 🔑 **Só deformação NORMAL muda volume.** Cisalhamento distorce mas **não** muda volume (não entra em `e`).

Substituindo Hooke nela, sai uma forma só com tensões:

```text
        1 − 2υ
   e = ──────── · (σx + σy + σz)
          E
```

E o volume muda por:  **δV = e · V**.

### 3.2 · Módulo de compressibilidade (bulk modulus k)

Sob **pressão hidrostática** (σx=σy=σz=−p, sem cisalhamento):

```text
              E
   k = ──────────          (rigidez ao volume)
        3(1 − 2υ)
```

> 🧠 **Limite do Poisson:** se ν→0,5, então k→∞ ⇒ material **incompressível** (δV=0). Por isso **ν nunca passa de 0,5**. Para metais ν≈1/3 ⇒ k≈E.

<br>

---

## ⚡ 4 · Energia de deformação (a base do von Mises)

Você não precisa decorar todas as integrais, mas precisa saber **de onde vem** o critério de von Mises.

```text
  Energia por unidade de volume (1D):  u = σ²/(2E)   (normal)   ou   τ²/(2G)  (cisalh.)
```

O truque da Aula 10: separar a energia total em **mudança de volume** + **distorção (mudança de forma)**. Usando σméd = (σ1+σ2+σ3)/3, a parte que sobra (distorção) é:

```text
        1 + υ
   ud = ───── · [ (σ1−σ2)² + (σ2−σ3)² + (σ3−σ1)² ]
         6E
```

> 🎯 **Por que isso importa:** materiais dúcteis escoam por **deslizamento (distorção)**, não por compressão de volume. Então o critério de von Mises diz: *"falha quando a energia de DISTORÇÃO atinge a do ensaio de tração"*. É daí que sai a fórmula do Bloco 5. Você só precisa do resultado final.

<br>

---

## 💥 5 · Critérios de falha para materiais DÚCTEIS (Aula 11)

> Dúctil = escoa antes de romper (aço). A "falha" é o **escoamento** (σe). Os dois critérios abaixo usam σ1, σ2, σ3 — que você já acha pelo Mohr.

### 5.1 · Tresca — Máxima Tensão de Cisalhamento

**Ideia física:** dúctil escoa por **deslizamento** (linhas de Lüder a 45°), que é causado por **cisalhamento**. Logo: *falha quando o maior cisalhamento do estado 3D iguala o do ensaio de tração.*

No ensaio de tração, no escoamento, τmáx = σe/2. Então o critério é:

```text
   τabs(do estado) ≤ σe/2     ⟺     (σmáx − σmín) ≤ σe
```

onde σmáx e σmín são a **maior e a menor das TRÊS** principais (incluindo σ3 = 0 no estado plano!). **É exatamente o τabs do Mohr 3D que você já sabe.**

Para **estado plano** (σ3 = 0), olhe o sinal de σ1 e σ2:

```text
  • σ1 e σ2 com SINAIS OPOSTOS  → τabs no plano  → critério: |σ1 − σ2| ≤ σe
  • σ1 e σ2 com MESMO sinal     → τabs sai do plano (usa σ3=0):
                                   critério: |σmaior| ≤ σe
```

> ⚠️ Esse é o **mesmo "pega" do γabs / τabs** que você já viu: o sinal das principais decide se o cisalhamento crítico está no plano ou fora dele.

### 5.2 · von Mises — Máxima Energia de Distorção

**Ideia física:** falha quando a **energia de distorção** atinge a do ensaio de tração. Igualando `ud = (ud)ensaio`:

```text
   Tensão equivalente de von Mises:

          ┌ (σ1−σ2)² + (σ2−σ3)² + (σ3−σ1)² ┐ ½
   σvm = │ ───────────────────────────────── │     ≤  σe
          └                2                  ┘
```

Para **estado plano** (σ3 = 0) simplifica para:

```text
   σ1² − σ1·σ2 + σ2²  ≤  σe²
```

### 5.3 · Tresca × von Mises (qual usar)

```text
  • von Mises é mais "generoso" (elipse maior); Tresca é mais CONSERVADOR
    (hexágono dentro da elipse). Tresca nunca libera o que von Mises proíbe.
  • Diferença máxima entre eles ≈ 15%.
  • Se o problema disser qual teoria usar, use essa. Se não, von Mises
    representa melhor os dados experimentais de dúcteis.
```

<br>

---

## 🪨 6 · Critério de falha para materiais FRÁGEIS

> Frágil = rompe sem escoar (ferro fundido, concreto). Falha por **tensão normal**, não por cisalhamento. Limite = tensão de **ruptura** σr (ou σu).

### Tensão Normal Máxima (Rankine)

```text
   σmáx ≤ σr(tração)        e        σmín ≥ −σr(compressão)
```

Ou seja: pega a **maior** principal e compara com a resistência à tração; a **menor** (mais negativa) com a resistência à compressão. Se passar das duas, **falha**.

> 🧠 Frágeis costumam ter σr(compressão) **muito maior** que σr(tração) — por isso a face de tração é quase sempre a que manda.

<br>

---

## 🛡️ 7 · Fator de Segurança (FS)

```text
  DÚCTEIS
     Tresca:    FS = σe / (σmáx − σmín)        [ = (σe/2) / τabs ]
     von Mises: FS = σe / σvm

  FRÁGEIS (Rankine)
     FS = σr / σmáx       (na face crítica de tração)
```

> ✔️ **FS > 1** ⇒ seguro (não falha).  **FS < 1** ⇒ falha.
> Projetar com FS = N significa usar σadm = σe/N (dúctil) ou σr/N (frágil).

<br>

---

## 🧮 8 · Resolução problema a problema (gabaritos)

### 🅰️ Família A — Lei de Hooke 3D

> #### 🔸 10.46 — eixo sob torção, deformações em x e y
> **Dados:** eixo maciço r = 15 mm, aço-ferramenta L2 (E=200 GPa, G=75 GPa), torque T = 2 kN·m. Os eixos x,y estão a 45° dos eixos x′,y′.
> **Passo 1 — tensão de cisalhamento (só torção):**
> ```text
>  J = (π/2)r⁴ = (π/2)(0,015)⁴ = 7,952×10⁻⁸ m⁴
>  τ = T·c/J = (2000)(0,015)/7,952×10⁻⁸ = 377,3 MPa   (cisalhamento PURO)
> ```
> **Passo 2 — x,y estão a 45° ⇒ são as direções PRINCIPAIS** do cisalhamento puro: σx = +τ, σy = −τ.
> **Passo 3 — Hooke:** εx = (1/E)[σx − ν·σy] = (τ/E)(1+ν) = **τ/(2G)**:
> ```text
>  εx = τ/(2G) = 377,3×10⁶ / (2·75×10⁹) = 2,52×10⁻³
>  εy = −εx = −2,52×10⁻³
> ```
> ✅ **Gabarito:** εx = **2,52×10⁻³**, εy = **−2,52×10⁻³**.
> 💡 Repare: a "deformação normal a 45° do cisalhamento puro" é exatamente γ/2 — o elo do Cap. 9/10 com Hooke.

<br>

### 🅱️ Família B — Dilatação / volume

> #### 🔸 10.56 — tubo sob carga axial, mudança de volume
> **Dados:** tubo A-36 (E=200 GPa, ν=0,32), Ø interno 30 mm, Ø externo 40 mm, L = 0,5 m, P = 60 kN axial.
> ```text
>  A = (π/4)(0,040² − 0,030²) = 5,498×10⁻⁴ m²
>  σx = P/A = 60000 / 5,498×10⁻⁴ = 109,1 MPa   (uniaxial: σy=σz=0)
>
>  e = (1−2ν)/E · σx = (1−0,64)/200×10⁹ · 109,1×10⁶ = 1,964×10⁻⁴
>  V = A·L = 5,498×10⁻⁴ · 0,5 = 2,749×10⁻⁴ m³
>  δV = e·V = 1,964×10⁻⁴ · 2,749×10⁻⁴ = 5,40×10⁻⁸ m³ ≈ 54,0 mm³
> ```
> ✅ **δV ≈ 54 mm³** (aumenta, pois é tração). Só a dilatação `e` (normais) conta.

<br>

### 🅲 Família C — Vaso de pressão + Hooke + Mohr 3D

> #### 🔸 10.48 — vaso ESFÉRICO, achar p, τmáx no plano e τabs
> **Dados:** esfera Ø interno 2 m (r=1 m), t = 10 mm, extensômetro L=20 mm acusa ΔL=0,012 mm. Aço E=200 GPa, ν=0,3.
> **Passo 1 — deformação medida:**
> ```text
>  ε = ΔL/L = 0,012/20 = 600×10⁻⁶
> ```
> **Passo 2 — esfera tem tensão BIAXIAL igual** (σ1=σ2=σ=pr/2t, σ3≈0). Hooke biaxial:
> ```text
>  ε = (σ/E)(1−ν)  ⇒  σ = εE/(1−ν) = 600×10⁻⁶·200×10⁹ / 0,7 = 171,4 MPa
> ```
> **Passo 3 — pressão:**
> ```text
>  σ = pr/2t  ⇒  p = 2tσ/r = 2·0,01·171,4×10⁶ / 1,0 = 3,43 MPa
> ```
> **Passo 4 — cisalhamentos (aqui entra o Mohr 3D):** principais = (171,4 ; 171,4 ; 0).
> ```text
>  τmáx no PLANO  = (σ1 − σ2)/2 = (171,4 − 171,4)/2 = 0   ← σ1=σ2, círculo no plano vira um PONTO!
>  τabs (3D)      = (σmáx − σmín)/2 = (171,4 − 0)/2 = 85,7 MPa
> ```
> ✅ **p = 3,43 MPa · τmáx(plano) = 0 · τabs = 85,7 MPa.**
> 💡 O "pega": como as duas do plano são iguais, o cisalhamento no plano é **zero** — todo o cisalhamento vem do 3D (par com σ3=0).

<br>

### 🅳 Família D — Falha dúctil (Tresca / von Mises)

> #### 🔸 10.81 — FS por Tresca (tensões principais dadas)
> **Dados:** tensões principais no plano σ1 = **+80 MPa** e σ2 = **−50 MPa** (sinais **opostos** na figura), aço-máquina σe = 700 MPa.
> ```text
>  Sinais opostos ⇒ τabs no plano ⇒ critério |σ1 − σ2|:
>  FS = σe / (σ1 − σ2) = 700 / (80 − (−50)) = 700 / 130
> ```
> ✅ **FS = 5,38** (gabarito). Seguro.
> 💡 Se fossem do **mesmo** sinal, o denominador seria |σmaior| = 80 (com σ3=0), dando FS = 8,75. **O sinal muda a resposta** — é o ponto-chave de Tresca.

> #### 🔸 10.86 — menor σe por Tresca (estrutura de banco)
> **Dados:** elemento com tensão normal **560 MPa** e cisalhamento **175 MPa**.
> **Passo 1 — principais (estado plano com σ e τ):**
> ```text
>  σ1,2 = σ/2 ± √[(σ/2)² + τ²] = 280 ± √(280² + 175²) = 280 ± 330,2
>  σ1 = 610,2 MPa   σ2 = −50,2 MPa   (sinais opostos)
> ```
> **Passo 2 — Tresca (menor σe que ainda aguenta):**
> ```text
>  σe(mín) = σ1 − σ2 = 610,2 − (−50,2) = 660,4 MPa
> ```
> ✅ **σe mínimo = 660,4 MPa** (gabarito). *(Por von Mises, problema 10.87, daria 636,8 MPa — menor, pois von Mises é menos conservador.)*

> #### 🔸 10.92 — diâmetro do eixo de navio por Tresca (cargas combinadas)
> **Dados:** torque T = 3,45 kN·m, momento M = 2,25 kN·m, axial P = 12,5 kN; σe = 700 MPa, **τe = 350 MPa**. Eixo maciço, achar d.
> **Passo 1 — tensões no ponto crítico da superfície** (em função de d):
> ```text
>  σ = 4P/(πd²) + 32M/(πd³)      (axial + flexão)
>  τ = 16T/(πd³)                 (torção)
> ```
> **Passo 2 — Tresca com limite de cisalhamento** (principais de sinais opostos):
> ```text
>  τabs = √[(σ/2)² + τ²] ≤ τe = 350 MPa   ⟺   2√[(σ/2)² + τ²] ≤ σe = 700
> ```
> Resolvendo para d (iterando / isolando):
> ```text
>  d = 39,35 mm   (conferência: com d=39,35 → σ≈386, τ≈288 → 2·347 ≈ 694 ≤ 700 ✔)
> ```
> ✅ **d = 39,35 mm** (gabarito).

<br>

### 🅴 Família E — Falha frágil (tensão normal máxima)

> #### 🔸 10.96 — cilindro de concreto, falha por tensão normal?
> **Dados:** concreto (frágil) Ø 50 mm (r=25 mm), torque T = 500 N·m, força axial **compressão** P = 2 kN, σr = 28 MPa (tração).
> **Passo 1 — tensões:**
> ```text
>  A = (π/4)(0,050)² = 1,963×10⁻³ m²
>  σ_axial = −P/A = −2000/1,963×10⁻³ = −1,02 MPa   (compressão)
>  J = (π/2)(0,025)⁴ = 6,136×10⁻⁷ m⁴
>  τ = T·c/J = 500·0,025/6,136×10⁻⁷ = 20,37 MPa
> ```
> **Passo 2 — principais:**
> ```text
>  σ1,2 = σ/2 ± √[(σ/2)² + τ²] = −0,51 ± √(0,51² + 20,37²) = −0,51 ± 20,38
>  σ1 = +19,87 MPa    σ2 = −20,89 MPa
> ```
> **Passo 3 — tensão normal máxima (Rankine):**
> ```text
>  σ1 = 19,87 MPa  <  σr = 28 MPa  (tração)  ✔ não rompe por tração
> ```
> ✅ **NÃO falha** segundo a teoria da tensão normal máxima (a tração máxima 19,9 MPa fica abaixo dos 28 MPa).

<br>

---

## ✅ 9 · Checklist antes da prova

```text
 □ Sei escrever Hooke 3D (εx = (1/E)[σx − ν(σy+σz)]) de cabeça
 □ Sei G = E/[2(1+ν)] e que cisalhamento não tem Poisson
 □ Dilatação e = εx+εy+εz = (1−2ν)/E·(σx+σy+σz); δV = e·V
 □ Bulk k = E/[3(1−2ν)]; ν≤0,5 (incompressível)
 □ Tresca: σmáx − σmín ≤ σe  (atenção ao SINAL das principais!)
 □ von Mises plano: σ1² − σ1σ2 + σ2² ≤ σe²
 □ Normal máxima (frágil): σmáx ≤ σr, σmín ≥ −σr
 □ FS: σe/(σmáx−σmín) [Tresca], σe/σvm [VM], σr/σmáx [Rankine]
 □ Lembro que σ1,σ2,σ3 saem do MOHR — falha é só comparar
```

<br>

---

## 📅 10 · Plano de estudo sugerido

```text
 1. 🧪 Hooke 3D primeiro: 10.46 (torção→Hooke) e 10.56 (volume) — fixa a relação σ↔ε.
 2. 🧊 10.48 — junta Hooke + vaso de pressão + Mohr 3D (τabs). Integra tudo da Aula 10.
 3. 💥 Dúcteis: 10.81 (Tresca direto) → 10.86 (acha principais antes) → 10.92 (cargas combinadas).
 4. 🪨 Frágil: 10.96 (tensão normal máxima) — mais curto, fecha o ciclo.
 5. 🔁 Reforço do "pega": em Tresca, SEMPRE checar se σ1 e σ2 têm o mesmo sinal.
```

<div align="center">

---

*EM506 · Resistência dos Materiais 2 · Aulas 10–11 · Cap. 10 Hibbeler*

</div>
