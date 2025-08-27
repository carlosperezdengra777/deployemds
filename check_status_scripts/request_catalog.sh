#!/bin/bash

export CONSUMER_CLOUD_IP=194.164.175.234

curl --location "http://$CONSUMER_CLOUD_IP:29193/management/v3/catalog/request" \
--header "Content-Type: application/json" \
--header "X-Api-Key: password" \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\"
  },
  \"counterPartyAddress\": \"http://$PROVIDER_CLOUD_IP:29194/protocol\",
  \"protocol\": \"dataspace-protocol-http\"
}"
