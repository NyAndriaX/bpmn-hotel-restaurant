@echo off
chcp 65001 >nul
title Installation Bonita Studio Community - Hôtel/Restaurant

echo ╔══════════════════════════════════════════════════════════════╗
echo ║  Installation Bonita Studio Community - Hôtel/Restaurant    ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

set "SCRIPT_DIR=%~dp0"
set "BPMN_FILE=%SCRIPT_DIR%hotel-restaurant-process.bpmn"
set "INSTALL_DIR=%USERPROFILE%\BonitaStudio"
set "BONITA_VERSION=2026.1"

:: Étape 1 : Vérifier Java
echo [1/5] Vérification de Java...
java -version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo   ⚠ Java non trouvé.
    echo   Veuillez installer Java 11+ depuis: https://adoptium.net/
    echo   Puis relancez ce script.
    pause
    exit /b 1
)
for /f "tokens=3" %%i in ('java -version 2^>^&1 ^| findstr /i "version"') do set JAVA_VER=%%i
echo   ✓ Java %JAVA_VER% détecté

:: Étape 2 : Vérifier si Bonita est déjà installé
echo.
echo [2/5] Vérification de Bonita Studio...
if exist "%INSTALL_DIR%\BonitaStudioCommunity.exe" (
    echo   ✓ Bonita Studio déjà installé dans %INSTALL_DIR%
    goto :launch
)

:: Étape 3 : Chercher le fichier d'installation
echo   Bonita Studio n'est pas encore installé.
echo.
echo   ┌─────────────────────────────────────────────────────────┐
echo   │ TÉLÉCHARGEMENT REQUIS                                   │
echo   │                                                         │
echo   │ Veuillez télécharger Bonita Studio :                    │
echo   │                                                         │
echo   │ 1. Ouvrir: https://www.bonitasoft.com/downloads         │
echo   │ 2. Cliquer sur 'Bonita for Windows'                     │
echo   │ 3. Le fichier sera:                                     │
echo   │    BonitaStudioCommunity-%BONITA_VERSION%-x86_64.exe    │
echo   │                                                         │
echo   │ Placez le fichier dans :                                │
echo   │ %SCRIPT_DIR%                                            │
echo   └─────────────────────────────────────────────────────────┘
echo.

:: Chercher dans le dossier courant et Downloads
set "INSTALLER="
for %%f in ("%SCRIPT_DIR%BonitaStudioCommunity-*-x86_64.exe") do set "INSTALLER=%%f"
if "%INSTALLER%"=="" (
    for %%f in ("%USERPROFILE%\Downloads\BonitaStudioCommunity-*-x86_64.exe") do set "INSTALLER=%%f"
)

if "%INSTALLER%"=="" (
    echo   Fichier d'installation non trouvé.
    echo   Téléchargez-le et relancez ce script.
    echo.
    pause
    exit /b 1
)

echo   ✓ Fichier trouvé: %INSTALLER%
echo.

:: Étape 3 : Installer Bonita Studio
echo [3/5] Installation de Bonita Studio...
echo   Lancement de l'installateur...
echo   (Suivez l'assistant d'installation, répertoire conseillé: %INSTALL_DIR%)
echo.
start /wait "" "%INSTALLER%"

if not exist "%INSTALL_DIR%\BonitaStudioCommunity.exe" (
    echo.
    echo   ⚠ Bonita Studio n'a pas été trouvé dans %INSTALL_DIR%
    echo   Si vous avez choisi un autre répertoire, modifiez INSTALL_DIR dans ce script.
    set /p "INSTALL_DIR=  Entrez le chemin d'installation: "
)

:launch
:: Étape 4 : Vérifier le fichier BPMN
echo.
echo [4/5] Préparation du fichier BPMN...
if exist "%BPMN_FILE%" (
    echo   ✓ Fichier BPMN prêt: %BPMN_FILE%
) else (
    echo   ✗ Fichier BPMN non trouvé!
    pause
    exit /b 1
)

:: Étape 5 : Lancer Bonita Studio
echo.
echo [5/5] Lancement de Bonita Studio...
echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║  INSTRUCTIONS D'IMPORT                                      ║
echo ║                                                             ║
echo ║  Bonita Studio va s'ouvrir. Pour importer le diagramme :    ║
echo ║                                                             ║
echo ║  1. Attendre que Bonita Studio soit complètement chargé     ║
echo ║  2. Menu: Fichier → Importer → Diagramme BPMN 2.0...       ║
echo ║  3. Naviguer vers:                                          ║
echo ║     %BPMN_FILE%
echo ║  4. Cliquer 'Ouvrir'                                       ║
echo ║  5. Le diagramme apparaîtra avec tous les pools et lanes    ║
echo ║                                                             ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

if exist "%INSTALL_DIR%\BonitaStudioCommunity.exe" (
    echo Lancement de Bonita Studio...
    start "" "%INSTALL_DIR%\BonitaStudioCommunity.exe"
    echo.
    echo ✓ Bonita Studio est en cours de démarrage.
    echo   (Le premier lancement peut prendre 1-2 minutes)
) else (
    echo ⚠ Bonita Studio non trouvé. Vérifiez l'installation.
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo   Projet terminé ! Fichiers disponibles:
echo   • %BPMN_FILE%
echo   • %SCRIPT_DIR%visualisation-bpmn.html (ouvrir dans navigateur)
echo   • %SCRIPT_DIR%README.md
echo ═══════════════════════════════════════════════════════════════
echo.
pause
