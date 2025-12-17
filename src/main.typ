#import "template/template.typ": *
#import "utils.typ": *
#import "components/definitionStructure.typ": *
#import "components/proofStructure.typ": *
#import "components/statementsStructure.typ": *

#show: it => basic-report(
  doc-category: "Lenguajes Formales y Computabilidad | FAMAF - UNC",
  doc-title: "Combos de Definiciones, Convenciones Notacionales y Teoremas",
  author: "Ramiro Lugo Viola",
  heading-color: black,
  compact-mode: false,
  show-date: true,
  format-date: "[year]",
  it,
)

#show link: underline
#show: add_shorthands


= #smallcaps[Definiciones y Convenciones Notacionales]

#combo_title(1)

#definitionStructure(
  1,
  [Defina cuando un *conjunto $S c= #omega_sigma_n_m$* es llamado *#sigmaa.recursivo*.],
  note: [no hace falta que defina "función #sigmaa.recursiva".],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#conjuntos-sigma-recursivos",
  [
    Un conjunto $S c= #omega_sigma_n_m$ es llamado *#sigmaa.recursivo* cuando la función $chi_S^(#omega_sigma_n_m)$ sea *#sigmaa.recursiva*.
  ],
)

#definitionStructure(
  2,
  [Defina $<< s_1, s_2, dots >>$.],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/2.2-codificacion-de-infinituplas-de-numeros",
  [
    Dada una infinitupla $(s_1, s_2, dots) in omega^(#text_floor($NN$))$, usamos *$<< s_1, s_2, dots >>$* para denotar al número $product_(i=1)^(infinity) "pr"(i)^(s_i)$ #footnote[Donde $"pr(i)"$ es la función que retorna el i-ésimo primo.]
  ],
)

#definitionStructure(
  3,
  [Defina "$f$ es una función #sigmaa.mixta".],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/1.10-funciones-y-conjuntos-sigma-mixtos#definicion-de-funcion-sigma-mixta",
  [
    Sea $Sigma$ un alfabeto finito. Dada una función $f$, diremos que *$f$ es una función #sigmaa.mixta* si cumple las siguientes propiedades:
    - Existen $n, m >= 0$ tales que $D_f c= #omega_sigma_n_m$
    - Además $I_f c= omega$ o $I_f c= #sigmaa.est$
  ],
)

#definitionStructure(
  4,
  [Defina "familia #sigmaa.indexada de funciones".],
  //   link_apunte: "recursion-primitiva-sobre-variable-alfabetica-con-valores-numericos",
  [
    Dado un alfabeto $Sigma$, una *familia #sigmaa.indexada de funciones* será una función $~G~$ tal que $D_(~G~) = Sigma$ y para cada $a in D_(~G~)$ se tiene que $~G~(a)$ es una función. \
    Notar que para cada $a in Sigma$ escribimos $~G~_a$ para denotar a la función $~G~(a)$.
  ],
)

#definitionStructure(
  5,
  [Defina $R(f, ~G~)$.],
  note: [haga el caso de valores numéricos.],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#recursion-primitiva-sobre-variable-alfabetica-con-valores-numericos",
  [
    Supongamos $Sigma$ un alfabeto finito. Sea
    $ f: #bloque_fijo -> omega $
    con $#conjuntos_omega c= omega$ y $#conjuntos_sigma c= #sigmaa.est$ conjuntos no vacíos y $~G~$ una familia #sigmaa.indexada de funciones tal que
    $ ~G~_a : omega X #bloque_fijo X #sigmaa.est -> omega "para cada " a in Sigma $
    Definamos *$R(f, ~G~)$*$: #bloque_fijo X #sigmaa.est -> omega$
    de la siguiente manera

    - $R(f, ~G~)(arrow(x), arrow(alpha), epsilon) = f(arrow(x), arrow(alpha))$
    - $R(f, ~G~)(arrow(x), arrow(alpha), alpha a) = ~G~_a (med R(f, ~G~)(arrow(x), arrow(alpha), alpha), med arrow(x), arrow(alpha), med alpha)$

    Diremos que $R(f, ~G~)$ es obtenida por _recursión primitiva_ a partir de $f$ y $~G~$.
  ],
)

#pagebreak()

#page(margin: (bottom: 0.75cm))[
  #combo_title(2)

  #definitionStructure(
    1,
    [Defina $d |-n d'$ y $d |-* d'$],
    note: [ no hace falta que defina $|-$],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.1-el-paradigma-de-turing#la-relacion-vdash",
    [
      Para $d,d' in bold("Des")$ y $n >= 0$, escribimos *$d |-n d'$* si existen $d_1,dots, d_(n+1) in bold("Des")$ tales que
      $
        & d = d_1 \
        & d' = d_(n+1) \
        & d_i |- d_(i+1), med "para " i=1,dots,n
      $
      Luego definimos *$d |-* d'$* si y solo si $(exists n in omega) d |-n d'$.
    ],
  )

  #definitionStructure(
    2,
    [Defina $L(M)$],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.1-el-paradigma-de-turing#el-lenguaje-lm",
    [
      Sea $M$ una máquina de Turing. \ Diremos que una palabra $alpha in #sigmaa.est$ _es aceptada por $M$ por alcance de estado final_ cuando
      $ #text_floor($q_0B alpha$) |-* d, med "con" med d "tal que" "St"(d) in F. $
      El *lenguaje aceptado por $M$ por alcance de estado final* se define de la siguiente manera:
      $
        L(M) = {alpha in #sigmaa.est : alpha " es aceptada por "M" por alcance de estado final"}
      $
    ],
  )

  #definitionStructure(
    3,
    [Defina "$f$ es una función de tipo (n, m, s)".],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/1.10-funciones-y-conjuntos-sigma-mixtos#el-tipo-de-una-funcion-mixta",
    [
      Dada una función #sigmaa.mixta $f$ con $n,m in omega$ tales que $D_f c= #omega_sigma_n_m$ y además $I_f c= omega$, entonces diremos que *$f$ es una función de tipo $(n, m, \#)$*.\ Si en cambio $I_f c= #sigmaa.est$, entonces diremos que *$f$ es una función de tipo $(n, m, *)$*.
    ],
  )

  #definitionStructure(
    4,
    [Defina $(x)$],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/2.2-codificacion-de-infinituplas-de-numeros",
    [
      Dado $x in NN$, usaremos *$(x)$* para denotar a la única infinitupla $(s_1, s_2, dots) in omega^(#text_floor($NN$))$ tal que
      $
        x = << s_1, s_2, dots >> = product_(i=1)^(infinity) "pr"(i)^(s_i) quad "donde " "pr"(i)" es el i-ésimo primo."
      $
    ],
  )

  #definitionStructure(
    5,
    [Defina $(x)_i$],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/2.2-codificacion-de-infinituplas-de-numeros",
    [
      Para $i in NN$, usaremos *$(x)_i$* para denotar al i-ésimo elemento de la infinitupla $(x)$, es decir, al $s_i$ de la definición anterior. \
      - $(x)_i$ es el exponente de $"pr"(i)$ en la (única posible) factorización de x como producto de primos.
        #footnote[
          Se le suele llamar la "bajada i-ésima de x" al número $(x)_i$. \ (Ya que representa bajar al exponente de $"pr"(i)$ en la única factorización de $x$ como producto de primos)
        ]
    ],
  )
]

#pagebreak()

#combo_title(3)

#definitionStructure(
  1,
  [Defina cuando un conjunto $S c= #omega_sigma_n_m$ es llamado *#sigmaa.recursivamente.enumerable*.],
  note: [no hace falta que defina "función #sigmaa.recursiva".],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#conjuntos-sigma-recursivamente-enumerables",
  [
    Un conjunto $S c= #omega_sigma_n_m$ será llamado *#sigmaa.recursivamente.enumerable* cuando sea vacío o haya una función $F: omega -> #omega_sigma_n_m$ tal que $I_F = S$ y $F_((i))$ sea #sigmaa.recursiva, para cada $i in {1,dots,n+m}$.
    #footnote()[\
      Dados $k,l,n,m in omega$ y $F: D_F c= omega^k X #sigmaa.est^l -> #omega_sigma_n_m$ con $n+m>=1$. Entonces denotaremos con $F_((i))$ a la función $p_i^(n,m) compose F$. \
      #box(width: 100%, inset: (top: 3pt, bottom: 3pt))[
        - $F_((i)): D_F c= omega^k X #sigmaa.est^l -> omega med med$ para $i=1,dots,n$ .
        - $F_((i)): D_F c= omega^k X #sigmaa.est^l -> #sigmaa.est$ para $i=n+1,dots,n+m$ .
      ]
      por lo tanto son #sigmaa.mixtas y $F = [F_((1)),dots,F_((n+m))]$.
    ]
  ],
)

#definitionStructure(
  2,
  [Defina $s<$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/2.1-ordenes-naturales-sobre-sigmaast#el-caso-general",
  [
    Sea $Sigma = {a_1,dots,a_n}$ un alfabeto no vacío, con $<=$ un orden total sobre $Sigma$ dado por $a_1 < a_2 < dots < a_n$.
    Definimos la función $s< : #sigmaa.est -> #sigmaa.est$ de la siguiente manera
    $
      & s<((a_n)^m) = (a_1)^(m+1) quad " para cada" m>=0 \
      & s<(alpha a_i (a_n)^m) = alpha a_(i+1) (a_1)^m quad " cada vez que" alpha in #sigmaa.est," con " 1<=i<n " y " m>=0
    $
  ],
)

#definitionStructure(
  3,
  [Defina $*<$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/2.1-ordenes-naturales-sobre-sigmaast#el-caso-general",
  [
    Sea $Sigma = {a_1,dots,a_n}$ un alfabeto no vacío, con $<=$ un orden total sobre $Sigma$ dado por $a_1 < a_2 < dots < a_n$.
    Definimos la función $*< : omega -> #sigmaa.est$ de la siguiente manera
    $
      & *<(0) = epsilon \
      & *<(i+1) = s<(*<(i)) quad #comentario[
          (donde $s<$ es la función definida justo antes)
        ]
    $
  ],
)

#definitionStructure(
  4,
  [Defina $\#<$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/2.1-ordenes-naturales-sobre-sigmaast#el-caso-general",
  [
    _Lema_ : Sea $Sigma = {a_1,dots,a_n}$ un alfabeto no vacío, con $<=$ un orden total sobre $Sigma$ dado por $a_1 < a_2 < dots < a_n$. \
    Entonces para cada $alpha in #sigmaa.est - {epsilon}$ hay únicos $k in omega$ y $i_0, i_1, dots, i_k in {1,dots,n}$ tales que *$alpha = a_(i_k) dots a_(i_0)$*. \

    Sea $Sigma = {a_1,dots,a_n}$ un alfabeto no vacío, con $<=$ un orden total sobre $Sigma$ dado por $a_1 < a_2 < dots < a_n$. \
    Gracias al _Lema_ anterior podemos definir la función $\#< : #sigmaa.est -> omega$ de la siguiente manera
    $
      & \#<(epsilon) = 0 \
      & \#<(a_(i_k) dots a_(i_0)) = i_k n^k + dots + i_0 n^0 quad " para " i_0, i_1, dots, i_k in {1,dots,n} \
      \
      & #comentario[
          $\#<(alpha) = i_k n^k + dots + i_0 n^0 "con" alpha = a_(i_k) dots a_(i_0) "tal que" k in omega med "y" med i_0, i_1, dots, i_k in {1,dots,n}$
        ]
    $
  ],
)

#pagebreak()

#combo_title(4)

#definitionStructure(
  1,
  [
    Defina cuando una función $f: D_f c= #omega_sigma_n_m -> omega$ es llamada #sigmaa.efectivamente.computable y defina "el procedimiento $PP$ computa a la función $f$".],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/3.1-funciones-sigma-efectivamente-computables",
  [
    Una función $f: D_f c= #omega_sigma_n_m -> omega$ es llamada *#sigmaa.efectivamente.computable* si hay un procedimiento efectivo $PP$ tal que
    #{
      set enum(numbering: "(1)", indent: 12.8pt)
      [
        + El conjunto de datos de entrada de $PP$ es #omega_sigma_n_m.
        + El conjunto de datos de salida está contenido en $omega$.
        + Si $(arrow(x), arrow(alpha)) in D_f$, entonces $PP$ se detiene partiendo de $(arrow(x), arrow(alpha))$, dando como dato de salida $f(arrow(x), arrow(alpha))$.
        + Si $(arrow(x), arrow(alpha)) in (#omega_sigma_n_m) - D_f$, entonces $PP$ no se detiene partiendo de $(arrow(x), arrow(alpha))$.
      ]
    }
    Cuando $PP$ cumpla los items anteriores diremos que "*el procedimiento $PP$ computa a la función $f$*".
  ],
)

#combo_title(5)

#definitionStructure(
  1,
  [
    Defina cuando un conjunto $S c= #omega_sigma_n_m$ es llamado #sigmaa.efectivamente.computable y defina \ "el procedimiento efectivo $PP$ decide la pertenencia a $S$".],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/3.2-conjuntos-sigma-efectivamente-computables",
  [
    Un conjunto $S c= #omega_sigma_n_m$ será llamado *#sigmaa.efectivamente.computable* cuando la función característica $chi_S^(#omega_sigma_n_m)$ sea #sigmaa.efectivamente.computable.

    Si $PP$ es un procedimiento efectivo el cual computa a la función $chi_S^(#omega_sigma_n_m)$,
    diremos que "*el procedimiento efectivo $PP$ decide la pertenencia a $S$*", con respecto al conjunto #omega_sigma_n_m . Es decir
    - El conjunto de datos de entrada de $PP$ es #omega_sigma_n_m, siempre termina y da como dato de salida un elemento de ${0,1}$.
    - Dado $(arrow(x), arrow(alpha)) in #omega_sigma_n_m$, $PP$ da como salida el número $1$ si $(arrow(x), arrow(alpha)) in S$ y al número $0$ si $(arrow(x), arrow(alpha)) in.not S$.
  ],
)

#combo_title(6)

#definitionStructure(
  1,
  [
    Defina cuando un conjunto $S c= #omega_sigma_n_m$ es llamado #sigmaa.efectivamente.enumerable y defina \ "el procedimiento efectivo $PP$ enumera a $S$".],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/3.3-conjuntos-sigma-efectivamente-enumerables",
  [
    #text(size: 10.7107pt)[
      Un conjunto $S c= #omega_sigma_n_m$ será llamado *#sigmaa.efectivamente.enumerable* cuando sea vacío o haya una función $F: omega -> #omega_sigma_n_m$ tal que $I_F = S$ y $F_((i))$ sea #sigmaa.efectivamente.computable, para cada $i in {1,dots,n+m}$.
    ]

    Diremos que "*el procedimiento efectivo $PP$ enumera a $S$*" cuando
    #{
      set enum(numbering: "(1)", indent: 12.8pt)
      [
        + El conjunto de datos de entrada de $PP$ es $omega$.
        + $PP$ se detiene para cada $x in omega$.
        + El conjunto de datos de salida de $PP$ es igual a S.\
          (Es decir, siempre que $PP$ se detiene, da como salida un elemento de S, y para cada elemento $(arrow(x), arrow(alpha)) in S$, hay un $x in omega$ tal que $PP$ da como salida a $(arrow(x), arrow(alpha))$ cuando lo corremos con $x$ como dato de entrada).
      ]
    }

  ],
)

En los combos 4, 5 y 6 usamos la *definición de procedimiento efectivo* que está en #link(<procedimiento-efectivo>)[definiciones auxiliares].

#pagebreak()

#page(margin: (bottom: 0.55cm))[

  #combo_title(7)

  #definitionStructure(
    1,
    [
      Defina cuando una función $f: D_f c= #omega_sigma_n_m -> omega$ es llamada #sigmaa.turing.computable y defina \ "la máquina de Turing $M$ computa a la función $f$".],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.1-el-paradigma-de-turing.html#definicion%20de%20maquina%20de%20Turing%20con%20unit",
    [
      Diremos que una función $f: D_f c= #omega_sigma_n_m -> omega$ es *#sigmaa.turing.computable* si existe una máquina de Turing con unit, $M = (Q, Sigma, Gamma, delta, q_0, B, unit, F)$ tal que
      #block(above: 11pt, below: 11pt)[
        #set enum(numbering: "(1)", indent: 12pt, spacing: 12pt)
        + Si $(arrow(x), arrow(alpha)) in D_f$, entonces hay un $p in Q$ tal que \
          #box(width: 100%)[
            $
              #v(16pt) #text_floor([$ q_0 B med unit^(x_1) B dots B med unit^(x_n) B alpha_1 B dots B alpha_m $])
              |-*
              #text_floor([$p B med unit^(f(arrow(x), arrow(alpha)))$])
            $
          ]
          y #text_floor([$p B med unit^(f(arrow(x), arrow(alpha)))$]) $!|- d$, para cada $d in "Des"$.
        + Si $(arrow(x), arrow(alpha)) in #omega_sigma_n_m - D_f$, entonces $M$ *no* se detiene partiendo de \
          #box(width: 100%)[
            $
              #v(16pt) #text_floor([$ q_0 B med unit^(x_1) B dots B med unit^(x_n) B alpha_1 B dots B alpha_m $])
            $
          ]
      ]

      Si $M$ y $f$ cumplen los items (1) y (2), diremos que *"la máquina de Turing $M$ computa a la función $f$"*.
    ],
  )

  #combo_title(8)

  #definitionStructure(
    1,
    [Defina $M(P)$],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#minimizacion-y-funciones-sigma-recursivas",
    [
      #show math.equation.where(block: true): set block(below: 1em, above: 1.2em)
      Sea $Sigma$ un alfabeto finito y sea $P: D_P c= omega X #omega_sigma_n_m -> omega$
      un predicado. Dado $(x->, alpha->) in #omega_sigma_n_m$, cuando exista al menos un $t in omega$ tal que $P(t, x->, alpha->) = 1$, usaremos #h(1.8cm)$min_t P(t, x->, alpha->)$ \
      para denotar al menor de tales $t's$. #comentario[Esta expresión está definida solo para aquellas $(n+m)$-uplas $(x->, alpha->)$ para las cuales existe al menos un $t in omega$ tal que se da $P(t, x->, alpha->) = 1$ (obviamente también $(t, x->, alpha->) in D_P$).]
      Ahora sí, definamos
      #show math.equation.where(block: true): set block(below: 0.2em, above: 0.8em)
      *$ M(P) = lambda x->alpha-> [ min_t P(t, x->, alpha->) ] $*
      Es decir que
      #show math.equation.where(block: true): set block(below: 0em, above: 0.4em)
      $
                  D_(M(P)) & = {
                               (x->, alpha->) in #omega_sigma_n_m : (exists t in omega) P(t, x->, alpha->) = 1
                             } \
        M(P)(x->, alpha->) & = min_t P(t, x->, alpha->), quad "para cada" quad (x->, alpha->) in D_(M(P))
      $
      // Diremos que _$M(P)$ se obtiene por minimización de variable numérica a partir de $P$_.
    ],
  )

  #definitionStructure(
    2,
    [Defina _Lt_],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/2.2-codificacion-de-infinituplas-de-numeros",
    [
      #box(inset: (top: -10.1pt, bottom: 8pt))[
        La función _Lt_ $:NN -> omega$ se define de la siguiente manera
        #box(inset: (bottom: -10.1pt))[
          $
            italic("Lt")(x) = cases(
              max_i (x)_i != 0 quad "si" x!=1,
              0 #h(2.1cm) quad "si" x=1
            )
          $
        ]
      ]
    ],
  )

  #definitionStructure(
    3,
    [Defina Conjunto rectangular],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/1.10-funciones-y-conjuntos-sigma-mixtos#conjuntos-rectangulares",
    [
      Un conjunto #sigmaa.mixto *$S$* será llamado *rectangular* si es de la forma $quad #bloque_fijo$ \
      con $S_1, dots, S_n c= omega$ y $L_1, dots, L_m c= #sigmaa.est$.
    ],
  )

  #definitionStructure(
    4,
    [Defina "$S$ es un conjunto de tipo $(n, m)$"],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/1.10-funciones-y-conjuntos-sigma-mixtos#el-tipo-de-un-conjunto-mixto",
    [
      Dado un conjunto #sigmaa.mixto $S$, si $n,m in omega$ son tales que $S c= #omega_sigma_n_m$, entonces diremos que *$S$ es un conjunto de tipo $(n, m)$*.
      #footnote[Si $S != emptyset$, entonces hay un único par $(n,m)$ con esa propiedad. $quad$ Pero si $S = emptyset$, entonces hay varios pares $(n,m)$ con esa propiedad. \ Por ello para hablar de *EL TIPO DE S* tiene que ser $S != emptyset$.]
    ],
  )
]

#pagebreak()

#combo_title(9)

#definitionStructure(
  1,
  [Defina "$I$ es una instrucción de #SSigma"],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#sintaxis-de-mathcalssigma",
  [
    Una *instrucción de #SSigma* es ya sea una instrucción básica de #SSigma, o una instrucción de la forma $alpha I$, donde $alpha in {L overline(n): n in NN}$ e $I$ es una instrucción básica de #SSigma. \
    (Usamos #InsSigma para denotar al conjunto de todas las instrucciones de #SSigma).
  ],
)

#definitionStructure(
  2,
  [Defina "$~P~$ es programa de #SSigma"],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#sintaxis-de-mathcalssigma",
  [
    Un *programa de #SSigma* es una palabra de la forma
    $
      I_1 I_2 dots I_n
    $
    donde $n >= 1$, $I_1, dots, I_n in #InsSigma$ y además cumple la siguiente propiedad llamada _ley de los GOTO_
    #align(center)[
      #par(justify: true)[
        _Para cada $i in {1,dots,n}$, si $"GOTO"L overline(m)$ es tramo final de $I_i$, \ entonces existe $j in {1,dots,n}$ tal que $I_j$ tiene label $L overline(m)$._
      ]
    ]
    (Usamos #ProSigma para denotar al conjunto de todos los programas de #SSigma).
  ],
)

#definitionStructure(
  [3 y 4],
  [Defina $I_i^(~P~)$ y $n(~P~)$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#sintaxis-de-mathcalssigma",
  [
    _Lema_ :
    #enum(indent: 10pt, numbering: "(a)")[
      Si $I_1, dots I_n = J_1, dots, J_m$ con $I_1, dots, I_n, J_1, dots, J_m in #InsSigma$, entonces $n = m$ y $I_i = J_i$ para cada $i >= 1$.
    ][
      Si $~P~ in #ProSigma$, entonces existe una única sucesión de instrucciones $I_1, dots, I_n$ tal que $~P~ = I_1 I_2 dots I_n$.
    ]
    Gracias al _Lema_ anterior y dados $i in omega$ y $~P~ in #ProSigma$, tenemos unicamente determinados $n(~P~) in NN$ e $I_1^(~P~), dots, I_(n(~P~))^(~P~) in #InsSigma$ tales que $~P~ = I_1^(~P~) dots I_(n(~P~))^(~P~)$ y definimos $I_i^(~P~) = epsilon$ cuando $i=0 med$ o $med i > n(~P~)$.
  ],
)

#definitionStructure(
  5,
  [Defina la función _Bas_],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#sintaxis-de-mathcalssigma",
  [
    La función _Bas_ $: #InsSigma -> (Sigma union Sigma_p)^*$ se define de la siguiente manera \
    $
      italic("Bas")(I) & = cases(
                           J quad "si" I "es de la forma" L overline(k) J", con" k in NN med "y" med J in #InsSigma,
                           I quad "caso contrario"
                         )
    $
  ],
)

#pagebreak()

#page(margin: (bottom: 21pt))[

  #combo_title(10)

  #definitionStructure(
    1,
    [Defina relativo al lenguaje #SSigma, "estado"],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#semantica-de-mathcalssigma",
    [
      Un *estado* es un par #box(inset: (left: 0.7cm, right: 0.7cm))[
        $(s->, sigma->) = ((s_1, s_2, dots),(sigma_1, sigma_2, dots)) in omega^(#text_floor($NN$)) X #sigmaa.est^(#text_floor($NN$))$
      ] \
      #comentario[
        Si $i>=1$, entonces diremos que $s_i$ es el contenido o valor de la variable $N overline(i)$ en el estado $(s->, sigma->)$ y $sigma_i$ es el contenido o valor de la variable $P overline(i)$ en el estado $(s->, sigma->)$.
      ]
    ],
  )

  #definitionStructure(
    2,
    [Defina relativo al lenguaje #SSigma, "descripción instantánea"],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#semantica-de-mathcalssigma",
    [
      Una *descripción instantánea* es una terna $(i , s->, sigma->)$ tal que $(s->, sigma->)$ es un estado e $i in omega$. \
      #comentario[(Es decir que el $omega X omega^#text_floor($NN$) X #sigmaa.est^(#text_floor($NN$))$ es el conjunto formado por todas las descripciones instantáneas)]
    ],
  )

  #definitionStructure(
    3,
    [Defina relativo al lenguaje #SSigma la función $S_(~P~)$],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#semantica-de-mathcalssigma",
    [
      #let SP = $S_(~P~)$
      #let SP_fun = $S_(~P~)(i, s->, sigma->)$
      #let Bas_fun = $"Bas"(I_i^(~P~))$
      #let N_k = $N overline(k)$
      #let N_n = $N overline(n)$
      #let P_k = $P overline(k)$
      #let P_n = $P overline(n)$
      #let L_m = $L overline(m)$
      #let menos_letra = text(size: 8pt, baseline: -4pt, weight: "bold")[↷]
      #set list(spacing: 13pt)
      Dado un programa $~P~ in #ProSigma$, definimos $quad quad #SP : omega X omega^(#text_floor($NN$)) X #sigmaa.est^(#text_floor($NN$)) -> omega X omega^(#text_floor($NN$)) X #sigmaa.est^(#text_floor($NN$)) quad quad$ tal que
      #show math.equation.where(block: true): set block(below: 1em, above: 1em)
      #show math.equation.where(block: true): set par(leading: 1pt)
      $
        #SP (i, s->, sigma->) & = "descripción instantánea que resulta luego de " \
                              & quad med "realizar"^""^#footnote[
                                  El verbo "realizar" una actividad es realizarla si se puede.
                                ]" " I_i^(~P~), "estando en el estado" (s->, sigma->)
      $
      Para definirla formalmente damos los siguientes casos \
      Cuando *$i in {1,dots,n(~P~)}$* entonces
      #block(above: 12.8pt, below: 13pt, width: 100%)[
        - Caso #box(width: 125pt)[$#Bas_fun = #N_k <- #N_k #menos_punto 1$]. Entonces $#SP_fun = (i+1, (s_1, dots, s_(k-1),s_k #menos_punto 1,s_(k+1), dots), sigma->)$
        - Caso #box(width: 125pt)[$#Bas_fun = #N_k <- #N_k + 1$]. Entonces $#SP_fun = (i+1, (s_1, dots, s_(k-1),s_k + 1,s_(k+1), dots), sigma->)$
        - Caso #box(width: 125pt)[$#Bas_fun = #N_k <- #N_n$]. Entonces $#SP_fun = (i+1, (s_1, dots, s_(k-1),s_n ,s_(k+1), dots), sigma->)$
        - Caso #box(width: 125pt)[$#Bas_fun = #N_k <- 0$]. Entonces $#SP_fun = (i+1, (s_1, dots, s_(k-1),0,s_(k+1), dots), sigma->)$
        - Caso $#Bas_fun = "IF" #N_k != 0 "GOTO" #L_m$. $med$ Sea $s_k$ el valor de #N_k en $(s->, sigma->)$, entonces
        #block(above: 10pt, below: 12pt, width: 100%)[
          $
            #SP_fun = cases(
              (min{l: I_l^(~P~) "tiene label" #L_m}, s->, sigma->) quad "si" s_k != 0,
              (i+1, s->, sigma->) #h(3.85cm) quad "si" s_k = 0,
            )
          $
        ]
        - Caso #box(width: 125pt)[$#Bas_fun = #P_k <- #menos_letra #P_k$]. Entonces $#SP_fun = (i+1, s->, (sigma_1, dots, sigma_(k-1), #menos_letra sigma_k, sigma_(k+1), dots))$
        - Caso #box(width: 125pt)[$#Bas_fun = #P_k <- #P_k."a"$]. Entonces $#SP_fun = (i+1, s->, (sigma_1, dots, sigma_(k-1), sigma_k a, sigma_(k+1), dots))$
        - Caso #box(width: 125pt)[$#Bas_fun = #P_k <- #P_n$]. Entonces $#SP_fun = (i+1, s->, (sigma_1, dots, sigma_(k-1), sigma_n, sigma_(k+1), dots))$
        - Caso #box(width: 125pt)[$#Bas_fun = #P_k <- epsilon$]. Entonces $#SP_fun = (i+1, s->, (sigma_1, dots, sigma_(k-1), epsilon, sigma_(k+1), dots))$
        - Caso $#Bas_fun = "IF" #P_k "BEGINS a GOTO" #L_m$. $med$ Sea $sigma_k$ el valor de #P_k en $(s->, sigma->)$, entonces
        #block(above: 10pt, below: 12pt, width: 100%)[
          $
            #SP_fun = cases(
              (min{l: I_l^(~P~) "tiene label" #L_m}, s->, sigma->) quad "si" sigma_k "comienza con a",
              (i+1, s->, sigma->) #h(3.85cm) quad "si" sigma_k bold("no")" comienza con a",
            )
          $]
        - Caso #box(width: 125pt)[$#Bas_fun = "GOTO" #L_m$]. Entonces $#SP_fun = (min{l: I_l^(~P~) "tiene label" #L_m}, s->, sigma->)$
        - Caso #box(width: 125pt)[$#Bas_fun = "SKIP"$]. Entonces $#SP_fun = (i+1, s->, sigma->)$
      ]
      Pero cuando *$i in.not {1,dots,n(~P~)}$* simplemente, $#SP (i, s->, sigma->) = (i, s->, sigma->)$.
    ],
  )
]

#definitionStructure(
  4,
  [Defina relativo al lenguaje #SSigma, "estado obtenido luego de $t$ pasos, partiendo del estado $(s->, sigma->)$"],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#la-computacion-partiendo-de-un-estado",
  [
    Diremos que
    #block(above: 0pt, below: 12pt, width: 100%)[
      $
        overbrace(#block[$S_(~P~)(dots S_(~P~)( S_(~P~) ($], "t veces") 1,s->, sigma->)) dots) = (j, u->, eta->)
      $]
    es la descripción instantánea obtenida luego de $t$ pasos, partiendo del estado $(s->, sigma->)$ y \ *$(u->, eta->)$ es el estado obtenido luego de $t$ pasos, partiendo del estado $(s->, sigma->)$.*
  ],
)

#definitionStructure(
  5,
  [Defina relativo al lenguaje #SSigma, "$~P~$ se detiene (luego de $t$ pasos), partiendo del estado $(s->, sigma->)$"],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#definicion-matematica-de-detencion",
  [
    Cuando la primera coordenada de
    #block(above: 0pt, below: 12pt, width: 100%)[
      $
        overbrace(#block[$S_(~P~)(dots S_(~P~)( S_(~P~) ($], "t veces") 1,s->, sigma->)) dots)
      $]
    sea igual a $n(~P~) + 1$ diremos que *$~P~$ se detiene (luego de $t$ pasos), partiendo del estado $(s->, sigma->)$*.
  ],
)

#pagebreak()

#combo_title(11)

#definitionStructure(
  1,
  [Defina #horquilla_n_m_num],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#funciones-sigma-computables",
  [
    Dados $x_1, dots, x_n in omega$ y $sigma_1, dots, sigma_m in #sigmaa.est$, usaremos $||x_1,dots,x_n,sigma_1,dots,sigma_m||$ para denotar el estado $((x_1,dots,x_n,0,dots),(sigma_1,dots,sigma_m,epsilon, dots))$. \
    Ahora sí, dado $~P~ in #ProSigma$, definamos para cada par $n,m in omega$, la función #horquilla_n_m_num de la siguiente manera
    #show math.equation.where(block: true): set par(leading: 0em)
    $
                   D_#horquilla_n_m_num & = {
                                          (x->, alpha->) in #omega_sigma_n_m : ~P~ "termina," \
                                        & quad quad "partiendo del estado" ||x_1,dots,x_n,sigma_1,dots,sigma_m||
                                          } \
                      #box(height: 9pt) \
      #horquilla_n_m_num (x->, alpha->) & = "valor de N1 en el estado obtenido cuando" ~P~ "termina," \
                                        & quad med "partiendo de" ||x_1,dots,x_n,sigma_1,dots,sigma_m||
    $
  ],
)

#definitionStructure(
  2,
  [Defina "$f$ es #sigmaa.computable"],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#funciones-sigma-computables",
  [
    Una función #sigmaa.mixta $f: D_f c= #omega_sigma_n_m -> bold(omega)$ es llamada *#sigmaa.computable* si hay un programa $~P~$ de #SSigma tal que $f = #horquilla_n_m_num$. \
    Análogamente una función #sigmaa.mixta $f: D_f c= #omega_sigma_n_m -> bold(#sigmaa.est)$ es llamada *#sigmaa.computable* si hay un programa $~P~$ de #SSigma tal que $f = #horquilla_n_m_est$.
  ],
)

#definitionStructure(
  3,
  [Defina "$~P~$ computa a $f$"],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#funciones-sigma-computables",
  [
    Sea $~P~$ un programa de #SSigma. \
    Dada una función #sigmaa.mixta $f: D_f c= #omega_sigma_n_m -> bold(omega)$ diremos que *$~P~$ computa $f$* si $f = #horquilla_n_m_num$. \
    Análogamente, si $f: D_f c= #omega_sigma_n_m -> bold(#sigmaa.est)$, también diremos que *$~P~$ computa a $f$* si $f = #horquilla_n_m_est$.
  ],
)

#definitionStructure(
  4,
  [Defina $M<(P)$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#minimizacion-de-variable-alfabetica",
  [
    #show math.equation.where(block: true): set block(below: 1em, above: 1.3em)
    Sea $Sigma$ un alfabeto no vacío, $<=$ un orden total sobre $Sigma$ #footnote([Recordar que $<=$ puede ser naturalmente extendido a un orden total sobre #sigmaa.est #link_arrow("https://apunte-lenguajes-logica.netlify.app/2.1-ordenes-naturales-sobre-sigmaast#extension-del-orden-total-de-sigma-a-sigmaast")]) y $P: D_P c= #omega_sigma_n_m X #sigmaa.est -> omega$ un predicado. \ Dado $(x->, alpha->) in #omega_sigma_n_m$, cuando exista al menos un $alpha in #sigmaa.est$ tal que $P(x->, alpha->, alpha) = 1$, usaremos
    $
      min_alpha P(x->, alpha->, alpha)
    $
    para denotar al menor de tales $alpha's$. #comentario[Esta expresión está definida solo para aquellas $(n+m)$-uplas $(x->, alpha->)$ para las cuales existe al menos un $alpha in #sigmaa.est$ tal que se da $P(x->, alpha->, alpha) = 1$ (obviamente también $(x->, alpha->, alpha) in D_p$).] \
    #show math.equation.where(block: true): set block(below: 1em, above: 1em)
    Ahora sí, definamos
    #align(center)[
      *$M<(P)$* $= lambda x->alpha-> [ min_alpha P(x->, alpha->, alpha) ]$
    ]
    Es decir que
    $
                D_(M<(P)) & = {
                              (x->, alpha->) in #omega_sigma_n_m : (exists alpha in #sigmaa.est) P(x->, alpha->, alpha) = 1
                            } \
      M<(P)(x->, alpha->) & = min_alpha P(x->, alpha->, alpha), quad "para cada" quad (x->, alpha->) in D_(M<(P))
    $
    // Diremos que _$M<(P)$ se obtiene por minimización de variable alfabética a partir de $P$_.
  ],
)

#pagebreak()

#combo_title(12)

#definitionStructure(
  1,
  [Defina cuando un conjunto $S c= #omega_sigma_n_m$ es llamado #sigmaa.computable.],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#conjuntos-sigma-computables",
  [
    Un conjunto $S c= #omega_sigma_n_m$ será llamado *#sigmaa.computable* cuando la función $chi_S^(#omega_sigma_n_m)$ sea #sigmaa.computable.
  ],
)

#definitionStructure(
  2,
  [Defina cuando un conjunto $S c= #omega_sigma_n_m$ es llamado #sigmaa.enumerable.],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#conjuntos-sigma-enumerables",
  [
    Un conjunto $S c= #omega_sigma_n_m$ será llamado *#sigmaa.enumerable* cuando sea vacío o haya una función \ $F: omega -> #omega_sigma_n_m$ tal que $I_F = S$ y $F_((i))$ sea #sigmaa.computable, para cada $i in {1,dots,n+m}$.
  ],
)

#definitionStructure(
  3,
  [Defina "el programa $~P~$ que enumera a $S$".],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#P%20enumera%20a%20S",
  [
    Diremos que *el programa $~P~ in #SSigma$ enumera a $S$* cuando cumple lo siguiente
    #block()[
      #set list(spacing: 14pt)
      - Para cada $x in omega$, tenemos que $~P~$ se detiene partiendo del estado $||x||$ y llega a un estado $((x_1, dots, x_n, y_1,dots), (sigma_1, dots, sigma_m,beta_1, dots))$, donde $(x_1,dots,x_n, sigma_1,...,sigma_m) in S$.
      - Para cada $(x_1, dots, x_n, sigma_1, dots, sigma_m) in S$, hay un $x in omega$ tal que $~P~$ se detiene partiendo del estado $||x||$ y llega a un estado $((x_1, dots, x_n, y_1,dots), (sigma_1, dots, sigma_m,beta_1, dots))$.
    ]
    (Notar que en los estados se agregan $y_1,dots$ y $beta_1, dots$ para representar "datos extra" que el programa puede haber producido además de los datos de salida relevantes $(x_1, dots, x_n, sigma_1, dots, sigma_m) med$)
  ],
)

#pagebreak()

#combo_title(13)

#definitionStructure(
  [1, 2 y 3],
  [Defina las funciones #i_nm , #E_nm_num y #E_nm_est],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#las-funciones-inm-e_nm-y-e_astnm",
  plural_def: true,
  [
    Sean $n,m in omega$ fijos. Definimos
    #{
      show math.equation.where(block: true): set block(below: 1em, above: 1em)
      $
            #i_nm & : omega X #omega_sigma_n_m X #ProSigma -> omega \
        #E_nm_num & : omega X #omega_sigma_n_m X #ProSigma -> #omega_floor_NN \
        #E_nm_est & : omega X #omega_sigma_n_m X #ProSigma -> #sigma_floor_NN
      $
    }
    de la siguiente manera
    $
      (med #i_nm (0,x->, alpha->, ~P~) med , med #E_nm_num (0,x->, alpha->, ~P~) med , med #E_nm_est (0,x->, alpha->, ~P~) med) = (med 1 med , med (x_1,dots,x_n,0,dots) med , med (alpha_1,dots,alpha_m,epsilon,dots) med)
    $
    #box(
      width: 0.7cm,
    ) $(med #i_nm (t+1,x->, alpha->, ~P~) med , med #E_nm_num (t+1,x->, alpha->, ~P~) med , med #E_nm_est (t+1,x->, alpha->, ~P~) med) =$ \
    #box(
      width: 6.8cm,
      height: 13pt,
    ) $S_(~P~)(med #i_nm (t,x->, alpha->, ~P~) med , med #E_nm_num (t,x->, alpha->, ~P~) med , med #E_nm_est (t,x->, alpha->, ~P~) med)$

    Notar que
    $
      (#i_nm (t,x->, alpha->, ~P~), #E_nm_num (t,x->, alpha->, ~P~), #E_nm_est (t,x->, alpha->, ~P~))
    $
    es la descripción instantánea luego de correr $~P~$ una cantidad $t$ de pasos, partiendo de $||x_1,dots,x_n,alpha_1,dots,alpha_m||$.
    #footnote(
      [Osea que para el paso $t$ podemos pensar que #i_nm representa "número de instrucción", #E_nm_num representa "los valores numéricos" y #E_nm_est representa "los valores alfabéticos".],
    ) #comentario[Además #i_nm es $(Sigma union Sigma_p)$-mixta pero #E_nm_num y #E_nm_est no.]
  ],
)

#definitionStructure(
  [4 y 5],
  [Defina las funciones #E_nmj_num y #E_nmj_est],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#las-funciones-inm-e_nm-y-e_astnm",
  plural_def: true,
  [
    Definimos para cada $j in NN$, las funciones
    $
      #E_nmj_num & : omega X #omega_sigma_n_m X #ProSigma -> omega \
      #E_nmj_est & : omega X #omega_sigma_n_m X #ProSigma -> #sigmaa.est
    $
    de la siguiente manera
    $
      #E_nmj_num (t,x->, alpha->, ~P~) = j"-ésima coordenada de" #E_nm_num (t,x->, alpha->, ~P~) \
      #E_nmj_est (t,x->, alpha->, ~P~) = j"-ésima coordenada de" #E_nm_est (t,x->, alpha->, ~P~)
    $
    #comentario[y es claro que estas funciones son $(Sigma union Sigma_p)$-mixtas.]
  ],
)

#definitionStructure(
  [6],
  [Defina #Halt_nm],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#las-funciones-haltnm-y-tnm.",
  plural_def: true,
  [
    Dados $n,m in omega$, definimos
    $
      bold(#Halt_nm) = lambda t x-> alpha-> ~P~ [ #i_nm (t,x->,alpha->) = n(~P~)+1]
    $
    Es decir que dado $(t, x->, alpha->, ~P~) in omega X #omega_sigma_n_m X #ProSigma$, tenemos que\
    $med med #Halt_nm (t, x->, alpha->, ~P~) = 1 quad$ sii $quad ~P~$ se detiene luego de $t$ pasos, partiendo del estado $||x_1,dots,x_n,alpha_1,dots,alpha_m||. med med$ \
    #comentario[Ojo, la notación lambda es respecto al alfabeto $(Sigma union Sigma_p)$.]
  ],
)

#definitionStructure(
  [7],
  [Defina #T_nm],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#las-funciones-haltnm-y-tnm.",
  plural_def: true,
  [
    Dados $n,m in omega$ y como #Halt_nm es un predicado podemos definir
    $
      bold(#T_nm) = M(#Halt_nm)
    $
    Es decir que para $(x->, alpha->, ~P~) in D_#T_nm$:
    #show math.equation.where(block: true): set par(leading: 2pt)
    $
      #T_nm (x->, alpha->, ~P~) & = "cantidad de pasos necesarios para que" ~P~ "se" \
                                & quad" detenga partiendo de" ||x_1,dots,x_n,alpha_1,dots,alpha_m||
    $
    #comentario[Notar que $D_#T_nm = { (x->, alpha->, ~P~) : ~P~ "se detiene partiendo de" ||x_1,dots,x_n,alpha_1,dots,alpha_m||}$.]
  ],
)

#definitionStructure(
  8,
  [Defina #AutoHalt],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#el-halting-problem-y-los-conjuntos-a-y-n",
  [
    Cuando $Sigma_p c= Sigma$, podemos definir
    $
      bold(#AutoHalt) = lambda ~P~ [(exists t in omega) italic("Halt"^(0,1)) (t, ~P~, ~P~)]
    $
    // Notar que el dominio de #AutoHalt es #ProSigma (es interesante porque está probado que *no es* #sigmaa.recursivo).
    Pensándolo de otra manera, podemos decir que para cada $~P~ in #ProSigma$ tenemos que
    $ #AutoHalt (~P~) = 1 bold("si y solo si") ~P~ "se detiene partiendo del estado" ||~P~|| "(i.e de sí mismo)" $

  ],
)

#definitionStructure(
  9,
  [Defina los conjuntos $italic(A)$ y $italic(N)$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#el-halting-problem-y-los-conjuntos-a-y-n",
  [
    Dado $Sigma_p c= Sigma$, definimos
    $
      bold(italic(A)) & = {~P~ in #ProSigma : #AutoHalt (~P~) = 1} \
      bold(italic(N)) & = {~P~ in #ProSigma : #AutoHalt (~P~) = 0}
    $
    // Aclarar que estos conjuntos son interesantes porque $italic(A)$ es #sigmaa.recursivamente.enumerable y *no es* #sigmaa.recursivo. Más aún, $italic(N)$ no es #sigmaa.recursivamente.enumerable.
  ],
)

#pagebreak()

#combo_title(14)

#definitionStructure(
  1,
  [Explique en forma detallada la notación lambda.],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/1.10-funciones-y-conjuntos-sigma-mixtos#notacion-lambda",
  [
    #set enum(numbering: "(1) (i)", indent: 12.8pt)
    Definamos primero cuándo una *expresión $E$* será llamada *lambdificable con respecto a $Sigma$*.
    Dado que no es un concepto matemáticamente preciso, daremos características que se deben cumplir
    + Puede involucrar variables:
      + Numéricas, valuadas en $omega$ y seleccionadas de #box(baseline: 50pt, inset: (left: 13pt))[
          $& x,y,z,n,m,k,dots \ & x_1,x_2,dots \ & y_1,y_2,dots \ & italic("etc")$
        ]
      + Alfabéticas, valuadas en #sigmaa.est y seleccionadas de #box(baseline: 52pt, inset: (left: 7pt))[
          $& alpha,beta,gamma,eta,dots \ & alpha_1,alpha_2,dots \ & beta_1,beta_2,dots \ & italic("etc")$
        ]
    + Puede no involucrar variables, por lo tanto produce un valor constante.
    + Para ciertas valuaciones de sus variables $E$ puede no estar definida. #comentario([(Por ejemplo $"Pred"(x)$ con $x = 0$)])
    + Cuando $E$ esté definida al valuar sus variables numéricas en $omega$ y alfabéticas en $#sigmaa.est$ deberá producir siempre un elemento de $omega$ o de #sigmaa.est. #comentario[(Es decir no puede tomar valores mixtos)]
    + Se pueden usar expresiones del lenguaje coloquial castellano. #comentario([(Por ejemplo _"es $x$ un número primo"_)])
    + Las expresiones booleanas toman valores en ${0,1} c= omega$. #comentario[("1 = verdad", "0 = falso")]

    Ahora definamos la *notación lambda*. \
    Sea un alfabeto fijo y finito $Sigma$, $E$ una expresión que sea lambdificable con respecto a $Sigma$.
    Sean $x_1,dots,x_n,alpha_1,dots,alpha_m$ variables distintas tales que,
    las variables numéricas que ocurren en $E$ están en ${x_1,dots,x_n}$
    y las variables alfabéticas que ocurren en $E$ están en ${alpha_1,dots,alpha_m}$.
    Entonces
    *$ lambda x_1 dots x_n alpha_1 dots alpha_m [ E ] $*
    denota la función definida por:
    #set list(spacing: 16pt)
    - $D_(lambda x_1 dots x_n alpha_1 dots alpha_m [ E ]) = { (k_1,dots,k_n,beta_1,dots,beta_m) in #omega_sigma_n_m : E$ está definida cuando le asignamos \ #h(103pt) a cada $x_i$ el valor $k_i$ y a cada $alpha_i$ el valor $beta_i}$
    - $lambda x_1 dots x_n alpha_1 dots alpha_m [ E ] (k_1,dots,k_n,beta_1,dots,beta_m) =$ valor que asume o representa $E$  cuando le asignamos \ #h(205pt) a cada $x_i$ el valor $k_i$ y a cada $alpha_i$ el valor $beta_i$.

    #comentario[Notar que por (4) $lambda x_1 dots x_n alpha_1 dots alpha_m [ E ]$ es #sigmaa.mixta de tipo $(n,m,s)$ con $s in {\#, *}$ según corresponda.]
  ],
)

#pagebreak()

#combo_title(15)

#definitionStructure(
  1,
  [Dada una función $f: D_f c= omega X #sigmaa.est -> omega$, describa qué tipo de objeto es y que propiedades debe tener el macro $["V"2 <- f("V"1, "W"1) ]$
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#macros-asociados-a-funciones-sigma-computables",
  [
    #let V1 = $"V"1$
    #let V2 = $"V"2$
    #let W1 = $"W"1$
    #let macro = $[ #V2 <- f(#V1, #W1) ]$
    Dada una función $f: D_f c= omega X #sigmaa.est -> omega$, usaremos
    *$ #macro $*
    para denotar el macro $M$, el cual es de tipo palabra y cumple las siguientes propiedades
    #set enum(numbering: "(1) (a)")
    #block(above: 12pt, below: 12pt)[
      + Las variables oficiales de $M$ son #V1, #V2 y #W1.
      + $M$ No tiene labels oficiales.
      + Si reemplazamos
        + Las variables oficiales de $M$ (i.e. #V1, #V2, #W1) por las variables concretas $"N"overline(k_1), "N"overline(k_2)$ y $"P"overline(j_1)$ con $k_1, k_2, j_1 in NN$.
        + Las variables auxiliares de $M$ por variables concretas (distintas de a dos) y distintas de $"N"overline(k_1), "N"overline(k_2)$, $"P"overline(j_1)$.
        + Los labels auxiliares de $M$ por labels concretos (distintos de a dos).
    ]
    Entonces la palabra así obtenida es un programa de #SSigma que denotaremos con
    #let macro_con_valores = $[ "N"overline(k_2) <- f("N"overline(k_1), "P"overline(j_1)) ]$
    $
      #macro_con_valores
    $
    el cual debe tener la siguiente propiedad:
    #block(inset: (left: 18pt), above: 14pt, below: 14pt)[
      Si lo hacemos correr partiendo de un estado $e$ que le asigne a las variables $"N"overline(k_1)$ y $"P"overline(j_1)$ valores $x_1$ y $alpha_1$, entonces independientemente de los valores que les asigne $e$ al resto de las variables se dará que
      #set enum(numbering: "(i) (a)")
      + Si $(x_1, alpha_1) in.not D_f$ entonces #macro_con_valores *no se detiene*.
      + Si $(x_1, alpha_1) in D_f$, entonces #macro_con_valores se detiene (i.e. intenta realizar la siguiente a su última instrucción) y llega a un estado $e'$ el cual cumple
        + $e'$ le asigna a $"N"overline(k_2)$ el valor $f(x_1, alpha_1)$.
        + $e'$ solo puede diferir de $e$ en los valores que le asigna a $"N"overline(k_2)$ o a las variables que fueran a reemplazar a las variables auxiliares de $M$. Al resto de las variables, no las modifica.
    ]
    Finalmente el programa #macro_con_valores es llamado la *expansión del macro* #macro con respecto a la elección de variables y labels realizada.
  ],
)

#pagebreak()

#combo_title(16)

#definitionStructure(
  1,
  [Dado un predicado $P: D_f c= omega X #sigmaa.est -> omega$, describa qué tipo de objeto es y qué propiedades debe tener el macro $["IF" P("V"1,"W"1) "GOTO" "A"1 ]$
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#macros-asociados-a-predicados-sigma-computables",
  [
    #let V1 = $"V"1$
    #let W1 = $"W"1$
    #let A1 = $"A"1$
    #let macro = $[ "IF" P(V1,W1) "GOTO" A1 ]$
    Dado un predicado $P: D_f c= omega X #sigmaa.est -> omega$, usaremos
    *$ #macro $*
    para denotar el macro $M$, el cual es de tipo palabra y  cumple las siguientes propiedades
    #set enum(numbering: "(1) (a)")
    #block(above: 12pt, below: 12pt)[
      + Las variables oficiales de $M$ son #V1 y #W1.
      + #A1 es el único label oficial de $M$.
      + Si reemplazamos
        + Las variables oficiales de $M$ (i.e. #V1, #W1) por las variables concretas $"N"overline(k_1)$ y $"P"overline(j_1)$ con $k_1,j_1 in NN$.
        + El label oficial #A1 por el label concreto $"L"overline(k)$ con $k in NN$.
        + Las variables auxiliares de $M$ por variables concretas (distintas de a dos) y distintas de $"N"overline(k_1)$, $"P"overline(j_1)$.
        + Los labels auxiliares de $M$ por labels concretos (distintos de a dos) y todos distintos de $"L"overline(k)$.
    ]
    Entonces la palabra así obtenida es un programa de #SSigma, salvo por la ley de los GOTO respecto de $"L"overline(k)$. \ Este programa lo denotaremos con
    #let macro_con_valores = $[ "IF" P("N"overline(k_1),"P"overline(j_1)) "GOTO" "L"overline(k) ]$
    $
      #macro_con_valores
    $
    el cual debe tener la siguiente propiedad:
    #block(inset: (left: 18pt), above: 14pt, below: 14pt)[
      Si lo hacemos correr partiendo de un estado $e$ que le asigne a las variables $"N"overline(k_1)$ y $"P"overline(j_1)$ valores $x_1$ y $alpha_1$, entonces independientemente de los valores que les asigne $e$ al resto de las variables se dará que
      #set enum(numbering: "(i) (a)")
      + Si $(x_1, alpha_1) in.not D_P$ entonces #macro_con_valores *no se detiene*.
      + Si $(x_1, alpha_1) in D_P$ entonces luego de una cantidad finita de pasos de #macro_con_valores
        + Si $P(x_1, alpha_1)=bold(1)$, *direcciona al label $"L"overline(k)$*.
        + Si $P(x_1, alpha_1)=bold(0)$, *se detiene*. (i.e. intenta realizar la siguiente a su última instrucción) \
        #box(inset: (top: -10pt))[
          En ambos casos quedándose en un estado $e'$ el cual solo puede diferir de $e$ en los valores que le asigna a las variables que fueran a reemplazar a las variables auxiliares de $M$. Al resto de las variables, no las modifica.
        ] #footnote()[
          El punto (ii) en el apunte está así
          #set enum(numbering: "(i) (a)", start: 2)
          + Si $(x_1, alpha_1) in D_P$ y *$P(x_1, alpha_1)=1$*, entonces luego de una cantidad finita de pasos #macro_con_valores *direcciona al label $"L"overline(k)$* quedándose en un estado $e'$ el cual solo puede diferir de $e$ en los valores que le asigna a las variables que fueran a reemplazar a las variables auxiliares, al resto de las variables, no las modifica.
          + Si $(x_1, alpha_1) in D_P$ y *$P(x_1, alpha_1) = 0$*, entonces luego de una cantidad finita de pasos #macro_con_valores *se detiene* quedando en un estado $e'$ el cual solo puede diferir de $e$ en los valores que le asigna a las variables que fueran a reemplazar a las variables auxiliares, al resto de las variables, no las modifica.
        ]
    ]
    Finalmente, el programa #macro_con_valores es llamado la *expansión del macro* #macro con respecto a la elección de variables y labels realizada.
  ],
)

#pagebreak()

#combo_title(17)

#definitionStructure(
  1,
  [Defina el concepto de función y desarrolle las tres Convenciones Notacionales asociadas a dicho concepto.
  ],
  note: "de la Guía 1",
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/1.6-el-concepto-de-funcion",
  [
    #set enum(numbering: "(1)", indent: 12.8pt)
    Una *función* es un conjunto *$f$* de pares ordenados con la siguiente propiedad
    $ "Si" (x,y) in f med"y"med (x,z) in f", entonces" y = z $
    Además, dada una función $f$ definimos
    $
      D_f & = "dominio de "f = {x : (x,y) in f "para algún " y} \
      I_f & = "imagen de "f = {y : (x,y) in f "para algún " x}
    $
    #comentario[A veces escribimos Dom($f$) y Im($f$) en lugar de $D_f$ e $I_f$, respectivamente.]\
    Las *convenciones notacionales* son \
    + Dado $x in D_f$ usaremos $f(x)$ para denotar el único $y in I_f$ tal que $(x,y) in f$. \
    + Escribimos $f: S c= A -> B$ para expresar que $f$ es una función tal que $D_f = S c= A$ y $I_f c= B$. \
      Escribimos $f: A -> B$ para expresar que $f$ es una función tal que $D_f = A$ y $I_f c= B$. \
      En ese contexto llamaremos a $B$ _conjunto de llegada_ ($B$ no está determinado por $f$, ya que $I_f c= B$).
    + Muchas veces, para definir una función $f$, lo que haremos es dar su dominio y su regla de asignación. Básicamente daremos precisamente el conjunto que es $D_f$ y quién es $f(x)$ para cada $x in D_f$. Esto determina por completo a $f$, ya que $f = {(x,f(x)): x in D_f}$. Algunos ejemplos son
      #align(center)[
        #table(
          columns: 3,
          stroke: none,
          column-gutter: 32pt,
          [Básico], [Con _conjunto de llegada_ y flechas], [Con flechas y por casos],
          $
             D_f & = omega \
            f(x) & = 23 dot x
          $,
          $
            f: omega & -> omega \
                   x & -> 23 dot x
          $,
          $
            f: NN & -> omega \
                x & -> cases(x+1 quad "si x es par", x+2 quad "si x es impar")
          $,
        )
      ]
  ],
)

#line_title("Definiciones Auxiliares") <definiciones-auxiliares>

#definitionStructure(
  "Aux",
  [Procedimiento efectivo $PP$. <procedimiento-efectivo>],
  short_title: "Procedimiento efectivo",
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/3-procedimientos-efectivos",
  [
    Llamaremos *procedimientos efectivos $PP$* a aquellos que posean las siguientes características
    #{
      set enum(numbering: "(1)", indent: 12.8pt)
      [
        + El ejecutante de $PP$ es una persona que trabajará con papel y lápiz disponibles en forma ilimitada.
        + Cada paso o tarea de $PP$ debe ser simple y fácil de realizar en forma efectiva por cualquier persona.
        + El procedimiento $PP$ comienza con cierto dato de entrada y sigue uno de dos posibles comportamientos
          #block(above: 8pt, below: 8pt)[
            #{
              set enum(numbering: "(a)")
              [
                + $PP$ luego de cierta cantidad de pasos realizados, se detiene y da cierto dato de salida.
                + $PP$ nunca se detiene, generando tareas sucesivamente sin fin.
              ]
            }
          ]
          Diremos que $PP$ _se detiene_ (caso a) o _no se detiene_ (caso b) partiendo del dato de entrada en cuestión.
        + Hay $n,m in omega$ y un alfabeto $Sigma$ tales que el conjunto de datos de entrada de $PP$ es #omega_sigma_n_m. \ Para ciertas $(n+m)$-uplas de #omega_sigma_n_m el procedimiento $PP$ se detendrá y para otras no.
      ]
    }
    Esta definición está con otras palabras.
    #link("https://apunte-lenguajes-logica.netlify.app/3-procedimientos-efectivos")[
      (Definición original en el apunte)
    ]
  ],
)

= #smallcaps[Teoremas]

#let lema_op_predicados_pr = [
  #counter(<lema-op-predicados-pr>).step()
  #link(<lema-op-predicados-pr>)[_Lema (o.p de Predicados #sigmaa.pr)_]
]

#let lema_op_conjuntos_pr = [
  #counter(<lema-op-conjuntos-pr>).step()
  #link(<lema-op-conjuntos-pr>)[_Lema (o.p de Conjuntos #sigmaa.pr)_]
]

#let lema_restriccion_dominios_pr = [
  #counter(<lema-restricción-dominios-pr>).step()
  #link(<lema-restricción-dominios-pr>)[_Lema (Restricción de Dominios #sigmaa.pr)_]
]

#let lema_caracterización_conjuntos_rectangulares_pr = [
  #counter(<lema-caracterización-conjuntos-rectangulares-pr>).step()
  #link(
    <lema-caracterización-conjuntos-rectangulares-pr>,
  )[_Lema (Caracterización de Conjuntos Rectangulares #sigmaa.pr)_]
]

#let lema_sumatoria = [
  #counter(<lema-sumatoria>).step()
  #link(<lema-sumatoria>)[_Lema de la Sumatoria_]
]

#let proposicion_caracterización_conjuntos_pr = [
  #counter(<prop-caracterización-conjuntos-pr>).step()
  #link(<prop-caracterización-conjuntos-pr>)[_Proposición (Caracterización de Conjuntos #sigmaa.pr)_]
]

#let primer_manantial = [
  #counter(<prop-primer-manantial-de-macros>).step()
  #link(<prop-primer-manantial-de-macros>)[_Primer Manantial_]
]

#let segundo_manantial = [
  #counter(<prop-Segundo-Manantial-de-Macros>).step()
  #link(<prop-Segundo-Manantial-de-Macros>)[_Segundo Manantial_]
]

#let teorema_independencia_del_alfabeto = [
  #counter(<teo-independencia-del-alfabeto>).step()
  #link(<teo-independencia-del-alfabeto>)[_Teorema (Independencia del Alfabeto)_]
]

#let teorema_neumann_vence_godel = [
  #counter(<teo-neumann-vence-godel>).step()
  #link(<teo-neumann-vence-godel>)[_Teorema (Neumann vence a Gödel)_]
]

#let teorema_godel_vence_neumann = [
  #counter(<teo-godel-vence-neumann>).step()
  #link(<teo-godel-vence-neumann>)[_Teorema (Gödel vence a Neumann)_],
]

#let lema_division_por_casos_pr = [
  #counter(<lema-division-por-casos-pr>).step()
  #link(<lema-division-por-casos-pr>)[_Lema (División por Casos para funciones #sigmaa.pr)_]
]

#let lema_division_por_casos_recursivas = [
  #counter(<lema-division-por-casos-recursivas>).step()
  #link(<lema-division-por-casos-recursivas>)[_Lema (División por Casos para funciones #sigmaa.r)_]
]

#combo_title(1)

#proofStructure(
  1,
  [*Proposición* (Caracterización de conjuntos #sigmaa.pr) <combo-1.1>],
  [
    \ Un conjunto $S$ es #sigmaa.pr sii $S$ es el dominio de alguna función #sigmaa.pr
  ],
  note: "en la inducción de la prueba hacer solo el caso de la composición.",
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#caract-dominios",
  [
    #let PRSigma = $"PR"^Sigma$
    #let PRSigma_k = $"PR"^Sigma_k$
    #let PRSigma_k1 = $"PR"^Sigma_(k+1)$
    #let omega_sigma_k_l = $omega^k X #sigmaa.est^l$
    #let gbar = $overline(g)$
    *($==>$)* Notar que $S = D_("Pred" med compose med chi_S^#omega_sigma_n_m) med$ #footnote([El truco está en que $D_("Pred") = omega - {0}$ por lo tanto cada vez que $(x->,alpha->) in.not S$ (i.e. $chi_S^#omega_sigma_n_m (x->,alpha->) = 0$), $(x->,alpha->) in.not D_("Pred" compose chi_S^#omega_sigma_n_m)$]) y $"Pred" med compose med chi_S^#omega_sigma_n_m$ es claramente #sigmaa.pr ya que $S$ lo es.

    *($<==$)* Probaremos por inducción sobre $k$ que para cada $F in #PRSigma_k$,  $D_F$ es #sigmaa.pr \
    El caso $k=0$, es fácil ya que $#PRSigma _0 = {"Suc","Pred", C_0^(0,0), C_epsilon^(0,0)} union {d_a : a in Sigma} union {p_j^(n,m) : 1<=j<=n+m}$ y
    $D_"Suc" = omega, D_"Pred" = NN, D_(C_0^(0,0)) = D_(C_epsilon^(0,0)) = {lozenge.stroked} med"y"med D_(p_j^(n,m)) = #omega_sigma_n_m$, que claramente son todos #sigmaa.pr \ Por lo tanto supongamos que vale para un $k$ fijo y veamos que se cumple también para $F in #PRSigma_k1$. \ Hay varios casos. Veamos el caso que $F = g compose [g_1,dots,g_r]$ con $g,g_1,dots,g_r in #PRSigma_k$.\
    Si $F = emptyset$, entonces es claro que $D_F$ es #sigmaa.pr \
    Si $F != emptyset$, tenemos entonces que $r$ es de la forma $n+m$ y
    $
        g & : D_g c= #omega_sigma_n_m -> O \
      g_i & : D_(g_i) c= #omega_sigma_k_l -> omega"  , para cada "i = 1,dots,n \
      g_i & : D_(g_i) c= #omega_sigma_k_l -> #sigmaa.est", para cada "i = n+1,dots,n+m
    $
    con $O in {omega, #sigmaa.est}$ y $k,l in omega$. Por el #link(<lema-1.1>)[_Lema (1)_] , hay funciones #sigmaa.pr $overline(g)_1,dots,overline(g)_(n+m)$ las cuales son #sigmaa.totales y
    $
      g_i = overline(g)_i |_(D_(g_i)) "para" i = 1,dots,n+m
    $
    Por hipótesis inductiva los conjuntos $D_g, D_(g_i), "con" i = 1,dots,n+m$, son #sigmaa.pr y por lo tanto también
    $
      S = inter.big_(i=1)^(n+m) D_(g_i)
    $
    Notar que $quad chi_(D_F)^(#omega_sigma_k_l) = (chi_(D_g)^(#omega_sigma_n_m) compose [overline(g)_1,dots,overline(g)_(n+m)] quad and quad chi_S^(#omega_sigma_k_l)) quad$ lo cual nos dice que *$D_F$ es #sigmaa.pr* #fin_demo

    #linea_dashed

    #par(hanging-indent: 48pt)[
      _Lema (1) :_ $med$ Sea $O = {omega, #sigmaa.est}$ y $n,m in omega$. Si $f: D_f c= #omega_sigma_n_m -> O$ es #sigmaa.pr, entonces existe una función #sigmaa.pr $overline(f): #omega_sigma_n_m -> O$ tal que $f = overline(f) |_(D_f)$. #comentario[(En la guía 5, es el lema 18 y en el #link("https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#extension")[apunte el $4.17$] )]
    ] <lema-1.1>
  ],
)

#pagebreak()

#proofStructure(
  2,
  [*Teorema* (Neumann vence a Gödel) <combo-1.2>],
  [
    Si $h$ es #sigmaa.recursiva, entonces $h$ es #sigmaa.computable.
  ],
  note: [en la inducción de la prueba hacer solo el caso $h=R(f,~G~)$, con $I_h c= omega$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#neumann-vence-a-godel",
  [
    #let RSigma_k = $R^Sigma_k$
    #let RSigma_k1 = $R^Sigma_(k+1)$
    // #show math.equation.where(block: true): set block(below: 1.35em, above: 1.35em)
    Esto será probado por inducción en $k$ que _ si $h in #RSigma_k$, entonces $h$ es #sigmaa.computable _. \
    El caso $k=0$, es fácil ya que $R_0 = "PR"_0$, entonces hay que hacer programas que computen \
    ${"Suc","Pred", C_0^(0,0), C_epsilon^(0,0)} union {d_a : a in Sigma} union {p_j^(n,m) : 1<=j<=n+m}$,
    los cuales son todos triviales
    #box(inset: (top: 1pt))[
      #table(
        column-gutter: 12pt,
        align: center,
        columns: 6,
        stroke: (left: none, right: none, top: 0.2pt, bottom: 0.2pt),
        "Suc", "Pred", $C_0^(0,0)$, $C_epsilon^(0,0)$, $d_a$, $p_j^(n,m)$,
        $
          "N"1 <- "N"1 + 1
        $,
        $
               & "IF N1" != "0 GOTO L2" \
          "L1" & "GOTO L1" \
          "L2" & "N1" <- "N"1 #menos_punto 1
        $,
        $
          "N"1 <- 0
        $,
        $
          "P"1 <- epsilon
        $,
        $
          "P"1 <- "P"1.a
        $,
        $
          "N"1 <- "N"overline(j) \
          o \
          "P"1 <- "P"overline(j)
        $,
      )
    ]
    Supongamos que la propiedad se cumple para un $k$ fijo y veamos que se cumple también para $h in #RSigma_k1$. \
    Hay varios casos. Veamos el caso que $h = R(f,~G~)$ con $f in #RSigma_k$ y $~G~ in #RSigma_k$ que son
    $
          f & : #bloque_fijo -> omega \
      ~G~_a & : omega X #bloque_fijo X #sigmaa.est -> omega, quad a in Sigma
    $
    Sea $Sigma = {a_1,dots,a_r}$. Por hipótesis inductiva, las funciones $f, ~G~_a$ con $a in Sigma$, son #sigmaa.computables y por lo tanto tenemos las macros
    $
      ["V"overline(n+1) &<- f("V"overline(1),dots,"V"overline(n), "W"overline(1),dots,"W"overline(m)) ] \
      ["V"overline(n+2) &<- ~G~_a_i ("V"overline(1),dots,"V"overline(n+1), "W"overline(1),dots,"W"overline(m+1)) ] "con" i = 1,dots,r
    $
    Podemos entonces hacer el siguiente programa (tener en cuenta que $"P"overline(m+2) = epsilon$ al iniciar)
    #let menos_letra = text(size: 8pt, baseline: -4pt, weight: "bold")[↷]
    #show math.equation.where(block: true): set par(leading: 0.55em)
    $
      & quad [med"N"overline(n+1) <- f("N"overline(1),dots,"N"overline(n), "P"overline(1),dots,"P"overline(m)) med] \
      "L"overline(r+1) & quad "IF P"overline(m+1) "BEGINS" a_1 "GOTO L1" \
      & quad #h(2cm) dots.v \
      & quad "IF P"overline(m+1) "BEGINS" a_r "GOTO L"overline(r) \
      & quad "GOTO L"overline(r+2) \
      "L1" & quad "P"overline(m+1) <- #menos_letra "P"overline(m+1) \
      & quad [med"N"overline(n+1) <- ~G~_a_1 ("N"overline(n+1), "N"overline(1),dots,"N"overline(n), "P"overline(1),dots,"P"overline(m),"P"overline(m+2)) med] \
      & quad "P"overline(m+2) <- "P"overline(m+2) med . med a_1 \
      & quad "GOTO L"overline(r+1) \
      & quad #h(2cm) dots.v \
      "L"overline(r) & quad "P"overline(m+1) <- #menos_letra "P"overline(m+1) \
      & quad [med"N"overline(n+1) <- ~G~_a_r ("N"overline(n+1), "N"overline(1),dots,"N"overline(n), "P"overline(1),dots,"P"overline(m),"P"overline(m+2)) med] \
      & quad "P"overline(m+2) <- "P"overline(m+2) med . med a_r \
      & quad "GOTO L"overline(r+1) \
      "L"overline(r+2) & quad "N"1 <- "N"overline(n+1)
    $ //TODO: EXPLICAR EL PROGRAMA
    es fácil ver que el programa computa $h$ #footnote([
      Recordar que $R(f, ~G~)(x->, alpha->, alpha a) = ~G~_a ( med R(f,~G~)(x->, alpha->, alpha), x->, alpha->, alpha med)$. La idea es que, por ejemplo para $x->, alpha->$ y $quad alpha = a_1 a_2 a_3 quad$ tenemos que
      $~G~_a_3 ( quad ~G~_a_2 ( quad ~G~_a_1 ( med f(x->, alpha->) quad, x->,alpha->,epsilon) quad, x->, alpha->, a_1) quad, x->, alpha->, a_1 a_2)$ por esto calculamos primero $f$ y después en $"P"overline(m+1)$ vamos llevando los $epsilon, a_1 a_2, a_1 a_2 a_3$
    ]), por lo tanto *$h$ es #sigmaa.computable*. (El resto de casos no los pide)~#fin_demo
  ],
)

#pagebreak()

#combo_title(2)

#proofStructure(
  1,
  [*Lema* (Lema de división por casos para funciones #sigmaa.pr) <combo-2.1>],
  [
    \Supongamos $f_i : D_f_i c= #omega_sigma_n_m -> #sigmaa.est$, con $i=1,dots,k$, son funciones #sigmaa.pr tales que $D_f_i inter D_f_j = emptyset$ para $i != j$. Entonces $f_1 union dots union f_k$ es #sigmaa.pr
  ],
  note: [ hacer el caso $k=2, n=2$ y $m=1$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#lema-de-division-por-casos-para-funciones-sigma-p.r.",
  [
    Supongamos $k=2, n=2 med"y"med m=1$. Por lo tanto tenemos que
    $
      overline(f)_i : omega X omega X #sigmaa.est -> #sigmaa.est, i=1,2
    $
    son funciones #sigmaa.pr tales que $f_i = overline(f)_i |_D_f_i, i=1,2$  por el #link(<lema-2.1>)[_Lema (1)_]. Luego por la  #proposicion_caracterización_conjuntos_pr, los conjuntos $D_f_1 med"y"med D_f_2$ son #sigmaa.pr y por lo tanto por el #lema_op_conjuntos_pr, $D_f_1 union D_f_2$ también. Finalmente dado que
    $
      f_1 union f_2 = (
        lambda alpha beta [alpha beta] compose [ quad
          lambda x alpha [alpha^x] compose [chi_(D_f_1)^(#omega_sigma_n_m), overline(f)_1]
          quad , quad
          lambda x alpha [alpha^x] compose [chi_(D_f_2)^(#omega_sigma_n_m), overline(f)_2]
          quad ]
      ) |_(D_f_1 union D_f_2)
    $
    y el #lema_restriccion_dominios_pr,
    tenemos que *$f_1 union f_2$ es #sigmaa.pr*. #fin_demo

    #linea_dashed

    #par(hanging-indent: 48pt)[
      _Lema (1) :_ ~ Sea $O = {omega, #sigmaa.est}$ y $n,m in omega$. Si $f: D_f c= #omega_sigma_n_m -> O$ es #sigmaa.pr, entonces existe una función #sigmaa.pr $overline(f): #omega_sigma_n_m -> O$ tal que $f = overline(f) |_(f)$. #comentario[(En la guía 5, es el lema 18 y en el #link("https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#extension")[apunte el $4.17$] )]
    ] <lema-2.1>
  ],
)

#pagebreak()

#page(margin: (bottom: 0pt))[
  #proofStructure(
    2,
    [*Proposición* (Caracterización básica de conjuntos #sigmaa.enumerables) <combo-2-prop>],
    [
      \ Sea $S c= #omega_sigma_n_m$ un conjunto no vacío. Entonces son equivalentes \
      #box(width: 92%)[
        #set enum(numbering: "(1) (a)", indent: 1pt)
        + $S$ es #sigmaa.enumerable.
        + Hay un programa $~P~ in #ProSigma$ tal que
          + Para cada $x in omega$,  tenemos que $~P~$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1,dots,x_n,y_1,dots),(alpha_1,dots,alpha_m,beta_1,dots))$ donde $(x_1,dots,x_n,alpha_1,dots,alpha_m) in S$.
          + Para cada $(x_1,dots,x_n,alpha_1,dots,alpha_m) in S$ hay un $x in omega$ tal que $~P~$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1,dots,x_n,y_1,dots),(alpha_1,dots,alpha_m,beta_1,dots))$.
      ]
    ],
    note: [ hacer el caso $n=2$ y $m=1$],
    link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.3-el-paradigma-imperativo-de-neumann-el-lenguaje-mathcalssigma#P%20enumera%20a%20S",
    [
      Haremos el caso $n=2$ y $m=1$, es decir $S c= omega X omega X #sigmaa.est$. \
      #let tipo_conjunto = $omega X omega X #sigmaa.est$
      * $(1) ==> (2)$* \
      Ya que $S$ es no vacío, por definición hay una $F: omega -> #tipo_conjunto$ tal que $I_F = S$ y $F_((i))$ es #sigmaa.computable, para cada $i=1,2,3$. Entonces por el #primer_manantial existen las macros
      #{
        show math.equation.where(block: true): set block(below: 1em, above: 1.4em)
        $
          ["V2" <- F_((1))("V1")] quad quad quad
          ["V2" <- F_((2))("V1")] quad quad quad
          ["W1" <- F_((3))("V1")]
        $
      }
      Y damos el programa $~P~$
      #box(baseline: 1.9cm, inset: (left: 3.2cm))[
        #show math.equation.where(block: true): set par(leading: 0.4em)
        $
          ["P1" <- F_((3))("N1")] \
          ["N2" <- F_((2))("N1")] \
          ["N1" <- F_((1))("N1")] \
        $
      ]
      \
      Donde se supone que las expansiones de las macros usan variables auxiliares que no aparecen en la lista $"N1", "N2","P1"$ y tampoco repiten labels auxiliares.\
      Notar que para cada $x in omega$, $~P~$ siempre se detiene partiendo de un estado $||x||$ porque las $F_((i))$ son #sigmaa.totales, entonces sus macros siempre se detienen. Luego  es fácil ver que *cumplen las condiciones*
      #set enum(numbering: "(a)")
      + Porque ya sabemos que para cada $x in omega$, $~P~$ se detiene partiendo desde el estado $||x||$ y además como  $F(x) = (F_((1))(x),F_((2))(x),F_((3))(x)) = (x_1,x_2,alpha_1) in S$ entonces $~P~$ se detiene con un estado de la forma $((x_1,x_2,y_1,dots),(alpha_1,beta_1,dots))$ donde $(x_1,x_2,alpha_1) in S$.
      + Porque para cada $(x_1,x_2,alpha_1) in S$, sabemos por definición que existe un $x in omega$ tal que $F(x) = (F_((1))(x),F_((2))(x),F_((3))(x)) = (x_1,x_2,alpha_1)$. Y como $~P~$ siempre se detiene, incluso partiendo del estado $||x||$, llegará a un estado de la forma $((x_1,x_2, y_1,dots),(alpha_1,beta_1,dots))$.
      * $(1) <== (2)$* \
      Supongamos $~P~ in #ProSigma$ que cumple (a) y (b) de (2). \ Sean
      #show math.equation.where(block: true): set block(below: 1em, above: 1em)
      $
        ~P~_1 = ~P~ "N1" <- "N1" quad quad quad quad
        ~P~_2 = ~P~ "N1" <- "N2" quad quad quad quad
        ~P~_3 = ~P~ "P1" <- "P1"
      $
      definamos las funciones
      $
        F_1 = Psi_(~P~_1)^(1,0, \#) quad quad quad quad
        F_2 = Psi_(~P~_2)^(1,0, \#) quad quad quad quad
        F_3 = Psi_(~P~_3)^(1,0, *)
      $
      Notar que cada $F_i$ es #sigmaa.computable y tienen dominio igual a $omega$. Sea $F = [F_1,F_2,F_3]$, por definición $D_F = omega$ y ya que $F_i = F_((i))$, para cada $i=1,2,3$ tenemos que cada $F_((i))$ es #sigmaa.computable. Resta ver que $I_F = S$ \
      #box(inset: (top: 5pt))[
        #par(hanging-indent: 42pt)[
          *$I_F c= S$* Por (a) tenemos que $~P~$ para todo $x in omega$ partiendo de $||x||$ llega a un estado de la forma $((x_1,x_2,y_1, dots),(alpha_1,beta_1,dots))$ donde $(x_1,x_2,alpha_1) in S$. Por lo tanto $F(x) = (F_1(x), F_2(x), F_3(x)) = (x_1,x_2,alpha_1) in S$ entonces $I_F c= S$.
        ]
      ]
      #box()[
        #par(hanging-indent: 42pt)[
          *$S c= I_F$* Por (b) tenemos que para cada $(x_1,x_2,alpha_1) in S$, hay un $x in omega$ tal que $~P~$ partiendo de $||x||$ llega a un estado de la forma $((x_1,x_2,y_1,dots),(alpha_1,beta_1,dots))$. Por lo tanto $F(x) = (F_1(x), F_2(x), F_3(x)) = (x_1,x_2,alpha_1) in I_F$ entonces $S c= I_F$.
        ]
      ]
      Entonces finalmente $I_F = S$ y por lo tanto *$S$ es #sigmaa.enumerable*. #fin_demo
    ],
  )
]

#pagebreak()

#combo_title(3)

#proofStructure(
  1,
  [*Teorema* (Gödel vence a Neumann) <combo-3.1>],
  [
    \ Si $f: D_f c= #omega_sigma_n_m -> #sigmaa.est$ es #sigmaa.computable, entonces $f$ es #sigmaa.recursiva.
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#godel-vence-a-neumann-1",
  [
    Sea $~P~_0$ un programa que compute a $f$.
    Primero veamos que $f$ es $(Sigma union Sigma_p)$-recursiva. Notar que
    #let Enm = $E_(* med 1)^(n,m)$
    #let Tnm = $T^(n,m)$
    #let pnm = $p^(n,m)$
    #let CnmP = $C^(n,m)_(~P~_0)$
    #footnote[
      #align(center)[
        #block(below: 0pt, above: 0pt)[
          #text(size: 10pt)[
            $
              f = underbrace(Enm, "resultado de P1, importante (*)") compose [underbrace(Tnm compose [pnm_1,dots,pnm_(n+m), CnmP ], "cantidad de pasos para que termine") med , med underbrace(pnm_1"," dots"," pnm_(n+m), "input"), underbrace(CnmP, "programa") ] \
            $
          ]
        ]
      ]
    ]
    $
      f = Enm compose [Tnm compose [pnm_1,dots,pnm_(n+m), CnmP ] med , med pnm_1,dots,pnm_(n+m), CnmP ]
    $
    donde $pnm_1,dots,pnm_(n+m)$ y $CnmP$ son respecto al alfabeto $Sigma union Sigma_p$, es decir que tienen dominio $omega^n X (Sigma union Sigma_p)^(*m)$. Esto nos dice que $f$ es $(Sigma union Sigma_p)$-recursiva. Osea que el #teorema_independencia_del_alfabeto nos dice que *$f$ es #sigmaa.recursiva*. #fin_demo
  ],
)

#proofStructure(
  2,
  [*Teorema* (Caracterización de conjuntos #sigmaa.efectivamente.computable)],
  [
    \ Sea $S c= #omega_sigma_n_m$. Son equivalentes \
    #box(width: 92%)[
      #set enum(numbering: "(a)", indent: 12.8pt)
      + $S$ es #sigmaa.efectivamente.computable.
      + $S$ y $(#omega_sigma_n_m)-S$ son #sigmaa.efectivamente.enumerables.
    ]
  ],
  note: [haga solo $(b) ==> (a)$. La prueba está al final de la Guía 3],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/3.3-conjuntos-sigma-efectivamente-enumerables",
  [
    *$(b) ==> (a)$* \
    Si $S = emptyset$ o $S = #omega_sigma_n_m$ es claro que se cumple (a). \ Así que supongamos que $S != emptyset$ y $S != #omega_sigma_n_m$ por lo cual $(#omega_sigma_n_m)-S != emptyset$. \ Además sea $PP_1$ un procedimiento efectivo que enumere a $S$ y $PP_2$ un procedimiento efectivo que enumere a $(#omega_sigma_n_m)-S$. Ahora sí es fácil ver que el siguiente procedimiento efectivo $PP$ computa $chi_S^#omega_sigma_n_m$ \

    #align(center)[
      #box()[
        #align(left)[
          Sea $(x->, alpha->) in #omega_sigma_n_m$. \
          ~ ~ Etapa 1 \
          Darle a la variable $T$ el valor $0$. \
          ~ ~ Etapa 2 \
          Realizar $PP_1$ con el valor $T$ como entrada para obtener de salida la ulpa $(arrow(y),arrow(beta))$. \
          ~ ~ Etapa 3 \
          Realizar $PP_2$ con el valor $T$ como entrada para obtener de salida la ulpa $(arrow(z),arrow(gamma))$. \
          ~ ~ Etapa 4 \
          Si $(arrow(y),arrow(beta)) = (x->, alpha->)$, entonces detenerse y dar como dato de salida el valor 1. \
          Si $(arrow(z),arrow(gamma)) = (x->, alpha->)$, entonces detenerse y dar como dato de salida el valor 0. \
          Si no sucede ninguna de las dos, aumentar $T$ en $1$ y volver a la Etapa 2. \
        ]
      ]
    ]

    #comentario[
      ya que, los procedimientos $PP_1$ y $PP_2$ siempre terminan y además para todo $(x->, alpha->) in #omega_sigma_n_m$ se cumple que $(x->, alpha->) in S$ o $(x->, alpha->) in.not S$. Osea que siempre existe algún $t in omega$ tal que haga detenerse a $PP$ dando como dato de salida $1$ o $0$ respectivamente.
    ] \
    Entonces *$S$ es #sigmaa.efectivamente.computable.* #fin_demo
  ],
)

#pagebreak()

#combo_title(4)

#proofStructure(
  1,
  [*Proposición* (misma que la del #link(<combo-2-prop>)[combo 2])],
  [],
  [],
  link_apunte: <combo-2-prop>,
  empty_demo: true,
)

#proofStructure(
  2,
  [*Lema* (Lema de la sumatoria) <combo-4>],
  [
    \ Sea $Sigma$ un alfabeto finito. Si $f: omega X #bloque_fijo -> omega$ es #sigmaa.pr , con $S_1,dots,S_n c= omega$ y $L_1,dots,L_m c= #sigmaa.est$ no vacíos, entonces la función $quad lambda x y x-> alpha-> [ sum_(t=x)^(t=y) f(t,x->,alpha->)] quad$ es #sigmaa.pr
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#iteracion",
  [
    // Haremos el caso $n=2$ y $m=1$, osea que $f : omega X S_1 X S_2 X L_1 -> omega$, con $S_1, S_2 c= omega$ y $L_1 c= #sigmaa.est$. \
    Sea $G = lambda t x x-> alpha-> [ sum_(i=x)^(i=t) f(i, x->, alpha->) ]$. Ya que #comentario[(es un simple cambio de lugar las variables)]
    $
      lambda x y x-> alpha-> [ sum_(t=x)^(t=y) f(t,x->, alpha->)] = G compose[bold(p^(n+2, m)_2), bold(p^(n+2, m)_1), p^(n+2, m)_3, dots , p^(n+2, m)_(n+m+2)]
    $
    basta probar que $G$ es #sigmaa.pr Primero notar que
    $
        G(0,x,x->,alpha->) & = cases(
                               0 #h(2.25cm) "si" x > 0,
                               f(0,x->,alpha->) #h(25pt) "si" x = 0
                             ) \
      G(t+1,x,x->,alpha->) & = cases(
                               0 #h(5cm) "si" x > t+1,
                               G(t,x,x->,alpha->) + f(t+1,x->,alpha->)  #h(18pt) "si" x <= t+1
                             ) \
    $
    osea que si definimos
    #{
      show math.equation.where(block: true): set par(leading: 0.2em)
      $
          h: omega X S_1 X dots X S_n X L_1 X dots X L_m & -> med med med omega \
                                       (x, x->, alpha->) & -> cases(
                                                             0 #h(1.35cm) quad "si" x > 0,
                                                             f(0,x->,alpha->) quad "si" x = 0
                                                           ) \
                                               #v(0.2cm) \
        g: omega^3 X S_1 X dots X S_n X L_1 X dots X L_m & -> med med med omega \
                                 (A, t, x, x->, alpha->) & -> cases(
                                                             0 #h(2.7cm) quad "si" x > t+1,
                                                             A + f(t+1,x->,alpha->) quad "si" x <= t+1
                                                           )
      $
    }
    tenemos que $G = R(h,g)$. Es decir que sólo nos falta probar que $h$ y $g$ son #sigmaa.pr Sean así
    $
      D_1 & = {(x, x_1, x_2, alpha_1) in omega X S_1 X dots X S_n X L_1 X dots X L_m : x > 0} \
      D_2 & = {(x, x_1, x_2, alpha_1) in omega X S_1 X dots X S_n X L_1 X dots X L_m : x = 0} \
      H_1 & = {(A, t, x, x_1, x_2, alpha_1) in omega^3 X S_1 X dots X S_n X L_1 X dots X L_m : x > t+1} \
      H_2 & = {(A, t, x, x_1, x_2, alpha_1) in omega^3 X S_1 X dots X S_n X L_1 X dots X L_m : x <= t+1} \
    $
    Notar que
    $
      h & = C_0^(n+1, m) |_D_1 union lambda x x-> alpha-> [f(0,x->,alpha->)] |_(D_2) \
      g & = C_0^(n+3, m) |_H_1 union lambda A t x x-> alpha-> [A + f(t+1,x->,alpha->)] |_(H_2) \
    $
    Para probarlo, vamos a ver que todas las funciones y conjuntos que aparecen en $h$ y $g$ son #sigmaa.pr

    Trivialmente $C_0^(n+1,m)$ y $C_0^(n+3,m)$ son #sigmaa.pr Luego como $f$ es #sigmaa.pr y
    $
      lambda x x-> alpha-> [f(0,x->,alpha->)] = f compose [C_0^(n+1,m), p_2^(n+1,m), dots , p_(n+1+m)^(n+1,m)] \
      lambda A t x x-> alpha-> [A + f(t+1,x->,alpha->)] = lambda x y [x+y] compose [p_1^(n+3,m), f compose ["Suc" compose p_2^(n+3,m), p_4^(n+3,m), dots, p_(n+3+m)^(n+3,m)]]
    $
    entonces tenemos que ambas funciones son #sigmaa.pr
    Resta ver que los conjuntos $D_1, D_2, H_1$ y $H_2$ son #sigmaa.pr \
    - *$D_1$ y $D_2$* : Como $f$ es #sigmaa.pr, por la #proposicion_caracterización_conjuntos_pr, tengo que \ $D_f = omega X S_1 X dots X S_n X L_1 X dots X L_m$ también es #sigmaa.pr. Ahora como \
      #box(width: 100%)[
        $
          chi^(omega^(n+1) X #sigmaa.est_m)_D_1 = ( chi^(omega^(n+1) X #sigmaa.est_m)_D_f quad and quad lambda x x-> alpha-> [x > 0]) \
          chi^(omega^(n+1) X #sigmaa.est_m)_D_2 = ( chi^(omega^(n+1) X #sigmaa.est_m)_D_f quad and quad lambda x x-> alpha-> [x = 0])
        $
      ]
      por el #lema_op_predicados_pr, tenemos que $D_1$ y $D_2$ son #sigmaa.pr .\
    - *$H_1$ y $H_2$* : Como $f$ es #sigmaa.pr, por la #proposicion_caracterización_conjuntos_pr, tengo que \ $D_f = omega X S_1 X dots X S_n X L_1 X dots X L_m$ también es #sigmaa.pr. \ Entonces no es difícil ver que $R = omega^3 X S_1 X dots X S_n X L_1 X dots X L_m$ es #sigmaa.pr usando el #lema_caracterización_conjuntos_rectangulares_pr. Ahora como \
      #box(width: 100%)[
        $
          chi^(omega^(n+3) X #sigmaa.est_m)_H_1 = ( chi^(omega^(n+3) X #sigmaa.est_m)_R quad and quad lambda A t x x-> alpha-> [x > t+1]) \
          chi^(omega^(n+3) X #sigmaa.est_m)_H_2 = ( chi^(omega^(n+3) X #sigmaa.est_m)_R quad and quad lambda A t x x-> alpha-> [x <= t+1]) \
        $
      ]
      por el #lema_op_predicados_pr, tenemos que $H_1$ y $H_2$ son #sigmaa.pr .
    Juntando todo por el #lema_restriccion_dominios_pr, todas las funciones usadas en $h$ y $g$ son #sigmaa.pr, pero notar que $D_1 inter D_2 = emptyset$ y $H_1 inter H_2 = emptyset$, entonces por el #lema_division_por_casos_pr, tenemos que $h$ y $g$ son #sigmaa.pr Por lo tanto *$G = R(h,g)$ es #sigmaa.pr* #fin_demo
  ],
)

#pagebreak()

#combo_title(5)

#proofStructure(
  1,
  [*Lema*],
  [
    Sea $Sigma = {@,%,!}$. Sea $f: S_1 X S_2 X L_1 X L_2 -> omega$ con $S_1,S_2 c= omega$ y $L_1,L_2 c= #sigmaa.est$ no vacíos y sea $~G~$ una familia #sigmaa.indexada de funciones tal que
    $~G~_a: omega X S_1 X S_2 X L_1 X L_2 X #sigmaa.est -> omega$
    para cada $a in Sigma$. Si $f$ y cada $~G~_a$ son #sigmaa.efectivamente.computables, *entonces* $R(f,~G~)$ lo es. ~ ~ Nota: es un ej de la Guía 5.
  ],
  [
    #let menos_letra = text(size: 8pt, baseline: -4pt, weight: "bold")[↷]
    Dado que $f, ~G~_@, ~G~_%$ y $~G~_!$ son #sigmaa.efectivamente.computables, entonces existen programas $PP_f, PP_@, PP_%$ y $PP_!$ que las computan respectivamente. Entonces notar que el siguiente procedimiento efectivo $PP$ computa $R(f,~G~)$ \
    #align(
      center,
      block()[
        #align(left)[
          Sea $(x_1, x_2,alpha_1, alpha_2, alpha) in S_1 X S_2 X L_1 X L_2 X #sigmaa.est$
          \ ~ ~ ~ Etapa 1  \
          Hago las asignaciones $I <- epsilon$ y $J <- alpha$. \
          Realizar $PP_f$ con la entrada $(x_1,x_2,alpha_1, alpha_2)$ y guardar la salida en la variable $A$.
          \ ~ ~ ~ Etapa 2 \
          Si $J = epsilon$, entonces detenerse y dar como dato de salida el valor $A$.\
          Si $J != epsilon$, realizar las asignaciones $B <- [J]_1 med$ y $med J <- #menos_letra J med$.\
          Ahora según el caso \
          #box(width: 100%, inset: (top: -15pt, left: 98pt))[
            si $B = @$ voy a la Etapa 3, \
            si $B = %$ voy a la Etapa 4, \
            si $B = !$ voy a la Etapa 5.
          ]
          \ ~ ~ ~ Etapa 3 \
          Corro el procedimiento $PP_@$ con la entrada $(A, x_1,x_2,alpha_1, alpha_2, I)$ y guardar la salida en la variable $A$.\
          Hago $I <- I @$ y voy a la Etapa 2
          \ ~ ~ ~ Etapa 4 \
          Corro el procedimiento $PP_%$ con la entrada $(A, x_1,x_2,alpha_1, alpha_2, I)$ y guardar la salida en la variable $A$.\
          Hago $I <- I %$ y voy a la Etapa 2
          \ ~ ~ ~ Etapa 5 \
          Corro el procedimiento $PP_!$ con la entrada $(A, x_1,x_2,alpha_1, alpha_2, I)$ y guardar la salida en la variable $A$.\
          Hago $I <- I !$ y voy a la Etapa 2
        ]
      ],
    )
    y por ello *$bold("R("f",")~G~)$ es #sigmaa.efectivamente.computable*. #fin_demo
  ],
)
/*
#page(paper: "a4", flipped: true)[

  $
                                   alpha = a_1 a_2 a_3 a_4 a_5 \
    R(f ~G~) (arrow(x), arrow(y), med med a_1 a_2 a_3 a_4 a_5) & = ~G~_a_5(
                                                                   quad R(f ~G~) (arrow(x), arrow(y), a_1 a_2 a_3 a_4) quad,
                                                                   arrow(x), arrow(y),quad a_1, a_2, a_3, a_4) \
                                                               & = ~G~_a_5(
                                                                   quad ~G~_a_4(
                                                                     quad R(f ~G~) (arrow(x), arrow(y), a_1 a_2 a_3) quad
                                                                     , arrow(x), arrow(y),quad a_1, a_2, a_3) quad,
                                                                   arrow(x), arrow(y),quad a_1, a_2, a_3, a_4) \
                                                               & =
                                                                 ~G~_a_5( quad
                                                                   ~G~_a_4( quad
                                                                     ~G~_a_3( quad
                                                                       R(f ~G~) (arrow(x), arrow(y), a_1 a_2) quad,
                                                                       arrow(x), arrow(y),quad a_1, a_2) quad,
                                                                     arrow(x), arrow(y),quad a_1, a_2, a_3) quad,
                                                                   arrow(x), arrow(y),quad a_1, a_2, a_3, a_4) \
                                                               & =
                                                                 ~G~_a_5( quad
                                                                   ~G~_a_4( quad
                                                                     ~G~_a_3( quad
                                                                       ~G~_a_2( quad
                                                                         R(f ~G~) (arrow(x), arrow(y), a_1) quad,
                                                                         arrow(x), arrow(y),quad a_1) quad,
                                                                       arrow(x), arrow(y),quad a_1, a_2) quad,
                                                                     arrow(x), arrow(y),quad a_1, a_2, a_3) quad,
                                                                   arrow(x), arrow(y),quad a_1, a_2, a_3, a_4) \
                                                               & =
                                                                 ~G~_a_5( quad
                                                                   ~G~_a_4( quad
                                                                     ~G~_a_3( quad
                                                                       ~G~_a_2( quad
                                                                         ~G~_a_1( quad
                                                                           R(f ~G~) (arrow(x), arrow(y),epsilon) quad,
                                                                           arrow(x), arrow(y),quad epsilon) quad,
                                                                         arrow(x), arrow(y),quad a_1) quad,
                                                                       arrow(x), arrow(y),quad a_1, a_2) quad,
                                                                     arrow(x), arrow(y),quad a_1, a_2, a_3) quad,
                                                                   arrow(x), arrow(y),quad a_1, a_2, a_3, a_4) \
                                                               & =
                                                                 ~G~_a_5( quad
                                                                   ~G~_a_4( quad
                                                                     ~G~_a_3( quad
                                                                       ~G~_a_2( quad
                                                                         ~G~_a_1( quad
                                                                           f (arrow(x), arrow(y)) quad,
                                                                           arrow(x), arrow(y),quad epsilon) quad,
                                                                         arrow(x), arrow(y),quad a_1) quad,
                                                                       arrow(x), arrow(y),quad a_1, a_2) quad,
                                                                     arrow(x), arrow(y),quad a_1, a_2, a_3) quad,
                                                                   arrow(x), arrow(y),quad a_1, a_2, a_3, a_4) \
  $
]
*/
#pagebreak()

#proofStructure(
  2,
  [*Lema* (Lema de cuantificación acotada) <combo-5>],
  [
    Sea $Sigma$ un alfabeto finito. Sea $P: S X S_1 X dots X S_n X L_1 X dots X L_m -> omega$ un predicado #sigmaa.pr, con $S, S_1,dots,S_n c= omega$ y $L_1,dots,L_m c= #sigmaa.est$ no vacíos. \
    Supongamos $overline(S) c= S$ es #sigmaa.pr Entonces $lambda x x-> alpha-> [ (forall t in overline(S))#text(size: 9pt, baseline: 3pt)[$(t<=x)$] med P(t, x->, alpha->) ]$ es #sigmaa.pr
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#cuantificacion",
  [
    Sea
    #{
      show math.equation.where(block: true): set block(below: 5pt, above: 5pt)
      $
        overline(P) = P |_(overline(S) X S_1 X dots X S_n X L_1 X dots X L_m) union C_1^(1+n,m) |_((omega - overline(S)) X S_1 X dots X S_n X L_1 X dots X L_m)
      $
    }
    veamos que es #sigmaa.pr \ Como $overline(S) X S_1 X dots X S_n X L_1 X dots X L_m inter (omega - overline(S)) X S_1 X dots X S_n X L_1 X dots X L_m = emptyset$, $P$ y $C_1^(1+n,m)$ son #sigmaa.pr, por el #lema_division_por_casos_pr y el #lema_restriccion_dominios_pr, alcanza con ver que los siguientes conjuntos son #sigmaa.pr

    $
      overline(S) X S_1 X dots X S_n X L_1 X dots X L_m quad quad"y"quad quad (omega - overline(S)) X S_1 X dots X S_n X L_1 X dots X L_m
    $
    Por la #proposicion_caracterización_conjuntos_pr sabemos que $D_P = S X S_1 X dots X S_n X L_1 X dots X L_m$ es #sigmaa.pr , por lo tanto, por el #lema_caracterización_conjuntos_rectangulares_pr, $S_1, dots, S_n, L_1, dots, L_m$ son #sigmaa.pr
    y además como $overline(S)$ es #sigmaa.pr, por el #lema_op_conjuntos_pr, $(omega - overline(S))$ también. Entonces nuevamente por el #lema_caracterización_conjuntos_rectangulares_pr, ambos conjuntos son #sigmaa.pr Así $overline(P)$ es #sigmaa.pr
    Notar que $D_overline(P) = omega X S_1 X dots X S_n X L_1 X dots X L_m$. Además, como
    $
      lambda x x-> alpha-> [ (forall t in overline(S))#text(size: 9pt, baseline: 3pt)[$(t<=x)$] med P(t, x->, alpha->) ] &= lambda x x-> alpha-> [ product_(t=0)^(t=x) med overline(P)(t, x->, alpha->) ] \
      &= lambda x y x-> alpha-> [ product_(t=x)^(t=y) med overline(P)(t, x->, alpha->) ] compose [C_0^(1+n,m),p_1^(1+n,m),dots,p_(1+n+m)^(1+n,m)] \
    $
    el #lema_sumatoria implica que $lambda x x-> alpha-> [ (forall t in overline(S))#text(size: 9pt, baseline: 3pt)[$(t<=x)$] med P(t, x->, alpha->) ]$ es #sigmaa.pr #fin_demo
  ],
)

#pagebreak()

#combo_title(6)

#proofStructure(
  1,
  [*Lema* (#sigmaa.efectivamente.computable implica #sigmaa.efectivamente.enumerable)],
  [
    \ Si $S c= #omega_sigma_n_m$ es #sigmaa.efectivamente.computable entonces $S$ es #sigmaa.efectivamente.enumerable.
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/3.3-conjuntos-sigma-efectivamente-enumerables",
  [
    Si $S = emptyset$, por definición es #sigmaa.efectivamente.enumerable.

    Supongamos entonces que $S != emptyset$ y fijamos $(arrow(z), arrow(gamma)) in S$. Sea $PP_S$ el procedimiento efectivo que compute a $chi_S^#omega_sigma_n_m$. Sea $PP_1$ un procedimiento efectivo que enumere a #omega_sigma_n_m, usando las bajadas y $*<$, que ya sabemos que son #sigmaa.efectivamente.computable. Entonces $PP_1$ sería
    #align(center)[
      #box()[
        #align(left)[
          Sea $x in omega$
          \ ~ ~ ~ Etapa 1  \
          Si $x=0$, entonces detenerse y dar como dato de salida $(0,0,0,dots,epsilon,epsilon,epsilon,dots )$
          \ ~ ~ ~ Etapa 2 \
          Detenerse y dar como dato de salida $((x)_1,dots,(x)_n,*<((x)_(n+1)),dots, *<((x)_((n+m))))$
        ]
      ]
    ]
    Entonces el siguiente procedimiento efectivo $PP$ enumera a $S$
    #align(center)[
      #box()[
        #align(left)[
          Sea $x in omega$
          \ ~ ~ ~ Etapa 1  \
          Realizar $PP_1$ con la entrada $x$ para obtener como salida a un $(arrow(x), arrow(alpha)) in #omega_sigma_n_m$.
          \ ~ ~ ~ Etapa 2 \
          Realizar $PP_S$ con la entrada $(arrow(x), arrow(alpha))$ para obtener como salida un booleano $e$.
          \ ~ ~ ~ Etapa 3 \
          Si $e = 1$, entonces detenerse y dar como dato de salida $(arrow(x), arrow(alpha))$. \
          Si $e = 0$, entonces detenerse y dar como dato de salida $(arrow(z), arrow(gamma))$.
        ]
      ]
    ]
    y por ello *$S$ es #sigmaa.efectivamente.enumerable*. #fin_demo
  ],
)

#pagebreak()

#proofStructure(
  2,
  [*Teorema* (Caracterización de conjuntos #sigmaa.recursivamente.enumerable) <combo-6.2>],
  [
    \ Dado $S c= #omega_sigma_n_m$. Son equivalentes \
    #box(width: 92%)[
      #set enum(numbering: "(1)", indent: 12.8pt)
      + $S$ es #sigmaa.recursivamente.enumerable.
      + $S = I_F$, para alguna $F: D_F c= omega^k X #sigmaa.est^l -> #omega_sigma_n_m$ tal que cada $F_((i))$ es #sigmaa.recursiva.
      + $S = D_f$, para alguna función #sigmaa.recursiva $f$.
    ]
  ],
  note: [haga solo la prueba $(2) ==> (3)$, caso $k=l=1$ y $n=m=2$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#equivalencias-r.e.",
  [
    #show math.equation.where(block: true): set block(above: 16.7pt, below: 16.7pt)
    #let omega_sigma_1_1 = $omega X #sigmaa.est$
    #let omega_sigma_2_2 = $omega^2 X #sigmaa.est^2$
    *$(2) ==> (3)$* \
    Haremos el caso $k=l=1$ y $n=m=2$, osea que $S c= #omega_sigma_2_2$ y $F: D_F c= #omega_sigma_1_1 -> #omega_sigma_2_2$ es tal que $I_F = S$ y $F_((1)), F_((2)), F_((3))$ y $F_((4))$ son #sigmaa.recursivas. \
    Gracias al #teorema_neumann_vence_godel, para cada $i in {1,2,3,4}$, las funciones $F_((i))$ son #sigmaa.computable, entonces por definición existen los programas $~P~_i$ que las computan. Sea $<=$ un orden total sobre $Sigma$. Definimos
    $
      H_i = lambda t x_1 alpha_1 [ not "Halt"^(1,1) (t, x_1, alpha_1, ~P~_i)] \
      #box(inset: (top: -6pt, bottom: 0pt))[
        #comentario[(te dice si el programa $~P~_i$ *no se detiene* partiendo de $(x_1, alpha_1)$ en *$t$ pasos*)]
      ]
    $
    Notar que $D_H_i = omega X #omega_sigma_1_1$ y $H_i$ es $sigmaa.mixta$.
    Además sabemos que $"Halt"^(1,1)$ es $(Sigma union Sigma_p)$-p.r, por lo tanto resulta fácil que $H_i$ es $(Sigma union Sigma_p)$-p.r.
    Entonces por el #teorema_independencia_del_alfabeto, $H_i$ es #sigmaa.pr, lo cual por el #segundo_manantial existen las macros
    $
      [med "IF" not H_i ("V2, V1, W1") "GOTO A1" med]
    $
    pero para usarlas de forma más intuitiva, las escribimos como
    $
      [med "IF" not "Halt"^(1,1) ("V2, V1, W1") "GOTO A1" med]
    $
    Luego para $i = 1,2$ definimos
    $
      E_i = lambda bold(x) t x_1 alpha_1 [bold(x) != E^(1,1)_(\# med 1) (t, x_1, alpha_1, ~P~_i)] \
      #box(inset: (top: -6pt, bottom: 0pt))[
        #comentario[(te dice si el programa $~P~_i$ en *$t$ pasos* devuelve $bold(x)$)]
      ]
    $
    Y para $i = 3,4$, definimos
    $
      E_i = lambda t x_1 alpha_1 bold(alpha) [bold(alpha) != E^(1,1)_(* med 1) (t, x_1, alpha_1, ~P~_i)] \
      #box(inset: (top: -6pt, bottom: 0pt))[
        #comentario[(te dice si el programa $~P~_i$ en *$t$ pasos* devuelve $bold(alpha)$)]
      ]
    $
    Notar que los predicados $E_i$ son $sigmaa.mixto$s.
    Además sabemos que $E^(1,1)_(\# med 1)$ y $E^(1,1)_(* med 1)$ son $(Sigma union Sigma_p)$-p.r, por lo tanto resulta fácil que los $E_i$ son $(Sigma union Sigma_p)$-p.r.
    Entonces por el #teorema_independencia_del_alfabeto, cada $E_i$ es #sigmaa.pr, lo cual por el #segundo_manantial existen las macros
    $
      [med "IF" E_i ("V2, V3, V1, W1") "GOTO A1" med]
      quad quad
      [med "IF" E_i ("V2, V1, W1, W2") "GOTO A1" med] \
      #box(inset: (top: -6pt, bottom: 0pt))[
        #comentario[(para $i=1,2$)]
      ]
      #h(5.5cm)
      #box(inset: (top: -6pt, bottom: 0pt))[
        #comentario[(para $i=3,4$)]
      ]
    $
    pero para usarlas de forma más intuitiva, las escribimos como
    $
      [med "IF" "V2" != E^(1,1)_(\# med 1) ("V3, V1, W1", ~P~_i) "GOTO A1" med]
      quad quad
      [med "IF" "W2" != E^(1,1)_(* med 1) ("V2, V1, W1", ~P~_i) "GOTO A1" med] \
      #box(inset: (top: -6pt, bottom: 0pt))[
        #comentario[(para $i=1,2$)]
      ]
      #h(6.5cm)
      #box(inset: (top: -6pt, bottom: 0pt))[
        #comentario[(para $i=3,4$)]
      ]
    $
    Ahora ya que las funciones $f_1 = lambda x [ (x)_1 ], f_2 = lambda x [ (x)_2 ]$ y $f_3 = compose lambda x [ *<(med (x)_3 med) ]$ son #sigmaa.pr, por el #segundo_manantial existen las macros
    $
      [med "V2" <- f_1("V1") med] quad [med "V2" <- f_2("V1") med] quad [med "P1" <- f_3("V1") med]
    $
    pero para usarlas de forma más intuitiva, las escribimos como
    $
      [med "V2" <- ("V1")_(1) med] quad [med "V2" <- ("V1")_(2) med] quad [med "P1" <- *< ("V1")_(3) med]
    $
    Ahora sí, sea $~P~$ el siguiente programa de #SSigma
    #show math.equation.where(block: true): set par(leading: 0.55em)
    $
      "L1" quad & "N20" <- "N20" + 1 \
                & [med "N10" <- ("N20")_1 med] \
                & [med "N3" <- ("N20")_2 med] \
                & [med "P3" <- *<("N20")_3 med] \
                & [med "IF" not "Halt"^(1,1) ("N10", "N3", "P3", ~P~_1) "GOTO L1" med] \
                & [med "IF" not "Halt"^(1,1) ("N10", "N3", "P3", ~P~_2) "GOTO L1" med] \
                & [med "IF" not "Halt"^(1,1) ("N10", "N3", "P3", ~P~_3) "GOTO L1" med] \
                & [med "IF" not "Halt"^(1,1) ("N10", "N3", "P3", ~P~_4) "GOTO L1" med] \
                & [med "IF" "N1" != "E"^(1,1)_(\# med 1) ("N10", "N3", "P3", ~P~_1) "GOTO L1" med] \
                & [med "IF" "N2" != "E"^(1,1)_(\# med 1) ("N10", "N3", "P3", ~P~_2) "GOTO L1" med] \
                & [med "IF" "P1" != "E"^(1,1)_(* med 1) ("N10", "N3", "P3", ~P~_3) "GOTO L1" med] \
                & [med "IF" "P2" != "E"^(1,1)_(* med 1) ("N10", "N3", "P3", ~P~_4) "GOTO L1" med] \
    $
    es fácil entender el programa si lo ves por partes y teniendo en cuenta que toma como entrada $(x_1, x_2, alpha_1, alpha_2)$\
    #box(inset: (top: 3pt, bottom: 3pt))[
      - La línea 1 incrementa N20 para generar nuevos candidatos.
      - Las líneas 2, 3 y 4 decodifican N20 generando candidatos $t$ (cantidad de pasos), $y_1$ y $gamma_1$ para la entrada de los $F_((i))$.
      - Las líneas del 5 al 8 verifican si $F_((1))$, $F_((2))$, $F_((3))$ y $F_((4))$ se detienen en $t$ pasos, con la entrada $(y_1, gamma_1)$.
      - Las líneas del 9 al 12 verifican si $F_((1))$, $F_((2))$, $F_((3))$ y $F_((4))$ devuelven $x_1, x_2, alpha_1$ y $alpha_2$ respectivamente.
      - Si alguna verificación *no* es cierta, se vuelve a la línea 1 y repite el proceso con nuevos candidatos.
    ]
    Finalmente, como $F = [F_((1)), F_((2)), F_((3)), F_((4))]$ y $I_F = S$, $~P~$ se detiene sólo cuando $(x_1, x_2, alpha_1, alpha_2) in S$. \
    Sabiendo esto, es fácil ver que computa la función $p^(2,2)_1|_S$. Entonces, listo porque $p^(2,2)_1|_S$ es #sigmaa.computable, por lo cual es #sigmaa.recursiva por el #teorema_godel_vence_neumann y trivialmente $D_(p^(2,2)_1|_S) = S$. #fin_demo
  ],
)

#pagebreak()

#combo_title(7)

#proofStructure(
  1,
  [*Lema* (Lema de minimización acotada)],
  [
    \ Sean $n,m >= 0$. Sea $P: D_P c= omega X #omega_sigma_n_m -> omega$ un predicado #sigmaa.pr Entonces \
    #box(width: 92%)[
      #set enum(numbering: "(a)", indent: 12.8pt)
      + $M(P)$ es #sigmaa.recursiva.
      + Si hay una función #sigmaa.pr $f: #omega_sigma_n_m$ tal que \
        ~ $M(P) (x->, alpha->) = min_t P(t, x->, alpha->) <= f(x->, alpha->)$, para cada $(x->, alpha->) in D_(M(P))$ \
        entonces $M(P)$ es #sigmaa.pr
    ]
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#lema-de-minimizacion-acotada-de-variable-numerica-de-predicados-sigma-p.r.",
  [
    #show math.equation.where(block: true): set block(above: 16.549875pt, below: 16.549875pt)
    *$(a)$* #comentario[(Idea básica, hacer que $P$ sea #sigmaa.total y que siga siendo #sigmaa.pr)] \
    Definimos el siguiente predicado, que es #sigmaa.total y pone ceros donde $P$ no estaba definida
    $
      overline(P)= P union C^(1+n,m)_0|_((omega X #omega_sigma_n_m) - D_P)
    $
    Dado que $P$ es #sigmaa.pr, por la #proposicion_caracterización_conjuntos_pr, $D_P$ también. \ Entonces por el #lema_op_conjuntos_pr tengo que $(omega X #omega_sigma_n_m) - D_P$ es #sigmaa.pr y por lo tanto, por el #lema_restriccion_dominios_pr, $C^(1+n,m)_0|_((omega X #omega_sigma_n_m) - D_P)$ también. Como trivialmente \ $D_P inter ((omega X #omega_sigma_n_m) - D_P) = emptyset$ por el #lema_division_por_casos_pr $overline(P)$ es #sigmaa.pr

    Ahora es fácil ver que $M(P) = M(overline(P))$ ya que la minimización está definida cuando el predicado es $1$. Osea
    $
      {t in omega: P(t,x->,alpha->) =1 } = {t in omega: overline(P)(t,x->,alpha->) =1 } \
    $
    Esto claramente dice que $D_(M(P)) = D_(M(overline(P)))$  y que $M(P) (x->, alpha->) = M(overline(P)) (x->, alpha->)$, para cada $(x->, alpha->) in D_(M(P))$, por lo cual $M(P) = M(overline(P))$. \
    Ahora sí con ver que $M(overline(P))$ es #sigmaa.recursiva, alcanza. Pero esto es fácil, porque si tomamos $k$ tal que  \ $overline(P) in "PR"_k^Sigma c= R_k^Sigma$ y como $overline(P)$ es #sigmaa.total, tenemos que $M(overline(P)) in R_(k+1)^Sigma$ y por lo tanto  $M(overline(P)) in R^Sigma$. \

    *$(b)$* \
    Ya que $M(P) = M(overline(P))$, basta probar que $M(overline(P))$ es #sigmaa.pr #comentario[(va a ser necesaria la "cota" que nos da $f$)] \
    Primero veremos que $D_(M(overline(P)))$ es un conjunto #sigmaa.pr Para ello notar que
    $
      chi_(D_(M(overline(P))))^(#omega_sigma_n_m) = lambda x-> alpha-> [ (exists t in omega)_(t<= bold(f(x->,alpha->))) med overline(P)(t, x->, alpha->) ]
    $
    lo cual nos dice que
    $
      chi_(D_(M(overline(P))))^(#omega_sigma_n_m) = lambda x x-> alpha-> [ (exists t in omega)_(t<= x) med overline(P)(t, x->, alpha->) ] compose [bold(f), p_1^(n,m),dots,p_(n+m)^(n,m)]
    $
    Pero dado que $overline(P)$ es #sigmaa.pr, por el #link(<lema-7.1-cuantificación-acotada>)[_Lema de cuantificación acotada_], nos dice que $lambda x x-> alpha-> [ (exists t in omega)_(t<= x) med overline(P)(t, x->, alpha->) ]$ es #sigmaa.pr y como $bold(f)$ es #sigmaa.pr tengo que $chi_(D_(M(overline(P))))^(#omega_sigma_n_m)$ también.
    Ahora definamos un predicado que será muy útil
    $
      P_1 = lambda t x-> alpha-> [ overline(P) (t,x->,alpha->) quad and quad (forall j in omega)_(j<=t) med j = t or not overline(P)(j, x->, alpha->) ] \
      #box(inset: (top: -3pt, bottom: 0pt))[
        #comentario[(Te dice si para los *$<$ a $t$* *no se cumple* $overline(P)$ y para *$t$ si se cumple*)]
      ]
    $
    Veamos además que es #sigmaa.pr Si defino $Q = lambda j t x-> alpha-> [j = t or not overline(P)(j, x->, alpha->)]$ que claramente es #sigmaa.pr por el #lema_op_predicados_pr. Por el #link(<lema-7.1-cuantificación-acotada>)[_Lema de cuantificación acotada_], tengo que $lambda t x-> alpha-> [ (forall j in omega)_(j<=t) med Q(j, t, x->, alpha->) ]$ es #sigmaa.pr Pero notar que $P_1 = lambda t x-> alpha-> [ overline(P) (t,x->,alpha->) quad and quad (forall j in omega)_(j<=t) med Q(j, t, x->, alpha->) ]$ entonces nuevamente por el #lema_op_predicados_pr,  $P_1$ es #sigmaa.pr

    Notar además que $P_1$ es #sigmaa.total y
    $
      P_1 (t, x->, alpha->) = 1 quad"si y solo si"quad (x->, alpha->) in D_(M(overline(P))) med"y"med med t = M(overline(P))(x->, alpha->)
    $
    Esto nos dice que
    $
      M(overline(P)) = ( lambda x-> alpha-> [product_(t=0)^(bold(f(x->,alpha->))) med t^(P_1 (t,x->,alpha->))]) |_(D_(M(overline(P)))) \
      #box(inset: (top: -3pt, bottom: 0pt))[
        #comentario[(como $t^0 = 1$, $t^1 = t$ y un solo $t$ va a cumplir $P_1$ entonces queda $1 times dots times 1 times t times 1 dots = t$)]
      ]
    $
    por lo cual para probar que $M(overline(P))$ es #sigmaa.pr, basta probar que
    $
      F = lambda x-> alpha-> [ product_(t=0)^(bold(f(x->,alpha->))) med t^(P_1 (t,x->,alpha->))] \
    $
    lo es, pero
    $
      F = lambda x y x-> alpha-> [ product_(t=x)^y med t^(P_1 (t,x->,alpha->))] compose [C_0^(n,m),bold(f), p_1^(n,m),dots,p_(n+m)^(n,m)] \
    $
    y por lo tanto el #lema_sumatoria nos dice que $F$ es #sigmaa.pr, por lo cual $M(overline(P)) = M(P)$ es #sigmaa.pr #fin_demo

    #linea_dashed

    #par()[
      _Lema (Lema de cuantificación acotada) :_ \
      Sea $Sigma$ un alfabeto finito. Sea $P: S X S_1 X dots X S_n X L_1 X dots X L_m -> omega$ un predicado #sigmaa.pr, con $S, S_1,dots,S_n c= omega$ y $L_1,dots,L_m c= #sigmaa.est$ no vacíos.
      Supongamos $overline(S) c= S$ es #sigmaa.pr \ Entonces $lambda x x-> alpha-> [ (exists t in overline(S))#text(size: 9pt, baseline: 3pt)[$(t<=x)$] med P(t, x->, alpha->) ]$ es #sigmaa.pr #comentario[(Cambiar $forall$ por $exists$ y es el #link(<combo-5>)[Combo 5.2] o el Lema 23 de la guía 5)]
    ] <lema-7.1-cuantificación-acotada>
  ],
)

#pagebreak()

#proofStructure(
  2,
  [*Lema* <combo-7.2>],
  [
    \ Supongamos $f: D_f c= #omega_sigma_n_m -> O$ es #sigmaa.recursiva, $O = {omega, #sigmaa.est}$ y $S c= D_f$ es #sigmaa.recursivamente.enumerable entonces $f|_S$ es #sigmaa.recursiva.
  ],
  note: [haga solo el caso $S$ no vacío, $n=m=1$ y $O = #sigmaa.est$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#restriccion1",
  [
    #let omega_sigma_1_1 = $omega X #sigmaa.est$
    Haremos el caso $n=m=1$ y $O = #sigmaa.est$, osea que
    $f: D_f c= #omega_sigma_1_1 -> #sigmaa.est$. \
    Como $S$ es #sigmaa.recursivamente.enumerable tenemos que hay una función $F: omega -> #omega_sigma_1_1$ tal que  $I_F = S$ y $F_((1))$ y $F_((2))$ son #sigmaa.recursivas. Además $f$ también, entonces por el #segundo_manantial, existen las macros
    $
      [med "W2" <- f("V1", "W1") med]
      quad
      [med "V2" <- F_((1)) ("V1") med]
      quad
      [med "W2" <- F_((2)) ("V1") med]
    $
    Y como $D = lambda x y [x != y]$ y $D' = lambda alpha beta [alpha != beta]$ son #sigmaa.pr Por el #segundo_manantial, existen las macros
    $
      [med "IF" D("V1", "V2") "GOTO A1" med]
      quad
      [med "IF" D'("W1", "W2") "GOTO A1" med]
    $
    pero para usarlas de forma más intuitiva, las escribimos como
    $
      [med "IF" "V1" != "V2" "GOTO A1" med]
      quad
      [med "IF" "W1" != "W2" "GOTO A1" med]
    $
    Ahora sí, sea $~P~$ el siguiente programa de #SSigma #comentario[(donde $"N10" = 0$ al iniciar)]
    #show math.equation.where(block: true): set par(leading: 0.55em)
    $
      "L1" quad & [med "N2" <- F_((1)) ("N10") med] \
                & [med "P2" <- F_((2)) ("N10") med] \
                & [med "IF" "N1" != "N2" "GOTO L2" med] \
                & [med "IF" "P1" != "P2" "GOTO L2" med] \
                & [med "P1" <- f("N1", "P1") med] \
                & "GOTO L3" \
      "L2" quad & "N10" <- "N10"+ 1 \
                & "GOTO L1" \
      "L3" quad & "SKIP" \
    $
    el cual es fácil ver que $~P~$ computa $f|_S$.
    Ya que, si analizamos por líneas
    #block()[
      - Las *líneas 1* y 2 generan un elemento $(y, beta) in S$.
      - Las líneas 3 y 4 comparan el input $(x,alpha)$ con $(y, beta)$.
        - Si son iguales, esto implicaría que $(x,alpha) in S$. Por eso calculamos $f(x,alpha)$ y lo retornamos.
        - Si no son iguales, se incrementa la variable para generar y se vuelve a la *línea 1* para generar un nuevo $(y, beta) in S$.
    ]
    Notar que si $(x,alpha) in.not S$, entonces $~P~$ no se detiene porque la comparación *nunca* va a dar igual. Entonces así $~P~$ computa $f|_S$, por lo tanto es #sigmaa.computable y por el #teorema_godel_vence_neumann *es #sigmaa.recursiva.*~ #fin_demo
  ],
)

#pagebreak()

#combo_title(8)

#proofStructure(
  1,
  [*Lema*],
  [
    Supongamos que $Sigma supset.eq Sigma_p$. Entonces $"AutoHalt"^Sigma$ no es #sigmaa.recursivo.
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#el-halting-problem-y-los-conjuntos-a-y-n",
  [
    #show math.equation.where(block: true): set block(above: 16pt, below: 16pt)
    Lo vamos a demostrar por el absurdo, entonces supongamos que $"AutoHalt"^Sigma$ *sí es #sigmaa.recursivo*. \
    Por el #segundo_manantial tenemos que hay un macro
    $
      [med "IF" "AutoHalt"^Sigma ("W1") "GOTO A1" med]
    $
    Sea $~P~_0$ el siguiente programa de #SSigma
    $
      "L1" quad [med "IF" "AutoHalt"^Sigma ("P1") "GOTO L1" med]
    $
    Notar que por definición de $"AutoHalt"^Sigma$ sabemos que para cada $~P~ in #SSigma$ se cumple que
    #align(center)[
      $"AutoHalt"^Sigma (~P~) = 1$ sii $~P~$ se detiene partiendo del estado $||~P~||$.
    ]
    pero por otra parte
    #align(center, block(above: 8pt)[
      $"AutoHalt"^Sigma (~P~_0) = 0$ sii $~P~_0$ se detiene partiendo del estado $||~P~_0||$
    ])
    Estas dos afirmaciones se contradicen y el absurdo viene de que supusimos que $"AutoHalt"^Sigma$ sí es #sigmaa.recursivo. #fin_demo \
    #comentario[
      Otra forma de decir lo mismo, es que si corremos $~P~_0$ partiendo de $||~P~_0||$, tenemos dos posibilidades \
      - $"AutoHalt"^Sigma (~P~_0) = 0$, osea que se sale del $"IF"$ y *$~P~_0$ termina*, por lo tanto $"AutoHalt"^Sigma (~P~_0) = 1$. Absurdo.
      - $"AutoHalt"^Sigma (~P~_0) = 1$, osea entra en bucle y *$~P~_0$ no termina*, por lo tanto $"AutoHalt"^Sigma (~P~_0) = 0$. Absurdo.
    ]
  ],
)

#proofStructure(
  2,
  [*Teorema*],
  [
    Supongamos que $Sigma supset.eq Sigma_p$. Entonces $"AutoHalt"^Sigma$ no es #sigmaa.efectivamente.computable. Es decir, no hay ningún procedimiento efectivo que decida si un programa de #SSigma termina partiendo de sí mismo.
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#autohalt%20es%20no%20EC",
  [
    Si $"AutoHalt"^Sigma$ fuera #sigmaa.efectivamente.computable, la  _Tesis de Church_ nos diría que es #sigmaa.recursivo, contradiciendo el Lema anterior. ~ _Tesis de Church :  "Toda función #sigmaa.efectivamente.computable es #sigmaa.recursiva."_~ #fin_demo
  ],
)

#proofStructure(
  3,
  [*Lema*],
  [
    Supongamos que $Sigma supset.eq Sigma_p$.\
    Entonces
    $quad A = { ~P~ in #ProSigma: "AutoHalt"^Sigma (~P~) = 1 } quad$
    es #sigmaa.recursivamente.enumerable y no #sigmaa.recursivo. \
    Más aún
    $quad N = { ~P~ in #ProSigma: "AutoHalt"^Sigma (~P~) = 0 } quad$
    no es #sigmaa.recursivamente.enumerable.
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#A%20es%20RE%20y%20no%20R",
  [
    Sea $P = lambda t ~P~ ["Halt"^(0,1) (t, ~P~, ~P~)]$ #footnote[
      Recordar que $"Halt"^(n,m) = lambda t x-> alpha-> ~P~ [ i^(n,m) (t, x->, alpha->, ~P~) = n(~P~) + 1]$, osea te dice si $~P~$ con entrada $||x->, alpha->||$ luego de $t$ pasos terminó.
    ]. Notar que $P$ es #sigmaa.pr (porque $Sigma supset.eq Sigma_p$) y por lo tanto $M(P)$ es #sigmaa.recursiva. Además, recordar que se definió $"AutoHalt"^Sigma = lambda ~P~ [(exists t in omega) med "Halt"^(0,1) (t, ~P~, ~P~) = 1]$, entonces
    $
      D_(M(P)) = { ~P~ in #ProSigma: (exists t in omega) med P(t, ~P~) = 1 } = { ~P~ in #ProSigma: "AutoHalt"^Sigma (~P~) = 1 } = A
    $
    Pero por la _Caracterización de conjuntos #sigmaa.re _(dada en el #link(<combo-6.2>)[_Combo 6.2_]) que entre otras cosas dice: un conjunto es #sigmaa.re sii es el dominio de alguna función #sigmaa.re. Entonces como $D_(M(P)) = A$ tenemos que *$A$ sí es #sigmaa.re* \
    Supongamos ahora que $N$ es #sigmaa.re. Entonces por el _Lema de restricción de dominios de funciones #sigmaa.r _ (dado en el #link(<combo-7.2>)[_Combo 7.2_]) la función $C^(0,1)_0 |_N$ es #sigmaa.recursiva ya que $C^(0,1)_0$ lo es. Análogamente como $A$ es #sigmaa.re, también lo es $C^(0,1)_1 |_A$.
    \
    \
    \
    Ahora sí, ya que
    $
      "AutoHalt"^Sigma = C^(0,1)_1 |_A union C^(0,1)_0 |_N quad , quad A union N = #ProSigma quad y quad A inter N = emptyset
    $
    por el #lema_division_por_casos_recursivas tenemos que $"AutoHalt"^Sigma$ es #sigmaa.recursiva, lo cual contradice el Lema anterior. Esto prueba que *$N$ no es #sigmaa.re* \
    Finalmente, supongamos que $A$ es #sigmaa.recursivo. Entonces el conjunto
    $quad quad N = (#sigmaa.est - A) inter #ProSigma quad quad$
    debería serlo, lo cual es absurdo por lo visto anteriormente. Por lo tanto *$A$ no es #sigmaa.recursivo*. #fin_demo
  ],
)

#proofStructure(
  4,
  [*Teorema* (Neumann vence a Gödel) <combo-8.4>],
  [
    Si una función $h$ es #sigmaa.recursiva, entonces $h$ es #sigmaa.computable.
  ],
  note: [en la inducción, hacer solo el caso $h=M(P)$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#neumann-vence-a-godel",
  [
    #let RSigma_k = $R^Sigma_k$
    #let RSigma_k1 = $R^Sigma_(k+1)$
    Esto será probado por inducción en $k$, que _ si $h in #RSigma_k$, entonces h es #sigmaa.computable _. \
    El caso $k=0$ es fácil ya que $R_0 = "PR"_0$, entonces hay que hacer programas que computen \
    ${"Suc","Pred", C_0^(0,0), C_epsilon^(0,0)} union {d_a : a in Sigma} union {p_j^(n,m) : 1<=j<=n+m}$,
    los cuales son todos triviales
    #box(inset: (top: 6pt, bottom: 6pt))[
      #table(
        column-gutter: 12pt,
        align: center,
        columns: 6,
        stroke: (left: none, right: none, top: 0.2pt, bottom: 0.2pt),
        "Suc", "Pred", $C_0^(0,0)$, $C_epsilon^(0,0)$, $d_a$, $p_j^(n,m)$,
        $
          "N"1 <- "N"1 + 1
        $,
        $
               & "IF N1" != "0 GOTO L2" \
          "L1" & "GOTO L1" \
          "L2" & "N1" <- "N"1 #menos_punto 1
        $,
        $
          "N"1 <- 0
        $,
        $
          "P"1 <- epsilon
        $,
        $
          "P"1 <- "P"1.a
        $,
        $
          "N"1 <- "N"overline(j) \
          o \
          "P"1 <- "P"overline(j)
        $,
      )
    ]
    Supongamos que la propiedad se cumple para un $k$ fijo y veamos que se cumple también para $h in #RSigma_k1$. \
    Hay varios casos. Veamos el caso donde $h = M(P)$, con $P : omega X #omega_sigma_n_m -> omega$, un predicado en #RSigma_k. \ Por hipótesis inductiva $P$ es #sigmaa.computable, osea que por el #primer_manantial existe el macro
    $
      [med "IF" P("V1",dots,"V"overline(n+1),"W1",dots,"W"overline(m)) "GOTO A1" med]
    $

    El cual nos permite realizar el siguiente programa $~P~$ de #SSigma
    #show math.equation.where(block: true): set par(leading: 0.55em)
    $
      "L1" quad & [med "IF" P("N"overline(n+1),"N1",dots,"N"overline(n),"P1",dots,"P"overline(m)) "GOTO L2" med] \
                & "N"overline(n+1) <- "N"overline(n+1) + 1 \
                & "GOTO L1" \
      "L2" quad & "N1" <- "N"overline(n+1) \
    $
    que es fácil ver que computa $M(P)$. Supongamos que $~P~$ inicia de un estado $||x->,alpha->||$, entonces hay dos casos
    #block()[
      - Si $(x->,alpha->) in.not D_(M(P))$, entonces el predicado $P$ nunca va a ser $1$, incluso al incrementar $"N"overline(n+1)$, por lo tanto $~P~$ nunca se va a detener.
      - Si $(x->,alpha->) in D_(M(P))$, entonces eventualmente $P$ va a ser $1$. Como además $"N"overline(n+1)$ inicia en $0$ e incrementa de a $1$, cuando $P$ valga $1$ entonces va a retornar el mínimo valor, osea $M(P) (x->,alpha->)$.
    ]
    Por esto $~P~$ computa $M(P)$ y por lo tanto *$M(P)$ es #sigmaa.computable*. #fin_demo
  ],
)

#pagebreak()

#combo_title(9)

#proofStructure(
  1,
  [*Lema* (Lema división por casos para funciones #sigmaa.recursivas) <combo-9.1>],
  [
    \ Supongamos $f_i : D_f_i c= #omega_sigma_n_m -> O, i=1,dots,k$ son #sigmaa.recursivas. Tales que $D_f_i inter D_f_j = emptyset$ para cada $i!=j$. Entonces la función $f_1 union dots union f_k$ es #sigmaa.recursiva.
  ],
  note: [ haga el caso $k=2$, $n=m=1$ y $O = omega$],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#lema-de-division-por-casos-para-funciones-sigma-recursivas",
  [
    #let omega_sigma_1_1 = $omega X #sigmaa.est$
    Haremos el caso $k=2$, $n=m=1$ y $O = omega$. Osea que tenemos $f_i: D_f_i c= #omega_sigma_1_1 -> omega$ con $i=1,2$. \
    Por el #teorema_neumann_vence_godel las funciones son #sigmaa.computables, osea que existen los programas $~P~_1$ y $~P~_2$ tales que las computan respectivamente. Entonces para $i=1,2$ definamos
    $
      H_i = lambda t x_1 alpha_1 [ "Halt"^(1,1) (t, x_1, alpha_1, ~P~_i)] med \
      #box(inset: (top: -3pt, bottom: 0pt))[
        #comentario[(Te dice si en $t$ pasos el programa $~P~_i$ con entrada $||x_1, alpha_1||$ termina)]
      ]
    $
    notar que $D_H_i = omega X #omega_sigma_1_1$ y que $H_i$ es #sigmaa.mixta. Además sabemos que $"Halt"^(1,1)$ es $(Sigma union Sigma_p)$-pr. Entonces por el #teorema_independencia_del_alfabeto, $H_i$ es #sigmaa.pr y por el #segundo_manantial existen las macros
    $
      [med "IF" H_i ("V1", "V2", "W1") "GOTO A1" med]
    $
    pero para usarla de forma más intuitiva, la escribimos como
    $
      [med "IF Halt"^(1,1) ("V1", "V2", "W1", ~P~_i) "GOTO A1" med]
    $
    Luego ya que cada $f_i$ es #sigmaa.computable, por el #primer_manantial existen las macros
    $
      [med "V2" <- f_1("V1", "W1") med]
      quad
      [med "V2" <- f_2("V1", "W1") med]
    $
    Con todo esto definimos el siguiente programa $~P~$ de #SSigma
    #show math.equation.where(block: true): set par(leading: 0.55em)
    $
      "L1" quad & "N10" <- "N10" + 1 \
                & [med "IF Halt"^(1,1) ("N10", "N1", "P1", ~P~_1) "GOTO L2" med] \
                & [med "IF Halt"^(1,1) ("N10", "N1", "P1", ~P~_2) "GOTO L3" med] \
                & "GOTO L1" \
      "L2" quad & [med "N1" <- f_1("N1", "P1") med] \
                & "GOTO L4" \
      "L3" quad & [med "N1" <- f_2("N1", "P1") med] \
      "L4" quad & "SKIP" \
    $
    el cual claramente computa $f_1 union f_2$, ya que si corremos $~P~$ partiendo del estado $||x_1,alpha_1||$, tenemos dos casos
    #block()[
      - $(x_1,alpha_1) in D_(f_1 union f_2)$, entonces en alguna cantidad de pasos se va cumplir alguno de los dos $"IF"$ #comentario[(nunca ambos ya que $D_f_1 inter D_f_2 = emptyset$)] y se va a detener retornando $f_1(x_1,alpha_1)$ o $f_2(x_1,alpha_1)$, según corresponda.
      - $(x_1,alpha_1) in.not D_(f_1 union f_2)$, entonces nunca se van a cumplir los $"IF"$, por lo tanto $~P~$ nunca va a detenerse.
    ]
    por lo tanto *$f_1 union f_2$ es #sigmaa.computable.* #fin_demo
  ],
)

#pagebreak()

#proofStructure(
  2,
  [*Teorema* (Gödel vence a Neumann) <combo-9.2>],
  [
    \ Si $f: D_f c= #omega_sigma_n_m -> omega$ es #sigmaa.computable, entonces $f$ es #sigmaa.recursiva.
  ],
  link_apunte: "https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#godel-vence-a-neumann-1",
  [
    Sea $~P~_0$ un programa que compute a $f$.
    Primero veamos que $f$ es $(Sigma union Sigma_p)$-recursiva. Notar que
    #let Enm = $E_(\# med 1)^(n,m)$
    #let Tnm = $T^(n,m)$
    #let pnm = $p^(n,m)$
    #let CnmP = $C^(n,m)_(~P~_0)$
    #footnote[
      #align(center)[
        #block(below: 0pt, above: 0pt)[
          #text(size: 10pt)[
            $
              f = underbrace(Enm, "resultado de N1, importante (#)") compose [underbrace(Tnm compose [pnm_1,dots,pnm_(n+m), CnmP ], "cantidad de pasos para que termine") med , med underbrace(pnm_1"," dots"," pnm_(n+m), "input"), underbrace(CnmP, "programa") ] \
            $
          ]
        ]
      ]
    ]
    $
      f = Enm compose [Tnm compose [pnm_1,dots,pnm_(n+m), CnmP ], med , med pnm_1, dots, pnm_(n+m), CnmP] \
    $
    donde $pnm_1,dots,pnm_(n+m)$ y $CnmP$ son respecto al alfabeto $Sigma union Sigma_p$, es decir, tienen dominio $omega^n X (Sigma union Sigma_p)^(*m)$. Esto nos dice que $f$ es $(Sigma union Sigma_p)$-recursiva. Osea que el #teorema_independencia_del_alfabeto nos dice que *$f$ es #sigmaa.recursiva*. #fin_demo
  ],
)

#pagebreak()

#page(margin: (top: 1.45cm, bottom: 0pt, left: 1.2cm, right: 1.2cm))[

  == Resultados Muy Usados en las Demostraciones

  #text(
    size: 10.2pt,
  )[
    Las *$(star)$* indican que son un combo y el *[ n ]* es la cantidad de veces que se mencionó el resultado (incluso en una misma demo).
  ]

  #table(
    inset: (top: 0pt),
    columns: 2,
    stroke: none,
    [
      #statementsStructure(
        padding_left: 5pt,
        padding_bottom: -10pt,
        [Lema (Operaciones con Predicados #sigmaa.pr) <lema-op-predicados-pr>],
        frequency: [
          #counter(<lema-op-predicados-pr>).update(c => c - 1)
          #context { counter(<lema-op-predicados-pr>).display() }
        ],
        [
          #set text(size: 10.2pt)
          Si $P: S c= #omega_sigma_n_m -> omega$ y $Q: S c= #omega_sigma_n_m -> omega$ son predicados #sigmaa.pr, entonces $P and Q, P or Q$ y $not P$ también.
        ],
      )
    ],
    [
      #statementsStructure(
        padding_left: 5pt,
        padding_bottom: -10pt,
        [Lema (Operaciones con Conjuntos #sigmaa.pr)   <lema-op-conjuntos-pr>],
        frequency: [
          #counter(<lema-op-conjuntos-pr>).update(c => c - 1)
          #context { counter(<lema-op-conjuntos-pr>).display() }
        ],
        [
          Si $S_1,S_2 c= #omega_sigma_n_m$ son #sigmaa.pr, entonces \ $S_1 union S_2 med , med S_1 inter S_2$ y $S_1 - S_2$ son #sigmaa.pr
        ],
      )
    ],
  )
  <lema-restricción-dominios-pr>
  #statementsStructure(
    [Lema (Restricción de Dominios #sigmaa.pr)],
    frequency: [
      #counter(<lema-restricción-dominios-pr>).update(c => c - 1)
      #context { counter(<lema-restricción-dominios-pr>).display() }
    ],
    [
      Supongamos $f: D_f c= #omega_sigma_n_m -> omega$ es #sigmaa.pr Si $S c= D_f$ es #sigmaa.pr, entonces $f |_S$ es #sigmaa.pr
    ],
  )

  <lema-caracterización-conjuntos-rectangulares-pr>
  #statementsStructure(
    [Lema (Caracterización de Conjuntos Rectangulares #sigmaa.pr)],
    frequency: [
      #counter(<lema-caracterización-conjuntos-rectangulares-pr>).update(c => c - 1)
      #context { counter(<lema-caracterización-conjuntos-rectangulares-pr>).display() }
    ],
    [
      Supongamos $S_1,dots,S_n c= omega$ y $L_1,dots,L_m c= #sigmaa.est$ no vacíos. Entonces $S_1 X dots X S_n X L_1 X dots X L_m$ es #sigmaa.pr sii $S_1,dots,S_n,L_1,dots,L_m$ son #sigmaa.pr
    ],
  )

  <lema-sumatoria>
  #statementsStructure(
    [Lema (Lema de la Sumatoria)],
    note: [#link(<combo-4>)[*Combo 4.2*]],
    is_combo: true,
    frequency: [
      #counter(<lema-sumatoria>).update(c => c - 1)
      #context { counter(<lema-sumatoria>).display() }
    ],
    [
      Sea $Sigma$ un alfabeto finito. Si $f: omega X S_1 X dots X S_n X L_1 X dots X L_m -> omega$ es #sigmaa.pr, con  $S_1,dots,S_n c= omega$ y $L_1,dots,L_m c= #sigmaa.est$ no vacíos. Entonces $lambda x y x-> alpha-> [ product_(t=x)^(t=y) med f(t, x->, alpha->) ]$ es #sigmaa.pr
    ],
  )

  <prop-caracterización-conjuntos-pr>
  #statementsStructure(
    [Proposición (Caracterización de Conjuntos #sigmaa.pr)],
    note: [#link(<combo-1.1>)[*Combo 1.1*]],
    frequency: [
      #counter(<prop-caracterización-conjuntos-pr>).update(c => c - 1)
      #context { counter(<prop-caracterización-conjuntos-pr>).display() }
    ],
    is_combo: true,
    [
      Un conjunto $S$ es #sigmaa.pr sii $S$ es el dominio de alguna función #sigmaa.pr
    ],
  )

  #table(
    columns: 2,
    stroke: none,
    [
      #statementsStructure(
        padding_left: 23.87pt,
        [Proposición (Primer Manantial de Macros) <prop-primer-manantial-de-macros> ],
        frequency: [
          #counter(<prop-primer-manantial-de-macros>).update(c => c - 1)
          #context { counter(<prop-primer-manantial-de-macros>).display() }
        ],
        [
          #show math.equation.where(block: true): set block(above: 12pt, below: 12pt)
          Sea $Sigma$ un alfabeto finito. Si   \
          $
            f: D_f c= #omega_sigma_n_m -> omega \
            g: D_g c= #omega_sigma_n_m -> #sigmaa.est \
            P: D_P c= #omega_sigma_n_m -> {0,1} \
          $
          son *#sigmaa.computables*, entonces en #SSigma hay macros
          #show math.equation.where(block: true): set par(leading: 0.55em)
          $
            & [med "V"overline(n+1) <- f("V1",dots,"V"overline(n),"W1",dots,"W"overline(m)) med] \
            & [med "W"overline(m+1) <- f("V1",dots,"V"overline(n),"W1",dots,"W"overline(m)) med] \
            & [med "IF" P("V1",dots,"V"overline(n),"W1",dots,"W"overline(m)) "GOTO A1" med]
          $
        ],
      )
    ],
    [
      #statementsStructure(
        padding_left: 23.87pt,
        [Proposición (Segundo Manantial de Macros) <prop-Segundo-Manantial-de-Macros>],
        frequency: [
          #counter(<prop-Segundo-Manantial-de-Macros>).update(c => c - 1)
          #context { counter(<prop-Segundo-Manantial-de-Macros>).display() }
        ],
        [
          #show math.equation.where(block: true): set block(above: 12pt, below: 12pt)
          Sea $Sigma$ un alfabeto finito. Si   \
          $
            f: D_f c= #omega_sigma_n_m -> omega \
            g: D_g c= #omega_sigma_n_m -> #sigmaa.est \
            P: D_P c= #omega_sigma_n_m -> {0,1} \
          $
          son *#sigmaa.recursivas*, entonces en #SSigma hay macros
          #show math.equation.where(block: true): set par(leading: 0.55em)
          $
            & [med "V"overline(n+1) <- f("V1",dots,"V"overline(n),"W1",dots,"W"overline(m)) med] \
            & [med "W"overline(m+1) <- f("V1",dots,"V"overline(n),"W1",dots,"W"overline(m)) med] \
            & [med "IF" P("V1",dots,"V"overline(n),"W1",dots,"W"overline(m)) "GOTO A1" med]
          $
        ],
      )
    ],
  )

  <teo-independencia-del-alfabeto>
  #statementsStructure(
    padding_left: 5pt,
    padding_bottom: -8pt,
    [Teorema (Independencia del Alfabeto)],
    frequency: [
      #counter(<teo-independencia-del-alfabeto>).update(c => c - 1)
      #context { counter(<teo-independencia-del-alfabeto>).display() }
    ],
    [
      Sea $Sigma$ y $Gamma$ alfabetos cualquiera y $f$ una función $Sigma$-mixta y $Gamma$-mixta, entonces $f$ es $Sigma$-recursiva sii $f$ es $Gamma$-recursiva.
    ],
  )

  #table(
    columns: 2,
    stroke: none,
    [
      #statementsStructure(
        padding_left: 5pt,
        padding_bottom: -8pt,
        add_auto_spacing: false,
        [ Teorema (Neumann vence a Gödel) <teo-neumann-vence-godel>],
        note: [Combos #link(<combo-1.2>)[*1.2*] | #link(<combo-8.4>)[*8.4*] ],
        is_combo: true,
        [
          Si $h$ es #sigmaa.recursiva, entonces $h$ es #sigmaa.computable. #comentario[
            #counter(<teo-neumann-vence-godel>).update(c => c - 1)
            *[ #context { counter(<teo-neumann-vence-godel>).display() } ]*
          ]
        ],
      )
    ],
    [
      #statementsStructure(
        padding_left: 5pt,
        padding_bottom: -8pt,
        add_auto_spacing: false,
        [Teorema (Gödel vence a Neumann) <teo-godel-vence-neumann> ],
        note: [ Combos #link(<combo-3.1>)[*3.1*] | #link(<combo-9.2>)[*9.2*]],
        is_combo: true,
        [
          Si $h$ es #sigmaa.computable, entonces $h$ es #sigmaa.recursiva.  #comentario[
            #counter(<teo-godel-vence-neumann>).update(c => c - 1)
            *[ #context { counter(<teo-godel-vence-neumann>).display() } ]*
          ]
        ],
      )

    ],
  )

  <lema-division-por-casos-pr>
  #statementsStructure(
    [Lema (Lema de división por casos para funciones #sigmaa.pr)],
    note: [#link(<combo-2.1>)[*Combo 2.1*]],
    frequency: [
      #counter(<lema-division-por-casos-pr>).update(c => c - 1)
      #context { counter(<lema-division-por-casos-pr>).display() }
    ],
    is_combo: true,
    [
      Sea $O = {omega, #sigmaa.est}$ y $n,m,k in omega$. Supongamos $f_i : D_f_i c= #omega_sigma_n_m -> O, i=1,dots,k$ son *#sigmaa.pr* \ Tales que $D_f_i inter D_f_j = emptyset$ para cada $i!=j$. Entonces la función $f_1 union dots union f_k$ es *#sigmaa.pr*
    ],
  )

  <lema-division-por-casos-recursivas>
  #statementsStructure(
    [Lema (Lema de división por casos para funciones #sigmaa.recursivas)],
    note: [#link(<combo-9.1>)[*Combo 9.1*]],
    frequency: [
      #counter(<lema-division-por-casos-recursivas>).update(c => c - 1)
      #context { counter(<lema-division-por-casos-recursivas>).display() }
    ],
    is_combo: true,
    [
      Sea $O = {omega, #sigmaa.est}$ y $n,m,k in omega$. Supongamos $f_i : D_f_i c= #omega_sigma_n_m -> O, i=1,dots,k$ son *#sigmaa.recursivas*. \ Tales que $D_f_i inter D_f_j = emptyset$ para cada $i!=j$. Entonces la función $f_1 union dots union f_k$ es *#sigmaa.recursiva*.
    ],
  )
]

#pagebreak()

#text(
  size: 15pt,
)[Referencias de los Resultados Anteriores] #comentario[(Están acá para no sobrecargar la página anterior)]

#set enum(spacing: 15pt)

+ _Lema (Operaciones con Predicados #sigmaa.pr)_ es el lema 14 de la Guía 5.
+ _Lema (Operaciones con Conjuntos #sigmaa.pr)_ es el lema 15 de la Guía 5.
+ _Lema (Restricción de Dominios #sigmaa.pr)_ es el lema 17 de la Guía 5.
+ _Lema (Caracterización de Conjuntos Rectangulares #sigmaa.pr)_ es el lema 16 de la Guía 5.
+ _Lema (Lema de la Sumatoria)_ es el lema 22 de la Guía 5 y casi es el #link(<combo-4>)[*Combo 4.2*].
+ _Proposición (Caracterización de Conjuntos #sigmaa.pr)_ es la prop 19 de la Guía 5, del #link("https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#caract-dominios")[apunte la 4.4] y el #link(<combo-1.1>)[*Combo 1.1*].
+ _Proposición (Primer Manantial de Macros)_ es la proposición 5 de la Guía 7.
+ _Proposición (Segundo Manantial de Macros)_ es la proposición 2 de la Guía 8.
+ _Teorema (Independencia del Alfabeto)_ es el teorema #link("https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#independencia")[4.2 del apunte].
+ _Teorema (Neumann vence a Gödel)_ es el teorema 1 de la Guía 8, el #link(<combo-1.2>)[*Combo 1.2*] y el #link(<combo-8.4>)[*Combo 8.4*].
+ _Teorema (Gödel vence a Neumann)_ del #link("https://apunte-lenguajes-logica.netlify.app/4.4-batallas-entre-paradigmas#godel-vence-a-neumann-1")[apunte es el 4.3] y el #link(<combo-9.2>)[*Combo 9.2*].
+ _Lema (Lema de división por casos para funciones #sigmaa.pr)_ es el lema 4.18 del #link("https://apunte-lenguajes-logica.netlify.app/4.2-el-paradigma-de-godel-funciones-sigma-recursivas#lema-de-division-por-casos-para-funciones-sigma-p.r.")[apunte] y el #link(<combo-2.1>)[*Combo 2.1*].
+ _Lema (Lema de división por casos para funciones #sigmaa.recursivas)_ es el lema 4.56 del #link("https://apunte-lenguajes-logica.netlify.app/4.6-resultados-basicos-presentados-en-paradigma-recursivo#lema-de-division-por-casos-para-funciones-sigma-recursivas")[apunte] y el #link(<combo-9.1>)[*Combo 9.1*].
