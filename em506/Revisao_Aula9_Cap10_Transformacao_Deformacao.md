(No terminal, rodar com glow)
<div align="center">

# 🧭 Revisão — EM506

## Aula 9 · Cap. 10 Hibbeler · Transformação de **Deformação**, Círculo de Mohr & **Rosetas**

`10.2` · `10.5` · `10.10` · `10.23` · `10.29` · `10.31` · `10.32` · `10.33`

*Baseado na Aula 9 (Prof. Daros) + Hibbeler Cap. 10*
**A ideia-mestra:** tudo que você já sabe de **tensão** (Cap. 9) vira deformação com **uma troca de variáveis**.

</div>

---

## 🔑 0 · A chave que destrava o capítulo inteiro

> Você já domina o Cap. 9 (transformação de tensão e Círculo de Mohr, inclusive 3D).
> **Boa notícia:** o Cap. 10 é o **mesmo capítulo**, com outra letra. Faça esta substituição e *todas* as fórmulas que você decorou continuam valendo:

```text
   σ   →   ε        (tensão normal vira deformação normal)

   τ   →   γ/2      (tensão de cisalhamento vira METADE da deformação angular)
```

> ⚠️ **O único cuidado novo do capítulo:** sempre que aparecer cisalhamento, é **γ/2**, nunca γ inteiro.
> Por isso o eixo vertical do Mohr de deformação é **γ/2** (e não γ), e a fórmula do raio tem **(γxy/2)²**.

| Conceito de **tensão** (você já sabe) | Vira o conceito de **deformação** |
|:---|:---|
| σx, σy, τxy | εx, εy, γxy |
| σx′ = … (transformação) | εx′ = … (mesma cara) |
| σ1, σ2 principais | ε1, ε2 principais |
| τmáx no plano | γmáx no plano |
| σméd = (σx+σy)/2 | εméd = (εx+εy)/2 |
| τabs (Mohr 3D, Aula 7) | γabs (idêntico!) |

<br>

---

## 🗺️ 1 · Mapa — a qual família pertence cada problema

| 🏷️ Família | 📋 Problemas | 🎯 O que pede | 🛠️ Ferramenta |
|:---|:---|:---|:---|
| **A** · Girar o elemento | `10.2` `10.5` | εx′, εy′, γx′y′ num elemento girado de θ | Eqs. de transformação (Bloco 3) |
| **B** · Estado dado → principais/γmáx | `10.10` | ε1, ε2, γmáx no plano + orientações | Bloco 4 |
| **C** · Estado dado → 3D / γ_abs | `10.23` | principais, γmáx no plano **e** γmáx **absoluto** | Bloco 4 + Bloco 6 |
| **D** · Rosetas (extensômetros) | `10.29` `10.31` `10.32` `10.33` | medir εa,εb,εc → achar εx,εy,γxy → principais | Bloco 7 |

<br>

---

## 📐 2 · O que é "deformação no plano" (EPD) e a convenção de sinais

> **Estado plano de deformação:** uma dimensão (z) é muito maior que as outras, o carregamento não varia ao longo dela e não há carga nessa direção. Resultado: `εz = γxz = γyz = 0`. Sobram só **εx, εy, γxy**.

O elemento sofre 3 coisas (figura da Aula 9):
- **εx** → estica/encolhe na horizontal (`+` = alonga)
- **εy** → estica/encolhe na vertical (`+` = alonga)
- **γxy** → "entorta" o ângulo reto (`+` quando o ângulo de 90° **diminui**)

> 🧷 **Convenção (igual à de tensão):**
> - **εx, εy positivas** = alongamento (tração).
> - **γxy positiva** = o ângulo reto entre +x e +y **fecha** (fica < 90°).
> - **θ positivo = anti-horário** a partir do eixo x.
> - ⚠️ Giro **horário** ⇒ θ **negativo** nas equações (igual ao Cap. 9).

> 🧊 **Detalhe que o professor cobra (efeito de Poisson):** na superfície de uma peça real você tem **estado plano de _tensão_** (σz=0), **não** de deformação — porque εz ≠ 0 (a peça afina/engrossa na direção z por Poisson). Por isso a roseta mede só o plano, mas existe uma deformação fora do plano que ela **não enxerga**. Isso aparece como "Observação" nos exemplos e no `10.23`.

<br>

---

## 🧮 3 · Equações de transformação (Família A — `10.2`, `10.5`)

> Conhecidos εx, εy, γxy, quero as deformações num elemento girado de θ. **São idênticas às de tensão, com τ→γ/2.**

```text
 εx'    = (εx+εy)/2 + [(εx−εy)/2]·cos2θ + (γxy/2)·sen2θ

 γx'y'/2 = −[(εx−εy)/2]·sen2θ + (γxy/2)·cos2θ        ← repare: dá γ/2

 εy'    = (εx+εy)/2 − [(εx−εy)/2]·cos2θ − (γxy/2)·sen2θ
```

> ✅ **Checagem de ouro:** `εx′ + εy′ = εx + εy` (invariante). Confira **sempre**.
> ⚠️ A 2ª equação te dá **γx′y′/2**. Para reportar γx′y′, **multiplique por 2**.

### 🔧 Receita (vale para 10.2 e 10.5)
1. Calcule (εx+εy)/2, (εx−εy)/2 e γxy/2.
2. Ache 2θ (cuidado com o sinal de θ: horário = negativo).
3. Substitua. Pegue εy′ pela 3ª eq. **ou** por εx′+εy′ = εx+εy.
4. Multiplique γx′y′/2 por 2.
5. **Desenhe o elemento deformado** (a prova exige o esboço).

<br>

---

## 🎯 4 · Deformações principais e cisalhamento máximo no plano (Família B — `10.10`)

```text
 ε1,2 = (εx+εy)/2 ± R          com   R = √{ [(εx−εy)/2]² + (γxy/2)² }

 tan(2θp) = γxy / (εx − εy)
```

```text
 γmáx(no plano) = 2R = 2·√{ [(εx−εy)/2]² + (γxy/2)² }      εméd = (εx+εy)/2

 tan(2θs) = −(εx − εy) / γxy
```

> 🧭 Nas direções **principais** o cisalhamento é zero (só εstica/encolhe). Os planos de **γmáx** ficam a **45°** dos principais, e aí atua **εméd** nas duas direções.
> ❓ Para saber qual θp dá **ε1** (o maior): substitua θp em εx′ — se der o maior, é ε1; senão, some 90°.

<br>

---

## ⭕ 5 · Círculo de Mohr da deformação

> Exatamente o Mohr que você já desenha, com **eixo horizontal = ε** e **eixo vertical = γ/2**.

| # | Passo | Como |
|:--:|:---|:---|
| 1️⃣ | **Centro** | C = (εméd, 0), εméd = (εx+εy)/2 |
| 2️⃣ | **Ponto de referência A** | A = (εx, γxy/2) — face x |
| 3️⃣ | **Raio** | R = √[((εx−εy)/2)² + (γxy/2)²] |
| 4️⃣ | **Principais** | ε1 = C+R, ε2 = C−R (onde o círculo corta o eixo ε) |
| 5️⃣ | **Ângulos** | giro de θ no elemento = **2θ no círculo**, mesmo sentido |
| 6️⃣ | **γmáx no plano** | topo/fundo do círculo: γmáx/2 = R ⇒ **γmáx = 2R**; ali ε = εméd |

> 🧷 **Convenção da aula:** o eixo **γ/2 positivo aponta para baixo** — assim rotação anti-horária do elemento = rotação anti-horária no círculo (vide Exemplo 10.4).

<br>

---

## 🧊 6 · Cisalhamento máximo **ABSOLUTO** (Família C — chave do `10.23`)

> Igualzinho ao **τabs** da Aula 7 (Mohr 3D). No EPD/EPT a 3ª deformação principal fora do plano é `εz` (em geral **0** no estado plano de tensão).

> 🔢 Ordene as três principais: **εmáx ≥ εint ≥ εmín** (inclua εz = 0).

```text
        εmáx − εmín
 γabs = ───────────── × 2   =  εmáx − εmín
              2
```

| Situação (ε1, ε2 no plano; ε3 = εz = 0) | γabs |
|:---|:---|
| ε1 e ε2 de **sinais opostos** | está **no plano**: γabs = ε1 − ε2 (= γmáx no plano) |
| ε1 e ε2 de **mesmo sinal** | **sai do plano**: γabs = (maior em módulo) − 0 |

> 🎯 No `10.23` as duas principais dão **positivas** ⇒ o absoluto **sai do plano** (usa o ε3 = 0). É por isso que γabs ≠ γmáx no plano.

<br>

---

## 🌹 7 · Rosetas de deformação (Família D — `10.29` `10.31` `10.32` `10.33`)

> 💡 **Por que existem rosetas?** Um extensômetro (strain gauge) é um fiozinho colado na peça: ao esticar, muda a resistência elétrica → mede **só a deformação normal NA direção do fio** (cisalhamento não estica o fio, então ele não mede γ). Mas o estado no plano tem **3 incógnitas** (εx, εy, γxy). Logo precisamos de **3 fios em 3 direções** = uma **roseta**.

### ⭐ A única equação que você precisa (deformação normal numa direção θ)

```text
 εθ = εx·cos²θ + εy·sen²θ + γxy·senθ·cosθ
```

> É a 1ª equação de transformação reescrita. Cada extensômetro lê εθ na sua direção θ (medida **anti-horário a partir do eixo x**).

### 🔧 Receita universal da roseta (serve para QUALQUER roseta)
1. Anote a direção θa, θb, θc de cada extensômetro (do desenho).
2. Escreva **3 equações**, uma por extensômetro:
   - εa = εx·cos²θa + εy·sen²θa + γxy·senθa·cosθa
   - εb = εx·cos²θb + εy·sen²θb + γxy·senθb·cosθb
   - εc = εx·cos²θc + εy·sen²θc + γxy·senθc·cosθc
3. **Resolva o sistema 3×3** para εx, εy, γxy.
4. Aplique o **Bloco 4** (principais, γmáx, orientação) — agora é um problema normal.

### ⚡ Atalhos (quando a roseta está alinhada com x)

> **Roseta 45° "padrão"** (θa=0°, θb=45°, θc=90°):
> `εx = εa` · `εy = εc` · `γxy = 2εb − εa − εc`

> **Roseta 60° "padrão"** (θa=0°, θb=60°, θc=120°):
> `εx = εa` · `εy = (2εb + 2εc − εa)/3` · `γxy = 2(εb − εc)/√3`

> ⚠️ **Os atalhos só valem se a roseta começa no eixo x (θa=0).** Se a roseta estiver **girada** (como em 10.31 e 10.32), **NÃO use o atalho** — monte as 3 equações com os θ reais. É mais seguro e quase sempre o que a figura exige.

<br>

---

## 📚 8 · Guia problema a problema (com dados e gabarito)

> Todos os ε e γ estão em ×10⁻⁶ (microstrain). **Confira os sinais na sua figura** — eu li direto do PDF, mas vale checar.

### 🅰️ Família A — girar o elemento

> #### 🔸 10.2 — aba da bequilha
> **Dados:** εx = **−400**, εy = **860**, γxy = **375**; gire **θ = 30° anti-horário** (θ = +30°).
> **Faça:** Bloco 3 com 2θ = 60° (cos60=0,5 · sen60=0,866).
> **Gabarito:**
> - εx′ = 230 − 315 + 162,4 = **77,4 ×10⁻⁶**
> - γx′y′/2 = +545,6 + 93,75 = 639,3 ⇒ γx′y′ = **1.279 ×10⁻⁶**
> - εy′ = 460 − 77,4 = **383 ×10⁻⁶**  *(checa: 77,4+383 = 460 = −400+860 ✓)*
> 🎨 Esboce o quadradinho girado 30° anti-horário, alongado em x′ e mais ainda em y′.

> #### 🔸 10.5 — suporte com carga P
> **Dados:** εx = **500**, εy = **350**, γxy = **−430**; gire **θ = 30° horário** ⇒ θ = **−30°** ⇒ 2θ = −60° (cos=0,5 · sen=−0,866).
> **Gabarito:**
> - εx′ = 425 + 37,5 + 186,2 = **649 ×10⁻⁶**
> - γx′y′/2 = +64,95 − 107,5 = −42,55 ⇒ γx′y′ = **−85,1 ×10⁻⁶**
> - εy′ = 850 − 649 = **201 ×10⁻⁶**  *(checa: 649+201 = 850 = 500+350 ✓)*

<br>

### 🅱️ Família B — principais + γmáx no plano

> #### 🔸 10.10 — braço
> **Dados:** εx = **250**, εy = **−450**, γxy = **−825**.
> **Cálculo:** εméd = −100 · R = √(350² + 412,5²) = √292.656 = **541**.
> **Gabarito (a):** ε1 = −100+541 = **441 ×10⁻⁶** · ε2 = −100−541 = **−641 ×10⁻⁶**
> tan2θp = −825/(250+450) = −1,179 ⇒ **θp = −24,8° (e 65,2°)**.
> **Gabarito (b):** γmáx(plano) = 2R = **1.082 ×10⁻⁶** · εméd = **−100 ×10⁻⁶** · θs = θp ± 45° ⇒ **θs = 20,2°**.
> 🎨 Dois esboços: o de ε1/ε2 (a −24,8°) e o de γmáx (a +20,2°).

<br>

### 🅲 Família C — 3D / γ absoluto

> #### 🔸 10.23 — suporte, ponto A
> **Dados:** εx = **300**, εy = **550**, γxy = **−650**, **εz = 0**.
> **Cálculo:** εméd = 425 · R = √(125² + 325²) = √121.250 = **348,2**.
> **(a) principais no plano:** ε1 = 425+348 = **773 ×10⁻⁶** · ε2 = 425−348 = **76,8 ×10⁻⁶** (a 3ª é εz = 0).
> **(b) γmáx no plano:** 2R = **696 ×10⁻⁶**.
> **(c) γmáx ABSOLUTO:** ε1 e ε2 são **ambas positivas** ⇒ o absoluto sai do plano. Ordene: εmáx=773, εint=76,8, εmín = εz = 0 ⇒
> γabs = εmáx − εmín = 773 − 0 = **773 ×10⁻⁶**.
> 💡 É o mesmo raciocínio do τabs (Aula 7): como as duas têm o mesmo sinal, entra o **εz = 0**, e por isso **γabs (773) > γmáx no plano (696)**.

<br>

### 🅳 Família D — rosetas

> #### 🔸 10.29 — roseta **60°** no suporte (a→0°, b→60°, c→120°)
> **Dados:** εa = **−780**, εb = **400**, εc = **500**.
> **Atalho 60° (vale, pois θa=0):** εx = εa = **−780** · εy = (2·400 + 2·500 − (−780))/3 = 2580/3 = **860** · γxy = 2(400−500)/√3 = **−115,5**.
> **Principais:** εméd = 40 · R = √(820² + 57,7²) = **822**.
> ε1 = **862 ×10⁻⁶** · ε2 = **−782 ×10⁻⁶** · γmáx(plano) = 2R = **1.644 ×10⁻⁶** · εméd = **40 ×10⁻⁶**.
> tan2θp = −115,5/(−1640) ⇒ **θp ≈ 2,0°**.

> #### 🔸 10.31 — roseta **60° GIRADA** numa viga (a→−30°, b→+30°, c→+90°)
> **Dados:** εa = **150**, εb = **−330**, εc = **400**.
> ⚠️ Roseta girada ⇒ **monte as 3 equações** (não use atalho).
> - c a 90°: εc = εy ⇒ **εy = 400**
> - a (−30°) + b (+30°): somando ⇒ 1,5εx + 0,5εy = 150 + (−330) = −180 ⇒ **εx = −253**
> - b − a: 0,866·γxy = −330 − 150 = −480 ⇒ **γxy = −554**
> **Principais:** εméd = 73,3 · R = √(326,7² + 277,2²) = **428**.
> ε1 = **502 ×10⁻⁶** · ε2 = **−355 ×10⁻⁶** · γmáx(plano) = **857 ×10⁻⁶** · εméd = **73,3 ×10⁻⁶** · θp ≈ **20,2°**.

> #### 🔸 10.32 — roseta **45° GIRADA** num eixo de aço (a→−45°, b→0°, c→+45°)
> **Dados:** εa = **800**, εb = **520**, εc = **−450**.
> Como b está em 0°: εx = εb = **520**. Então (roseta simétrica −45/0/+45):
> εy = εa + εc − εb = 800 + (−450) − 520 = **−170** · γxy = εc − εa = −450 − 800 = **−1.250**.
> **Principais:** εméd = 175 · R = √(345² + 625²) = **714**.
> ε1 = **889 ×10⁻⁶** · ε2 = **−539 ×10⁻⁶**.
> tan2θp = −1250/(520+170) = −1,812 ⇒ **θp = −30,5° (e 59,5°)**.

> #### 🔸 10.33 — orientação **geral** (problema de "escrever um código")
> **Dados de teste:** θa=40°/εa=160 · θb=125°/εb=100 · θc=220°/εc=80.
> **O que se espera:** montar o sistema geral e resolvê-lo:
> ```text
> [cos²θa  sen²θa  senθa·cosθa] [εx ]   [εa]
> [cos²θb  sen²θb  senθb·cosθb] [εy ] = [εb]
> [cos²θc  sen²θc  senθc·cosθc] [γxy]   [εc]
> ```
> Resolve o 3×3 → εx, εy, γxy → aplica o **Bloco 4** (ε1, ε2, γmáx).
> ⚠️ **Observação importante deste exemplo:** θc = 220° = θa + 180°. Como o extensômetro lê o mesmo valor numa direção e na oposta, os fios **a e c ficam na mesma reta** — o sistema fica **singular** com esses números. Ou seja, os valores são só para "testar o código": na prática escolha **3 direções não colineares** (ex.: 0°, 45°, 90°). Para a entrega, o essencial é **mostrar o sistema acima montado e o método de solução**, que é o que o enunciado pede.

<br>

---

## ✅ 9 · Checklist de prova (erros que mais custam nota)

- [ ] 🔁 Sempre que vir cisalhamento: é **γ/2**, não γ. (Eixo do Mohr, raio, ponto A.)
- [ ] ➗ A 2ª equação dá **γx′y′/2** — **multiplique por 2** para reportar γx′y′.
- [ ] ➕ Confira **εx′ + εy′ = εx + εy** (invariante).
- [ ] 🔄 Giro **horário** do elemento ⇒ θ **negativo**.
- [ ] 🌹 Roseta **girada** ⇒ monte as 3 equações; **não** use o atalho (que só vale com θa=0).
- [ ] 📐 Ângulos da roseta são medidos **anti-horário a partir de x**; leia bem o desenho.
- [ ] 🧊 γmáx **no plano** ≠ γmáx **absoluto**: se ε1 e ε2 têm o **mesmo sinal**, o absoluto usa **εz = 0**.
- [ ] 🧷 Poisson: superfície livre = estado plano de **tensão**; existe εz ≠ 0 que a roseta não mede.
- [ ] ✏️ **Desenhe o elemento deformado** sempre que pedir orientação.

<br>

---

<div align="center">

## 🗓️ Plano de estudo sugerido

</div>

1. ✍️ Faça `10.2` e `10.5` (girar elemento) — fixa as equações e o sinal de θ.
2. 🎯 `10.10` (principais + γmáx) e refaça por **Mohr** — devem bater.
3. 🧊 `10.23` (γ absoluto) — pratica a regra do "mesmo sinal ⇒ usa εz=0".
4. 🌹 Rosetas na ordem **10.29 (atalho 60°) → 10.32 (45° girada) → 10.31 (60° girada) → 10.33 (geral/código)**.

<div align="center">

---

**Bons estudos! 💪📘 — lembre: é o Cap. 9 com σ→ε e τ→γ/2.**

</div>
