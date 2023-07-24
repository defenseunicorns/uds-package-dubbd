moved {
  to =  module.irsa.module.irsa.aws_iam_role.this[0]
  from = module.S3.module.irsa[0].aws_iam_role.this[0]
}

moved {
  to = aws_iam_policy.loki_policy
  from = module.S3.module.irsa_policy[0].aws_iam_policy.policy[0]
}

moved {
  to = module.irsa.module.irsa.aws_iam_role_policy_attachment.this["loki"]
  from = module.S3.aws_iam_role_policy_attachment.irsa[0]
}

moved {
  to = aws_s3_bucket_policy.bucket_policy
  from = module.S3.aws_s3_bucket_policy.bucket_policy[0]
}