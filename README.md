# Long_project

Les lymphocytes T ou cellules T, jouent un rôle important dans la réponse immunitaire
adaptative, notamment dans la destruction de cellules infectées ou tumorales. Chaque lymphocyte
exprime à sa surface un récepteur unique généré aléatoirement. Pour chaque pathogène ou tumeur, il
existe un petit nombre de lymphocytes T portant un récepteur capable de reconnaître des cellules
infectées ou tumorales. Ce sont les lymphocytes T spécifiques de l’antigène.
Généralement, les lymphocytes T ont une grande mobilité mais ce comportement change lors
de la reconnaissance de l’antigène. Cela se traduit par une décélération ou un arrêt complet et un
changement de morphologie de la cellule T.
le lymphocyte T est mobile. En rouge, reconnaissance de l’antigène par la cellule T induisant son
changement de morphologie. En bleu, cellule infectée/tumorale.


Pour prédire le devenir de la pathologie, il est essentiel d'identifier le type cellulaire présent au
niveau de la cellule infectée/tumorale et de connaître leur activité (spécifique ou non spécifique). Ainsi,
plusieurs questions biologiques se posent. Quel est le nombre ou la densité de lymphocytes T spécifiques
dans une tumeur ? Quel est le nombre de cellules T non spécifiques ne jouant vraisemblablement pas de
rôle anti-tumoral ? Les approches existantes permettent difficilement de discriminer les cellules T
spécifiques des non spécifiques sur une coupe de tumeur.
L’objectif de ce projet est d’évaluer dans quelle mesure il est possible de prédire la spécificité
antigénique d’une cellule T à partir de sa morphologie.


Différents films réalisés in vivo par microscopie biphotonique de cellules T ne reconnaissant
pas l’antigène ou en train de reconnaître l’antigène ont permis la construction de modèles de prédiction.
La première partie de ce travail correspond au traitement des films collectés par l’utilisation d’un outil
spécifique aux traitements d’images. Par la suite, différents modèles de prédictions sont créés dans un
contexte non tumoral. Des films collectés dans un contexte tumoral sont utilisés afin d’étudier
l’adaptabilité des modèles.

Ainsi, l’axe sur les modèles de prédiction est divisé en 5 parties :
- Partie 1 : Construction d’un modèle de classification binaire basé sur la morphologie des
cellules T à un moment t.
- Partie 2 : Construction d’un modèle de classification binaire basé sur la morphologie des
cellules T après projection sur 3 temps.
- Partie 3 : Construction d’un modèle de classification en 3 classes basé sur la morphologie des
cellules T à un moment t.
- Partie 4 : Adaptation des différents modèles sur un film dans un contexte tumoral.
Ce projet a été encadré par Philippe Bousso, directeur du département d’Immunologie de
l’Institut Pasteur, et Hélène Moreau, chargée de recherche à l’Institut Curie.

Les macros réalisées sur ImageJ sont présentes dans le répertoire "fiji_macro". Les modèles sont dans le notebook "long_project".

Les différents tests avec la bibliothèque SHAP sont dans le notebook
