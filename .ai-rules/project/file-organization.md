# `file-organization.md`

## Descripción

Organización de archivos y carpetas en el proyecto.

## Regla

```
src/
├── components/       # Componentes compartidos (Button, Card, Modal)
│   └── ui/           # Componentes de UI base
├── features/         # Módulos por funcionalidad (auth, dashboard)
│   └── auth/
│       ├── components/
│       ├── hooks/
│       └── api/
├── hooks/            # Custom hooks compartidos
├── lib/              # Utilidades y configuraciones
├── types/            # Tipos e interfaces globales
├── app/              # Páginas/rutas (Next.js App Router)
└── styles/           # Estilos globales (globals.css)
```

## Correcto ✅

```
components/
├── Button.tsx
├── Card.tsx
├── Modal.tsx
└── ui/
    ├── Input.tsx
    └── Label.tsx
```

## Incorrecto ❌

```
├── misc.tsx          # ❌ archivos sin categoría
├── helpers.ts        # ❌ muy genérico
├── file1.tsx         # ❌ nombres sin sentido
└── cosas.tsx         # ❌ nombres en idioma mezclado
```

## Justificación

- **Navegación**: estructura predecible facilita encontrar archivos
- **Escalabilidad**: el proyecto crece ordenadamente
- **Separación**: cada carpeta tiene una responsabilidad clara