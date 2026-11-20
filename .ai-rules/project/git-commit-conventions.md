# `git-commit-conventions.md`

## Descripción

Convenciones para commits y ramas en Git.

## Regla

### Ramas
Usar prefijos descriptivos:
- `feat/nombre-modulo` — Nueva funcionalidad
- `fix/descripcion-error` — Corrección
- `refactor/componente` — Refactorización
- `docs/readme` — Documentación
- `chore/config` — Mantenimiento

### Commits (Conventional Commits)
Formato: `tipo(alcance): descripción breve`

Tipos permitidos: `feat`, `fix`, `refactor`, `docs`, `chore`, `test`, `style`, `perf`, `ci`.

## Correcto ✅

```
feat(auth): implement JWT token refresh flow
fix(button): resolve loading state not disabling click
refactor(api): extract user service from controller
docs(readme): add installation instructions
chore(deps): update tailwindcss to v3.4
```

## Incorrecto ❌

```
fix bug                 # ❌ muy vago
arreglando cosas        # ❌ sin formato
WIP                     # ❌ sin contexto
Agregando cambios       # ❌ no dice qué cambió
```

## Justificación

- **Historial limpio**: permite navegar el changelog eficientemente
- **Automatización**: genera changelogs y releases automáticos
- **Contexto**: cada commit cuenta una historia clara