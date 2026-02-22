#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID="${1:-}"
REGION="${2:-us-central1}"
SERVICE="${3:-simple-app}"

if [[ -z "${PROJECT_ID}" ]]; then
  echo "Usage: $0 <PROJECT_ID> [REGION] [SERVICE_NAME]"
  exit 1
fi

gcloud builds submit \
  --project "${PROJECT_ID}" \
  --config simple-app/cloudbuild.yaml \
  --substitutions "_REGION=${REGION},_SERVICE=${SERVICE}"
