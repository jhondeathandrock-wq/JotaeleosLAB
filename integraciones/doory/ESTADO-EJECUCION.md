# Estado de ejecución — 2026-11-08

- [x] Repositorio JotaeleosLAB preservado.
- [x] Revisión documental de upstream shaongitbd/doory.
- [x] Brand Kit JotaeleosLAB documentado.
- [x] Presets reales de Doory (JSON formato `version/groups/children/presets`) preparados.
- [x] Override Docker Compose aislado preparado.
- [x] Instalador local con comprobación de requisitos y secretos aleatorios preparado.
- [ ] Clonación del upstream en un equipo con acceso GitHub y Docker.
- [ ] Ejecución de Docker Compose y pruebas del editor.
- [ ] Carga de logos originales y fuentes con licencia.
- [ ] Configuración de Brand Kit en la interfaz y exportaciones verificadas.
- [ ] Despliegue público con HTTPS y atribución legal visible.

**Limitación de este entorno:** Docker no está disponible y el shell no resuelve github.com. Por ello no se puede afirmar que la aplicación esté ejecutándose ni que las dependencias estén instaladas. Los archivos se han incorporado mediante la conexión GitHub autorizada.

**Cómo ejecutar en el equipo del usuario:**
```bash
git clone https://github.com/jhondeathandrock-wq/JotaeleosLAB.git
cd JotaeleosLAB
bash integraciones/doory/instalar-local.sh
```
Seguir las instrucciones impresas por el script para iniciar los contenedores. La instalación debe permanecer en local hasta revisar HTTPS, contraseñas y atribución.

**Licencia:** mantener `LICENSE`, `NOTICE`, `THIRD_PARTY.md` del upstream y crédito visible en la aplicación: Doory by Siam, creator and maintainer of Doory, https://github.com/shaongitbd/doory.
