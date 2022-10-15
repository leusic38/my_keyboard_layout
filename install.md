## Installation de mon layout de clavier

installer le fichier frqw dans "/usr/share/X11/xkb/symbols

dans le fichier "/usr/share/X11/xkb/rules/evdev.xml" ajouter 
avant la fermeture de la balise layoutList "\</layoutList>" le code suivant:

```
<layout>
    <configItem>
    <name>frqw</name>
    <shortdescription>qwerty french</shortdescription>
    <description>clavier qwerty personnel avec les touches utilisées en français</description>
    </configItem>
</layout>
```
utiliser la commande suivante pour generer un layout multiple avec utilisation du petit script creer dans i3blocks pour le changement
 setxkbmap -layout "frqw,fr" -variant ",oss"

 ou alors juste:
 setxkbmap frqw
