## Installation de mon layout de clavier

installer le fichier fr_qw dans "/usr/share/X11/xkb/symbols

dans le fichier "/usr/share/X11/xkb/rules/evdev.xml" ajouter 
avanr la fermeture de la balise layoutList "\</layoutList>" le code suivant:

```
<layout>
    <configItem>
    <name>fr_qw</name>
    <shortdescription>qwerty french</shortdescription>
    <description>clavier qwerty personnel avec les touche français</description>
    </configItem>
</layout>
```
utiliser la commande suivante pour generer un layout multiple avec utilisation du petit script creer dans i3blocks pour le changement
 setxkbmap -layout "fr_qw,fr" -variant ",oss"

 ou alors juste:
 setxkbmap fr_qw
