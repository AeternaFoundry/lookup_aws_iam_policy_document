data "aws_iam_policy_document" "iam_policy_document_lookup" {
  for_each = var.iam_policy_document_lookup

  override_json             = each.value.override_json
  override_policy_documents = each.value.override_policy_documents
  policy_id                 = each.value.policy_id
  source_json               = each.value.source_json
  source_policy_documents   = each.value.source_policy_documents
  version                   = each.value.version

  dynamic "statement" {
    for_each = each.value.statement != null ? each.value.statement : []
    content {
      actions = statement.value.actions
      dynamic "condition" {
        for_each = statement.value.condition != null ? statement.value.condition : []
        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
      effect      = statement.value.effect
      not_actions = statement.value.not_actions
      dynamic "not_principals" {
        for_each = statement.value.not_principals != null ? statement.value.not_principals : []
        content {
          identifiers = not_principals.value.identifiers
          type        = not_principals.value.type
        }
      }
      not_resources = statement.value.not_resources
      dynamic "principals" {
        for_each = statement.value.principals != null ? statement.value.principals : []
        content {
          identifiers = principals.value.identifiers
          type        = principals.value.type
        }
      }
      resources = statement.value.resources
      sid       = statement.value.sid
    }
  }
}

