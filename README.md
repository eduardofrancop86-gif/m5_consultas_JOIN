# m5_consultas_JOIN
Ejercicio correspondiente al Modulo 5 de Data Analytics Coderhouse


## 📁 Estructura del Repositorio

El proyecto se encuentra estructurado secuencialmente por módulos:

| Archivo | Módulo | Descripción |
| :--- | :--- | :--- |
| `PreEntrega Modulo 3 Data Analytics Eduardo_Franco.sql` | **Módulo 3** | Creación de la base de datos `Ventas_Tech_DB`, definición del esquema relacional (Tablas: `categorias`, `clientes`, `productos`, `ventas`) e inserción de datos iniciales. |
| `m4_consultas_negocio.sql` | **Módulo 4** | Consultas analíticas sobre tablas individuales (Facturación mensual, ranking de productos, segmentación de clientes y análisis con `CASE`). |
| `m5_consultas_joins.sql` | **Módulo 5** | Cruce de tablas con `JOINs` para construir la vista enriquecida para Power BI, detección de clientes y productos sin ventas, y consolidado por canal con `UNION ALL`. |

---

Contenido del Módulo 5 (`m5_consultas_joins.sql`)

En esta entrega se desarrollaron 4 consultas clave para conectar y estructurar la información del negocio:

1. **Vista base del proyecto (`INNER JOIN`):** Combina las tablas `ventas`, `clientes`, `productos` y `categorias` en una sola vista enriquecida que sirve como fuente principal para Power BI.
2. **Clientes sin ventas (`LEFT JOIN`):** Identifica mediante `WHERE ... IS NULL` los clientes registrados que aún no han realizado transacciones.
3. **Productos sin ventas (`LEFT JOIN`):** Filtra los artículos del catálogo que no registran movimiento en ventas.
4. **Consolidado por canal (`UNION ALL`):** Simula el origen de las ventas generando un literal fijo (`'Online'` / `'Presencial'`) y consolidando los totales por canal.

---

Tecnologías y Herramientas

* **Motor de Base de Datos:** Microsoft SQL Server
* **Lenguaje:** T-SQL
* **Control de Versiones:** Git & GitHub
* **Consumo de Datos:** Preparado para Power BI

---
 Autor
**Eduardo Franco**  
*Data Analytics Student*
