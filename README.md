# 🏗️ Coding Standards Template — Proyecto 4Geeks

> Repositorio template con reglas de codificación estandarizadas y proyecto de ejemplo.
> Úsalo como punto de partida para todos tus proyectos.

---

## 📋 Contenido

| Recurso | Descripción |
|---------|-------------|
| [`AGENTS.md`](./AGENTS.md) | Reglas globales de codificación (flujo de trabajo, git, seguridad) |
| [`.cursor/rules/`](./.cursor/rules/) | Reglas modulares por stack tecnológico (frontend, TypeScript, Python, infra) |
| [`.ai-rules/project/`](./.ai-rules/project/) | Reglas legacy compatibles con Claude Code |
| [`components/`](./components/) | Proyecto de ejemplo (React + TypeScript + Tailwind) |
| [`scripts/`](./scripts/) | Utilidades para crear y publicar proyectos |

---

## 🚀 Cómo usar este template

### Opción 1: GitHub Template (recomendada)
1. Haz clic en **"Use this template"** en GitHub.
2. Nombra tu nuevo proyecto.
3. Clona y empieza a codificar siguiendo las reglas.

### Opción 2: Script de creación
```bash
# Desde la raíz de este repositorio
./scripts/create-new-project.sh mi-nuevo-proyecto
cd mi-nuevo-proyecto
```

### Opción 3: Manual
```bash
git clone <este-repo> mi-nuevo-proyecto
cd mi-nuevo-proyecto
rm -rf .git
git init
git add .
git commit -m "chore: initial scaffold"
```

---

## 📚 Reglas de Codificación

### Globales (`AGENTS.md`)
- **Spec-Driven Development:** Verificar especificaciones antes de codificar.
- **Seguridad:** Nunca exponer secretos en código; usar `.env`.
- **Git:** Conventional Commits y ramas con prefijos (`feat/`, `fix/`, etc.).

### Modulares (`.cursor/rules/`)

| Archivo | Globs | Stack |
|---------|-------|-------|
| [`frontend.mdc`](./.cursor/rules/frontend.mdc) | `src/**/*.{tsx,jsx,html,css}` | React, Next.js, Tailwind CSS, Accesibilidad |
| [`typescript.mdc`](./.cursor/rules/typescript.mdc) | `**/*.{ts,tsx}` | TypeScript strict, interfaces, naming |
| [`backend-python.mdc`](./.cursor/rules/backend-python.mdc) | `**/*.py` | FastAPI, Pydantic, SQL, PEP 8 |
| [`infra-data.mdc`](./.cursor/rules/infra-data.mdc) | tests, pipelines, Docker | Errores, testing, Docker, RAG |

---

## 📤 Publicar un proyecto terminado

Cuando termines un proyecto y quieras publicarlo **sin las reglas de template**:

```bash
./scripts/publish-clean-project.sh /ruta/del/proyecto https://github.com/usuario/repo-final.git
```

Esto extraerá solo el código del proyecto, eliminando:
- `.ai-rules/` y `.cursor/` (reglas de codificación)
- `AGENTS.md`
- `scripts/` de automatización
- `.env.example`

---

## 📁 Proyecto de Ejemplo

El directorio [`components/`](./components/) contiene un componente `Button.tsx` que demuestra la aplicación de las reglas:

| Regla Aplicada | Cómo se cumple |
|----------------|----------------|
| ✅ Tailwind CSS (no inline styles) | Clases Tailwind en `variantClasses`, `sizeClasses` |
| ✅ TypeScript strict | Interfaces `ButtonProps`, tipos `ButtonVariant`, `ButtonSize` |
| ✅ PascalCase | `Button.tsx` como componente |
| ✅ camelCase | `isLoading`, `variantClasses`, `sizeClasses` |
| ✅ Accesibilidad | `aria-hidden="true"` en SVG de loading |

---

## 🧰 Stack del Proyecto de Ejemplo

- **React 18+** con TypeScript
- **Tailwind CSS** para estilos
- Componente reutilizable con variantes, sizes y estado de carga

---

## 🛠️ Scripts Disponibles

| Script | Propósito |
|--------|-----------|
| `scripts/create-new-project.sh` | Crear un nuevo proyecto desde este template |
| `scripts/publish-clean-project.sh` | Publicar proyecto terminado sin reglas de template |

---

## 📝 Licencia

Este proyecto es parte del programa **4Geeks Academy**.