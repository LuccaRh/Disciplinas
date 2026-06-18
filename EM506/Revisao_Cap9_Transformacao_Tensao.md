# Revisão — EM506 / Cap. 9 Hibbeler: Transformação de Tensão (Círculo de Mohr)

Guia para resolver os exercícios **9.14, 9.15, 9.16, 9.36, 9.37, 9.38, 9.49, 9.68, 9.78, 9.81, 9.82, 9.85, 9.90**.
Baseado no Hibbeler (Cap. 9) + Aulas 6 e 7. Os 13 problemas caem em **4 famílias**. Domine os blocos 1–5 e você resolve todos.

---

## 0. Mapa rápido — a qual família pertence cada problema

| Família | Problemas | O que pede | Ferramenta principal |
|---|---|---|---|
| **A — Estado já dado, achar principais/τmáx** | 9.14, 9.15 | σ₁, σ₂, τ_máx no plano, σ_méd + orientações | Eqs. de transformação (Bloco 2) ou Mohr (Bloco 4) |
| **B — Estado dado, girar o elemento** | 9.16, 9.68 | Tensões num elemento girado θ (16→60° h., 68→30° h.) | Eqs. de transformação σx′, σy′, τx′y′ (Bloco 1) |
| **C — Carga combinada → montar o estado, depois transformar** | 9.36, 9.37, 9.38, 9.49, 9.81, 9.82, 9.85 | Achar σ e τ num ponto a partir de N, V, M, T; depois transformar | Bloco 6 (montar estado) + Bloco 2 ou tensão num plano |
| **D — Mohr direto / estado 3D** | 9.78, 9.90 | Desenhar Mohr (78); principais + τ_abs 3D (90) | Bloco 4 e Bloco 5 |

---

## 1. Convenção de sinais e equações de transformação

Estado plano de tensão (EPT): conhecidos σx, σy, τxy. Queremos as tensões num elemento girado de θ.

**Convenção:** θ positivo **anti-horário**; σ de tração positiva; τxy positiva quando aponta no sentido +y na face +x. Eixo x′ é o eixo girado de θ a partir de x.

```
σx' = (σx+σy)/2 + [(σx−σy)/2]·cos2θ + τxy·sen2θ

τx'y' = −[(σx−σy)/2]·sen2θ + τxy·cos2θ

σy' = (σx+σy)/2 − [(σx−σy)/2]·cos2θ − τxy·sen2θ
```

> Checagem útil: **σx′ + σy′ = σx + σy** (invariante). Use sempre para conferir.

**Aplicação direta:** 9.16 (gira 60° horário ⇒ θ = −60°) e 9.68 (gira 30° horário ⇒ θ = −30°). Basta substituir. Cuidado com o **sinal do θ** (horário = negativo).

---

## 2. Tensões principais e cisalhamento máximo no plano

**Tensões principais** (planos onde τ = 0):

```
σ1,2 = (σx+σy)/2 ± √{ [(σx−σy)/2]² + τxy² }

tan(2θp) = τxy / [(σx−σy)/2]
```

**Cisalhamento máximo no plano** e tensão normal associada:

```
τmáx(plano) = √{ [(σx−σy)/2]² + τxy² }       σméd = (σx+σy)/2

tan(2θs) = −[(σx−σy)/2] / τxy
```

> Os planos de τ_máx ficam a **45° dos planos principais**. No elemento de τ_máx atua σ_méd nas duas faces.
> Para saber **qual** ângulo dá σ₁ (e não σ₂), substitua θp em σx′: se der o maior valor, é σ₁; senão some 90°.

**Aplicação direta:** 9.14, 9.15 (item *a* = principais; item *b* = τ_máx no plano + σ_méd, com orientações).

---

## 3. Roteiro do elemento orientado (como desenhar a resposta)

1. Calcule σ₁, σ₂ e θp1 / θp2.
2. Desenhe o elemento original e gire-o de θp; marque σ₁ e σ₂ (sem cisalhamento nessas faces).
3. Para o item de τ_máx, gire 45° a partir do elemento principal; marque τ_máx e σ_méd.
4. Indique sentido (horário/anti-horário) e o valor do ângulo. A prova exige o **desenho do elemento orientado**.

---

## 4. Círculo de Mohr — procedimento (Aula 6)

Convenção da aula: eixo **σ horizontal (tração à direita)**, eixo **τ vertical positivo para baixo**.

1. **Centro:** C = (σ_méd, 0), com σ_méd = (σx+σy)/2.
2. **Ponto de referência A** = (σx, τxy) — representa a face x.
3. **Raio:** R = distância de C a A = √[((σx−σy)/2)² + τxy²]  (= τ_máx no plano).
4. **Principais:** interseções com o eixo σ ⇒ σ₁ = C + R, σ₂ = C − R.
5. **Ângulos:** rotação de θ no elemento = **2θ no círculo**. O ângulo de A até o eixo σ é 2θp. Sentido no círculo = mesmo sentido no elemento.
6. **Estado girado:** gire 2θ a partir de A (mesmo sentido do giro do elemento) para ler (σx′, τx′y′).
7. **τ_máx no plano** = topo/fundo do círculo = R; ali σ = σ_méd.

> Mohr é o caminho mais seguro para 9.78 (só desenhar os círculos: dê **C e R** de cada estado — gabarito: (a) C=0,1 MPa, R=0,7 MPa; (b) C=−1 MPa, R=1 MPa) e é alternativa válida para 9.14/9.15/9.16/9.68.

---

## 5. Estado geral 3D e cisalhamento máximo ABSOLUTO (Aula 7) — chave do 9.90

Ordene as três tensões principais: **σ_máx ≥ σ_int ≥ σ_mín** (no EPT, a 3ª principal fora do plano é **σ = 0**).

```
        σmáx − σmín
τabs = ─────────────
             2
```

Regras práticas a partir do estado plano (σ₁, σ₂ no plano, σ₃ = 0):
- **σ₁ e σ₂ de sinais opostos** ⇒ τ_abs está no plano = (σ₁−σ₂)/2 (= τ_máx no plano).
- **σ₁ e σ₂ de mesmo sinal** ⇒ τ_abs sai do plano = |maior principal|/2 (use σ=0 como mín ou máx).

**9.90** é um estado já dado em 3D (σx, σy, σz e cisalhamentos): obtenha as 3 principais (autovalores), ordene e aplique a fórmula.
Gabarito: σ_máx = 98,94 MPa, σ_int = 88,94 MPa, σ_mín = −100,00 MPa ⇒ **τ_abs = 99,47 MPa**.

---

## 6. A "ponte" — montar o estado de tensão a partir das cargas internas (Família C)

Esta é a parte que mais cai e a que confunde. Antes de transformar, você precisa de σx, σy, τxy **no ponto pedido**. Passos:

1. **Cortar e achar as cargas internas** na seção do ponto: força normal **N**, cortante **V**, momento fletor **M**, torque **T** (equilíbrio da viga/estrutura).
2. **Somar as contribuições de tensão no ponto** (princípio da superposição):

| Solicitação | Tensão | Onde atua |
|---|---|---|
| Axial | σ = N/A | normal, uniforme |
| Flexão | σ = M·y/I | normal; **zero na LN, máx na fibra extrema** |
| Cisalhamento transversal | τ = V·Q/(I·t) | cisalhante; **máx na LN, zero na fibra extrema** |
| Torção (eixos/tubos) | τ = T·ρ/J | cisalhante, cresce com o raio |

3. **Monte o elemento** nesse ponto com o σx resultante (axial + flexão) e o τxy resultante (cortante ± torção). Geralmente σy = 0.
4. **Transforme** (Bloco 2 para principais, ou Bloco 1 para um plano específico).

> Detalhe que decide a nota: **na fibra extrema** (topo/base) Q→0 ⇒ τ_flexão = 0, mas σ_flexão é máximo; **na LN** σ_flexão = 0, mas τ é máximo. Por isso o mesmo problema dá respostas bem diferentes em A, B, C.

Lembretes de propriedades de seção:
- Retângulo: I = b·h³/12. Q (acima de y₁) = (área acima)·(ȳ até a LN).
- Q na LN do retângulo = b·(h/2)·(h/4) = b·h²/8 ⇒ τ_máx = 1,5·V/A.
- Tubo/eixo circular: J = π(r_e⁴−r_i⁴)/2; I = J/2.

---

## 7. Guia problema a problema

### Família A — estado dado
- **9.14** — σx, σy, τxy do elemento. (a) principais; (b) τ_máx no plano + σ_méd; desenhe os dois elementos.
  Gab.: σ₁ ≈ 26,5 MPa, σ₂ ≈ −84,9 MPa, θp1 = 60,5°, θp2 = −29,5°; τ_máx = 175 MPa (confira pelos valores da figura).
- **9.15** — idem. Gab.: σ₁ = 4,21 MPa, σ₂ = −34,21 MPa, θp1 = 19,33°, θp2 = −70,67°; τ_máx = 19,21 MPa, σ_méd = −15,00 MPa, θs = 25,67°/−64,33°.

### Família B — girar o elemento (transformação direta, Bloco 1)
- **9.16** — elemento a **60° horário** ⇒ θ = −60°. Ache σx′, σy′, τx′y′. (sem gabarito publicado; confira com σx′+σy′ = σx+σy).
- **9.68** — elemento a **30° horário** ⇒ θ = −30°, estado (230, 350, 480 MPa conforme figura). Substitua nas 3 equações. (sem gabarito publicado).

### Família C — carga combinada
- **9.36 / 9.37 / 9.38** — seção de viga com N=500/800 kN e M=40/30 kN·m (ver figura). Pede principais e τ_máx no plano em **A, B (na alma) e C (base da alma)**.
  Método: σ = N/A + M·y/I em cada ponto; τ = V·Q/(I·t); depois Bloco 2. Note como muda Q de A→B→C.
  Gab.: 9.37 (B): σ₁ = 44,1 MPa, σ₂ = 0, τ_máx = 22,1 MPa, θs = 14,4° h.; 9.38 (C): σ₁ = 54,6 MPa, σ₂ = −59,8 MPa, τ_máx = 57,2 MPa. (9.36/A sem gabarito).
- **9.49** — viga-caixão, principais em A e B. Ache V e M na seção, σ = M·y/I, τ = V·Q/(I·t), transforme.
  Gab.: A: σ₁ = 0,494 MPa, σ₂ = 0; B: σ₁ = 0, σ₂ = −0,370 MPa.
- **9.81 / 9.82** — barra retangular em balanço, força 25 kN (componentes 3-4-5 ⇒ parte axial + parte transversal). Principais em **A** (81) e **B** (82).
  Em A: combine axial (N/A) + flexão (M·y/I); cortante pode ser ≈0 na fibra extrema. Em B muda a posição ⇒ entra o cortante.
  Gab.: 9.81: σ₁ = 10,52 MPa, σ₂ = −0,165 MPa; 9.82: σ₁ = 0,560 MPa, σ₂ = −4,491 MPa.
- **9.85** — pórtico com carga distribuída 200 N/m. Pede σ e τ no ponto D **perpendicular e paralelo às fibras (fibras a 30°)**.
  Este NÃO pede principais: pede tensões num **plano inclinado de 30°** ⇒ monte o estado em D (carga combinada) e use o **Bloco 1** com θ alinhado às fibras (perpendicular às fibras = σx′; paralelo = τx′y′).
  Gab.: σ_perp = 11,0 kPa, τ = 22,6 kPa.

### Família D — Mohr / 3D
- **9.78** — só **desenhe os círculos de Mohr** de cada estado (a, b, c). Dê centro e raio. Gab.: (a) C=0,1 MPa, R=0,7 MPa; (b) C=−1 MPa, R=1 MPa.
- **9.90** — estado 3D dado ⇒ principais ordenadas + **τ_abs** (Bloco 5). Gab.: σ_máx=98,94, σ_int=88,94, σ_mín=−100,00 MPa, τ_abs=99,47 MPa.

---

## 8. Checklist de prova (erros que mais custam nota)

- [ ] Giro **horário** do elemento ⇒ θ **negativo** nas equações.
- [ ] Conferir sempre **σx′ + σy′ = σx + σy**.
- [ ] No Mohr, **ângulo do elemento × 2 = ângulo no círculo**.
- [ ] Identificar corretamente **qual** θp dá σ₁ (substituir e checar).
- [ ] Carga combinada: na **fibra extrema** τ_cortante = 0; na **LN** σ_flexão = 0. Escolha as fórmulas certas para o ponto.
- [ ] τ_máx **no plano** ≠ τ_máx **absoluto**: se σ₁ e σ₂ têm o mesmo sinal, o absoluto sai do plano (use σ₃ = 0).
- [ ] Unidades: kPa/MPa/N·m consistentes; converter mm→m com cuidado em I, Q, J.
- [ ] Sempre **desenhar o elemento orientado** quando o enunciado pede orientação.

---

### Plano de estudo sugerido (ordem)
1. Resolva **9.14 e 9.15** à mão pelas equações (Bloco 2) e **refaça por Mohr** (Bloco 4) — devem bater.
2. Faça **9.16 e 9.68** (giro puro, Bloco 1) — fixa sinal de θ.
3. Faça **9.78** (Mohr direto) e **9.90** (3D, τ_abs).
4. Ataque a carga combinada na ordem **9.81/82 → 9.49 → 9.36/37/38 → 9.85** (do mais simples ao com plano inclinado).
