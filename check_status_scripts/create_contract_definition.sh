#!/bin/bash

curl --location 'http://localhost:19193/management/v3/contractdefinitions' \
--header 'Content-Type: application/json' \
--header 'X-Api-Key: ••••••' \
--data-raw '{
  "@context": {
    "@vocab": "https://w3id.org/edc/v0.0.1/ns/"
  },
  "@id": "1",
  "accessPolicyId": "aPolicy",
  "contractPolicyId": "aPolicy",
  "assetsSelector": []
}
'