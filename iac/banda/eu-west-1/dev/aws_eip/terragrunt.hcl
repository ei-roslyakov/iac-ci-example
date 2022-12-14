terraform {
  source = "git::ssh://git@github.com/ei-roslyakov/terraform-modules.git//aws_eip/?ref=tags/v0.0.2"
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  region = jsondecode(file(find_in_parent_folders("region.json")))
  env    = jsondecode(file(find_in_parent_folders("env.json")))
  app    = jsondecode(file(find_in_parent_folders("app.json")))
  common = jsondecode(file(find_in_parent_folders("../common.json")))
}

inputs = {
  name      = "${local.env.env}-${local.app.app}-${local.region.region_abbr}-nlb-ip"
  count_eip = 1
  tags = {
    Name = "${local.env.env}-${local.app.app}-${local.region.region_abbr}-nlb-ip"
    App  = "${local.app.app}"
  }
}