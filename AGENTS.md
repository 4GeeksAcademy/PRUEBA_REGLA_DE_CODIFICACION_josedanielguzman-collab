# AGENTS.md — Reglas Globales de Codificación

> Este archivo contiene las reglas globales que aplican a **todos los proyectos** del repositorio.
> Las reglas específicas por stack tecnológico están en `.cursor/rules/`.

---

## Flujo de Trabajo con Agentes y Especificaciones

### Spec-Driven Development
Antes de escribir código en proyectos complejos (como *Financial Dashboard* o *Agent Hub*), redacta o verifica las especificaciones (`specs/`) y el contexto del dominio antes de implementar.

### Seguridad y Secretos
- Nunca expongas claves de API (`OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, credenciales de DB o tokens) en el código ni en Git.
- Usa siempre archivos `.env` listados en `.gitignore` y provee un `.env.example`.

---

## Convenciones de Git, Ramas y Commits

### Ramas
Usa prefijos descriptivos según la tarea:
- `feat/nombre-modulo` — Nuevas funcionalidades
- `fix/descripcion-error` — Corrección de errores
- `refactor/componente` — Refactorización
- `docs/readme` — Documentación
- `chore/config` — Tareas de mantenimiento

### Commits (Conventional Commits)
Escribe mensajes claros y atómicos en formato:
```
tipo(alcance): descripción breve
```
Ejemplo: `feat(auth): implement JWT token refresh flow`

Tipos permitidos: `feat`, `fix`, `refactor`, `docs`, `chore`, `test`, `style`, `perf`, `ci`.

### Entregables limpios
- No subas carpetas autogeneradas (`node_modules/`, `__pycache__/`, `.venv/`, `.next/`, `dist/`, `build/`).
- Todo proyecto debe incluir un `README.md` con instrucciones exactas de instalación y ejecución.
- Mantén un `.gitignore` actualizado.

---

## Estructura del Repositorio

```
/
├── AGENTS.md                    # Reglas Globales (este archivo)
├── .cursor/rules/               # Reglas modulares por stack
│   ├── frontend.mdc
│   ├── typescript.mdc
│   ├── backend-python.mdc
│   └── infra-data.mdc
├── .ai-rules/project/           # Reglas legacy (compatibilidad)
├── components/                  # Código fuente de ejemplo
├── scripts/                     # Utilidades de automatización
├── .gitignore
├── .env.example
└── README.md
```