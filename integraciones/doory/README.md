# Integración aislada de Doory — JotaeleosLAB

**Estado:** preparada para instalación; aplicación no desplegada ni código de Doory incorporado.

## Origen y licencia

Repositorio: https://github.com/shaongitbd/doory

Licencia de origen: **Attribution Assurance License** (no MIT). Uso y modificación comercial permitidos **con atribución obligatoria**. Al incorporar código Doory, conservar sus archivos `LICENSE`, `NOTICE`, `THIRD_PARTY.md` y avisos de terceros, y mostrar crédito prominente en la app ejecutada:

> Doory by Siam, creator and maintainer of Doory — https://github.com/shaongitbd/doory

Verificar el texto completo de la licencia original antes de redistribuir; no sustituirla por una licencia inventada ni eliminar créditos. El código Doory todavía **no** se ha copiado a este repositorio.

## Arquitectura segura

No mezclar Doory con la raíz de JotaeleosLAB. Mantenerlo en un checkout **separado**, por ejemplo `doory-upstream/` fuera de este repositorio, o posteriormente en `integraciones/doory/app/` mediante un proceso revisado que preserve el historial y los avisos legales. No hacer `git clone` encima de los archivos existentes.

Requisitos documentados por el upstream: Node.js 22, Python 3.12, PostgreSQL, Docker Compose, frontend React 19/TypeScript/Vite/Fabric.js/Yjs/Zustand y backend Django 5/DRF/Channels.

## Instalación de evaluación local (sin modificar este repositorio)

```bash
git clone https://github.com/shaongitbd/doory.git doory-upstream
cd doory-upstream
cp .env.example .env
# Configurar DJANGO_SECRET_KEY y POSTGRES_PASSWORD; no publicar .env
docker compose up -d --build
docker compose exec api python manage.py createsuperuser
```

Acceso de evaluación: http://localhost:8080. No exponer públicamente antes de configurar dominio, HTTPS, contraseñas, copias de seguridad y atribución. No asumir que Cloudflare Workers por sí solo aloja PostgreSQL, Django y WebSockets.

## Adaptación a JotaeleosLAB

1. Crear Brand Kit con `brand-kit.json`.
2. Subir **los archivos originales** del logo e isotipo desde `marca/logos-originales/` cuando estén disponibles; nunca recrearlos.
3. Cargar las fuentes Unbounded Black 900 y Nimbus Sans Regular/Bold **solo si se dispone de las licencias y archivos autorizados**; el logo Monument Extended UltraBold debe insertarse como arte original.
4. Configurar formatos feed 1080 × 1350, cuadrado 1080 × 1080, story 1080 × 1920.
5. Adaptar plantillas de `plantillas/instagram/`; revisar compatibilidad SVG y no asumir que los SVG existentes son documentos Doory nativos.
6. Validar exportaciones, contraste, responsive, licencias y atribución antes de lanzar.

## Próximos pasos

- Inspeccionar el checkout upstream y fijar commit/tag revisado.
- Ejecutar auditoría de dependencias, `make test` y `make lint` en un entorno apropiado.
- Hacer pruebas con el Brand Kit y el logo original.
- Proponer cambios de interfaz en una rama/PR, sin alterar el proyecto principal.
