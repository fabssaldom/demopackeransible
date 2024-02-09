module "sie-packer-poc" {
  source               = "./packer-image-builder"
  project_id           = "gdccompute"
  packer_account_users = ["user:fsalaman@google.com"]
  create_packer_vars   = true
  project_create       = false
  region               = "us-west1"
  cidrs = {
    image-builder = "172.16.192.0/24"
  }
  packer_source_cidrs = ["35.235.240.0/20", "10.0.0.0/8", "172.16.0.0/16", "35.191.0.0/16", "130.211.0.0/22"]
}
# tftest modules=7 resources=19 files=pkrvars