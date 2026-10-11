variable "iam_policy_document_lookup" {
  description = <<EOT
Map of iam_policy_document_lookup, attributes below
Optional:
    - override_json
    - override_policy_documents
    - policy_id
    - source_json
    - source_policy_documents
    - version
    - statement (block):
        - actions (optional)
        - condition (optional, block):
            - test (required)
            - values (required)
            - variable (required)
        - effect (optional)
        - not_actions (optional)
        - not_principals (optional, block):
            - identifiers (required)
            - type (required)
        - not_resources (optional)
        - principals (optional, block):
            - identifiers (required)
            - type (required)
        - resources (optional)
        - sid (optional)
EOT

  type = map(object({
    override_json             = optional(string)
    override_policy_documents = optional(list(string))
    policy_id                 = optional(string)
    source_json               = optional(string)
    source_policy_documents   = optional(list(string))
    version                   = optional(string)
    statement = optional(list(object({
      actions = optional(set(string))
      condition = optional(list(object({
        test     = string
        values   = list(string)
        variable = string
      })))
      effect      = optional(string)
      not_actions = optional(set(string))
      not_principals = optional(list(object({
        identifiers = set(string)
        type        = string
      })))
      not_resources = optional(set(string))
      principals = optional(list(object({
        identifiers = set(string)
        type        = string
      })))
      resources = optional(set(string))
      sid       = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.iam_policy_document_lookup : (
        v.override_policy_documents == null || (alltrue([for x in v.override_policy_documents : can(jsondecode(x))]))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_policy_document_lookup : (
        v.source_policy_documents == null || (alltrue([for x in v.source_policy_documents : can(jsondecode(x))]))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.iam_policy_document_lookup : (
        v.statement == null || alltrue([for item in v.statement : (item.effect == null || (contains(["Allow", "Deny"], item.effect)))])
      )
    ])
    error_message = "must be one of: Allow, Deny"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

