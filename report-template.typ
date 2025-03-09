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
#place(image("assets/" + theme + ".png", width: 101%))

// top-left
    #place(
      dx: 2.20cm,
      dy: 4.48cm,
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
      dy: 2.12cm,
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

BABABABABA