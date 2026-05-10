# ---------- Stage 1: deps + lint ----------
FROM node:20-slim AS builder

WORKDIR /app

# Copier les fichiers nécessaires à l'installation
COPY package*.json ./

# Installer toutes les dépendances (y compris dev pour lint)
RUN npm ci

# Copier le reste du projet
COPY . .

# Lancer le lint (échoue si erreur)
RUN npm run lint


# ---------- Stage 2: production deps ----------
FROM node:20-slim AS prod-deps

WORKDIR /app

COPY package*.json ./

# Installer uniquement les dépendances de production
RUN npm ci --omit=dev


# ---------- Stage 3: runtime ----------
FROM node:20-alpine

WORKDIR /app

# Copier uniquement les dépendances prod
COPY --from=prod-deps /app/node_modules ./node_modules

# Copier le code applicatif
COPY --from=builder /app ./

# Optionnel : supprimer les fichiers inutiles
RUN rm -rf node_modules/.cache

# Exposer le port (adapter si besoin)
EXPOSE 3000

# Commande de démarrage
CMD ["npm", "run", "start"]