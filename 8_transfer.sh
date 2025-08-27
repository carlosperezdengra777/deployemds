#!/bin/bash

if [ -z "$CONSUMER_CLOUD_IP" ] || [ -z "$PROVIDER_CLOUD_IP" ] || [ -z "$CONTRACT_NEGOTIATION_ID" ] || [ -z "$ASSET_ID" ]; then
  echo "Error: Faltan variables necesarias."
  exit 1
fi

RECEIVER_PORT=5005  # Cambia el puerto si es necesario

export RECEIVER_SERVER="https://webhook.site/34bd0485-073b-4865-9602-fc260645938d"

curl --location "http://$CONSUMER_CLOUD_IP:29193/management/v3/transferprocesses" \
--header 'Content-Type: application/json' \
--header 'X-Api-Key: password' \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\"
  },
  \"@type\": \"TransferRequestDto\",
  \"connectorId\": \"consumer\",
  \"counterPartyAddress\": \"http://$PROVIDER_CLOUD_IP:29194/protocol\",
  \"contractId\": \"$CONTRACT_NEGOTIATION_ID\",
  \"assetId\": \"$ASSET_ID\",
  \"protocol\": \"dataspace-protocol-http\",
  \"transferType\": \"HttpData-PUSH\",
  \"dataDestination\": {
    \"type\": \"HttpData\",
    \"baseUrl\": \"http://194.164.175.234:8080/custom_endpoint\"
  }
}"