# `accessibility.md`

## Descripción

Estándares de accesibilidad (a11y) para componentes y páginas.

## Regla

- Usar HTML semántico: `<header>`, `<main>`, `<nav>`, `<section>`, `<article>`
- Atributos `alt` descriptivos en todas las imágenes
- Etiquetas `<label>` vinculadas a inputs con `htmlFor`
- Jerarquía correcta de encabezados (un solo `h1` por página)
- Roles ARIA cuando el HTML semántico no es suficiente
- Los botones deben ser `<button>` no `<div>` con onClick

## Correcto ✅

```tsx
// Componente accesible
<section aria-labelledby="products-heading">
  <h2 id="products-heading">Productos Destacados</h2>
  <div className="grid grid-cols-3 gap-4">
    {products.map(product => (
      <article key={product.id}>
        <img src={product.image} alt={product.name} loading="lazy" />
        <h3>{product.name}</h3>
        <p>{product.description}</p>
        <button onClick={() => addToCart(product.id)}>
          Agregar al carrito
        </button>
      </article>
    ))}
  </div>
</section>
```

```tsx
// Formulario accesible
<form>
  <div>
    <label htmlFor="email">Correo electrónico</label>
    <input
      id="email"
      type="email"
      aria-required="true"
      aria-describedby="email-hint"
    />
    <p id="email-hint">Nunca compartiremos tu correo</p>
  </div>
</form>
```

## Incorrecto ❌

```tsx
// ❌ Div como botón, sin roles
<div onClick={handleClick}>Clic aquí</div>

// ❌ Imagen sin alt
<img src="logo.png" />

// ❌ Encabezados saltados
<h1>Título</h1>
<h3>Subtítulo</h3>  <!-- ❌ se saltó h2 -->
```

## Justificación

- **Inclusión**: personas con discapacidades pueden usar la aplicación
- **SEO**: HTML semántico mejora el posicionamiento
- **Legal**: muchas jurisdicciones exigen cumplimiento WCAG
- **UX**: todos los usuarios se benefician de una navegación clara