/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.1.4"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "rhel-sie-demo" {
  project_id                  = var.project_id
  zone                        = var.compute_zone
  #impersonate_service_account = var.builder_sa
  service_account_email       = var.compute_sa
  subnetwork                  = var.compute_subnetwork
  omit_external_ip            = true
  use_internal_ip             = true
  ssh_username                = "packer"
  use_iap                     = var.use_iap
  temporary_key_pair_type = "ed25519"
  metadata = {
    enable-oslogin : "false"
  }
  use_os_login      = false

  source_image_family = "rhel-9"
  image_name          = "rhel-9-sie-2024-ansible"
  image_description   = "Packer built: SIE RHEL9 image for X application, customized with Ansible"
}

build {
  sources = ["sources.googlecompute.rhel-sie-demo"]
  provisioner "shell" {
    script = "preprocess.sh"
  }
} 