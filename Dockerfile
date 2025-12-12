FROM node:20-alpine3.19

# Carpeta de trabajo dentro del contenedor
WORKDIR /app

# Copiamos solo los package*.json del server
COPY server/package*.json ./

# Instalamos dependencias del backend
RUN npm install

# Copiamos TODO el código del server
COPY server/ ./

# Compilamos TypeScript a dist/
RUN npm run build

# La app escuchará en el puerto 3000
ENV PORT=3000
EXPOSE 3000

# Levantamos el servidor
CMD ["npm", "start"]
