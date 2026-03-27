#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KEYLAYOUT_FILE="$SCRIPT_DIR/frqw.keylayout"
USER_DIR="$HOME/Library/Keyboard Layouts"
SYSTEM_DIR="/Library/Keyboard Layouts"

# Vérifie qu'on est bien sur macOS
if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "Ce script est uniquement pour macOS."
    exit 1
fi

echo "==> Installation du layout clavier 'frqw' sur macOS..."

# Choix : installation utilisateur (défaut) ou système (sudo)
if [[ "$1" == "--system" ]]; then
    if [[ $EUID -ne 0 ]]; then
        echo "L'installation système requiert sudo."
        echo "Usage: sudo $0 --system"
        exit 1
    fi
    DEST="$SYSTEM_DIR"
else
    DEST="$USER_DIR"
fi

echo "  Installation dans '$DEST/'..."
mkdir -p "$DEST"
cp "$KEYLAYOUT_FILE" "$DEST/frqw.keylayout"

echo ""
echo "==> Installation terminée."
echo ""
echo "Pour activer le layout :"
echo "  1. Ouvrir Réglages Système → Clavier → Méthodes de saisie"
echo "  2. Cliquer '+', chercher 'Français' dans la liste de gauche"
echo "  3. Sélectionner 'French QWERTY (frqw)' et cliquer Ajouter"
echo ""
echo "Note : une déconnexion/reconnexion peut être nécessaire si"
echo "  le layout n'apparaît pas dans la liste."
