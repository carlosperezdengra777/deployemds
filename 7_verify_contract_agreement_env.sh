#!/bin/bash

if [ -z "$CONTRACT_ID" ]; then
  echo "Error: CONTRACT_ID no está definido."
  exit 1
fi

export ASSIGNER_ID="$PROVIDER_CLOUD_IP"

RESPONSE=$(curl --silent --location --request GET "http://$CONSUMER_CLOUD_IP:29193/management/v3/contractnegotiations/$CONTRACT_ID" \
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
    \"@id\": \"$CONTRACT_ID\",
    \"@type\": \"Offer\",
    \"assigner\": \"provider\",
    \"target\": \"$ASSET_ID\"
  }
}")

if ! echo "$RESPONSE" | jq empty 2>/dev/null; then
  echo "Error: La respuesta no es un JSON válido."
  echo "DEBUG: RESPONSE=$RESPONSE"
  exit 1
fi

export CONTRACT_NEGOTIATION_ID=$(echo "$RESPONSE" | jq -r '.["contractAgreementId"]')

if [ -z "$CONTRACT_NEGOTIATION_ID" ]; then
  echo "Error: No se pudo extraer el ContractNegotiation ID"
  exit 1
fi

echo "CONTRACT_NEGOTIATION_ID=$CONTRACT_NEGOTIATION_ID"
