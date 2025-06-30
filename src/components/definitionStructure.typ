#import "../utils.typ": COMPLETAR, hiddenTitle, link_arrow
#import "const.typ": color_gray_block

#let definitionStructure(
  number,
  title,
  link_apunte: none,
  short_title: none,
  note: none,
  plural_def: false,
  def,
) = {
  box(width: 100%, inset: (left: 15pt, right: 15pt, top: 8pt, bottom: 8pt), fill: color_gray_block)[
    #if short_title != none {
      hiddenTitle([#short_title], level: 3)
    }

    #if note != none {
      stack(spacing: 8pt)[
        #par(hanging-indent: 16pt)[
          #box(inset: (right: 3pt))[*#number.*] #title
        ]
      ][
        #box(inset: (left: 15pt))[
          _Nota:_ #note
          #if link_apunte != none {
            h(1fr)
            link(link_apunte)[$⤷$]
          }
        ]
      ]
    } else {
      par(hanging-indent: 16pt)[
        #box(inset: (right: 3pt))[*#number.*] #title
        #if link_apunte != none {
          link_arrow(link_apunte, in_end: true)
        }
      ]
    }


  ]

  box(width: 100%, inset: (left: 30pt))[
    #stack(spacing: 8pt)[_Definición#if plural_def { "es" }:_][
      #if def == [] {
        COMPLETAR
      } else {
        def
      }
    ]
  ]
}
