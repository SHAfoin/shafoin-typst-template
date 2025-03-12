
#import "report-template.typ" : *

#show: doc => insa-report(
  theme: "pastel-theme",
    title: "Coucou et diffraction",
    authors: (
    "Saltel Baptiste",
  ),
    description: lorem(25),
  date: "10 Mars 2025",
  matiere: "Physique",
  bib-yaml: "refs.yaml",
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


#figure(
  kind: table,
  rect[Hello],
  caption: [I am emphasized!],
) <results>


#columns(2,
  [#figure(caption: [gros lapin], image("lapin.jpg", width: 100%)),
#colbreak(),
#lorem(100)]
)

#figure(
  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [Timing results],
)

#figure(
  
  
  table(
    

  columns: 4,
  table.header([*Name*], [*Value*], [*Unit*], [*Type*]),
  table.hline(start: 0, stroke : 2pt),

  table.vline(x: 1, stroke : 2pt),

  [John], [], [A], [],
  [Mary], [], [A], [A],
  [Robert], [B], [A], [B],

table.hline(start: 0, stroke : 2pt),
  table.footer([*Name*], [*Value*], [*Unit*], [*Type*]),
))

Cite (comme la référence)

Reference : uniquement pour les figures, tableaux, équations. Headings aussi mais pas là car ils sont pas numérotés.

#set terms(tight: true)

Term list :
/ Ligature: A merged glyph.
/ Kerning: #lorem(50)


  `test`

- test
  - test 2
- test 3

Numbered list: utiliser le "+" car automatique
+ test
  + test
+ test 2
  + test 2.1
+ test 3

référence bibliographique : @harry

Référence vers results : @results

Liens/url :
#link("https://example.com") \
#link("https://example.com")[
  See example.com
]


#codeblock(filename: "Main.java", 
```java
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```) 

hey

comment faire un #strike[texte barré]

Revenue#sub[yearly]
1#super[st] try!

#overline[A line over text.]
This is #highlight[important].


#warning(lorem(50))

C'est l'heure de ```rust fn main()``` avec moi ! #lorem(50)

#raw("Hello, World!")

#comment(lorem(50))

#info(lorem(60))