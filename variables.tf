variable "region" {
  type        = "string"
  description = "AWS region to deploy the AVM into"
}

variable "secondary_region" {
  type        = "string"
  description = "Secondary AWS region for the AVM"
}

variable "runtime" {
  description = "Runtime of Lambda function"
  default     = "python3.7"
}

variable "timeout" {
  description = "Timeout value for Lambda function"
  default     = 300
}

variable "memory_size" {
  description = "Timeout value for Lambda function"
  default     = 150
}

###################
# Account Numbers #
###################

variable "master_payer_account" {
  description = "AccountID of master_payer account"
}

variable "core_logging_account" {
  description = "AccountID of core-logging account"
}

variable "core_security_account" {
  description = "AccountID of core_security account"
}

variable "core_shared_services_account" {
  description = "AccountID of shared-services account"
}

variable "tlz_admin_role" {
  description = "Admin role that is used by shared-services to access target account"
}

####################
# AWS dependencies #
####################

variable "security_group_ids" {
  type        = "list"
  description = "security_group_ids used by lambdas that call GHE and TFE"
}

variable "subnet_ids" {
  type        = "list"
  description = "subnet_ids used by lambdas that call GHE and TFE"
}

variable "avm_activity_sns_subscribers" {
  description = "Emails of avm_activity_sns_subscribers"
}

variable "post_account_sender_email" {
  description = "Email id of post_account_sender_email"
}

variable "post_account_subscriber_emails" {
  description = "Email ids of post_account_subscriber_emails"
}

###########
# Redlock #
###########

variable "redlock_user" {
  description = "User to use to add vended accounts to redlock"
  type        = "string"
}

variable "redlock_password" {
  description = "Password for the redlock user"
  type        = "string"
}

variable "redlock_group_id" {
  default = "dae55ccd-c9d2-49db-975c-971beda39080"
  type    = "string"
}

variable "redlock_rest_api_url" {
  default = "https://api.eu.redlock.io"
  type    = "string"
}

########
# PTFE #
########

variable "terraform_key" {
  type        = "string"
  description = "PTFE API key"
}

variable "TFE_AWS_ACCESS_KEY_ID" {
  type        = "string"
  description = "AWS access key used by TFE to deploy into the shared services account"
}

variable "TFE_AWS_SECRET_ACCESS_KEY" {
  type        = "string"
  description = "AWS secret access key used by TFE to deploy into the shared services account"
}

variable "vcs_oauth_token" {
  type        = "string"
  description = "Oauth token ID from application link between PTFE and Bitbucket. This needs to be pulled from an API call to PTFE: curl --header \"Authorization: <ptfe_token>\" --header \"Content-Type: application/vnd.api+json\" https://<tfe_url>/api/v2/organizations/xxx/oauth-clients . Once you have the return, check the return for the id in the oauth_tokens section. It should be of the form \"ot-<random characters>\"(this really needs to be put into the code at some point)"
}

########
# Okta #
########

variable "okta_token" {
  type        = "string"
  description = "Okta API token"
}

variable "okta_url" {
  type        = "string"
  description = "URL to use for okta service. Should be https://xxxx.okta.com or https://xxxx.oktapreview.com"
}

variable "PRD_LINK_ID" {
  type        = "string"
  description = "ID used in the metadata URL for the Production Okta application"
}

variable "SBX_LINK_ID" {
  type        = "string"
  description = "ID used in the metadata URL for the Sandbox Okta application"
}

variable "DEV_LINK_ID" {
  type        = "string"
  description = "ID used in the metadata URL for the Dev Okta application. **Not implemented**"
  default     = "not_implemented"
}

variable "NPD_LINK_ID" {
  type        = "string"
  description = "ID used in the metadata URL for the Non-Production Okta application"
}

variable "COR_LINK_ID" {
  type        = "string"
  description = "ID used in the metadata URL for the Core Okta application"
}

variable "SBX_APP_ID" {
  type        = "string"
  description = "Application ID for the Sandbox Okta application"
}

variable "COR_APP_ID" {
  type        = "string"
  description = "Application ID for the Core Okta application"
}

variable "NPD_APP_ID" {
  type        = "string"
  description = "Application ID for the Non-Production Okta application"
}

variable "PRD_APP_ID" {
  type        = "string"
  description = "Application ID for the Production Okta application"
}

variable "DEV_APP_ID" {
  type        = "string"
  description = "Application ID for the Dev Okta application. **Not Implemented**"
  default     = "not_implemented"
}

#############
# Bitbucket #
#############

variable "tlz_vcs_url" {
  description = "Base URL of the VCS provider"
  type        = "string"
}
variable "vcs_user" {
  type        = "string"
  description = "vcs user to fork vended account baselines"
}

variable "vcs_password" {
  type        = "string"
  description = "Password for the vcs user to use to fork vended account baselines"
}

#########################
# AVM Dynamo DB entries #
#########################

variable "master_payer_org_id" {
  type        = "string"
  description = "Organization ID for the organization in the master payer account. Get with 'aws organizations describe-organization --profile <profile>'"
}

variable "tfe_api_url" {
  type        = "string"
  description = "URL for the v2 API for PTFE. Should be https://<ptfe_hostname>/api/v2"
}

variable "tfe_org_name" {
  type        = "string"
  description = "Name of the organization the TLZ will be deployed through in PTFE"
}

variable "stack-env" {
  type        = "string"
  description = "Environment type to tag TLZ resources with"
}

variable "stack-version" {
  type        = "string"
  description = "TLZ version to tag TLZ resources with"
}

variable "stack-owner" {
  type        = "string"
  description = "Team to tag TLZ resources with to denote support ownership"
}

variable "stack-support_group" {
  type        = "string"
  description = "Email to tag TLZ resources with to direct support requests"
}

variable "primary_zone_name" {
  type        = "string"
  description = "DNS zone used by AVM resources. Should be the raw domain name, eg: 'example.com'"
}

variable "terraform_service_user" {
  type        = "string"
  description = "the name of the IAM service user"
}

variable "avm_workspace_name" {
  type        = "string"
  description = "Name of the PTFE workspace the AVM will be deployed through"
  default     = "avm"
}

variable "logging_workspace_name" {
  type        = "string"
  description = "Name of the PTFE workspace the Logging account will be deployed through"
  default     = "tlz-core_logging"
}
