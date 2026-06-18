#!/usr/bin/env bash
# ============================================================================
#  ES827 - Robótica Industrial
#  Resumo: da Cinemática Inversa ao Planejamento de Trajetória
#  Uso:  bash resumo_cinematica_trajetoria.sh
#        bash resumo_cinematica_trajetoria.sh | less -R   (para rolar)
# ============================================================================

# --- Paleta de cores (ANSI) -------------------------------------------------
B=$'\e[1m'            # negrito
D=$'\e[2m'            # fraco
I=$'\e[3m'            # itálico
U=$'\e[4m'            # sublinhado
RST=$'\e[0m'         # reset
RED=$'\e[38;5;203m'
GRN=$'\e[38;5;78m'
YEL=$'\e[38;5;221m'
BLU=$'\e[38;5;75m'
MAG=$'\e[38;5;176m'
CYN=$'\e[38;5;80m'
ORN=$'\e[38;5;215m'
GRY=$'\e[38;5;245m'
WHT=$'\e[38;5;255m'

# --- Helpers ----------------------------------------------------------------
hr()    { printf "${GRY}%s${RST}\n" "────────────────────────────────────────────────────────────────────────"; }
titulo(){ printf "\n${B}${ORN}██ %s${RST}\n" "$1"; hr; }
sub()   { printf "\n${B}${CYN}▸ %s${RST}\n" "$1"; }
eq()    { printf "    ${YEL}%s${RST}\n" "$1"; }
nota()  { printf "    ${GRY}%s${RST}\n" "$1"; }
key()   { printf "  ${GRN}•${RST} %s\n" "$1"; }

clear 2>/dev/null

# ============================================================================
cat <<EOF

${B}${WHT}╔══════════════════════════════════════════════════════════════════════╗
║   ES827 — ROBÓTICA INDUSTRIAL                                         ║
║   Da Cinemática Inversa ao Planejamento de Trajetória                 ║
╚══════════════════════════════════════════════════════════════════════╝${RST}

${GRY}Ponto onde você se perdeu: logo após a última aula de cinemática inversa
(aula 9 — cinemática inversa iterativa). Abaixo, primeiro um resumo leve do
caminho até ali, depois a explicação da parte seguinte: TRAJETÓRIA (aula 10).${RST}
EOF

# ============================================================================
titulo "PARTE 1 — RESUMO DO QUE VEIO ANTES (aulas 3 a 9)"
# ============================================================================

sub "1) Transformações homogêneas  (aula 3)"
key "Toda pose (posição + orientação) de um corpo é descrita por uma matriz 4×4:"
eq "        ⎡ R₃ₓ₃   p ⎤      R = rotação (3×3)"
eq "   T  = ⎢          ⎥      p = posição (3×1)"
eq "        ⎣  0 0 0  1 ⎦"
key "Compor movimentos = multiplicar matrizes:  T₀² = T₀¹ · T₁²"

sub "2) Graus de liberdade e convenção de Denavit–Hartenberg  (aula 4)"
key "Cada junta i é descrita por 4 parâmetros DH:  aᵢ, αᵢ, dᵢ, θᵢ"
nota "(aᵢ, αᵢ, dᵢ = geometria fixa do elo;  θᵢ ou dᵢ = a VARIÁVEL da junta)"
eq "   Tᵢ₋₁ⁱ = Rot(z,θᵢ) · Trans(z,dᵢ) · Trans(x,aᵢ) · Rot(x,αᵢ)"

sub "3) Cinemática DIRETA  (aulas 5–6)"
key "Pergunta: dados os ângulos das juntas q = (θ₁,θ₂,…), onde está a ferramenta?"
eq "   T₀ⁿ(q) = T₀¹ · T₁² · … · Tₙ₋₁ⁿ      (multiplica todas as juntas)"
key "É sempre única e fácil — basta substituir os valores das juntas."

sub "4) Jacobiano e velocidades  (aula 7)"
key "Relaciona a velocidade das juntas q̇ com a velocidade do efetuador Ẋ:"
eq "                    ${B}Ẋ = J · q̇${RST}${YEL}"
eq "   J = matriz das derivadas parciais  ∂X/∂qⱼ"
key "Configuração ${B}singular${RST}: quando det(J) = 0  →  J não tem inversa."
nota "Nessas poses o robô 'trava' uma direção, ou as juntas exigiriam"
nota "velocidade/torque infinitos. Tipos: punho, cotovelo e ombro."

sub "5) Cinemática INVERSA — analítica  (aula 8)"
key "Pergunta inversa: dada a pose desejada X, quais ângulos q produzem ela?"
eq "   X (desejado)  ──►   q = ?     (resolver  T₀ⁿ(q) = X )"
key "É o problema ${B}difícil${RST}: pode ter VÁRIAS soluções (cotovelo p/ cima ou"
key "p/ baixo), nenhuma solução, ou infinitas. Resolve-se por geometria/álgebra."

sub "6) Cinemática INVERSA ITERATIVA  (aula 9)  ${D}← última aula antes de você se perder${RST}"
key "Quando não dá para isolar q na mão, resolve-se NUMÉRICAMENTE, em passos,"
key "usando o Jacobiano (é o método de Newton aplicado à robótica):"
eq "   1. Escolha um chute inicial  q⁽⁰⁾"
eq "   2. Erro de pose:        ΔX = X_desejado − f(q⁽ᵏ⁾)   (f = cinem. direta)"
eq "   3. Correção das juntas:  Δq = J⁻¹(q⁽ᵏ⁾) · ΔX"
eq "   4. Atualiza:             q⁽ᵏ⁺¹⁾ = q⁽ᵏ⁾ + Δq"
eq "   5. Repete até  ‖ΔX‖  ser menor que uma tolerância."
nota "Ideia central: 'ande' das juntas na direção que reduz o erro de posição,"
nota "usando o Jacobiano invertido como bússola. Por isso singularidades"
nota "(det J = 0) quebram o método: J⁻¹ não existe."

# ============================================================================
titulo "PARTE 2 — A PARTE SEGUINTE: PLANEJAMENTO DE TRAJETÓRIA (aula 10)"
# ============================================================================

cat <<EOF
${WHT}A cinemática inversa responde "QUAIS juntas levam a UM ponto".
O planejamento de trajetória responde a pergunta seguinte:${RST}

   ${B}${GRN}"COMO o robô deve se mover, no tempo, de um ponto até outro?"${RST}

${GRY}Ou seja: não basta saber as juntas do ponto final — precisamos de uma
função suave q(t) que diga a posição de cada junta a CADA instante, com
velocidade e aceleração bem comportadas (sem solavancos, sem estourar
limites de motor).${RST}
EOF

sub "A) Onde isso entra no sistema do robô"
nota "Planejador de Tarefa  →  Gerador de Trajetória  →  Controlador  →  Robô"
nota "                          (é AQUI que estamos)"
key "O gerador de trajetória recebe os pontos-objetivo X*(t) e produz a"
key "referência q*(t) que o controlador vai seguir."

sub "B) Dois espaços para planejar"
printf "  ${BLU}Espaço Cartesiano${RST}: planejo o caminho do efetuador no mundo (x,y,z).\n"
nota "   Caminho previsível (ex.: reta), mas preciso resolver cinemática"
nota "   inversa a cada ponto e posso atravessar singularidades."
printf "  ${MAG}Espaço das Juntas${RST}: planejo direto cada junta qᵢ(t).\n"
nota "   Simples e seguro (sem IK em tempo real), mas o caminho do efetuador"
nota "   no espaço fica menos previsível. ${B}É o foco da aula.${RST}"

sub "C) A ponte com a aula 9 — exemplo do SCARA"
key "Antes de gerar a trajetória, usa-se a cinemática inversa ITERATIVA"
key "(aula 9) para achar as juntas de CADA ponto-objetivo. No SCARA:"
eq "   ⎧ X ⎫   ⎧ a₂cos(θ₁+θ₂) + a₁cos(θ₁) ⎫"
eq "   ⎨ Y ⎬ = ⎨ a₂sen(θ₁+θ₂) + a₁sen(θ₁) ⎬     ← cinemática direta"
eq "   ⎩ Z ⎭   ⎩        d₁ − d₃           ⎭"
nota "Constantes: a₁, a₂, d₁    |    Variáveis: θ₁, θ₂, d₃"
key "Calcula-se o Jacobiano J e sua inversa J⁻¹, e itera-se (Δq = J⁻¹·ΔX)"
key "para cada objetivo. Resultado: cada pose-objetivo vira um vetor de juntas:"
eq "   Origem  →  Posição 1  →  Posição 2  →  Origem"
eq "   θ₁: 90    76,95         78,28        90      (graus)"
eq "   θ₂:−90   −56,25       −110,92      −90"
eq "   d₃: 0.1   0.3           0.5          0.1     (m)"

sub "D) Atribuir TEMPOS aos movimentos"
key "Define-se quanto tempo cada trecho leva. Ex.:"
eq "   0s ──1s──► Pos1 ──2s──► Pos2 ──2s──► Origem      (t = 0,1,3,5 s)"
key "Agora cada junta tem pontos (tempo, valor) que precisam ser LIGADOS por"
key "uma curva suave. Ligar por retas dá velocidade descontínua (trancos) —"
key "por isso usamos POLINÔMIOS."

# ----------------------------------------------------------------------------
titulo "TRAJETÓRIAS SUAVES — as 3 ferramentas da aula 10"
# ----------------------------------------------------------------------------

sub "1) Polinômio CÚBICO (3ª ordem) — controla posição e velocidade"
key "Tenho ponto inicial (t₀,q₀) e final (t_f,q_f), e quero fixar as"
key "velocidades v₀ e v_f nas pontas (em geral 0, para parar suave)."
eq "   q(t) = a₀ + a₁t + a₂t² + a₃t³           (posição)"
eq "   q̇(t) =      a₁ + 2a₂t + 3a₃t²            (velocidade)"
nota "4 incógnitas (a₀..a₃) ⇄ 4 condições (q₀, v₀, q_f, v_f). Sistema linear:"
eq "   ⎡ 1  t₀   t₀²    t₀³  ⎤ ⎡a₀⎤   ⎡q₀⎤"
eq "   ⎢ 0   1   2t₀   3t₀²  ⎥ ⎢a₁⎥ = ⎢v₀⎥"
eq "   ⎢ 1  t_f  t_f²   t_f³ ⎥ ⎢a₂⎥   ⎢q_f⎥"
eq "   ⎣ 0   1   2t_f  3t_f² ⎦ ⎣a₃⎦   ⎣v_f⎦"
printf "  ${D}Exemplo (θ₁: 10°→45° em 1s, v=0): θ₁(t) = 10 + 105t² − 70t³${RST}\n"

sub "2) Polinômio de 5ª ordem (quíntico) — também controla a ACELERAÇÃO"
key "Quando você quer fixar posição, velocidade E aceleração nas duas pontas."
eq "   q(t) = a₀ + a₁t + a₂t² + a₃t³ + a₄t⁴ + a₅t⁵"
eq "   q̇(t) = a₁ + 2a₂t + 3a₃t² + 4a₄t³ + 5a₅t⁴"
eq "   q̈(t) = 2a₂ + 6a₃t + 12a₄t² + 20a₅t³"
nota "6 incógnitas ⇄ 6 condições (q,v,a no início + q,v,a no fim)."
printf "  ${D}Exemplo (θ₂: 10°→45° em 1s, v=a=0): θ₂(t) = 10 + 350t³ − 525t⁴ + 210t⁵${RST}\n"

sub "3) LSPB — Segmento Linear com concordância Parabólica"
key "Perfil de velocidade ${B}TRAPEZOIDAL${RST}: acelera, cruzeiro a velocidade"
key "constante, desacelera. Ideal quando se quer velocidade constante no meio."
eq "          ⎧ q₀ + (α/2)·t²                    , 0 ≤ t ≤ t_b      (parábola: rampa de v)"
eq "   q(t) = ⎨ (q₀−q_f+V·t_f)/2 + V·t           , t_b ≤ t ≤ t_f−t_b (reta: v constante)"
eq "          ⎩ q_f − (α·t_f²)/2 − (α/2)·t²      , t_f−t_b < t ≤ t_f (parábola: freia)"
nota "α = aceleração nas pontas   V = velocidade de cruzeiro   t_b = tempo de mistura"
nota "Posição em S, velocidade trapézio, aceleração em degraus (+α, 0, −α)."

# ----------------------------------------------------------------------------
titulo "RESUMÃO — qual usar?"
# ----------------------------------------------------------------------------
printf "  ${BLU}Cúbico (3ª)${RST}   → fixa posição e velocidade nas pontas. Mais simples.\n"
printf "  ${MAG}Quíntico (5ª)${RST} → fixa também a aceleração → movimento mais suave.\n"
printf "  ${GRN}LSPB${RST}          → velocidade constante no meio (perfil trapezoidal).\n"
echo
printf "${GRY}Fluxo completo da aula 10:\n"
printf "  pontos no espaço  ─►  [cinem. inversa iterativa, aula 9]  ─►  juntas q de cada ponto\n"
printf "  ─►  atribui tempos  ─►  [polinômio cúbico / quíntico / LSPB]  ─►  q(t) suave  ✔${RST}\n"
echo
printf "${D}Próximas aulas: incertezas (11), dinâmica (12–13), controle linear (14).${RST}\n\n"
