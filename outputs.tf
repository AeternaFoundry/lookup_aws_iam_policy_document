output "iam_policy_document_lookup_id" {
  description = "Map of id values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "iam_policy_document_lookup_json" {
  description = "Map of json values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.json if v.json != null && length(v.json) > 0 }
}
output "iam_policy_document_lookup_minified_json" {
  description = "Map of minified_json values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.minified_json if v.minified_json != null && length(v.minified_json) > 0 }
}
output "iam_policy_document_lookup_override_json" {
  description = "Map of override_json values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.override_json if v.override_json != null && length(v.override_json) > 0 }
}
output "iam_policy_document_lookup_override_policy_documents" {
  description = "Map of override_policy_documents values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.override_policy_documents if v.override_policy_documents != null && length(v.override_policy_documents) > 0 }
}
output "iam_policy_document_lookup_policy_id" {
  description = "Map of policy_id values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.policy_id if v.policy_id != null && length(v.policy_id) > 0 }
}
output "iam_policy_document_lookup_source_json" {
  description = "Map of source_json values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.source_json if v.source_json != null && length(v.source_json) > 0 }
}
output "iam_policy_document_lookup_source_policy_documents" {
  description = "Map of source_policy_documents values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.source_policy_documents if v.source_policy_documents != null && length(v.source_policy_documents) > 0 }
}
output "iam_policy_document_lookup_statement" {
  description = "Map of statement values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.statement if v.statement != null && length(v.statement) > 0 }
}
output "iam_policy_document_lookup_version" {
  description = "Map of version values across all iam_policy_document_lookup, keyed the same as var.iam_policy_document_lookup"
  value       = { for k, v in data.aws_iam_policy_document.iam_policy_document_lookup : k => v.version if v.version != null && length(v.version) > 0 }
}

