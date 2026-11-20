# `error-handling.md`

## Descripción

Manejo centralizado de errores en frontend y backend.

## Regla

- Nunca silenciar excepciones con `catch {}` o `except: pass` vacíos
- Capturar errores específicos (no genéricos)
- Registrar errores con contexto (stack trace, usuario, acción)
- Devolver respuestas estructuradas y consistentes
- Usar Error Boundaries en React para errores de UI

## Correcto ✅

```typescript
// Frontend: Error Boundary
class ErrorBoundary extends React.Component<Props, { hasError: boolean }> {
  componentDidCatch(error: Error, info: React.ErrorInfo) {
    logger.error("UI Error", {
      error: error.message,
      stack: error.stack,
      componentStack: info.componentStack,
    });
  }
  // ...
}
```

```python
# Backend: Manejo específico
from fastapi import HTTPException

def get_user(user_id: int) -> User:
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(
            status_code=404,
            detail=f"User with id {user_id} not found"
        )
    return user
```

## Incorrecto ❌

```typescript
// ❌ Error silenciado
try {
  await api.saveData(data);
} catch {
  // No hacer nada
}
```

```python
# ❌ Except genérico
try:
    process_data()
except:
    pass
```

## Justificación

- **Depuración**: errores con contexto se resuelven más rápido
- **Estabilidad**: previene estados inconsistentes en la aplicación
- **UX**: usuarios reciben mensajes de error útiles en lugar de crashes