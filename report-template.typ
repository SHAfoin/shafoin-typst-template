#let heading-fonts = ("Stretch Pro")
#let normal-fonts = ("Metropolis")

#let insa-report(
  theme: "blue-theme",
  title : none, 
  lang: "fr",
  description: none,
  authors: (),
  matiere: none,
  date: none,
  doc
) = {

  set document(author: authors, date: auto, title: title)

let theme-color = "#3AA5D8"

set page("a4", margin: 0cm)
set par(leading: 0.25em)



set text(lang: lang, hyphenate: true)
place(image("assets/"+ theme + "/" + theme + "-cover.png", width: 100%))

place(
  dx: 1.91cm,
      dy: 1.96cm,
     image("assets/insa-hdf.png", width: 33%))

// top-left
    place(
      dx: 2.30cm,
      dy: 4.55cm,
      stack(
        
        spacing: 0.6cm,
        block(
        width:  16.581cm,
        text(font: heading-fonts,size:38pt, fill: white, upper(title))
      ),
      block(
        width: 16.581cm,
        text(size:11pt, fill: white, font: normal-fonts, weight: "regular", description)
      )
      )
      
    )

    

    let first-bold = (text) => {
  let words = text.split(" ") // Sépare les mots
  upper(strong(words.first()) + " " + words.at(1))
}

set par(leading: 0.75em)

    // bottom-right
    place(
      dx: 3.95cm,
      dy: 20.9cm,
      box(
        height: 4.2cm,
        text(size: 14pt, fill: white, font: normal-fonts, align(horizon, strong("4A ICY\n") + authors.map(auteur => first-bold(auteur)).join("\n")))
      )
    )

    // bottom-right
    place(
      dx: 13.51cm,
      dy: 2.22cm,
      box(
        height: 1.39cm,
        width: 6.28cm,
        text(size: 15pt, fill: rgb(theme-color), font: normal-fonts, weight: "bold", align(center + horizon, upper(date)))
      )
    )

    // bottom-right
    place(
      dx: 2.24cm,
      dy: 26.32cm,
      box(
        height: 1.39cm,
        width: 6.28cm,
        text(size: 15pt, fill: rgb(theme-color), font: normal-fonts, weight: "bold", upper(matiere))
      )
    )

    pagebreak()

    

    set text(lang: "fr", size:14pt, fill: black, font: normal-fonts, weight: "medium")


    place(
     image("assets/"+ theme + "/" + theme + "-summary.png", width: 100%))

   

    place(
      dx: 3.14cm,
      dy: 1.87cm,
      box(
        width: 16.44cm,
        text(size: 48pt, fill: white, font: heading-fonts, weight: "bold", upper("Sommaire"))
      )
    )

    place(
      dx: 3.14cm,
      dy: 6.14cm,
      box(
        width: 16.44cm,
        outline(title: none, fill: line(start: (5%, 0%), end: (95%, 0%), stroke: 1pt + rgb(theme-color)), indent:0.75cm)
      
    )     )

    

    pagebreak()

    show heading.where(level: 1): it => [
      #stack(
        spacing: 0.3cm,
        text(
  size: 32pt,
  font: heading-fonts,
  weight: "bold", upper(it.body)
),

  rect(
    width: 20%, 
    height: 10pt, 
    fill: rgb(theme-color),

  )
      )
     
      
      ]

      show heading.where(level: 2): it => [
        #text(
  size: 24pt,
  font: normal-fonts,
  weight: "bold", underline(stroke: 6pt + rgb(theme-color) , it.body)
)

  
     
      
      ]

      show heading.where(level: 3): it => [
        #text(
  size: 16pt,
  font: normal-fonts,
  weight: "medium", upper(it.body)
)

  
     
      
      ]

      show heading.where(level: 4): it => [
        #text(
  size: 12pt,
  font: normal-fonts,
  fill: rgb(theme-color),
  weight: "medium", upper(emph(it.body)),
  
)

#block(below: 0.1cm)

  
     
      
      ]
set page(
  margin: (
  top: 1cm,
  bottom: 1cm,
  left: 2.2cm,
  right: 1.12cm
),
    background:  place(
        dx: 0cm,
        dy: 0cm,
        image("assets/"+ theme + "/" + theme + "-side.png")
      
      ) 
      
      
      )

set footnote.entry(
  separator: line(stroke: 2pt + rgb(theme-color))
)

let normalheader() = context [
  #strong(upper(text(fill: white, title)))
  #let headings = query(selector(heading.where(level: 1)).after(here()))
  #if headings.len() > 0 {
    let content = headings.first()
    if content.location().page() == here().page() {
      text(upper(content.body), size: 12pt, weight: 200, fill: white)
    } else {
      let headings = query(selector(heading.where(level: 1)).before(here()))
      if headings.len() > 0 {
        let content = headings.last().body
        text(upper(content), size: 12pt, weight: 200, fill: white)
      }
    } 
  } else {
    let headings = query(selector(heading.where(level: 1)).before(here()))
    if headings.len() > 0 {
      let content = headings.last().body
      text(upper(content), size: 12pt, weight: 200, fill: white)
    }
  }
]

let headerauthor() = context [
  #if authors.len() > 1 {
    text(strong("4A ICY"), size: 12pt,fill: white)
  } else {
    text(first-bold(authors.first()), size: 12pt, fill: white)
  }
]

set page(footer: context [
  #rotate(-90deg)[#place(
    center,
    dy: -1.8cm,
    dx: 14cm,
    normalheader()
  )]

  #rotate(-90deg)[#place(
    right,
    dy: -1.8cm,
    dx: 28.9cm,
    headerauthor()
  )]
    
  #place(
    dx: -1.8cm,
    dy: -0.7cm,
    text(fill: white, weight: "semibold", size: 12pt, counter(page).display(
    "1",
  ))
    )
])

set text(size: 11pt, weight: "regular")
set par(justify: true)

show quote: it => {
    align(center, 
     // Texte en blanc pour le contraste
  rect(
    width: 100%,
    outset: (x: 1.12cm),
    fill: rgb(theme-color+"33"), // Bleu personnalisé
    inset: 1.5em ,// Ajoute un peu de marge intérieure,
    stack(
      
      
      
      text(it.body), if it.attribution != none {
      align(right, text( "\n —  " + it.attribution))})
  )
    )
  
    
}

doc



pagebreak()

set page(margin: 0cm, background: none)

place(right, image("assets/"+ theme + "/" + theme + "-back.png"))
set par(justify: false)
set text(hyphenate: true)

place(
  dx: 10.51cm,
      dy: 26.1cm,
     image("assets/insa-hdf.png", width: 33%))

// top-left
    place(
      dx: 11.01cm,
      dy: 2.15cm,
      stack(
        spacing: 0.6cm,
        block(
        width: 9.45cm,
        text(font: heading-fonts,size:32pt, fill: white, upper(title))
      ),
      block(
        width: 9.45cm,
        text( size:11pt, fill: white, font: normal-fonts, weight: "regular", description)
      )
      )
      
    )

    // bottom-right
    place(
      dx: -10.8cm,
      dy: 24.765cm,
      right,
      box(
        text(size: 14pt, fill: rgb(theme-color), font: normal-fonts, authors.map(auteur => first-bold(auteur)).join("\n"))
      )
    )

    // bottom-right
    place(
      right,
      dx: -10.8cm,
      dy: 22.37cm,
      box(
        text(size: 15pt, fill: rgb(theme-color), font: normal-fonts, weight: "bold", upper(date))
      )
    )

}

#show: doc => insa-report(
  title: "Coucou et diffraction",
  authors: (
  "Saltel Baptiste",
),
  description: lorem(25),
date: "10 Mars 2025",
matiere: "Physique",
  doc)


    = Test1

    == test 2

    === test 3

    ==== test 4

    Code java à corriger
    Questions de cours
    Exercices de math (exemple : sur attribut)

    #lorem(800)

    #quote(attribution: [Didier])[
  bababa bababab bababa babzaab bababa bababa bababa bababa bababa bababa bababa bababa bababa bababa
]

    Check the docs for more details.
#footnote[https://typst.app/docs]