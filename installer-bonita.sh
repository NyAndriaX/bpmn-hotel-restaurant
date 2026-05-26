#!/bin/bash
#
# Script d'installation automatique - Bonita Studio Community Edition
# et import du diagramme BPMN Hôtel/Restaurant
#

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BPMN_FILE="$SCRIPT_DIR/hotel-restaurant-process.bpmn"
INSTALL_DIR="$HOME/BonitaStudio"
BONITA_VERSION="2026.1"

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Installation Bonita Studio Community - Hôtel/Restaurant    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Étape 1 : Vérifier Java
echo "[1/5] Vérification de Java..."
if ! command -v java &> /dev/null; then
    echo "  ⚠ Java non trouvé. Installation..."
    sudo apt-get update -qq && sudo apt-get install -y openjdk-17-jdk -qq
fi
JAVA_VER=$(java -version 2>&1 | head -1)
echo "  ✓ $JAVA_VER"

# Étape 2 : Vérifier si Bonita est déjà installé
echo ""
echo "[2/5] Vérification de Bonita Studio..."
if [ -d "$INSTALL_DIR" ] && [ -f "$INSTALL_DIR/BonitaStudioCommunity" ]; then
    echo "  ✓ Bonita Studio déjà installé dans $INSTALL_DIR"
else
    echo "  Bonita Studio n'est pas encore installé."
    echo ""
    echo "  ┌─────────────────────────────────────────────────────────┐"
    echo "  │ TÉLÉCHARGEMENT REQUIS                                   │"
    echo "  │                                                         │"
    echo "  │ Bonitasoft ne permet pas le téléchargement automatique. │"
    echo "  │ Veuillez télécharger manuellement :                     │"
    echo "  │                                                         │"
    echo "  │ 1. Ouvrir: https://www.bonitasoft.com/downloads         │"
    echo "  │ 2. Cliquer sur 'Bonita for Linux'                       │"
    echo "  │ 3. Le fichier sera:                                     │"
    echo "  │    BonitaStudioCommunity-${BONITA_VERSION}-x86_64.tar.gz│"
    echo "  │                                                         │"
    echo "  │ Placez le fichier dans :                                │"
    echo "  │ $SCRIPT_DIR/                                            │"
    echo "  └─────────────────────────────────────────────────────────┘"
    echo ""

    TARBALL=$(find "$SCRIPT_DIR" "$HOME/Downloads" "$HOME/Téléchargements" -name "BonitaStudioCommunity-*-x86_64.tar.gz" 2>/dev/null | head -1)

    if [ -z "$TARBALL" ]; then
        echo "  Fichier .tar.gz non trouvé."
        echo "  Téléchargez-le et relancez ce script."
        echo ""
        read -p "  Appuyez sur Entrée une fois le fichier téléchargé (ou Ctrl+C pour quitter)... "
        TARBALL=$(find "$SCRIPT_DIR" "$HOME/Downloads" "$HOME/Téléchargements" -name "BonitaStudioCommunity-*-x86_64.tar.gz" 2>/dev/null | head -1)
        if [ -z "$TARBALL" ]; then
            echo "  ✗ Fichier toujours non trouvé. Abandon."
            exit 1
        fi
    fi

    echo "  ✓ Fichier trouvé: $TARBALL"
    echo ""
    echo "[3/5] Extraction de Bonita Studio..."
    mkdir -p "$INSTALL_DIR"
    tar -xzf "$TARBALL" -C "$INSTALL_DIR" --strip-components=1
    chmod +x "$INSTALL_DIR/BonitaStudioCommunity"
    echo "  ✓ Extraction terminée dans $INSTALL_DIR"
fi

# Étape 4 : Préparer le fichier BPMN pour import
echo ""
echo "[4/5] Préparation du fichier BPMN..."
if [ -f "$BPMN_FILE" ]; then
    echo "  ✓ Fichier BPMN prêt: $BPMN_FILE"
else
    echo "  ✗ Fichier BPMN non trouvé!"
    exit 1
fi

# Étape 5 : Lancer Bonita Studio
echo ""
echo "[5/5] Lancement de Bonita Studio..."
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  INSTRUCTIONS D'IMPORT                                      ║"
echo "║                                                             ║"
echo "║  Bonita Studio va s'ouvrir. Pour importer le diagramme :    ║"
echo "║                                                             ║"
echo "║  1. Attendre que Bonita Studio soit complètement chargé     ║"
echo "║  2. Menu: Fichier → Importer → Diagramme BPMN 2.0...       ║"
echo "║  3. Naviguer vers:                                          ║"
echo "║     $BPMN_FILE"
echo "║  4. Cliquer 'Ouvrir'                                       ║"
echo "║  5. Le diagramme apparaîtra avec tous les pools et lanes    ║"
echo "║                                                             ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

if [ -f "$INSTALL_DIR/BonitaStudioCommunity" ]; then
    echo "Lancement..."
    cd "$INSTALL_DIR"
    ./BonitaStudioCommunity &
    echo ""
    echo "✓ Bonita Studio est en cours de démarrage."
    echo "  (Le premier lancement peut prendre 1-2 minutes)"
else
    echo "⚠ Bonita Studio n'est pas installé. Installez-le d'abord."
    echo "  Fichier BPMN prêt pour import: $BPMN_FILE"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  Projet terminé ! Fichiers créés:"
echo "  • $BPMN_FILE"
echo "  • $SCRIPT_DIR/visualisation-bpmn.html (ouvrir dans navigateur)"
echo "  • $SCRIPT_DIR/README.md"
echo "═══════════════════════════════════════════════════════════════"
