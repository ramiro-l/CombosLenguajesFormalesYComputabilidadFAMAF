#import "../utils.typ": COMPLETAR, comentario, hiddenTitle, link_arrow
#import "const.typ": color_gray_block

#let statementsStructure(
  title,
  note: none,
  is_combo: false,
  frequency: none,
  content,
  padding_left: 20pt,
  padding_bottom: -5pt,
  add_auto_spacing: true,
) = {
  box(width: 100%, inset: (left: padding_left, right: 5pt, top: 6.8pt, bottom: 6.8pt), fill: color_gray_block)[
    _ #title _
    #if note != none { comentario[#if add_auto_spacing [~] (#note)] }
    #if frequency != none {
      comentario[#if add_auto_spacing [~] *[#frequency]*]
    }
    #if is_combo [ #h(1fr) #if add_auto_spacing [~] $(star)$]
  ]

  box(width: 100%, inset: (left: padding_left + 2pt, bottom: padding_bottom))[
    #if content == [] {
      COMPLETAR
    } else {
      content
    }
  ]
}
