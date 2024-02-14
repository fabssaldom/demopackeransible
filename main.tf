module "sie-packer-poc" {
  source               = "./packer-image-builder" # check path against your code
  project_id           = "<project_id>" # Image Bakery GCP Project
  packer_account_users = ["user:<user>@<org.domain>"] # User
  create_packer_vars   = true
  project_create       = false
  region               = "<GCP-region>" # Desired region for Image Bakery
  cidrs = {
    image-builder = "<aa.bb.cc.dd/cidr>"
  }
  packer_source_cidrs = ["35.235.240.0/20", "35.191.0.0/16", "130.211.0.0/22", "<private-range 1>", "<private-range 2  , ...>"]
}
# tftest modules=7 resources=19 files=pkrvars