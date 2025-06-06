# module "managed-service-grafana" {
#   source  = "terraform-aws-modules/managed-service-grafana/aws"
#   version = "2.3.0"

#   # Workspace
#   name                      = "angelo-grafana-workspace"
#   associate_license         = false
#   description               = "Grafana workspace for Angelo's EKS cluster"
#   account_access_type       = "CURRENT_ACCOUNT"
#   authentication_providers  = ["AWS_SSO"]
#   permission_type           = "SERVICE_MANAGED"
#   data_sources              = ["CLOUDWATCH", "PROMETHEUS", "XRAY"]
#   notification_destinations = ["SNS"]
#   stack_set_name            = "angelo-grafana-stack-set"
#   grafana_version           = "10.4"

#   configuration = jsonencode({
#     unifiedAlerting = {
#       enabled = true
#     },
#     plugins = {
#       pluginAdminEnabled = false
#     }
#   })

#   # Workspace API keys
#   workspace_api_keys = {
#     viewer = {
#       key_name        = "viewer"
#       key_role        = "VIEWER"
#       seconds_to_live = 3600
#     }
#     editor = {
#       key_name        = "editor"
#       key_role        = "EDITOR"
#       seconds_to_live = 3600
#     }
#     admin = {
#       key_name        = "admin"
#       key_role        = "ADMIN"
#       seconds_to_live = 3600
#     }
#   }

#   # Workspace service accounts
#   workspace_service_accounts = {
#     viewer = {
#       grafana_role = "VIEWER"
#     }
#     editor = {
#       name         = "editor-example"
#       grafana_role = "EDITOR"
#     }
#     admin = {
#       grafana_role = "ADMIN"
#     }
#   }

#   workspace_service_account_tokens = {
#     viewer = {
#       service_account_key = "viewer"
#       seconds_to_live     = 3600
#     }
#     editor = {
#       name                = "editor-example"
#       service_account_key = "editor"
#       seconds_to_live     = 3600
#     }
#     admin = {
#       service_account_key = "admin"
#       seconds_to_live     = 3600
#     }
#   }

#   # Workspace IAM role
#   create_iam_role                = true
#   iam_role_name                  = "angelo-grafana-workspace-role"
#   use_iam_role_name_prefix       = true
#   iam_role_description           = "Role for Angelo's Grafana workspace"
#   iam_role_path                  = "/grafana/"
#   iam_role_force_detach_policies = true
#   iam_role_max_session_duration  = 7200
#   iam_role_tags                  = { role = true }

#   tags = {
#     Terraform   = "true"
#   }
# }