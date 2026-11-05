# Paloma de cuero

Tienda de productos de cuero hechos a mano. El catálogo tiene cartera, bolsos, chalecos, pechera, pollera, cintos, pollera con flecos y fajas con flecos.

La API está hecha con NestJS. En esta instancia los endpoints responden, y la base ya tiene el catálogo y los pedidos de ejemplo. Los módulos todavía no leen esa base: esa conexión queda para cuando se pida.

## Cómo correrla

Requisitos: Node.js, npm y PostgreSQL.

```bash
npm install
npm run start:dev
```

La API queda en http://localhost:4000.

Para crear la base la primera vez:

```bash
psql -U postgres -c "CREATE USER paloma WITH PASSWORD 'paloma';"
psql -U postgres -c "CREATE DATABASE paloma_de_cuero OWNER paloma;"
psql -U postgres -d paloma_de_cuero -c "ALTER SCHEMA public OWNER TO paloma;"
psql -U paloma -d paloma_de_cuero -f database/schema.sql
psql -U paloma -d paloma_de_cuero -f database/seed.sql
psql -U paloma -d paloma_de_cuero -f database/verify.sql
```

## Estructura

```text
src/
├── main.ts
└── modules/
    ├── app/
    ├── auth/
    ├── orders/
    ├── products/
    └── users/
```

## Rutas

| Método | Ruta |
| --- | --- |
| GET | / |
| GET, POST | /products |
| GET, PATCH, DELETE | /products/:id |
| GET, POST | /users |
| GET, PATCH, DELETE | /users/:id |
| GET, POST | /orders |
| GET, PATCH, DELETE | /orders/:id |
| GET, POST | /auth |
| GET, PATCH, DELETE | /auth/:id |

La ruta de cada recurso la declara su controlador. El proyecto no usa un prefijo global.

## Base de datos

PostgreSQL. Base: `paloma_de_cuero`.

| Tabla | Contenido | Relación |
| --- | --- | --- |
| users | Cuentas. Una administradora y cinco clientas. | El email es único. |
| products | Los ocho productos del catálogo. | El nombre es único. |
| orders | Cinco pedidos. | `user_id` apunta a `users`. |
| order_items | El producto y la cantidad de cada pedido. | Apunta a `orders` y a `products`. |

Auth no tiene tabla. El ingreso va a usar `users`.

## Variables de entorno

```env
PORT=4000
DATABASE_URL=postgresql://paloma:paloma@localhost:5432/paloma_de_cuero
API_BASE_URL=http://localhost:4000
```

## Ramas

| Rama | Uso |
| --- | --- |
| main | Versión estable |
| dev | Integración del trabajo |
| feature/nombre-funcionalidad | Una funcionalidad nueva |
| fix/nombre-correccion | Una corrección |
| refactor/nombre-cambio | Una mejora del código |
| docs/nombre-documentacion | Documentación |

## Postman

Importar `postman/Paloma-de-cuero.postman_collection.json`. La variable `baseUrl` es `http://localhost:4000`.