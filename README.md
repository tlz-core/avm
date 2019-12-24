Overview
--------
This module provides a details how TLZ-AVM adds a new AWS account and brings the AWS account



Process
-------
Once Cloud Account Request is approved, CloudOps team receives an servicenow REQ with all the needed inputs for webform which is hosted in S3.Creation of the Account uses AWS SSM, Lambda, S3, IAM Roles and TFE.

The AVM pipeline is made up of the following steps:

1. Fill the required details in Account creation webform and submits the request.
2. On submit the web form,  data is inserted to DynamoDB  table named OrgAccountRequest.
3. Lambda function avm-master-respond-to-account-creation is invoked on insert to OrgAccountRequest dynamodb table.
4. The above lambda query the AWS organizations with the given email-id, if there is no matching AWS account found, it calls the ssm-automation-document **tlz-avm-ssm-document**.
5. master lambda **avm-master-respond-to-account-creation** also writes the data into OrgDetails table with accountid and with few other items.
6. tlz-avm-ssm-document SSM document has a branching logic which defines the dynamic Automation workflow that evaluates different choices based on web form inputs and it will execute either **app account type** or **sandbox account type** SSM document steps.
7. SSM document has a series of below lamba functions which will bring the AWS account to your organizations compliance standards.

 
Usage
-----
The module expects the following inputs and returns listed outputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| COR\_APP\_ID | Application ID for the Core Okta application | string | n/a | yes |
| COR\_LINK\_ID | ID used in the metadata URL for the Core Okta application | string | n/a | yes |
| DEV\_APP\_ID | Application ID for the Dev Okta application. **Not Implemented** | string | `"not_implemented"` | no |
| DEV\_LINK\_ID | ID used in the metadata URL for the Dev Okta application. **Not implemented** | string | `"not_implemented"` | no |
| NPD\_APP\_ID | Application ID for the Non-Production Okta application | string | n/a | yes |
| NPD\_LINK\_ID | ID used in the metadata URL for the Non-Production Okta application | string | n/a | yes |
| PRD\_APP\_ID | Application ID for the Production Okta application | string | n/a | yes |
| PRD\_LINK\_ID | ID used in the metadata URL for the Production Okta application | string | n/a | yes |
| SBX\_APP\_ID | Application ID for the Sandbox Okta application | string | n/a | yes |
| SBX\_LINK\_ID | ID used in the metadata URL for the Sandbox Okta application | string | n/a | yes |
| TFE\_AWS\_ACCESS\_KEY\_ID | AWS access key used by TFE to deploy into the shared services account | string | n/a | yes |
| TFE\_AWS\_SECRET\_ACCESS\_KEY | AWS secret access key used by TFE to deploy into the shared services account | string | n/a | yes |
| avm\_activity\_sns\_subscribers | Emails of avm\_activity\_sns\_subscribers | string | n/a | yes |
| bitbucket\_password | Password for the Bitbucket user to use to fork vended account baselines | string | n/a | yes |
| bitbucket\_url | URL for the Bitbucket server (duplicate?) | string | n/a | yes |
| bitbucket\_user | User in Bitbucket to use to fork vended account baselines | string | n/a | yes |
| core\_logging\_account | AccountID of core-logging account | string | n/a | yes |
| core\_security\_account | AccountID of core\_security account | string | n/a | yes |
| core\_shared\_services\_account | AccountID of shared-services account | string | n/a | yes |
| master\_payer\_account | AccountID of master\_payer account | string | n/a | yes |
| master\_payer\_org\_id | Organization ID for the organization in the master payer account. Get with 'aws organizations describe-organization --profile <profile>' | string | n/a | yes |
| memory\_size | Timeout value for Lambda function | string | `"150"` | no |
| okta\_token | Okta API token | string | n/a | yes |
| okta\_url | URL to use for okta service. Should be https://blizzard-cloud.okta.com or https://blizzard-cloud.oktapreview.com | string | n/a | yes |
| post\_account\_sender\_email | Email id of post\_account\_sender\_email | string | n/a | yes |
| post\_account\_subscriber\_emails | Email ids of post\_account\_subscriber\_emails | string | n/a | yes |
| redlock\_group\_id |  | string | `"dae55ccd-c9d2-49db-975c-971beda39080"` | no |
| redlock\_password | Password for the redlock user | string | n/a | yes |
| redlock\_rest\_api\_url |  | string | `"https://api.eu.redlock.io"` | no |
| redlock\_user | User to use to add vended accounts to redlock | string | `"cirrus@blizzard-cloud.com"` | no |
| region | AWS region to deploy the AVM into | string | n/a | yes |
| runtime | Runtime of Lambda function | string | `"python3.7"` | no |
| security\_group\_ids | security\_group\_ids used by lambdas that call GHE and TFE | list | n/a | yes |
| stack-env | Environment type to tag TLZ resources with | string | n/a | yes |
| stack-owner | Team to tag TLZ resources with to denote support ownership | string | n/a | yes |
| stack-support\_group | Email to tag TLZ resources with to direct support requests | string | n/a | yes |
| stack-version | TLZ version to tag TLZ resources with | string | n/a | yes |
| subnet\_ids | subnet\_ids used by lambdas that call GHE and TFE | list | n/a | yes |
| terraform\_key | PTFE API key | string | n/a | yes |
| tfe\_api\_url | URL for the v2 API for PTFE. Should be https://<ptfe\_hostname>/api/v2 | string | n/a | yes |
| tfe\_org\_name | Name of the organization the TLZ will be deployed through in PTFE | string | n/a | yes |
| timeout | Timeout value for Lambda function | string | `"300"` | no |
| tlz\_admin\_role | Admin role that is used by shared-services to access target account | string | n/a | yes |
| tlz\_git\_url | Base URL of the VCS provider | string | n/a | yes |
| vcs\_oauth\_token | Oauth token ID from application link between PTFE and Bitbucket. This needs to be pulled from an API call to PTFE: curl --header "Authorization: <ptfe\_token>" --header "Content-Type: application/vnd.api+json" https://app.terraform.io/api/v2/organizations/blizzard-cloud/oauth-clients . Once you have the return, check the return for the id in the oauth\_tokens section. It should be of the form "ot-<random characters>"(this really needs to be put into the code at some point) | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| baseline\_version | Version of the baseline module |
| core\_logging\_account | AccountID of core-logging account |
| core\_security\_account | AccountID of core\_security account |
| core\_shared\_services\_account | AccountID of shared-services account |
| master\_payer\_account | AccountID of master\_payer account |
| tlz\_admin\_role | Admin role that is used |

