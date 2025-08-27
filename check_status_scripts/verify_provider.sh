#!/bin/bash

if [ -z "$CONTRACT_ID" ]; then
  echo "Error: CONTRACT_ID no está definido."
  exit 1
fi

export ASSIGNER_ID="$PROVIDER_CLOUD_IP"

RESPONSE=$(curl --silent --location --request POST "http://$PROVIDER_CLOUD_IP:29193/management/v3/contractnegotiations/request" \
--header "Content-Type: application/json" \
--header "X-Api-Key: password" \
--data-raw "{\"@context\": [
            \"https://w3id.org/edc/connector/management/v0.0.1\"
                    ],
            \"@type\": \"QuerySpec\"
  }
}")

# Verifica si RESPONSE es un JSON válido
if ! echo "$RESPONSE" | jq empty 2>/dev/null; then
  echo "Error: La respuesta no es un JSON válido."
  echo "DEBUG: RESPONSE=$RESPONSE"
  exit 1
fi

# Imprimir la respuesta del servidor
echo "RESPONSE=$RESPONSE"
