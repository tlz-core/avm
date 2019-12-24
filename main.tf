# AWS provider and region

provider "aws" {
  region = "${var.region}"
}

locals {
  secret_vcs = {
    url      = "${var.tlz_vcs_url}"
    user     = "${var.vcs_user}"
    password = "${var.vcs_password}"
  }

  secret_okta = {
    token       = "${var.okta_token}"
    url         = "${var.okta_url}"
    COR_LINK_ID = "${var.COR_LINK_ID}"
    DEV_LINK_ID = "${var.DEV_LINK_ID}"
    NPD_LINK_ID = "${var.NPD_LINK_ID}"
    PRD_LINK_ID = "${var.PRD_LINK_ID}"
    SBX_LINK_ID = "${var.SBX_LINK_ID}"
    COR_APP_ID  = "${var.COR_APP_ID}"
    DEV_APP_ID  = "${var.DEV_APP_ID}"
    NPD_APP_ID  = "${var.NPD_APP_ID}"
    PRD_APP_ID  = "${var.PRD_APP_ID}"
    SBX_APP_ID  = "${var.SBX_APP_ID}"
  }

  secret_redlock = {
    user         = "${var.redlock_user}"
    password     = "${var.redlock_password}"
    group_id     = "${var.redlock_group_id}"
    rest_api_url = "${var.redlock_rest_api_url}"
  }

  secret_terraform = {
    terraform = "${var.terraform_key}"
  }

  secret_tfe_aws_keys = {
    AWS_ACCESS_KEY_ID     = "${var.TFE_AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${var.TFE_AWS_SECRET_ACCESS_KEY}"
  }

  secret_vcs_oauth_token = {
    oauth_token = "${var.vcs_oauth_token}"
  }
}

module avm-baseline {
  source                         = "tfe.tlzdemo.net/TLZ-Demo/avm/aws"
  version                        = "~> 0.1.12"
  subnet_ids                     = ["${var.subnet_ids}"]
  security_group_ids             = ["${var.security_group_ids}"]
  master_payer_account           = "${var.master_payer_account}"
  core_logging_account           = "${var.core_logging_account}"
  core_security_account          = "${var.core_security_account}"
  core_shared_services_account   = "${var.core_shared_services_account}"
  tlz_admin_role                 = "${var.tlz_admin_role}"
  avm_activity_sns_subscribers   = "${var.avm_activity_sns_subscribers}"
  post_account_sender_email      = "${var.post_account_sender_email}"
  post_account_subscriber_emails = "${var.post_account_subscriber_emails}"
  tlz_git_url                    = "${var.tlz_vcs_url}"
  master_payer_org_id            = "${var.master_payer_org_id}"
  tfe_api_url                    = "${var.tfe_api_url}"
  tfe_org_name                   = "${var.tfe_org_name}"
  stack-env                      = "${var.stack-env}"
  stack-owner                    = "${var.stack-owner}"
  stack-support_group            = "${var.stack-support_group}"
  stack-version                  = "${var.stack-version}"
  terraform_service_user         = "${var.terraform_service_user}"
  secondary_region               = "${var.secondary_region}"
  primary_zone_name              = "${var.primary_zone_name}"
  avm_workspace_name             = "${var.avm_workspace_name}"
  logging_workspace_name         = "${var.logging_workspace_name}"
}
