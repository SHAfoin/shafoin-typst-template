# Vibrant Color - Modèle Typst SHA_foin

<img alt="Typst" src="https://img.shields.io/badge/Typst-239DAD?style=for-the-badge&logo=typst&logoColor=FFFFFF"/>
<img alt="GitHub License" src="https://img.shields.io/github/license/SkytAsul/INSA-Typst-Template?style=for-the-badge"/>

Le modèle Variant Color est un template Typst qui permet de créer des rapports avec un schéma de couleurs vives. Il a été initialement utilisé pour des rapports étudiants, mais il peut être utilisé pour tout type de rapport.

Il existe 4 thèmes différents : **blue**, **red**, **green** et **pastel**. Il utilise la règle show `vibrant-color`.

## Table des matières

1. [Exemples & Utilisation](#exemples--utilisation)
1. [Polices](#polices)
1. [Notes](#notes)
1. [Licence](#licence)
1. [Changelog](#changelog)

## Exemples & Utilisation

![Tous les thèmes du rapport](./vibrant-color-themes.png)

| **Paramètre**         | **Description**                                                                            | **Type**    | **Utilisation**                        |
| --------------------- | ------------------------------------------------------------------------------------------ | ----------- | -------------------------------------- |
| **title**             | Titre du rapport.                                                                          | str         | "Mon Titre"                            |
| **date**              | Date du rapport mm/jj/aaaa. Si la langue est le français, la date littérale est supportée. | datetime    | datetime(day: 1, month: 2, year: 2025) |
| **theme**             | Couleur du thème. 4 thèmes sont actuellement supportés : green, pastel, blue et red.       | str         | "pastel-theme"                         |
| **authors**           | Tableau d'auteurs "NOM Prénom". La première partie est automatiquement en gras.            | content     | ("DUPONT Jean", "MARTIN Alice")        |
| **sub-authors**       | Nom du groupe/équipe, utilisé dans le pied de page s'il y a au moins 2 auteurs.            | str         | "EQUIPE 1"                             |
| **subject**           | Sujet du rapport.                                                                          | str         | "Mathématiques"                        |
| **description**       | Description du rapport.                                                                    | str         | "Mon super rapport"                    |
| **bib-yaml**          | Chemin vers un fichier bib.yaml pour la bibliographie automatique.                         | str \| none | "./bib.yaml"                           |
| **lang**              | Langue pour le correcteur et la date (par défaut "fr").                                    | str         | "fr"                                   |
| **heading-numbering** | Afficher la numérotation des titres (par défaut false).                                    | bool        | false                                  |
| **image-cover**       | Chemin optionnel vers une image à ajouter sur la couverture.                               | str \| none | "./images/cover.png"                   |
| **logo**              | Logo optionnel à afficher sur la couverture et le verso.                                   | str \| none | "./images/logo.png"                    |

#### Exemple

Un exemple complet illustrant l'utilisation de ce modèle et toutes ses fonctionnalités est disponible dans le répertoire `example`.

```typst

#import "@preview/vibrant-color-template:0.1.0": *

#show: doc => vibrant-color(
  theme: "green-theme",
  title: "Mon Rapport",
  authors: (
    "DUPONT Jean",
    "MARTIN Alice",
  ),
  lang: "fr",
  sub-authors: "EQUIPE 1",
  description: "Ceci est un exemple d'utilisation du template.",
  date: datetime(day: 10, month: 3, year: 2025),
  subject: "Mathématiques",
  bib-yaml: "./example/refs.yaml",
  logo: "./example/my_logo.png",
  doc
)

== Première étape

Faites ceci

```

De plus, des blocs personnalisés sont disponibles pour afficher des commentaires, avertissements et informations.

````typst

#warning("Ceci est un avertissement.")

#info("Ceci est une information.")

#comment("Ceci est un commentaire ou une remarque.")

#codeblock(filename: "custom_block.java", line_number: true,
```java
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```)

````

## Polices

Pour ce template, la police des titres est **Stretch Pro** et **Metropolis** pour le texte courant. Il est recommandé d'installer ces polices pour un meilleur rendu.

> **Stretch Pro** est une police particulière qui a des effets spéciaux sur les doubles lettres (comme "oo" ou "ee"). C'est un choix assumé d'utiliser cette police, mais ce n'est pas obligatoire. Si vous souhaitez utiliser une autre police, vous pouvez changer la variable `heading-fonts` dans le template.

Les polices sont toutes disponibles sur [le repo](https://github.com/SHAfoin/shafoin-typst-template/tree/main/font).

Si ces polices ne sont pas installées, le template utilisera automatiquement : **Arial** pour les titres et le texte du corps.

## Notes

Ce template est développé par Baptiste SALTEL dans [ce dépôt](https://github.com/SHAfoin/shafoin-typst-template).

Merci à [RedPrismey](https://github.com/RedPrismey) pour son aide sur les corrections de bugs et améliorations.

Remerciements particuliers à SkytAsul pour l'inspiration lors de la création de ce template.

## Licence

Le template Typst est sous licence [MIT](https://github.com/SHAfoin/shafoin-typst-template/blob/main/LICENSE).

Les polices sont sous leurs propres licences.

## Changelog

### 0.1.0

- Initial release
