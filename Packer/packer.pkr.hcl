packer {
  required_plugins {
    azure = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/azure"
    }
  }
}

variable "client_id" {
  type    = string
  default = ""
}

variable "client_secret" {
  type    = string
  default = ""
}

variable "subscription_id" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type    = string
  default = ""
}

source "azure-arm" "nginx" {
  client_id                   = "******"
  client_secret               = "******"
  subscription_id             = "*****"
  tenant_id                   = "*******"
  managed_image_resource_group_name = "myResourceGroup"
  managed_image_name          = "nginxImage"
  os_type                     = "Linux"
  image_publisher             = "Canonical"
  image_offer                 = "UbuntuServer"
  image_sku                   = "18.04-LTS"
  location                    = "West Europe"
  vm_size                     = "Standard_DS2_v2"
  azure_tags = {
    dept  = "Engineering",
    task  = "Image deployment"
  }
}

build {
  sources = ["source.azure-arm.nginx"]

  provisioner "shell" {
    inline = [
      "sudo add-apt-repository ppa:ansible/ansible",
      "sudo apt-get update",
      "sudo apt-get install -y ansible",
      "echo 'Ansible installation completed'"
    ]
  }

  provisioner "file" {
    source      = "/home/david/packer/playbook.yml"
    destination = "/home/packer/playbook.yml"
  }

  provisioner "shell" {
    inline = [
      "sudo ansible-playbook /home/packer/playbook.yml"
    ]
  }

  provisioner "shell" {
    inline = [
      "echo 'Running cleanup'",
      "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync",
      "echo 'Cleanup completed'"
    ]
  }
}
