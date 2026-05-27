# Importer le projet dans Bonita Studio

Ce dépôt est maintenant un **projet Bonita complet**. Vous pouvez l’ouvrir par **import de projet**, sans passer par « Importer un fichier BPMN ».

---

## Méthode 1 — Cloner le projet (Git) — recommandé

1. Ouvrir **Bonita Studio**
2. Menu **Équipe** → **Git** → **Cloner…**
3. URI du dépôt :
   ```
   git@github.com:NyAndriaX/bpmn-hotel-restaurant.git
   ```
   (ou HTTPS : `https://github.com/NyAndriaX/bpmn-hotel-restaurant.git`)
4. Suivre l’assistant jusqu’à la fin
5. Le projet **hotel-restaurant** apparaît dans l’explorateur

> Si Bonita propose une **migration** de version, acceptez et laissez le Studio terminer.

---

## Méthode 2 — Importer une archive BOS (projet)

1. Télécharger le fichier :  
   [releases/hotel-restaurant-1.0.0.bos](releases/hotel-restaurant-1.0.0.bos)  
   (sur GitHub : onglet **Releases** ou dossier `releases/` du dépôt)
2. Dans Bonita Studio : **Fichier** → **Importer** → **Archive BOS…**
3. Cocher **Créer un nouveau projet**
4. Sélectionner `hotel-restaurant-1.0.0.bos`
5. Cliquer **Importer**

Ceci importe **tout le projet** (structure Maven, BDM, diagramme), pas seulement un fichier isolé.

---

## Contenu du projet importé

| Élément | Emplacement |
|---------|-------------|
| Diagramme de processus | `app/diagrams/HotelRestaurant-1.0.proc` |
| Modèle de données (BDM) | `bdm/bom.xml` (objet `Chambre`) |
| Référence BPMN complète (4 pools) | `docs/hotel-restaurant-process.bpmn` |
| Visualisation navigateur | `docs/visualisation-bpmn.html` |

Le fichier `.proc` dans le projet est un **squelette Bonita** (basé sur le tutoriel officiel). Le diagramme détaillé hôtel/restaurant (Client, Hôtel, Restaurant, Facebook) est dans `docs/hotel-restaurant-process.bpmn` pour le reproduire ou l’enrichir dans le Studio.

---

## Après l’import

1. Ouvrir le diagramme **HotelRestaurant** dans `app/diagrams/`
2. Adapter le processus selon le cahier des charges et le BPMN de référence dans `docs/`
3. **Déployer** : clic droit sur le processus → **Déployer**

---

## Récapitulatif

| Action | Utiliser |
|--------|----------|
| Importer **le projet** | **Git → Cloner** ou **Importer → Archive BOS** |
| Voir le BPMN de référence | `docs/hotel-restaurant-process.bpmn` |
| Ne pas utiliser | Git → Cloner sur l’ancienne version (simple `.bpmn` à la racine) |
