#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 --contractId=<contractId>"
  exit 1
fi

export CONTRACT_ID="$(echo $1 | sed 's/--contractId=//')"

# Create contract definition
curl --location "http://$PROVIDER_CLOUD_IP:29193/management/v3/contractdefinitions" \
--header 'Content-Type: application/json' \
--header 'X-Api-Key: password' \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\"
  },
  \"@id\": \"$CONTRACT_ID\",
  \"accessPolicyId\": \"$POLICY_ID\",
  \"contractPolicyId\": \"$POLICY_ID\",
  \"assetsSelector\": []
}"    