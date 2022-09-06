terraform {
  source = "git::ssh://git@github.com/ei-roslyakov/terraform-modules.git//aws_ecr/?ref=tags/v0.0.2"
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
  image_names = [
    "some-name-${local.env.env}-${local.app.app}-${local.region.region_abbr}-1",
    "some-name-${local.env.env}-${local.app.app}-${local.region.region_abbr}-2",
    "some-name-${local.env.env}-${local.app.app}-${local.region.region_abbr}-3",
    "some-name-${local.env.env}-${local.app.app}-${local.region.region_abbr}-4"
  ]
  tags = {
    Name = "some-name-${local.env.env}-${local.app.app}"
  }
}
