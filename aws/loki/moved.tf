moved {
  from = module.S3.module.irsa_policy[0].aws_iam_policy.policy[0]
  to   = aws_iam_policy.loki_policy
}

moved {
  from = module.S3.aws_iam_role_policy_attachment.irsa[0]
  to   = module.irsa.module.irsa.aws_iam_role_policy_attachment.custom[0]
}

moved {
  from = module.S3.module.irsa[0].aws_iam_role.this[0]
  to   = module.irsa.module.irsa.aws_iam_role.this[0]
}

moved {
  from = module.S3.module.irsa.aws_iam_role.this[0]
  to   = module.S3.module.irsa[0].aws_iam_role.this[0]
}

moved {
  from = module.S3.module.irsa_policy.aws_iam_policy.policy[0]
  to   = module.S3.module.irsa_policy[0].aws_iam_policy.policy[0]
}
