#!/bin/bash

# Use provider IP as assigner ID
export ASSIGNER_ID="$PROVIDER_CLOUD_IP"

# Execute the curl request and capture the response
RESPONSE=$(curl --silent --location "http://$CONSUMER_CLOUD_IP:29193/management/v3/contractnegotiations" \
--header "Content-Type: application/json" \
--header "X-Api-Key: password" \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\"
  },
  \"@type\": \"ContractRequest\",
  \"counterPartyAddress\": \"http://$PROVIDER_CLOUD_IP:29194/protocol\",
  \"protocol\": \"dataspace-protocol-http\",
  \"policy\": {
    \"@context\": \"http://www.w3.org/ns/odrl.jsonld\",
    \"@id\": \"$ODRL_POLICY\",
    \"@type\": \"Offer\",
    \"assigner\": \"provider\",
    \"target\": \"$ASSET_ID\"
  }
}")

# Verifica si RESPONSE es un JSON válido
if ! echo "$RESPONSE" | jq empty 2>/dev/null; then
  echo "Error: La respuesta no es un JSON válido."
  echo "DEBUG: RESPONSE=$RESPONSE"
  exit 1
fi

# Extraer CONTRACT_ID del JSON, manejando posibles estructuras
export CONTRACT_ID=$(echo "$RESPONSE" | jq -r 'if type == "object" then .["@id"] else empty end')

# Verificar si CONTRACT_ID está vacío
if [[ -z "$CONTRACT_ID" ]]; then
  echo "Error: No se pudo extraer CONTRACT_ID"
  echo "DEBUG: RESPONSE=$RESPONSE"
  exit 1
fi

# Imprimir el resultado
echo "CONTRACT_ID=$CONTRACT_ID"
