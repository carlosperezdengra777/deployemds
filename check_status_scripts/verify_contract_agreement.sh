#!/bin/bash

curl --silent --location --request GET "http://194.164.175.234:29193/management/v3/contractnegotiations/6e9221cd-e50a-40ff-8481-28cab48e93e0" \
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
    \"@id\": \"6e9221cd-e50a-40ff-8481-28cab48e93e0\",
    \"@type\": \"Offer\",
    \"assigner\": \"provider\",
    \"target\": \"$ASSET_ID\"
  }
}"
