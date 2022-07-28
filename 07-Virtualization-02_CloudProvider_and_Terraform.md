## Домашнее задание к занятию "Домашнее задание к занятию "7.2. Облачные провайдеры и синтаксис Terraform"

__Зачастую разбираться в новых инструментах гораздо интересней понимая то, как они работают изнутри. Поэтому в рамках первого необязательного задания предлагается завести свою учетную запись в AWS (Amazon Web Services) или Yandex.Cloud. Идеально будет познакомится с обоими облаками, потому что они отличаются.__

__1.	Задача 1 (вариант с AWS). Регистрация в aws и знакомство с основами (необязательно, но крайне желательно).__

__Остальные задания можно будет выполнять и без этого аккаунта, но с ним можно будет увидеть полный цикл процессов.
AWS предоставляет достаточно много бесплатных ресурсов в первый год после регистрации, подробно описано здесь.__

1)	Создайте аккаут aws.
2)	Установите c aws-cli https://aws.amazon.com/cli/.
3)	Выполните первичную настройку aws-sli https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html.
4)	Создайте IAM политику для терраформа c правами
o	AmazonEC2FullAccess
o	AmazonS3FullAccess
o	AmazonDynamoDBFullAccess
o	AmazonRDSFullAccess
o	CloudWatchFullAccess
o	IAMFullAccess
5)	Добавьте переменные окружения
6)	export AWS_ACCESS_KEY_ID=(your access key id)
7)	export AWS_SECRET_ACCESS_KEY=(your secret access key)
8)	Создайте, остановите и удалите ec2 инстанс (любой с пометкой free tier) через веб интерфейс.
 
__В виде результата задания приложите вывод команды aws configure list.__

__1.	Задача 1 (Вариант с Yandex.Cloud). Регистрация в ЯО и знакомство с основами (необязательно, но крайне желательно).__

1)	Подробная инструкция на русском языке содержится здесь.
2)	Обратите внимание на период бесплатного использования после регистрации аккаунта.
3)	Используйте раздел "Подготовьте облако к работе" для регистрации аккаунта. Далее раздел "Настройте провайдер" для подготовки базового терраформ конфига.
4)	Воспользуйтесь инструкцией на сайте терраформа, что бы не указывать авторизационный токен в коде, а терраформ провайдер брал его из переменных окружений.

__Решение:__

1.1)	Регистрация была выполнена в рамках ДЗ 5-4. 
1.2)	Проверим вывод команды yc config list:

```
artem@ubuntu:~$ yc config list
token: AQAAAAAN_tZ5AATuwSsx5JrfJUgGr8kj0SbPdKY
cloud-id: b1g4u3sfpchj6i21hp7f
folder-id: b1gjl0488dbj7totafg8
compute-default-zone: ru-central1-a
```

Проверим версию:
```
artem@ubuntu:~$ yc -v
Yandex Cloud CLI 0.91.0 linux/amd64
```

1.3)	Что бы не указывать авторизационный токен в коде, а терраформ провайдер брал его из переменных окружений, используем переменную окружения
```
artem@ubuntu:~$ export IAM_TOKEN=`yc iam create-token`
artem@ubuntu:~$ curl -H "Authorization: Bearer ${IAM_TOKEN}" \
>   https://resource-manager.api.cloud.yandex.net/resource-manager/v1/clouds
{
 "clouds": [
  {
   "id": "b1g4u3sfpchj6i21hp7f",
   "createdAt": "2022-06-08T15:41:36Z",
   "name": "cloud-tiinamu",
   "organizationId": "bpffgpf8hfgs76hdb8bg"
  }
 ]
}
```

1.4)	Проверим:
```
artem@ubuntu:~$ echo $IAM_TOKEN
t1.9euelZqTj5uJkJSekJPGys_GnY6dj-3rnpWajZ6dko2Kxs2TmYnNyJrGx8_l9PdLfnlo-e94F0Pf3fT3Cy13aPnveBdD3w.MiCw_MppuLv1xHWuwIO6L0GRkHfV8BrwtaxRWiG11lvojv6PO8SCnk3jK_S61YB0poTP9nVDUjepKov4X-KiDA
artem@ubuntu:~$
```
_________________________________

__2.	Задача 2. Создание aws ec2 или yandex_compute_instance через терраформ.__

1)	В каталоге terraform вашего основного репозитория, который был создан в начале курсе, создайте файл main.tf и versions.tf.
2)	Зарегистрируйте провайдер
i.	для aws. В файл main.tf добавьте блок provider, а в versions.tf блок terraform с вложенным блоком required_providers. Укажите любой выбранный вами регион внутри блока provider.
ii.	либо для yandex.cloud. Подробную инструкцию можно найти здесь.
3)	Внимание! В гит репозиторий нельзя пушить ваши личные ключи доступа к аккаунту. Поэтому в предыдущем задании мы указывали их в виде переменных окружения.
4)	В файле main.tf воспользуйтесь блоком data "aws_ami для поиска ami образа последнего Ubuntu.
5)	В файле main.tf создайте ресурс
i.	либо ec2 instance. Постарайтесь указать как можно больше параметров для его определения. Минимальный набор параметров указан в первом блоке Example Usage, но желательно, указать большее количество параметров.
ii.	либо yandex_compute_image.
6)	Также в случае использования aws:
i.	Добавьте data-блоки aws_caller_identity и aws_region.
ii.	В файл outputs.tf поместить блоки output с данными об используемых в данный момент:
	AWS account ID,
	AWS user ID,
	AWS регион, который используется в данный момент,
	Приватный IP ec2 инстансы,
	Идентификатор подсети в которой создан инстанс.
7)	Если вы выполнили первый пункт, то добейтесь того, что бы команда terraform plan выполнялась без ошибок.

__В качестве результата задания предоставьте:__

1.	Ответ на вопрос: при помощи какого инструмента (из разобранных на прошлом занятии) можно создать свой образ ami?
2.	Ссылку на репозиторий с исходной конфигурацией терраформа.

__Решение:__

2.1)	Подготовим новую директорию проекта:
```
artem@ubuntu:~/Netology_5-4_Compose sudo -R cp . ~/Netology_7_2_CloudProvider_and_Terraform/ 
Далее работаем в папке проекта ~/Netology_7_2_CloudProvider_and_Terraform
```

2.2)	Удаляем настройки предыдущих провайдеров:
```
rm -rf .terraform*
rm provider.tf
```

2.3)	Создаем файл main.tf
```
provider "yandex" {
  cloud_id  = "b1g4u3sfpchj6i21hp7f"
  folder_id = "b1gjl0488dbj7totafg8"
  zone      = "ru-central1-a"
  service_account_key_file = "key.json"
}

resource "yandex_compute_image" "image" {
  source_family = "centos-8"
}

resource "yandex_compute_instance" "virtual_ya" {
  name                      = "virtual_ya"
  zone                      = "ru-central1-a"
  hostname                  = "virtual_ya.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${yandex_compute_image.image.id}"
      name        = "root-virtual_ya"
      type        = "network-nvme"
      size        = "30"
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
```

2.4)	Создаем файл versions.tf
```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}
```

2.5)	Проводим инициализацию: terraform init – терраформ скачает все зависимости для него:
```
artem@ubuntu:~/Netology_7_2_CloudProvider_and_Terraform/terraform$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of yandex-cloud/yandex from the dependency lock file
- Using previously-installed yandex-cloud/yandex v0.77.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

2.6)	Далее надо провести валидацию конфига terraform:
```
artem@ubuntu:~/Netology_7_2_CloudProvider_and_Terraform/terraform$ terraform validate
Success! The configuration is valid.
```

2.7)	Посмотрим, что terraform нам создаст через plan:
```
artem@ubuntu:~/Netology_7_2_CloudProvider_and_Terraform/terraform$ sudo terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_image.image will be created
  + resource "yandex_compute_image" "image" {
      + created_at      = (known after apply)
      + folder_id       = (known after apply)
      + id              = (known after apply)
      + min_disk_size   = (known after apply)
      + os_type         = (known after apply)
      + pooled          = (known after apply)
      + product_ids     = (known after apply)
      + size            = (known after apply)
      + source_disk     = (known after apply)
      + source_family   = "centos-8"
      + source_image    = (known after apply)
      + source_snapshot = (known after apply)
      + source_url      = (known after apply)
      + status          = (known after apply)
    }

  # yandex_compute_instance.virtual_ya will be created
  + resource "yandex_compute_instance" "virtual_ya" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "virtual_ya.netology.cloud"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiczfAD4mqrE1Qolxag4LH+ADEaBCvWVhg83cmxEi9AWWKIiFJH2XFhGJTeBb1uEso9hBcekEOBcYRnthNcjWq0bHXtvv2rIOrbSTBHD6MyV/ChTkotdB7NXCccaSKONtv89VCyqGBdodHsX58AWLln47bB1ewU8V5wJnJp1I5ZpeIidJvRTTbGEASZFmvnO3/KqqgGuisTKmRRjvaGOFb5rJJAYRgrupONpwJDKjTVD8XMmlSMs/mIztJ/CawHZkIqZ/4NxAIhPNuvn8l8SykEXM/QdqIjSTqDxTehHcwNbw8T+xyof6aXt+3pbaDvU00TnUFdtKD51mh7bRRzchyRO6FH8pUFRiVJYGkE4MHn9w2/mA31nVf0DuOtjR9ciH7/P/Wtr9IVsF8YN9df82D8cNnv97c4wZma6I/GT5Qgoe0cs8l3KaPHOVRtKyM1xISxqI4+qROmDHM+pdp2mr0pR2ikndBEZrHE3xxHSLBX0RZe+brCRD68FFO1MWC/Ns= artem@ubuntu
            EOT
        }
      + name                      = "virtual_ya"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = (known after apply)
              + name        = "root-virtual_ya"
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_vpc_network.default will be created
  + resource "yandex_vpc_network" "default" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "net"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.default will be created
  + resource "yandex_vpc_subnet" "default" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.101.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 4 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you
run "terraform apply" now.
artem@ubuntu:~/Netology_7_2_CloudProvider_and_Terraform/terraform$
```

2.8)	Ошибок при выполнении terraform plan – нет.

2.9)	Создать образ ami можно с помощью Packer

2.10)	Исходная конфигурация terraform-файлов приведена выше.
