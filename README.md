# Processus Métier - Hôtel et Restaurant (BPMN 2.0)

Dépôt GitHub : https://github.com/NyAndriaX/bpmn-hotel-restaurant

## Important : clonage Git dans Bonita Studio

**Ne pas utiliser** `Équipe → Git → Cloner` sur ce dépôt en l'état actuel.

Bonita Studio affichera : *« Bonita project descriptor not found »* car ce dépôt contient un **diagramme BPMN**, pas un **projet Bonita** complet (structure Maven + `.project` générée par le Studio).

**Procédure correcte :** voir le guide détaillé **[IMPORT-BONITA.md](IMPORT-BONITA.md)**

En bref :
1. **Fichier** → **Nouveau projet…** dans Bonita Studio
2. **Fichier** → **Importer** → **Diagramme BPMN 2.0** → `hotel-restaurant-process.bpmn`
3. (Optionnel) **Équipe** → **Git** → **Partager avec Git** pour pousser un vrai projet Bonita sur GitHub

## Fichiers du dépôt

| Fichier | Description |
|---------|-------------|
| `hotel-restaurant-process.bpmn` | Diagramme BPMN 2.0 (import Bonita) |
| `visualisation-bpmn.html` | Aperçu dans le navigateur |
| `IMPORT-BONITA.md` | Guide d'import et dépannage clone Git |
| `installer-bonita.sh` / `installer-bonita.bat` | Installation Bonita Studio |

## Structure du processus

### Pools (Participants)

| Pool | Description |
|------|-------------|
| **Client** | Parcours client : réservation, séjour, commande restaurant |
| **Hôtel** | Gestion interne avec 3 lanes |
| **Restaurant** | Gestion des commandes et facturation |
| **Page Facebook** | Réponse aux demandes de tarifs |

### Lanes (Hôtel)

| Lane | Rôle |
|------|------|
| **Réceptionniste** | Vérification disponibilité, émission facture, encaissement |
| **Femmes de ménage** | Nettoyage, remplacement articles, notification |
| **Comptable** | Vérification stock, comptage factures, tableau de bord |

### Catégories de chambres
- Standard
- Suite Senior
- Suite Prestige

### Articles par chambre (consommation par nuitée)
- Gel douche × 1
- Papier hygiénique × 1
- Pantoufle × 1
- Brosse à dent × 1

### Règles métier
- Seules les chambres **propres** peuvent être vendues
- Chaque nuitée = consommation des 4 articles
- Le ménage doit notifier le réceptionniste après nettoyage
- Le comptable vérifie le stock et réapprovisionne si nécessaire
- La facture restaurant peut être transférée à la chambre

## Flux de messages entre pools

1. Client → Hôtel : Demande de réservation
2. Hôtel → Client : Confirmation + Facture
3. Femmes de ménage → Réceptionniste : Notification chambre propre
4. Réceptionniste → Comptable : Copie de facture
5. Client → Facebook : Demande de tarif
6. Facebook → Client : Réponse tarif
7. Client → Restaurant : Commande
8. Restaurant → Client : Facture ajoutée à la chambre
