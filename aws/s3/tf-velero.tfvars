name          = "###ZARF_VAR_NAME###"
bucket_name   = "###ZARF_VAR_NAME###-velero"
#kms_key_arn  = "###ZARF_VAR_VELERO_KMS_KEY_ARN###"
force_destroy = "###ZARF_VAR_EPHEMERAL###"

kubernetes_service_account = "velero-velero-server"
kubernetes_namespace       = "velero"
