#!/usr/bin/env bash
set -euo pipefail
# Ejecutar desde la raíz de una copia local del repositorio JotaeleosLAB.
# Requiere git, docker y docker compose. No modifica archivos existentes.
command -v git >/dev/null || { echo "Falta git"; exit 1; }
command -v docker >/dev/null || { echo "Falta Docker"; exit 1; }
docker compose version >/dev/null || { echo "Falta Docker Compose"; exit 1; }
ROOT="$(pwd)"
BASE="$ROOT/integraciones/doory"
DEST="$ROOT/../doory-jotaeleoslab"
if [ -e "$DEST" ]; then echo "Destino ya existe: $DEST. No se sobrescribe."; exit 1; fi
git clone https://github.com/shaongitbd/doory.git "$DEST"
mkdir -p "$DEST/config"
cp "$BASE/config/size-presets.json" "$DEST/config/jotaeleoslab-size-presets.json"
cp "$BASE/docker-compose.jotaeleoslab.yml" "$DEST/docker-compose.jotaeleoslab.yml"
cp "$DEST/.env.example" "$DEST/.env"
# Seguridad local: secretos generados por Python, sin publicarlos en Git.
command -v python3 >/dev/null || { echo "Falta Python3 para generar secretos"; exit 1; }
(cd "$DEST" && python3 - <<'PY'
import secrets
from pathlib import Path
p=Path(".env")
s=p.read_text()
for key,value in {
    "DJANGO_SECRET_KEY": secrets.token_urlsafe(48),
    "POSTGRES_PASSWORD": secrets.token_hex(24),
    "WEB_BIND": "127.0.0.1",
}.items():
    lines=s.splitlines()
    lines=[(key+"="+value) if line.startswith(key+"=") else line for line in lines]
    s="\n".join(lines)+"\n"
p.write_text(s)
PY
)
echo "Doory preparado en $DEST"
echo "Revisa la licencia y NOTICE del checkout, luego ejecuta:"
echo "cd '$DEST' && docker compose -f docker-compose.yml -f docker-compose.jotaeleoslab.yml up -d --build"
echo "Después: docker compose -f docker-compose.yml -f docker-compose.jotaeleoslab.yml exec api python manage.py createsuperuser"
echo "Acceso local: http://localhost:8080"
echo "Importante: subir manual/logos originales por la interfaz del Brand Kit, no recrearlos."
