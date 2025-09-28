# 📦 Entreprise Notifications – ESX

Un script simple et immersif pour permettre aux entreprises de ton serveur FiveM d’annoncer **ouverture** et **fermeture** avec des notifications GTA V natives + son.

---

## ✨ Fonctionnalités

- Commandes **/open** et **/close** (automatique selon le job du joueur).
- Gestion des **grades minimum** requis (`Config.minGrade`).
- Anti-spam avec **cooldown configurable**.
- **État global des entreprises** :
  - Une seule ouverture possible par entreprise.
  - Impossible de rouvrir si déjà ouvert (même après reconnexion).
  - Fermeture obligatoire avec `/close`.
- **Notifications immersives GTA 5** :
  - Apparence identique aux notifs du jeu (type SMS).
  - Ajout d’un **son** lors de la réception.
- Messages clairs pour chaque cas :
  - Pas le job → “Tu n’as pas accès à cette commande.”
  - Pas le grade → “Tu n’as pas le grade requis…”
  - Cooldown actif → “Attends avant de réutiliser la commande.”
  - Déjà ouvert/fermé → “L’entreprise est déjà ouverte/fermée !”

---

## ⚙️ Configuration

Le fichier `config.lua` permet de personnaliser :

```lua
Config = {
    Cooldown = 60, -- Temps en secondes avant qu'un joueur puisse relancer une commande
    Jobs = {
        unicorn = {
            label = "Unicorn",
            minGrade = 2, -- Grade minimum requis
            duration = 10, -- Durée de la notification (en secondes)
            sound = "CHALLENGE_UNLOCKED", -- Son de la notif
            soundSet = "HUD_AWARDS"
        },
        burgershot = {
            label = "BurgerShot",
            minGrade = 1,
            duration = 8,
            sound = "Text_Arrive_Tone",
            soundSet = "Phone_SoundSet_Default"
        }
    }
}
```

---

## 🚀 Installation

1. Mets le dossier dans `resources/[entreprises]/entreprise_status`
2. Vérifie que ton serveur utilise ESX (sinon adapte).
3. Ajoute dans ton `server.cfg` :

```lua
   ensure entreprise_status
```

---

## 🕹️ Utilisation
- `/open` → Ouvrir son entreprise (si grade suffisant).
- `/close` → Fermer son entreprise.
Les notifications sont envoyées à tous les joueurs connectés.

---

## 📌 Roadmap / Améliorations futures
- Choix de la position des notifications (haut-gauche, bas-droite, centre).
- Ajout d’une commande de test des sons pour choisir facilement le son idéal.
- Interface NUI personnalisable.
