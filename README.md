# Processus Métier - Hôtel et Restaurant (BPMN 2.0)

## Fichier principal
- `hotel-restaurant-process.bpmn` — Fichier BPMN 2.0 importable dans Bonita Studio

## Comment importer dans Bonita Studio

1. Ouvrir **Bonita Studio**
2. Menu **Fichier** → **Importer** → **Diagramme BPMN 2.0**
3. Sélectionner le fichier `hotel-restaurant-process.bpmn`
4. Le diagramme s'ouvre avec tous les pools et lanes

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
