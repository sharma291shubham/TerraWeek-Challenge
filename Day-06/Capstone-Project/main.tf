module "labels" {
  source = "./modules/labels"

  project     = var.project_name
  environment = var.environment
  component   = "platform"
}

module "network" {
  source = "./modules/network"

  project_name = var.project_name
  environment  = var.environment
  tags         = module.labels.tags
}

module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
  environment  = var.environment
  tags         = module.labels.tags
}