#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 --id=<assetId>"
  exit 1
fi

# Extract the asset ID from the argument
export ASSET_ID="$(echo $1 | sed 's/--id=//')"

# Define the API endpoint and key
export API_URL="http://104.28.255.108:8281/management/v3/assets"
export API_KEY="password"
export PROVIDER_CLOUD_IP=104.28.255.108

# Execute the curl command
curl --location "$API_URL" \
--header "Content-Type: application/json" \
--header "X-Api-Key: $API_KEY" \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\"
  },
  \"@id\": \"$ASSET_ID\",
  \"properties\": {
    \"name\": \"product description\",
    \"contenttype\": \"application/json\"
  },
  \"dataAddress\": {
    \"type\": \"HttpData\",
    \"name\": \"Test asset\",
    \"baseUrl\": \"https://jsonplaceholder.typicode.com/users\",
    \"proxyPath\": \"true\"
  }
}"