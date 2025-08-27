#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 --policyId=<policyId>"
  exit 1
fi

# Extract the policy and contract IDs from the arguments
export POLICY_ID="$(echo $1 | sed 's/--policyId=//')"

# Create policy definition
curl --location "http://$PROVIDER_CLOUD_IP:29193/management/v3/policydefinitions" \
--header 'Content-Type: application/json' \
--header 'X-Api-Key: password' \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\",
    \"odrl\": \"http://www.w3.org/ns/odrl/2/\"
  },
  \"@id\": \"$POLICY_ID\",
  \"policy\": {
    \"@context\": \"http://www.w3.org/ns/odrl.jsonld\",
    \"@type\": \"Set\",
    \"permission\": [],
    \"prohibition\": [],
    \"obligation\": []
  }
}"
