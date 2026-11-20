# `testing-standards.md`

## Descripción

Estándares para pruebas unitarias y de integración.

## Regla

- Toda lógica de negocio crítica debe tener pruebas
- Endpoints de API deben probarse (request → response)
- Cubrir: casos exitosos, casos borde, casos de error
- Usar `vitest`/`jest` en TypeScript, `pytest` en Python

## Correcto ✅

```typescript
// Button.test.tsx
import { render, screen } from "@testing-library/react";
import { Button } from "./Button";

describe("Button", () => {
  it("renders with default variant", () => {
    render(<Button>Click me</Button>);
    const button = screen.getByRole("button", { name: /click me/i });
    expect(button).toBeInTheDocument();
    expect(button).toHaveClass("bg-blue-600");
  });

  it("shows loading state", () => {
    render(<Button isLoading>Submit</Button>);
    expect(screen.getByRole("button")).toBeDisabled();
    expect(screen.getByRole("status")).toBeInTheDocument();
  });
});
```

## Incorrecto ❌

```typescript
// ❌ Sin pruebas
// ❌ Prueba que no asserts nada
it("renders", () => {
  render(<Button>Click</Button>);
  // No assertions!
});
```

## Justificación

- **Calidad**: previene regresiones en el código
- **Confianza**: permite refactorizar sin miedo
- **Documentación**: las pruebas describen el comportamiento esperado