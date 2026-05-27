# Projet Bonita — Hôtel et Restaurant

Dépôt GitHub : https://github.com/NyAndriaX/bpmn-hotel-restaurant

Projet Bonita Studio importable (Git ou archive BOS), modélisant le workflow hôtel/restaurant.

## Importer le projet dans Bonita Studio

**Guide détaillé : [IMPORT-BONITA.md](IMPORT-BONITA.md)**

### Option A — Git (cloner le projet)

1. **Équipe** → **Git** → **Cloner…**
2. URI : `git@github.com:NyAndriaX/bpmn-hotel-restaurant.git`

### Option B — Archive BOS

1. Télécharger [releases/hotel-restaurant-1.0.0.bos](releases/hotel-restaurant-1.0.0.bos)
2. **Fichier** → **Importer** → **Archive BOS…** → créer un nouveau projet

## Structure du dépôt

```
hotel-restaurant/          # Projet Bonita (racine)
├── app/diagrams/          # Processus (.proc)
├── bdm/                   # Modèle de données métier
├── pom.xml
├── docs/                  # BPMN de référence + visualisation HTML
├── releases/              # Archive .bos pour import
└── scripts/               # Installation Bonita Studio
```

## Processus métier (référence)

### Pools

| Pool | Rôle |
|------|------|
| **Client** | Réservation, séjour, restaurant |
| **Hôtel** | Réceptionniste, ménage, comptable |
| **Restaurant** | Commandes, facturation |
| **Page Facebook** | Tarifs, menus |

Voir le diagramme complet : `docs/hotel-restaurant-process.bpmn`  
Visualisation : ouvrir `docs/visualisation-bpmn.html` dans un navigateur.

### Règles métier

- 3 catégories de chambres : Standard, Suite Senior, Suite Prestige
- Articles par nuitée : gel douche, papier hygiénique, pantoufle, brosse à dent
- Seules les chambres **propres** sont vendues
- Le ménage notifie la réception après nettoyage
- Facture restaurant transférable sur la chambre

## Installation de Bonita Studio

- Linux : `scripts/installer-bonita.sh`
- Windows : `scripts/installer-bonita.bat`

Téléchargement : https://www.bonitasoft.com/downloads
