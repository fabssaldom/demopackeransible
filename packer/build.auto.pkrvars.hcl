# Packer variables file template.
# Used by Terraform to generate Packer variable file.
project_id         = "gdccompute"
compute_zone       = "us-west1-a"
builder_sa         = "image-builder@gdccompute.iam.gserviceaccount.com"
compute_sa         = "image-builder-vm@gdccompute.iam.gserviceaccount.com"
compute_subnetwork = "image-builder"
use_iap            = true