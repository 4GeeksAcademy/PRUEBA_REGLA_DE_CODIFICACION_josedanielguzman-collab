#!/bin/bash
# ──────────────────────────────────────────────────────────────────────────────
# publish-clean-project.sh
# Uso:   ./scripts/publish-clean-project.sh <ruta-al-proyecto> <url-del-repo-final>
# Propósito: Extrae el código limpio de un proyecto terminado (sin reglas,
#            scripts de template ni historial) y lo publica en un nuevo repo.
# ──────────────────────────────────────────────────────────────────────────────

set -euo pipefail

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if [ $# -lt 2 ]; then
  echo -e "${RED}Error: Faltan argumentos.${NC}"
  echo "Uso: ./scripts/publish-clean-project.sh <ruta-del-proyecto-terminado> <url-del-nuevo-repo>"
  echo ""
  echo "Ejemplo:"
  echo "  ./scripts/publish-clean-project.sh /ruta/mi-proyecto https://github.com/usuario/proyecto-final.git"
  exit 1
fi

PROJECT_DIR="$1"
NEW_REMOTE="$2"
TEMP_DIR="/tmp/clean-publish-$(date +%s)"

if [ ! -d "$PROJECT_DIR" ]; then
  echo -e "${RED}Error: El directorio '$PROJECT_DIR' no existe.${NC}"
  exit 1
fi

echo -e "${YELLOW}📤 Preparando publicación limpia del proyecto...${NC}"
echo -e "${YELLOW}   Origen:  $PROJECT_DIR${NC}"
echo -e "${YELLOW}   Destino: $NEW_REMOTE${NC}"
echo ""

# 1. Clonar el proyecto a una carpeta temporal
echo -e "${YELLOW}📂 Clonando proyecto...${NC}"
git clone "$PROJECT_DIR" "$TEMP_DIR"
cd "$TEMP_DIR"

# 2. Eliminar archivos de reglas y template del historial
echo -e "${YELLOW}🗑️  Eliminando reglas de codificación y scripts del historial...${NC}"
git filter-branch --force --index-filter \
  'git rm -r --cached --ignore-unmatch \
    .ai-rules/ \
    .cursor/ \
    AGENTS.md \
    scripts/create-new-project.sh \
    scripts/publish-clean-project.sh \
    .env.example' \
  --prune-empty --tag-name-filter cat -- --all

# 3. Crear un clone fresco (sin el historial filtrado pesado)
echo -e "${YELLOW}🧹 Creando clone fresco...${NC}"
FRESH_DIR="/tmp/clean-final-$(date +%s)"
git clone "$TEMP_DIR" "$FRESH_DIR"
cd "$FRESH_DIR"

# 4. Agregar el remote del nuevo repositorio
echo -e "${YELLOW}🔗 Configurando remote: $NEW_REMOTE${NC}"
git remote add origin "$NEW_REMOTE"

# 5. Mostrar resumen antes de publicar
echo ""
echo -e "${GREEN}✅ Proyecto listo para publicar.${NC}"
echo ""
echo -e "${YELLOW}📋 Resumen:${NC}"
echo "   Archivos incluidos:"
git ls-files | head -20
echo "   ..."
echo ""
echo -e "   Para publicar, ejecuta:"
echo -e "   ${GREEN}   cd $FRESH_DIR${NC}"
echo -e "   ${GREEN}   git push -u origin main${NC}"
echo ""
echo -e "${YELLOW}⚠️  Revisa que todo esté correcto antes de hacer push.${NC}"
echo ""