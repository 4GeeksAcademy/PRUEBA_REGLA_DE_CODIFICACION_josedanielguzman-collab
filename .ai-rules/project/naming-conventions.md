# `naming-conventions.md`

## Descripción

Convenciones de nomenclatura para todo el proyecto.

## Regla

| Elemento | Convención | Ejemplo |
|----------|-----------|---------|
| Componentes React | `PascalCase` | `Button.tsx`, `UserCard.tsx` |
| Interfaces/Tipos | `PascalCase` | `interface ButtonProps` |
| Funciones/Métodos | `camelCase` | `formatDate()`, `getUserData()` |
| Variables | `camelCase` | `isLoading`, `userName` |
| Constantes globales | `UPPER_SNAKE_CASE` | `API_BASE_URL`, `MAX_RETRIES` |
| Archivos de componentes | `PascalCase` | `Button.tsx`, `Navbar.tsx` |
| Archivos de utilerías | `camelCase` | `formatDate.ts`, `useAuth.ts` |
| Directorios | `kebab-case` | `ui-components/`, `api-routes/` |

## Correcto ✅

```typescript
// Archivo: components/UserProfile.tsx
const API_BASE_URL = "https://api.example.com";

interface UserProfileProps {
  userId: string;
}

export function UserProfile({ userId }: UserProfileProps) {
  const [userData, setUserData] = useState<User | null>(null);
  // ...
}
```

## Incorrecto ❌

```typescript
// ❌ Archivo: components/user-profile.tsx
const api_base_url = "https://api.example.com";

interface user_profile_props {
  user_id: string;
}

export function User_profile({ user_id }: user_profile_props) {
  // ...
}
```

## Justificación

- **Consistencia**: todo el equipo escribe de la misma forma
- **Búsqueda**: facilita encontrar archivos y símbolos
- **Tooling**: linters y autocompletado funcionan mejor