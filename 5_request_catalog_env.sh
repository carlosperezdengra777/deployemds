#!/bin/bash

export CONSUMER_CLOUD_IP=194.164.175.234

RESPONSE=$(curl --silent --location "http://$CONSUMER_CLOUD_IP:29193/management/v3/catalog/request" \
--header "Content-Type: application/json" \
--header "X-Api-Key: password" \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\"
  },
  \"counterPartyAddress\": \"http://$PROVIDER_CLOUD_IP:29194/protocol\",
  \"protocol\": \"dataspace-protocol-http\"
}")

if ! echo "$RESPONSE" | jq empty 2>/dev/null; then
  echo "Error: La respuesta no es un JSON válido."
  exit 1
fi

export ODRL_POLICY=$(echo "$RESPONSE" | jq -r --arg ASSET_ID "$ASSET_ID" '
  .["dcat:dataset"] | select(.["@id"] == $ASSET_ID) | .["odrl:hasPolicy"]["@id"]
')

echo "ODRL_POLICY=$ODRL_POLICY"
