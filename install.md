# Installation du layout clavier frqw

---

## Linux

### Installation rapide (script)

```bash
sudo ./install.sh
```

Le script :
1. Copie `frqw` dans `/usr/share/X11/xkb/symbols/`
2. Ajoute l'entrée dans `/usr/share/X11/xkb/rules/evdev.xml` (si absente)

### Activation

Layout seul :
```bash
setxkbmap frqw
```

Layout avec bascule fr/frqw (pour i3blocks ou similaire) :
```bash
setxkbmap -layout "frqw,fr" -variant ",oss"
```

### Installation manuelle

1. Copier `frqw` dans `/usr/share/X11/xkb/symbols/`
2. Ajouter dans `/usr/share/X11/xkb/rules/evdev.xml`, avant `</layoutList>` :

```xml
<layout>
  <configItem>
    <name>frqw</name>
    <shortDescription>qwerty french</shortDescription>
    <description>Clavier QWERTY personnel avec les touches utilisées en français</description>
  </configItem>
</layout>
```

---

## macOS

### Installation rapide (script)

Installation pour l'utilisateur courant (pas besoin de sudo) :
```bash
./install_mac.sh
```

Installation système (tous les utilisateurs) :
```bash
sudo ./install_mac.sh --system
```

Le script copie `frqw.keylayout` dans :
- `~/Library/Keyboard Layouts/` (utilisateur)
- `/Library/Keyboard Layouts/` (système, avec `--system`)

### Activation

1. Ouvrir **Réglages Système → Clavier → Méthodes de saisie**
2. Cliquer **+**, chercher **Français** dans la liste de gauche
3. Sélectionner **French QWERTY (frqw)** et cliquer **Ajouter**

> Si le layout n'apparaît pas, se déconnecter et se reconnecter.

### Équivalences des modificateurs

| Linux (XKB) | macOS |
|-------------|-------|
| AltGr | Option (⌥) |
| AltGr+Shift | Shift+Option (⇧⌥) |

Les dead keys fonctionnent de la même façon :
- `^` (Shift+6) → dead_circumflex
- `⌥` + `` ` `` → dead_grave
- `⌥` + `9` → dead_tréma
- `⌥` + `'` → dead_cédille
- `⇧⌥` + `` ` `` → dead_tilde
- `⇧⌥` + `0` → dead_rond
- `⇧⌥` + `.` → dead_caron

---

## Windows

### Prérequis

Télécharger **Microsoft Keyboard Layout Creator (MSKLC)** :
https://www.microsoft.com/en-us/download/details.aspx?id=102134

### Installation

1. Ouvrir MSKLC
2. **File → Load Existing Keyboard** → sélectionner `frqw.klc`
3. **Project → Build DLL and Setup Package**
4. Exécuter `setup.exe` dans le dossier généré
5. **Paramètres Windows → Heure et langue → Langue → Français (France) → Options → Ajouter un clavier** → sélectionner `French QWERTY (frqw)`

> **Note :** Si MSKLC refuse de charger le fichier, ouvrir `frqw.klc` dans un éditeur de texte
> et le sauvegarder en **UTF-16 LE avec BOM**.

### Désinstallation Windows

**Paramètres → Applications → rechercher "frqw"** → Désinstaller,
puis supprimer le layout dans les paramètres de langue.
