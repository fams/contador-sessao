#!/bin/bash
source /app/venv/bin/activate
PYTHONPATH=/app/venv/bin/python3
exec python3 "$@"
