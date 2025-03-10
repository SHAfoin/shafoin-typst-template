#let heading-fonts = ("Stretch Pro")
#let normal-fonts = ("Metropolis")
#let theme = "blue-theme"
#let theme-color = "#3AA5D8"

#set page("a4", margin: 0cm)
#set par(leading: 0.25em)

#let authors = (
  "Saltel Baptiste",
  "Doe Jane"
)


#set text(lang: "fr", font: heading-fonts,size:48pt, fill: white)
#place(image("assets/"+ theme + "/" + theme + "-cover.png", width: 100%))

#place(
  dx: 1.91cm,
      dy: 1.96cm,
     image("assets/insa-hdf.png", width: 33%))

// top-left
    #place(
      dx: 2.30cm,
      dy: 4.55cm,
      stack(
        spacing: 0.6cm,
        block(
        width: 16.581cm,
        text( upper("Titre de mon rapport"))
      ),
      block(
        width: 16.581cm,
        text(size:11pt, fill: white, font: normal-fonts, weight: "regular", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec elit  ligula. Vivamus quis magna est. Ut ac mi ut metus rhoncus condimentum id et nunc. ")
      )
      )
      
    )

    #let first-bold = (text) => {
  let words = text.split(" ") // Sépare les mots
  upper(strong(words.first())) + " " + words.at(1)
}

#set par(leading: 0.75em)

    // bottom-right
    #place(
      dx: 3.95cm,
      dy: 20.9cm,
      box(
        height: 4.2cm,
        text(size: 14pt, fill: white, font: normal-fonts, align(horizon, authors.map(auteur => first-bold(auteur)).join("\n")))
      )
    )

    // bottom-right
    #place(
      dx: 13.51cm,
      dy: 2.22cm,
      box(
        height: 1.39cm,
        width: 6.28cm,
        text(size: 15pt, fill: rgb(theme-color), font: normal-fonts, weight: "bold", align(center + horizon, upper("9 Mars 2025")))
      )
    )

    // bottom-right
    #place(
      dx: 2.24cm,
      dy: 26.45cm,
      box(
        height: 1.39cm,
        width: 6.28cm,
        text(size: 15pt, fill: rgb(theme-color), font: normal-fonts, weight: "bold", upper("Développement web"))
      )
    )

    #pagebreak()

    

    #set text(lang: "fr", size:14pt, fill: black, font: normal-fonts, weight: "medium")


    #place(
     image("assets/"+ theme + "/" + theme + "-summary.png", width: 100%))

   

    #place(
      dx: 3.14cm,
      dy: 1.87cm,
      box(
        width: 16.44cm,
        text(size: 48pt, fill: white, font: heading-fonts, weight: "bold", upper("Sommaire"))
      )
    )

    #place(
      dx: 3.14cm,
      dy: 6.14cm,
      box(
        width: 16.44cm,
        outline(title: none, fill: line(start: (5%, 0%), end: (95%, 0%), stroke: 1pt + rgb(theme-color)), indent:0.75cm)
      
    )     )

    

    #pagebreak()

    

    #show heading.where(level: 1): it => [
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




    = Test de ma

    == test2

    = test1

    == test 3

    === test 4

BABABABABA