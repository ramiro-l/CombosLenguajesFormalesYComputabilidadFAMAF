#import "@preview/hydra:0.6.0": hydra
#import "titlepage.typ": *
#import "../utils.typ" as short_cuts

// ===========================================
// Main Template Function: `basic-report`
// ===========================================

#let basic-report(
  doc-category: none,
  doc-title: none,
  author: none,
  affiliation: none,
  logo: none,
  language: "es",
  show-outline: true,
  show-date: false,
  format-date: "[day].[month].[year]",
  compact-mode: false,
  heading-color: black,
  heading-font: "Libertinus Serif",
  body,
) = {
  // =========================================
  // Global Parameters
  // =========================================
  set document(title: doc-title, author: author)
  set text(lang: language)

  set smartquote(quotes: "“”")

  let body-font = "Libertinus Serif"
  let body-size = 11pt

  // heading font is used in this size for kind of "information blocks"
  let info-size = 11pt

  // heading font is used in this size for different sorts of labels
  let label-size = 9pt

  let in-outline = state("in-outline", if compact-mode { false } else { true })


  // =======================================
  // Title Page
  // =======================================

  if (not compact-mode) {
    counter(page).update(0)
    titlepage(
      doc-category,
      doc-title,
      author,
      heading-font,
      heading-color,
      info-size,
      show-date,
      format-date: format-date,
    )
  }

  // =======================================
  // Basic Text- and Page-Setup
  // =======================================

  set text(font: body-font, size: body-size, fill: luma(50))

  set par(
    justify: true,
    leading: 0.75em,
    spacing: 1.65em,
  )

  set list(indent: 1.5em)

  set footnote.entry(
    clearance: 0em,
    indent: 0em,
  )


  set page(
    paper: "a4",
    margin: (top: 2cm, left: 1.5cm, right: 1.5cm, bottom: 2cm),
    header: context {
      if compact-mode and (counter(page).get().first() == 1) {
        none
      } else {
        grid(
          columns: (1fr, 1fr),
          align: (left, right),
          row-gutter: 0.5em,
          text(font: heading-font, size: label-size, context { hydra(1, use-last: false, skip-starting: false) }),
          text(font: heading-font, size: label-size, number-type: "lining", context {
            if in-outline.get() {
              counter(page).display("i")
            } else {
              counter(page).display("1")
            }
          }),
          grid.cell(colspan: 2, line(length: 100%, stroke: 0.5pt)),
        )
      }
    },
    header-ascent: 1.5em,
  )


  // ======================================
  // Headings and Numbering
  // ======================================

  set heading(numbering: none)
  show heading: set text(
    font: heading-font,
    fill: heading-color,
    weight: "regular",
    size: 1.6 * body-size, // default
  )

  show heading.where(level: 1): set text(size: 2 * body-size)
  show heading.where(level: 1): set text(weight: "semibold")


  show heading.where(level: 2): set text(size: 1.46 * body-size)


  set figure(numbering: "1")
  show figure.caption: it => {
    set text(font: heading-font, size: label-size)
    block(it)
  }

  // =========================================
  // Table of Contents
  // =========================================

  show outline: it => {
    in-outline.update(true)
    it
    in-outline.update(false)
  }

  show outline.entry.where(level: 1): it => {
    set block(above: 2 * body-size)
    set text(font: heading-font, weight: "bold", size: info-size)
    link(it.element.location(), it.indented(it.prefix(), it.body() + box(width: 1fr) + strong(it.page())))
  }

  show outline.entry.where(level: 2).or(outline.entry.where(level: 3)): it => {
    set block(above: 0.8 * body-size)
    set text(font: heading-font, size: info-size)
    link(it.element.location(), it.indented(
      it.prefix(),
      it.body() + "  " + box(width: 1fr, repeat([.], gap: 2pt)) + "  " + it.page(),
    ))
  }

  if (show-outline and not compact-mode) {
    outline(
      title: if language == "es" {
        "Contenido"
      } else {
        "Contents"
      },
      indent: auto,
    )
    counter(page).update(0)
  } else {
    in-outline.update(false)
    counter(page).update(1)
  }

  if (not compact-mode) {
    pagebreak()
  }

  // =========================================
  // Main Body
  // =========================================

  if compact-mode {
    compact-title(
      doc-category,
      doc-title,
      author,
      heading-font,
      heading-color,
      info-size,
      body-size,
      label-size,
      show-date,
      format-date,
    )
  }

  body
}
