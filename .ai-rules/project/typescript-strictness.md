# `typescript-strictness.md`

## Descripción

Nivel de strictness requerido para TypeScript en el proyecto.

## Regla

- `strict: true` debe estar habilitado en `tsconfig.json`
- **Prohibido el uso de `any`**. Usar `unknown` con type guards
- Todas las funciones deben tener tipos explícitos en parámetros y retorno
- Preferir `interface` sobre `type` para objetos públicos

## Correcto ✅

```json
// tsconfig.json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true
  }
}
```

```typescript
// Función con tipos explícitos
function parseUserId(input: unknown): string | null {
  if (typeof input === "string" && input.length > 0) {
    return input.trim();
  }
  return null;
}
```

## Incorrecto ❌

```typescript
// ❌ Uso de any
function process(data: any) {
  return data.value;
}

// ❌ Parámetros sin tipo
function getName(user) {
  return user.name;
}
```

## Justificación

- **Seguridad**: el tipado estricto atrapa errores en compilación
- **Documentación**: los tipos sirven como documentación viviente
- **Mantenibilidad**: refactorizaciones más seguras con tipos explícitos