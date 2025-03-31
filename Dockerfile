# Usamos la imagen de Wolfram Engine como base
FROM wolframresearch/wolframengine:latest

# Cambiamos al usuario root para las operaciones de instalación
USER root

# Instalamos Node.js 20, herramientas de construcción y Python
RUN apt-get update && apt-get install -y curl build-essential python3 && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

WORKDIR /app

# Copiamos package.json y package-lock.json
COPY package*.json ./

# Verificamos que package-lock.json exista (para depuración)
RUN ls -l package-lock.json || echo "package-lock.json not found!"

# Instalamos dependencias
RUN npm ci --omit=dev

# Copiamos el resto de tu aplicación
COPY . .

# Exponemos el puerto 3000 (si tu app es un servidor)
EXPOSE 3000

# Script para activar y luego iniciar
CMD ["sh", "-c", "wolframscript --activate -username \"$WOLFRAMID_USERNAME\" -password \"$WOLFRAMID_PASSWORD\" || true && npm start"]