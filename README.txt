- Create asset

./create_asset.sh --id=assetId1
### Environment variables

source 1_create_asset.sh --id=assetId1
. create_asset.sh --id=assetId1


- Request asset

./2_request_asset_env.sh

- Create policy and contract definition

. create_policy_and_contract_definition.sh --policyId=aPolicy --contractId=1
source 3_create_policy_and_contract_definition.sh --policyId=aPolicy --contractId=1

- Request catalog

./request_catalog.sh

(*) Request catalog and add the env variable ODRL_POLICY

source 4_request_catalog_env.sh

- Negotiate contract:

source 5_negotiate_contract_env.sh

- Contract agreement:

source verify_contract_agreement.sh