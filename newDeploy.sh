# Eliminar el directorio .git existente (solo si quieres reiniciar)
rm -rf .git

# Inicializar un nuevo repositorio Git
git init

# Agregar todos los archivos
git add .

# Hacer el commit inicial
git commit -m "Initial commit con Wolfram Engine y Node.js"

# Crear un nuevo repositorio en GitHub desde la terminal
gh repo create mmatex-wljs --public --source=.

# Subir el commit inicial a GitHub
git push -u origin main
