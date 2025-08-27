#!/bin/bash

# Execute the curl request
curl --location "http://194.164.175.234:29193/management/v3/contractnegotiations" \
--header "Content-Type: application/json" \
--header "X-Api-Key: password" \
--data-raw "{
  \"@context\": {
    \"@vocab\": \"https://w3id.org/edc/v0.0.1/ns/\"
  },
  \"@type\": \"ContractRequest\",
  \"counterPartyAddress\": \"http://213.165.80.121:29194/protocol\",
  \"protocol\": \"dataspace-protocol-http\",
  \"policy\": {
    \"@context\": \"http://www.w3.org/ns/odrl.jsonld\",
    \"@id\": \"MQ==:YXNzZXRJZDI=:NDk4MDNmYjAtMWYzZC00NTgzLWFlM2YtOTUwODI2YWJkNTAy\",
    \"@type\": \"Offer\",
    \"assigner\": \"consumer\",
    \"target\": \"$ASSET_ID\"
  }
}"