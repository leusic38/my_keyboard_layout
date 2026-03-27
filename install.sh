#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYMBOLS_DIR="/usr/share/X11/xkb/symbols"
EVDEV_XML="/usr/share/X11/xkb/rules/evdev.xml"
LAYOUT_NAME="frqw"

# Vérifie les droits root
if [[ $EUID -ne 0 ]]; then
    echo "Ce script doit être exécuté avec sudo."
    echo "Usage: sudo $0"
    exit 1
fi

echo "==> Installation du layout clavier '$LAYOUT_NAME'..."

# 1. Lien symbolique vers le fichier de layout du dépôt
echo "  Lien symbolique : '$SYMBOLS_DIR/$LAYOUT_NAME' -> '$SCRIPT_DIR/$LAYOUT_NAME'..."
ln -sf "$SCRIPT_DIR/$LAYOUT_NAME" "$SYMBOLS_DIR/$LAYOUT_NAME"

# 2. Ajout de l'entrée XML dans evdev.xml si absente
if grep -q "\"$LAYOUT_NAME\"" "$EVDEV_XML"; then
    echo "  Entrée '$LAYOUT_NAME' déjà présente dans evdev.xml, rien à faire."
else
    echo "  Ajout de '$LAYOUT_NAME' dans '$EVDEV_XML'..."
    # Insère le bloc layout avant la fermeture de </layoutList>
    sed -i "/<\/layoutList>/i\\
    <layout>\\
      <configItem>\\
        <name>$LAYOUT_NAME<\/name>\\
        <shortDescription>qwerty french<\/shortDescription>\\
        <description>Clavier QWERTY personnel avec les touches utilisées en français<\/description>\\
      <\/configItem>\\
    <\/layout>" "$EVDEV_XML"
    echo "  Entrée ajoutée."
fi

echo ""
echo "==> Installation terminée."
echo ""
echo "Pour activer le layout :"
echo "  Layout seul         : setxkbmap $LAYOUT_NAME"
echo "  Layout + fr (bascule): setxkbmap -layout \"$LAYOUT_NAME,fr\" -variant \",oss\""
