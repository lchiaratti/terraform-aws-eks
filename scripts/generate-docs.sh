#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="$ROOT_DIR/.terraform-docs.yml"

if ! command -v terraform-docs >/dev/null 2>&1; then
  echo "terraform-docs não encontrado no PATH." >&2
  exit 1
fi

TARGETS=(
  "$ROOT_DIR"
  "$ROOT_DIR/modules/network"
  "$ROOT_DIR/modules/cluster"
  "$ROOT_DIR/modules/nodegroup"
  "$ROOT_DIR/modules/alb-controller"
)

for target in "${TARGETS[@]}"; do
  echo "[terraform-docs] Atualizando $target/README.md"
  terraform-docs --config "$CONFIG_FILE" "$target"
done
