# `component-structure.md`

## Descripción

Estructura estándar para componentes React/TypeScript.

## Regla

Todo componente debe seguir esta estructura:
1. **Imports** (librerías externas primero, luego locales)
2. **Tipos/Interfaces** (definir `Props` justo encima del componente)
3. **Constantes y variantes** fuera del componente (no re-renderizar)
4. **Componente** con export nombrado
5. **Estilos** vía Tailwind (nunca inline)

## Correcto ✅

```tsx
import React from "react";

interface ButtonProps {
  variant?: "primary" | "secondary";
  children: React.ReactNode;
}

const variantClasses = {
  primary: "bg-blue-600 text-white",
  secondary: "bg-gray-200 text-gray-800",
};

export function Button({ variant = "primary", children }: ButtonProps) {
  return (
    <button className={`${variantClasses[variant]} px-4 py-2 rounded`}>
      {children}
    </button>
  );
}
```

## Incorrecto ❌

```tsx
// ❌ Todo mezclado y desordenado
import React, { useState } from "react";
const styles = { btn: { color: "blue" } }; // ❌ inline styles
export default function btn({ variant, children }: any) { // ❌ any, default export
  const [count, setCount] = useState(0);
  return <button style={styles.btn}>{children}</button>;
}
```

## Justificación

- **Legibilidad**: estructura predecible facilita la navegación
- **Rendimiento**: constantes fuera del componente evitan re-creaciones
- **Mantenibilidad**: cambios localizados sin efectos colaterales