#!/bin/bash


if [ -z "$PROVIDER_CLOUD_IP" ] || [ -z "$API_KEY" ]; then
  echo "Error: Las variables de entorno PROVIDER_CLOUD_IP y API_KEY no están definidas."
  echo "Ejecuta 'source script.sh' o define las variables manualmente."
  exit 1
fi

API_URL="http://$PROVIDER_CLOUD_IP:29193/management/v3/assets/request"

# Ejecutar la petición con curl
curl --location "$API_URL" \
--header "Content-Type: application/json" \
--header "X-Api-Key: $API_KEY" \
--data-raw '{
    "@type": "https://w3id.org/edc/v0.0.1/ns/QuerySpec",
    "https://w3id.org/edc/v0.0.1/ns/offset": 0,
    "https://w3id.org/edc/v0.0.1/ns/limit": 10
}'
