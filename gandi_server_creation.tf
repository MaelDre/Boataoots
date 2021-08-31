terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

provider "openstack" {
  auth_url = "https://keystone.sd6.api.gandi.net:5000/v3"
  region = "FR-SD6"
}

variable "SSH_PUBKEY" {
  type = string
}

resource "openstack_compute_instance_v2" "tf_server" {
  name = "tf-test-server"
  key_pair = "${var.SSH_PUBKEY}"
  flavor_name = "V-R1"
  security_groups = ["default"]
  power_state = "active"
  network {
    name = "public"
  }

  block_device {
    uuid = "47edd0a0-23ce-4ce5-9168-36de68990d1b"
    source_type           = "image"
    volume_size           = 25
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
}

output "IP_v4" {
  value = openstack_compute_instance_v2.tf_server.access_ip_v4
}