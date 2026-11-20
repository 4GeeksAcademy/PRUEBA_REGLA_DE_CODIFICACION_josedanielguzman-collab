#!/bin/bash
# ──────────────────────────────────────────────────────────────────────────────
# create-new-project.sh
# Uso:   ./scripts/create-new-project.sh <nombre-del-nuevo-proyecto>
# Propósito: Clona este repositorio template, resetea el historial git
#            y deja el proyecto listo para empezar a codificar.
# ──────────────────────────────────────────────────────────────────────────────

set -euo pipefail

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if [ $# -lt 1 ]; then
  echo -e "${RED}Error: Debes especificar un nombre para el nuevo proyecto.${NC}"
  echo "Uso: ./scripts/create-new-project.sh <nombre-del-proyecto>"
  exit 1
fi

NEW_PROJECT_NAME="$1"
TEMPLATE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PARENT_DIR="$(dirname "$TEMPLATE_DIR")"
DEST_DIR="$PARENT_DIR/$NEW_PROJECT_NAME"

if [ -d "$DEST_DIR" ]; then
  echo -e "${RED}Error: El directorio '$DEST_DIR' ya existe.${NC}"
  exit 1
fi

echo -e "${YELLOW}📦 Creando nuevo proyecto desde el template...${NC}"

# 1. Clonar el repositorio template
git clone "$TEMPLATE_DIR" "$DEST_DIR"

# 2. Entrar al directorio destino
cd "$DEST_DIR"

# 3. Eliminar el historial git del template
echo -e "${YELLOW}🧹 Limpiando historial git del template...${NC}"
rm -rf .git

# 4. Inicializar un repositorio git fresco
git init
git checkout -b main

# 5. Hacer commit inicial
git add .
git commit -m "chore: initial scaffold from coding-standards template

Includes:
- AGENTS.md (global coding rules)
- .cursor/rules/ (modular rules per stack)
- Project example components
- Automation scripts"

echo ""
echo -e "${GREEN}✅ Proyecto '$NEW_PROJECT_NAME' creado exitosamente en:${NC}"
echo -e "${GREEN}   $DEST_DIR${NC}"
echo ""
echo -e "${YELLOW}📋 Próximos pasos:${NC}"
echo "   cd $NEW_PROJECT_NAME"
echo "   # Revisa AGENTS.md y .cursor/rules/ para conocer las reglas"
echo "   # Empieza a desarrollar siguiendo los estándares definidos"
echo ""