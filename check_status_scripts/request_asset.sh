#!/bin/bash

PROVIDER_CLOUD_IP=213.165.80.121

# Define the API endpoint and key
API_URL="http://$PROVIDER_CLOUD_IP:29193/management/v3/assets/request"
API_KEY="password"

# Execute the curl command
curl --location "$API_URL" \
--header "Content-Type: application/json" \
--header "X-Api-Key: $API_KEY" \
--data-raw '{
    "@type": "https://w3id.org/edc/v0.0.1/ns/QuerySpec",
    "https://w3id.org/edc/v0.0.1/ns/offset": 0,
    "https://w3id.org/edc/v0.0.1/ns/limit": 10
}'
