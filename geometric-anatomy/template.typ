#import "@preview/ctheorems:1.1.3": *
#import "@preview/tablem:0.3.0": tablem, three-line-table

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#ffcc91"),
  stroke: rgb("#d67200") + 1pt,
)

#let definition = thmbox(
  "definition",
  "Definition",
  fill: rgb("#c0d2fc"),
  stroke: rgb("#275096") + 1pt,
)

#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong,
)

#let def_remark = thmplain(
  "remark",
  "Remark",
  base: "definition",
  titlefmt: strong,
)

#let thm_remark = thmplain(
  "remark",
  "Remark",
  base: "theorem",
  titlefmt: strong,
)

#let example = thmplain(
  "example",
  "Example",
  base: "theorem",
  titlefmt: strong,
)

#let proof = thmproof("proof", "Proof")

#let notes(
  notes_title: none,
  lecture_url: none,
  author: none,
  date_updated: none,
  doc,
) = {
  // Page settings
  set page(
    paper: "us-letter",
    numbering: "1/1",
    number-align: right,
    header: context {
      if counter(page).get().first() > 1 [
        #align(right + horizon, notes_title)
      ]
    },
  )

  // Paragraph settings
  set par(justify: true, leading: 0.55em)

  // Text settings
  set text(
    font: "Arial",
    size: 12pt,
  )
  // Heading settings
  set heading(numbering: "1.")

  // Link settings
  show link: it => text(fill: blue)[#it]

  // Quotation settings
  set quote(block: true)

  // Title and author block
  align(left)[
    #text(notes_title, size: 17pt, weight: "bold")
    #linebreak()
    #linebreak()
    Based on the lectures by Frederic Schuller
    #linebreak()
    Notes by: #author
    #linebreak()
    #link(lecture_url)[Lecture Playlist]
    #linebreak()
    Last updated: #date_updated
  ]

  outline()

  doc
}
