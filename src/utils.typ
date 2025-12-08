#import "@preview/quick-maths:0.2.1": shorthands

#let add_shorthands = shorthands.with(
  ($c=$, $subset.eq$),
  ($Sigma*$, $Sigma^*$),
  ($w*$, $omega^*$),
  ($X$, $times$),
  ($x->$, $arrow(x)$),
  ($alpha->$, $arrow(alpha)$),
  ($s->$, $arrow(s)$),
  ($u->$, $arrow(u)$),
  ($sigma->$, $arrow(sigma)$),
  ($eta->$, $arrow(eta)$),
  ($<<$, $chevron.l$),
  ($>>$, $chevron.r$),
  ($|-n$, $tack^n$),
  ($|-*$, $tack^*$),
  ($!|-$, $tack.not$),
  ($|-$, math.tack),
  ($~G~$, $cal(G)$),
  ($~P~$, $cal(P)$),
  ($s<$, $s^(<=)$),
  ($*<$, $*^(<=)$),
  ($\#<$, $\#^(<=)$),
  ($M<$, $M^(<=)$),
)


#let sigmaa = (
  mixto: [$Sigma$-mixto],
  mixta: [$Sigma$-mixta],
  mixtas: [$Sigma$-mixtas],
  recursivo: [$Sigma$-recursivo],
  recursiva: [$Sigma$-recursiva],
  recursivas: [$Sigma$-recursivas],
  r: [$Sigma$-r.],
  recursivamente: (
    enumerable: [$Sigma$-recursivamente enumerable],
  ),
  re: [$Sigma$-r.e.],
  indexada: [$Sigma$-indexada],
  efectivamente: (
    computable: [$Sigma$-efectivamente computable],
    computables: [$Sigma$-efectivamente computables],
    enumerable: [$Sigma$-efectivamente enumerable],
  ),
  turing: (
    computable: [$Sigma$-Turing computable],
  ),
  computable: [$Sigma$-computable],
  computables: [$Sigma$-computables],
  enumerable: [$Sigma$-enumerable],
  enumerables: [$Sigma$-enumerables],
  est: [$Sigma^*$],
  est_m: [$Sigma^(*m)$],
  pr: [$Sigma$-p.r.],
  totales: [$Sigma$-totales],
  total: [$Sigma$-total],
)

#let SSigma = $S^Sigma$
#let InsSigma = $"Ins"^Sigma$
#let ProSigma = $"Pro"^Sigma$
#let menos_punto = $accent(-, dot.c)$
#let horquilla_n_m_num = $Psi_(~P~)^(n,m,\#)$
#let horquilla_n_m_est = $Psi_(~P~)^(n,m,*)$

#let omega_sigma_n_m = [$w^n X #sigmaa.est^m$]
#let conjuntos_omega = $S_1 , dots , S_n$
#let conjuntos_sigma = $L_1 , dots , L_m$
#let bloque_fijo_omega = $S_1 times dots times S_n$
#let bloque_fijo_sigma = $L_1 times dots times L_m$
#let bloque_fijo = $#bloque_fijo_omega times #bloque_fijo_sigma$
#let unit = text(size: 12pt, stroke: 0.1pt)[၊]
#let x_alpha_vector = $arrow(x), arrow(alpha)$
#let par_x_alpha_vector = $(#x_alpha_vector)$

#let text_floor(text) = $floor.l text floor.r$

#let i_nm = $i^(n,m)$
#let E_nm_num = $E_(\#)^(n,m)$
#let E_nm_est = $E_(*)^(n,m)$
#let E_nmj_num = $E_(\# j)^(n,m)$
#let E_nmj_est = $E_(* j)^(n,m)$
#let omega_floor_NN = $omega^#text_floor($NN$)$
#let sigma_floor_NN = $#sigmaa.est^#text_floor($NN$)$
#let Halt_nm = $italic("Halt")^(n,m)$
#let T_nm = $italic(T)^(n,m)$
#let AutoHalt = $italic("AutoHalt")^Sigma$

#let estrella = $#sym.ast.op$
#let fin_demo = [#h(1fr) #text(fill: luma(18%))[$qed$]]
#let linea_dashed = [ #line(length: 100%, stroke: (paint: luma(80%), thickness: 1pt, dash: "dashed"))]

#let text_center(str) = box(width: 100%)[#align(center)[#str]]
#let hiddenTitle(title, level: 1) = {
  show heading: none
  heading(level: level)[#title]
}
#let line_title(text, level: 2) = {
  heading(level: level)[#text]
  line(length: 100%)
}
#let combo_title(number, level: 2) = {
  line_title([Combo #number], level: level)
}
#let link_arrow(link_text, in_end: false) = {
  if in_end { h(1fr) }
  link(link_text)[
    #box(width: 12pt, height: 7pt)[$ ⤷ $]
  ]
}
#let COMPLETAR = {
  box(fill: yellow, inset: 3pt)[
    #text(size: 12pt, fill: black)[COMPLETAR ...]
  ]
}
#let comentario(content) = {
  text(fill: luma(45%), size: 10pt)[#content]
}

