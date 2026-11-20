# `no-inline-styles.md`

## Descripción

Prohibir estilos inline; usar clases de Tailwind en su lugar.

## Regla

No se permite el uso del atributo `style` en elementos HTML/JSX. En su lugar, todo el estilizado debe realizarse exclusivamente mediante clases de **Tailwind CSS**.

## Correcto ✅

```jsx
<div className="flex items-center gap-4 bg-blue-500 text-white p-4 rounded-lg">
  <span className="text-lg font-bold">Título</span>
</div>
```

## Incorrecto ❌

```jsx
<div style={{ display: 'flex', alignItems: 'center', gap: '16px', backgroundColor: 'blue', color: 'white', padding: '16px', borderRadius: '8px' }}>
  <span style={{ fontSize: '18px', fontWeight: 'bold' }}>Título</span>
</div>
```

## Excepciones

- No hay excepciones. Cualquier uso del atributo `style` se considera una violación de esta regla.

## Justificación

- **Consistencia visual**: Tailwind proporciona un sistema de diseño unificado evitando valores hardcodeados.
- **Mantenibilidad**: Los cambios de estilo se centralizan en las clases, facilitando actualizaciones globales.
- **Rendimiento**: Las clases de Tailwind generan CSS optimizado y purgado, reduciendo el tamaño del bundle.
- **Legibilidad**: El código es más limpio y fácil de entender al separar la capa de presentación de la lógica.