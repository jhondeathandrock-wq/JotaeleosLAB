# Revisión inicial: licencia, dependencias y riesgos

Origen: https://github.com/shaongitbd/doory

## Licencia
La licencia declarada por Doory es Attribution Assurance License. No es MIT. Permite uso comercial, modificaciones y redistribución sujetos a conservar el texto firmado, NOTICE y mostrar crédito prominente en la aplicación ejecutada. Consultar el texto íntegro y firmado en el repositorio upstream; esta nota no lo reemplaza.

## Stack identificado
- React 19, TypeScript, Vite, Fabric.js, Yjs, Zustand.
- Django 5, Django REST Framework, Channels, PostgreSQL.
- Docker Compose/nginx; Redis y almacenamiento S3 compatibles son opcionales.
- Node.js 22 y Python 3.12 en instrucciones de instalación.

## Dependencias y licencias de terceros
Consultar `THIRD_PARTY.md` y `licenses/DEPENDENCIES.md` upstream. Se documentan excepciones, incluyendo `psycopg2-binary` LGPL-3.0-or-later y `certifi` MPL-2.0. Una evaluación definitiva requiere auditar el checkout y los lockfiles exactos antes del despliegue.

## Riesgos y controles
- **Atribución:** no eliminar créditos ni avisos del autor.
- **Fuentes:** las tipografías corporativas no deben subirse ni distribuirse sin licencias apropiadas.
- **Logo:** usar arte oficial con transparencia; no redibujar ni reemplazar el isotipo.
- **Datos:** configurar secretos fuera de Git; respaldar PostgreSQL y archivos.
- **Despliegue:** el stack completo necesita servicios persistentes; no prometer instalación directa en Cloudflare Workers.
- **Compatibilidad:** validar SVG y presets dentro de Doory, no asumir importación nativa.
- **Actualizaciones:** fijar revisión upstream antes de personalizar y volver a ejecutar tests.

**Estado de revisión:** documental, no auditoría automatizada de código ni prueba de funcionamiento.
