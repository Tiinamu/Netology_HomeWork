provider "yandex" {
  cloud_id  = "b1g4u3sfpchj6i21hp7f"
  folder_id = "b1gjl0488dbj7totafg8"
  zone      = "ru-central1-a"
  service_account_key_file = "key.json"
}

locals {
  instance_name = "${terraform.workspace}-instance1" 
  
  instance_type_count = {
     stage = 1
     prod  = 2
  }

  cores = {
    stage = 2
    prod  = 4
  }
  
  memory = {
    stage = 2
    prod  = 4  
  }

  disk_size = {
    stage = 10
    prod  = 30
  }

  instance_type_for_each = {
    stage = toset(["1"]),
    prod  = toset(["1", "2"])
  }

}


#resource "yandex_storage_bucket" "test" {
#  access_key = "YCAJEe1qfB6ng9cSWti6Q0wzD"
#  secret_key = "YCM1LJ8lBvph0T4j43juSJu0FBdJk1tuXOg0-UDv"
#  bucket = "tiinamu-bucket"
  
#}

terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tiinamu-bucket"
    region     = "ru-central1"
    key        = "bucket_path/terraform.tfstate"
    access_key = "YCAJEe1qfB6ng9cSWti6Q0wzD"
    secret_key = "YCM1LJ8lBvph0T4j43juSJu0FBdJk1tuXOg0-UDv"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}


resource "yandex_compute_image" "image" {
  source_family = "centos-8"
}

#создадим первый инстанст, в котором будет использоваться count
#resource "yandex_compute_instance" "count_vm" {
#  count                     = local.instance_type_count[terraform.workspace]
#  name                      = "${terraform.workspace}-${count.index+1}"
#  zone                      = "ru-central1-a"
#  hostname                  = "vm.netology.cloud-${terraform.workspace}-${count.index+1}"
#  allow_stopping_for_update = true

#  resources {
#    cores  = local.cores[terraform.workspace]
#    memory = local.memory[terraform.workspace]
#  }

#  boot_disk {
#    initialize_params {
#      image_id    = "${yandex_compute_image.image.id}"
#      name        = "root-${terraform.workspace}-${count.index+1}"
#      type        = "network-nvme"
#      size        = local.disk_size[terraform.workspace]
#    }
#  }

#  network_interface {
#    subnet_id = "${yandex_vpc_subnet.default.id}"
#    nat       = true
#  }
#
#  metadata = {
#    ssh-keys = "centos:${file("/home/artem/.ssh/id_rsa.pub")}"
#  }
#}

#создадим второй инстанс, в котором будет использоваться for-each
resource "yandex_compute_instance" "for_each_vm" {
  for_each                  = local.instance_type_for_each[terraform.workspace]
  name                      = "${terraform.workspace}-${each.key}"
  zone                      = "ru-central1-a"
  hostname                  = "vm.netology.cloud-${terraform.workspace}-${each.key}"
  allow_stopping_for_update = true

  lifecycle {
    create_before_destroy = true
  }

  resources {
    cores  = local.cores[terraform.workspace]
    memory = local.memory[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id    = "${yandex_compute_image.image.id}"
#      name        = "root-vm1"
      name        = "root-${terraform.workspace}-${each.key}"
      type        = "network-nvme"
      size        = local.disk_size[terraform.workspace]
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("/home/artem/.ssh/id_rsa.pub")}"
  }

}
