#let format-date(date) = {
  /* formate date avec les mois français (car pas encore supporté nativement dans typst) */
  let months = ("janvier", "février", "mars", "avril", "mai", "juin", "juillet", "aout", "septembre", "octobre", "novembre", "décembre")
  date.display("[day] ") + months.at(date.month() - 1) + date.display(" [year]")
}

#let insa-report = (
  title: none, // titre du document
  date: none, // date du document, type: datetime
  authors: (), // liste des auteurs
  sub-authors: "4A ICY", // texte optionnel au dessus des auteurs ex : groupe 2, 4A ICY
  matiere: none, // matière du document ou texte en bas
  description: none, // description du document
  bib-yaml: none, // référence vers une bibliographie
  lang: "fr", // langue du document
  heading_numbering: false, // option de numérotation des titres
  theme: "blue-theme", // theme parmi pastel-theme, blue-theme, green-theme, red-theme
  image-cover: none, // image de couverture du rapport, optionnel
  doc,
) => {
  /* -------------------------------------------
  *  Options générales
  *  ------------------------------------------- */
  // ajoute une numérotation si demandé
  if heading_numbering {
    set heading(numbering: "I.A.1.")
  }


  // Couleur du thème
  let theme-color = if theme == "blue-theme" {
    "#3AA5D8"
  } else if theme == "pastel-theme" {
    "#AB8EFF"
  } else if theme == "green-theme" {
    "#49B949"
  } else if theme == "red-theme" {
    "#F61359"
  } else {
    "#3AA5D8"
  }


  // Définit la date comme aujourd'hui si elle n'est pas fournie
  if date == none {
    date = datetime.today()
  }
  let date_fmt = format-date(date)


  // Metadatas
  set document(author: authors, date: date, title: title)
  // Polices requises
  let heading-fonts = "Stretch Pro"
  let normal-fonts = "Metropolis"
  // Page
  set page("a4", margin: 0cm)
  // Texte
  set text(lang: lang, font: normal-fonts)

  /* -------------------------------------------
  *  Page de présentation
  *  ------------------------------------------- */
  // Uniquement pour le titre & description
  set par(leading: 0.25em)

  // Image de couverture
  place(image("assets/" + theme + "/" + theme + "-cover.png", width: 100%))

  if image-cover != none {
    place(
      dx: 5cm,
      dy: 11.88cm,

      box(
        height: 8.78cm,
        width: 13cm,


        align(
          center,
          box(fill: rgb(255, 255, 255, 120), image(image-cover, height: 100%)),
        ),
      ),
    )
  }


  // Logo "INSA-HDF"
  place(
    dx: 1.91cm,
    dy: 1.96cm,
    image("assets/insa-hdf.png", width: 33%),
  )

  set par(justify: false)

  // Titre & Description
  place(
    dx: 2.30cm,
    dy: 4.55cm,
    stack(
      spacing: 0.6cm,
      // Titre
      block(
        width: 16.581cm,
        text(
          font: heading-fonts,
          size: 38pt,
          hyphenate: false,
          fill: white,
          upper(title),
        ),
      ),
      // Description
      block(
        width: 16.581cm,
        par(
          justify: true,
          text(
            size: 11pt,
            fill: white,
            hyphenate: false,
            weight: "regular",
            description,
          ),
        ),
      ),
    ),
  )

  // Fonction pour mettre en gras le premier mot, utilisé pour les auteurs
  let first-bold = text => {
    let words = text.split(" ")
    upper(strong(words.first()) + " " + words.at(1))
  }

  // On remet le leading à 0.75em
  set par(leading: 0.75em)

  // Auteurs
  place(
    dx: 3.95cm,
    dy: 20.9cm,
    box(
      height: 4.2cm,
      text(
        size: 14pt,
        fill: white,
        align(
          horizon,
          if sub-authors != none { strong(sub-authors + "\n") } else { }
            + authors.map(auteur => first-bold(auteur)).join("\n"),
        ),
      ),
    ),
  )

  // Date
  place(
    dx: 13.51cm,
    dy: 2.22cm,
    box(
      height: 1.39cm,
      width: 6.28cm,
      text(
        size: 15pt,
        fill: rgb(theme-color),
        font: normal-fonts,
        weight: "bold",
        align(
          center + horizon,
          upper(date_fmt),
        ),
      ),
    ),
  )

  // Matiere
  place(
    dx: 2.24cm,
    dy: 25.95cm,
    box(
      height: 1cm,
      width: 10cm,
      // fill: red,
      align(
        horizon,
        text(
          size: 15pt,
          fill: rgb(theme-color),
          font: normal-fonts,
          weight: "bold",
          upper(matiere),
        ),
      ),
    ),
  )

  /* -------------------------------------------
  *  Sommaire
  *  ------------------------------------------- */

  pagebreak()

  // Margin du contenu du sommaire
  set page(
    margin: (
      top: 6.14cm,
      bottom: 1cm,
      left: 3.14cm,
      right: 1.12cm,
    ),
    // Arrière plan
    background: place(
      dx: 0cm,
      dy: 0cm,
      image("assets/" + theme + "/" + theme + "-summary.png"),
    ),
  )

  // Header "SOMMAIRE" en haut
  set page(
    header: context [
      #place(
        dy: 2cm,
        text(
          size: 48pt,
          fill: white,
          font: heading-fonts,
          weight: "bold",
          upper("Sommaire"),
        ),
      )
    ],
  )

  // Texte du sommaire
  set text(size: 12pt, fill: black, weight: "medium")

  set outline.entry(
    fill: line(
      start: (5%, 0%),
      end: (95%, 0%),
      stroke: 1pt + rgb(theme-color),
    ),
  )

  // Contenu du sommaire
  outline(
    title: none,
    depth: 3,

    indent: 0.75cm,
  )

  pagebreak()

  /* -------------------------------------------
  *  Body du rapport
  *  ------------------------------------------- */

  // Supprimer le header du sommaire
  set page(header: context [])

  set par(justify: false)

  // Titre 1
  show heading.where(level: 1): it => [
    #set par(justify: false)
    #set par(leading: 0.25em)
    #block(
      below: 1em,
      stack(
        spacing: 0.3cm,
        text(
          hyphenate: false,
          size: 32pt,
          font: heading-fonts,
          weight: "bold",
          upper(it.body),
        ),
        rect(
          width: 30%,
          height: 10pt,
          fill: rgb(theme-color),
        ),
      ),
    )

  ]

  // Titre 2
  show heading.where(level: 2): it => [
    #set par(leading: 0.5em)
    #block(
      below: 1.7em,
      text(
        size: 24pt,
        font: normal-fonts,
        weight: "bold",
        underline(
          evade: false,
          background: true,
          stroke: 6pt + rgb(theme-color),
          it.body,
        ),
      ),
    )

  ]

  // Titre 3
  show heading.where(level: 3): it => [
    #block(
      below: 1em,
      text(
        size: 16pt,
        font: normal-fonts,
        weight: "bold",
        upper(it.body),
      ),
    )

  ]

  // Titre 4
  show heading.where(level: 4): it => [
    #block(
      below: 1.3em,
      text(
        size: 12pt,
        font: normal-fonts,
        fill: rgb(theme-color),
        weight: "medium",
        it.body,
      ),
    )

  ]

  // Margin des pages pour écrire
  set page(
    margin: (
      top: 1cm,
      bottom: 1cm,
      left: 2.2cm,
      right: 1.12cm,
    ),
    // Side bar
    background: place(
      dx: 0cm,
      dy: 0cm,
      image("assets/" + theme + "/" + theme + "-side.png"),
    ),
  )

  // Renvoie l'auteur si il n'y en a qu'un, renvoie le sub-authors sinon
  let headerauthor() = context [
    #if authors.len() > 1 {
      text(strong(sub-authors), size: 12pt, fill: white)
    } else {
      text(first-bold(authors.first()), size: 12pt, fill: white)
    }
  ]

  // Affiche la side-bar (placée dans l'élément "footer")
  set page(
    footer: context [
      // Titre
      #rotate(-90deg)[#place(
          center,
          dy: -1.8cm,
          dx: 14cm,
          strong(upper(text(fill: white, matiere + " : ")))
            + upper(text(fill: white, title)),
        )
      ]
      // Auteur/sub-authors
      #rotate(-90deg)[#place(
          right,
          dy: -1.8cm,
          dx: 28.9cm,
          headerauthor(),
        )]
      // Numéro de la page
      #place(
        dx: -1.8cm,
        dy: -0.7cm,
        text(
          fill: white,
          weight: "semibold",
          size: 12pt,
          counter(page).display("1"),
        ),
      )
    ],
  )

  /* -------------------------------------------
  *  Style pour le document
  *  ------------------------------------------- */

  // Style des textes normaux
  set text(size: 11pt, weight: "regular")
  set par(justify: true)

  // Texte au dessus et en dessous (ex : 'er' dans '1er')
  set super(size: 0.7em)
  set sub(size: 0.7em)

  // Delimiteur
  set line(stroke: rgb(theme-color))

  // Style des footnote
  set footnote.entry(
    separator: line(length: 40%, stroke: 2pt + rgb(theme-color)),
  )

  // Citations custom
  show quote: it => {
    align(
      center,
      rect(
        width: 100%,
        outset: (x: 1.12cm),
        fill: rgb(theme-color + "33"),
        inset: (x: 2cm, y: 0.5cm),
        stack(
          text(it.body),
          if it.attribution != none {
            box(width: 80%, align(right, emph(text("\n —  " + it.attribution))))
          },
        ),
      ),
    )
  }

  // Custom caption pour les images uniquement
  show figure.where(kind: image): it => layout(sz => {
    let size = measure(it.body, width: sz.width).width
    set text(fill: white)

    stack(
      it.body,
      rect(
        fill: rgb(theme-color),
        width: size,
        it.caption.supplement.text
        + " "
        + it.caption.counter.display()
        + " - "
        + it.caption.body,
      ),
    )
  })

  show table: set align(left)

  // Tableau
  set table(
    stroke: (x, y) => if y > 0 {
      (
        top: (paint: rgb("aaaaaa"), thickness: 1pt),
      )
    } else {
      none
    },
  )

  // Cellules des tableaux
  set table.cell(inset: (x: 1em, y: 0.5em))

  // Lignes horizontales ajoutées manuellement
  set table.hline(stroke: 2pt + rgb(theme-color))

  // Lignes verticales ajoutées manuellement
  set table.vline(stroke: 2pt + rgb(theme-color))

  // Liens
  show link: it => {
    set text(
      fill: rgb(theme-color),
      weight: "medium",
    )
    underline(it)
  }

  // Surligner
  set highlight(fill: rgb(theme-color + "77"))

  show raw.where(block: false): {
    box.with(
      fill: rgb("202628"),
      inset: (x: 3pt),
      outset: (y: 4pt),
      radius: 2pt,
    )
  }

  // Blocs de code inline
  show raw.where(block: false): set text(fill: white)

  /* -------------------------------------------
  *  Document
  *  ------------------------------------------- */

  doc

  /* -------------------------------------------
  *  Bibliographie (si elle existe)
  *  ------------------------------------------- */

  set bibliography(full: true)

  if bib-yaml != none {
    pagebreak()
    bibliography(bib-yaml)
  }

  /* -------------------------------------------
  *  Page de fin
  *  ------------------------------------------- */

  pagebreak()

  set page(margin: 0cm, background: none)

  // Image
  place(right, image("assets/" + theme + "/" + theme + "-back.png"))

  set par(justify: true)
  set text(hyphenate: true)

  // Logo INSA-HDF
  place(
    dx: 10.51cm,
    dy: 26.1cm,
    image("assets/insa-hdf.png", width: 33%),
  )

  // Titre & Description
  place(
    dx: 11.01cm,
    dy: 2.15cm,
    stack(
      spacing: 0.6cm,
      // Titre
      block(
        width: 9.45cm,
        text(font: heading-fonts, size: 32pt, fill: white, upper(title)),
      ),
      // Description
      block(
        width: 9.45cm,
        text(
          size: 11pt,
          fill: white,
          font: normal-fonts,
          weight: "regular",
          description,
        ),
      ),
    ),
  )

  // Auteurs
  place(
    dx: -10.8cm,
    dy: 24.765cm,
    right,
    box(
      text(
        size: 14pt,
        fill: rgb(theme-color),
        font: normal-fonts,
        authors.map(auteur => first-bold(auteur)).join("\n"),
      ),
    ),
  )

  // Date
  place(
    right,
    dx: -10.8cm,
    dy: 22.37cm,
    box(
      text(
        size: 15pt,
        fill: rgb(theme-color),
        font: normal-fonts,
        weight: "bold",
        upper(date_fmt),
      ),
    ),
  )
}

#let codeblock(filename: "", line_number: true, content) = {
  set text(fill: white)

  let term = ((content.lang == "bash" or content.lang == "term") and filename == "")

  show raw.line: line => {
    if (line_number and not term) {
      text(fill: rgb("ffffff55"))[#line.number]
      h(2em)
    }
    line.body
  }

  align(
    center,
    // Texte en blanc pour le contraste
    rect(
      width: 100%,
      outset: (x: 1.12cm),
      fill: rgb("202628"),
      inset: (x: 0cm, y: 0.7em), // Ajoute un peu de marge intérieure,
      stack(
        spacing: 0.7em,
        // Désactive la barre pour afficher l'output d'un terminal
        if not (term) { 
          [#text(font: "DejaVu Sans Mono", size: 9pt, filename) #h(1fr) #text(
            font: "DejaVu Sans Mono",
            size: 9pt,
            content.lang,
          )]
          line(
            length: 100% + (2 * 1.12cm),
            stroke: 1pt + rgb("444444"),
          )
        },
        align(left, content),
      ),
    ),
  )
}

#let warning(content) = {
  box(
    stroke: (left: 7pt + rgb("F61359")),
    inset: (y: 1em, x: 1.3em),

    grid(
      columns: (0.5em, 95%),
      gutter: 2.7em,
      image("assets/warning.png", width: 0.8cm), align(horizon, text(content)),
    ),
  )
}

#let info(content) = {
  box(
    stroke: (left: 7pt + rgb("FFC13D")),
    inset: (y: 0.5em, x: 1.3em),

    grid(
      columns: (0.2em, 95%),
      gutter: 3em,
      image("assets/info.png", width: 0.8cm), align(horizon, text(content)),
    ),
  )
}

#let comment(theme: "blue-theme", content) = {
  box(
    stroke: (left: 7pt + rgb("999999")),
    inset: (y: 0.5em, x: 1.3em),

    grid(
      columns: (1em, 95%),
      gutter: 2.3em,
      image("assets/comment.png", width: 0.8cm), align(horizon, text(content)),
    ),
  )
}
