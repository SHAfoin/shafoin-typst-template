#import "../report-template.typ" : *

#show: doc => insa-report(
  theme: "green-theme",  // choix du theme parmi pastel-theme, blue-theme, green-theme, red-theme
  title: "Thème custom typst",  // titre du document
  authors: (  // liste des auteurs
    "SHAfoin Shafoin",
  ),
  sub-authors: "4A ICY",  // texte optionnel au dessus des auteurs ex : groupe 2, 4A ICY 
  description: "Présentation du thème custom typst", // description du document
  date: datetime(day: 10, month: 3, year: 2025), // date du document, sous format datetime
  matiere: "Matière", // matière du document ou texte en bas
  bib-yaml: "./exemple/refs.yaml",  // référence vers une bibliographie
  doc
)

= Test1 

== Titre 2

=== Titre 3

==== Titre 4
    
*Texte stylisé* :
On peut #strike[barrer du texte], mettre du texte en *gras*, en _italique_, ou *_les deux_*. Le texte en inférieur#sub[aussi], et en supérieur aussi pour les 1#super[er] par exemple. Enfin on peut #underline[souligner], mettre une ligne #overline[au dessus], et #highlight[surligner] (selon la couleur du thème).

*Citation* :

#quote(attribution: [Didier])[
  _Voilà une jolie citation pour illustrer le principe. L'italique est inséré manuellement au cas où l'on ne souhaite pas l'utiliser (pour autre chose qu'une citation par exemple)_
]

*Footnote* : Création d'une petite note de bas de page
#footnote[Une petite note de bas de page]

#figure(
  kind: table,
  rect[Hello],
  caption: [Voici un tableau et son caption.],
)

#figure(
  caption: [Un nouveau tableau. Il contient des hline et vline pour accentuer le tableau, utilisable manuellement et accordés au thème actuel.],

  table(
    columns: 4,
    table.header([*Header*], [*Value*], [*Unit*], [*Type*]),
    table.hline(start: 0, stroke : 2pt),
    table.vline(x: 1, stroke : 2pt),
    [John], [], [A], [],
    [Mary], [], [A], [A],
    [Robert], [B], [A], [B],
    table.hline(start: 0, stroke : 2pt),
    table.footer([*Footer*], [*Value*], [*Unit*], [*Type*]),
  )
)

#figure(
  caption: [Un autre tableau. Les figures sont centrées par défaut. Seuls des lignes horizontales grisées sont affichées par choix de design.],

  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
)

#columns(2,[
  #lorem(60)
  #figure(
    caption: [Une image d'un gros lapin. La caption des images est différente, avec une barre colorée selon le thème en arrière-plan.], 
    image("lapin.jpg", width: 100%)
  )<lapin>
  #colbreak()
  #text[*Colonnes* : Nous avons placé un texte en colonnes. Les images, figures, comment, info, warning fonctionnent très bien avec, mais pas les codeblock. Il faut préciser soit même le \#columns pour l'utiliser.]
  ]
)

*Reference* : uniquement pour les figures, tableaux, équations. Headings aussi mais pas là car ils sont pas numérotés. Il faut préciser la référence en mettant un \<nomDeMaReference\> à côté de l'endroit à référencer. Référence vers le lapin : @lapin

*Dictionnaire* : Une liste de description de termes. Utiles en annexe par exemple.
/ Ligature: A merged glyph.
/ Kerning: #lorem(50) 

*Liste non numérotée* : utiliser le "-" avec des tabulations
- test
  - test 2
- test 3

*Liste numérotée*: utiliser le "+" et les tabulations pour automatiquement faire la numérotation. On peut mélanger la liste numérotée et non numérotée.

+ test
  + test
+ test 2
  + test 2.1
+ test 3

*Délimiteur* : 

#line(length: 100%)

*Référence bibliographique* : Il suffit de fournir un fichier bibliographique YAML (voir exemple). Il permet de stocker nos références bibliographiques et de les citer dans le texte. Il faut préciser le nom du fichier dans l'attribut "bib-yaml" de la fonction insa-report. Une section "BIBLIOGRAPHIE" apparait alors automatiquement à la fin de notre rapport. On cite un document de la bibliographie de la même manière que les références. Exemple : @harry

*Liens/URL* : Cliquables et colorés selon le thème. On peut les mettre en brut #link("https://example.com") ou avec 
#link("https://example.com")[
  un texte.
]

*Code inline* : Possibilité de taper du code inline comme `test` et même de lui mettre la syntaxe de son langage avec ```rust fn main()```.

*Block de code* : Possibilité de mettre un block de code avec la syntaxe de son langage. On peut préciser un nom de fichier aussi.
#codeblock(filename: "Main.java", line_number: true,
```java
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```) 

*Blocks customs * : Plusieurs blocs custom avec des couleurs & icônes *fixes* sont définis ci dessous :

#warning("Le warning, utile pour mettre en avant des informations importantes ou un avertissement")

#info("L'info, pour donner des informations supplémentaires ou des précisions.")

#comment("Le commentaire, pour mettre des annotations, remarques ou des exemples.")

test
