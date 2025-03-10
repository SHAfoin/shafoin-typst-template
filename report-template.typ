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




set text(lang: lang, font: heading-fonts,size:38pt, fill: white)
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
        width: 16.581cm,
        text( upper(title))
      ),
      block(
        width: 16.581cm,
        text(size:11pt, fill: white, font: normal-fonts, weight: "regular", description)
      )
      )
      
    )

    let first-bold = (text) => {
  let words = text.split(" ") // Sépare les mots
  upper(strong(words.first())) + " " + words.at(1)
}

set par(leading: 0.75em)

    // bottom-right
    place(
      dx: 3.95cm,
      dy: 20.9cm,
      box(
        height: 4.2cm,
        text(size: 14pt, fill: white, font: normal-fonts, align(horizon, authors.map(auteur => first-bold(auteur)).join("\n")))
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
    fill: rgb(theme-color) 
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
  weight: "medium", upper(emph(it.body))
)

  
     
      
      ]

set text(size: 11pt, weight: "regular")
set par(justify: true)


doc


pagebreak()



}

#show: doc => insa-report(
  title: "Interférences et diffraction",
  authors: (
  "Saltel Baptiste",
  "Doe Jane"
),
date: "10 Mars 2025",
matiere: "Physique",
  doc)


    = Test1

    == test2

    == test 2

    === test 3

    ==== test 4