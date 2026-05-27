# Importer le projet dans Bonita Studio

## Pourquoi le clonage Git échoue ?

Si vous voyez cette erreur :

```
Git repository clone failed.
Bonita project descriptor not found in cloned repository ...
Please check that you are cloning a Bonita project.
```

**C'est normal** pour ce dépôt dans son état actuel.

| Ce dépôt contient | Ce que Bonita attend pour un clone Git |
|-------------------|----------------------------------------|
| Un fichier `.bpmn` (diagramme BPMN 2.0) | Un **projet Bonita** complet créé par Bonita Studio |
| Des scripts d'installation | Fichiers `.project`, `pom.xml`, modules `app/`, `bdm/`, etc. |
| Une visualisation HTML | Des diagrammes au format `.proc` dans `app/diagrams/` |

Le menu **Équipe → Git → Cloner** sert à récupérer un projet **déjà exporté depuis Bonita Studio**, pas un simple fichier BPMN.

---

## Méthode recommandée : importer le diagramme BPMN

### Étape 1 — Créer un projet Bonita

1. Ouvrir **Bonita Studio**
2. **Fichier** → **Nouveau projet…**
3. Nom : `hotel-restaurant` (ou autre)
4. Project ID : `hotel-restaurant` (conventions Maven)
5. Group ID : par ex. `com.hotel.bpm`
6. Cliquer **Créer**

### Étape 2 — Importer le diagramme

1. **Fichier** → **Importer** → **Diagramme BPMN 2.0…**
2. Sélectionner `hotel-restaurant-process.bpmn` (depuis ce dépôt cloné ou téléchargé)
3. Choisir le dossier de destination dans le projet (souvent `Processus` / `diagrams`)
4. Valider

Le diagramme s'ouvre dans l'éditeur. Vous pouvez ajuster la disposition, les acteurs, les formulaires, etc.

### Étape 3 — (Optionnel) Partager sur Git pour permettre le clone

Une fois le projet créé et le diagramme importé dans Bonita Studio :

1. **Équipe** → **Git** → **Partager avec Git…**
2. Cocher **Partager le projet**
3. **Commit and Push**
4. URI : `git@github.com:NyAndriaX/bpmn-hotel-restaurant.git`
5. Terminer l'assistant

Après ce push depuis Bonita Studio, le dépôt contiendra la structure Bonita complète et le **clone Git fonctionnera** pour vous et vos collègues.

> **Note :** Le premier push depuis Studio peut remplacer l'historique Git actuel (fichiers `.bpmn` à la racine). Conservez une copie de `hotel-restaurant-process.bpmn` si besoin.

---

## Alternative : ouvrir la visualisation sans Bonita

Ouvrez `visualisation-bpmn.html` dans un navigateur (double-clic ou glisser-déposer). Aucune installation requise.

---

## Récapitulatif

| Action | Fonctionne ? |
|--------|----------------|
| **Git → Cloner** ce dépôt tel quel | Non |
| **Fichier → Importer → Diagramme BPMN 2.0** | Oui |
| **Git → Cloner** après partage depuis Studio | Oui |
| Ouvrir `visualisation-bpmn.html` | Oui |
