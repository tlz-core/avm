output "baseline_version" {
  description = "Version of the baseline module"
  value       = "${module.avm-baseline.baseline_version}"
}

output "master_payer_account" {
  description = "AccountID of master_payer account"
  value       = "${var.master_payer_account}"
}

output "core_logging_account" {
  description = "AccountID of core-logging account"
  value       = "${var.core_logging_account}"
}

output "core_security_account" {
  description = "AccountID of core_security account"
  value       = "${var.core_security_account}"
}

output "core_shared_services_account" {
  description = "AccountID of shared-services account"
  value       = "${var.core_shared_services_account}"
}

output "tlz_admin_role" {
  description = "Admin role that is used"
  value       = "${var.tlz_admin_role}"
}
output "avm_config_table_name" {
  description = "Name of avm_config dynamo db table"
  value       = "${module.avm-baseline.avm_config_table_name}"
}
output "avm_config_table_hash" {
  description = "Hash key of avm_config table"
  value       = "${module.avm-baseline.avm_config_table_hash}"
}
