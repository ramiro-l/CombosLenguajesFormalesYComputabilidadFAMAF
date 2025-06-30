// ===============================================
// Functions for TITLE PAGE and COMPACT TITLE
// ===============================================


// ========================================
// TITLE PAGE: `titlepage`
// ========================================

#let titlepage(
  doc-category,
  doc-title,
  author,
  heading-font,
  heading-color,
  info-size,
  show-date,
  format-date: "[day].[month].[year]",
) = {
  // ========================================
  // Page-Setup
  // ========================================

  set page(
    paper: "a4",
    margin: (top: 3cm, left: 3cm, right: 3cm, bottom: 4.5cm),
  )

  v(6cm) // = 4 x 1.5 cm

  // ========================================
  // Title Category & Title
  // ========================================

  align(
    left, // 1 x 14pt + 2 x 36pt ≈ 2 x 1.5 cm
    text(
      font: heading-font,
      weight: "regular",
      size: 14pt,
      doc-category,
    ),
  )

  text(
    font: heading-font,
    weight: "semibold",
    size: 34pt,
    fill: heading-color,
    doc-title,
  )

  // ========================================
  // Info Block
  // ========================================

  set par(leading: 1em)

  place(
    bottom + left,
    text(
      font: heading-font,
      weight: "regular",
      size: 12pt,
      fill: black,
      author // author.join(str("\n"))
        + str("\n")
        + (
          if show-date {
            datetime.today().display(format-date) + str("\n")
          } else {
            ""
          }
        ),
    ),
  )
}

// ========================================
// COMPACT TITLE: `compact-title`
// ========================================

#let compact-title(
  doc-category,
  doc-title,
  author,
  heading-font,
  heading-color,
  info-size,
  body-size,
  label-size,
  show-date,
) = {
  stack(
    v(1.5cm - 0.6cm), // 3.6cm top-margin -0.6cm + 1.5cm = 4.5cm
    box(
      height: 1.5cm,
      text(font: heading-font, size: 1 * body-size, top-edge: "ascender", doc-category),
    ),
    box(
      height: 4cm,
      par(
        leading: 0.5em,
        text(
          font: heading-font,
          weight: "bold",
          size: 2 * body-size,
          fill: luma(40%).mix(heading-color),
          top-edge: "ascender",
          hyphenate: false,
          doc-title,
        )
          + "\n\n",
      )
        + text(
          font: heading-font,
          size: label-size,
          author // author.join(str("\n"))
            + str("\n")
            + (
              if show-date {
                datetime.today().display(format-date) + str("\n")
              } else {
                ""
              }
            ),
        ),
    ),
  )
}
