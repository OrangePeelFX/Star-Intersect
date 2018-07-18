# Star Intersect

Ce programme sert à l'intersection des données mrcs de 2 fichiers STAR 

## Haxe

Pour lancer le programme en Neko

	haxe -main "Main" --interp -lib thx.core

En python (version 3.7):

	pour compiler le programme en Python : haxe build-py.hxml
	puis pour le le lancer : py StarIntersect.py -f1 "monfichier.star" -f2 "monfichier.star" -o "resultats.txt"

ou sinon en C++ :

	pour compiler le programme en CPP : haxe build-cpp.hxml
	puis pour le le lancer : StarIntersect -f1 "monfichier.star" -f2 "monfichier.star" -o "resultats.txt"
	
## Documentation

####	Usage
```
	StarIntersect -f1 <fichier> -f2 <fichier> -o <fichier>
```
####	Options
```
- f1 <fichier> : Fichier du 1er dataset
- f2 <fichier> : Fichier du 2nd dataset
- o  <fichier> : Fichier de sortie de l'intersection
```
------------------------------

## Algorithme

Le programme charge les 2 fichiers .star et cherche les chemins .mrcs
à l'aide l'expression régulière suivante / ([0-9]+@.*\/.*)\.mrcs /

Le programme fait ensuite l'intersection des 2 tableaux de données.
Et sauvegarde les redondances dans le fichier de sortie.


	