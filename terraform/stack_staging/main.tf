module "stack" {
  source = "../modules/stack"

  namespace = "staging"

  redis_server = data.terraform_remote_state.critical.outputs.redis_server
  redis_port   = data.terraform_remote_state.critical.outputs.redis_port

  rds_username = data.terraform_remote_state.critical.outputs.rds_username
  rds_password = data.terraform_remote_state.critical.outputs.rds_password
  rds_host     = data.terraform_remote_state.critical.outputs.rds_host
  rds_port     = data.terraform_remote_state.critical.outputs.rds_port

  ebs_volume_id = data.terraform_remote_state.critical.outputs.ebs_volume_id

  mcp_client_container_image            = module.mcp_client_repo_uri.value
  mcp_server_container_image            = module.mcp_server_repo_uri.value
  storage_service_container_image       = module.storage_service_repo_uri.value
  storage_service_nginx_container_image = module.storage_service_nginx_repo_uri.value
  dashboard_container_image             = module.dashboard_repo_uri.value
  dashboard_nginx_container_image       = module.dashboard_nginx_repo_uri.value

  certificate_arn = data.terraform_remote_state.infra.outputs.certificate_arn

  storage_service_hostname = "archivematica-storage-service-stage.wellcomecollection.org"
  dashboard_hostname       = "archivematica-stage.wellcomecollection.org"

  ingests_bucket_arn          = data.terraform_remote_state.critical.outputs.ingests_bucket_arn
  transfer_source_bucket_arn  = data.terraform_remote_state.critical.outputs.transfer_source_bucket_arn
  transfer_source_bucket_name = data.terraform_remote_state.critical.outputs.transfer_source_bucket_name
  storage_service_bucket_arn  = "arn:aws:s3:::wellcomecollection-storage-staging"

  archivematica_username    = local.archivematica_username
  archivematica_api_key     = local.archivematica_api_key
  archivematica_ss_username = local.archivematica_ss_username
  archivematica_ss_api_key  = local.archivematica_ss_api_key

  azure_tenant_id = local.azure_tenant_id
  oidc_client_id  = local.oidc_client_id

  network_private_subnets = data.terraform_remote_state.workflow.outputs.private_subnets
  network_public_subnets  = data.terraform_remote_state.workflow.outputs.public_subnets
  vpc_id                  = data.terraform_remote_state.workflow.outputs.vpc_id

  interservice_security_group_id   = data.terraform_remote_state.critical.outputs.interservice_security_group_id
  service_egress_security_group_id = data.terraform_remote_state.workflow.outputs.service_egress_security_group_id
  service_lb_security_group_id     = data.terraform_remote_state.workflow.outputs.service_lb_security_group_id

  admin_cidr_ingress = local.admin_cidr_ingress

  lambda_error_alarm_arn = local.lambda_error_alarm_arn

  providers = {
    aws.digitisation = aws.digitisation
    aws.dns          = aws.dns
  }
}
