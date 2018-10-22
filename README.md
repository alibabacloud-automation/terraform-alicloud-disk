Alicloud ECS Disk Terraform Module On Alibaba Cloud 
terraform-alicloud-disk
=====================================================================

Terraform module which creates several ECS disks and attach them to one specified ECS instance on Alibaba Cloud.

These types of resources are supported:

* [ECS disk](https://www.terraform.io/docs/providers/alicloud/r/disk.html)

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

    ```
    module "disks" {
        source = "terraform-alicloud-modules/disk/alicloud"

        disk_count = 2

        name     = "disk-exapmle"
        category = "cloud_ssd"
        size     = 40

        tags = {
          Owner       = "user"
          Environment = "dev"
        }

        attach_disk = true
        instance_id = "i-ce3nf3cf"

    }
    ```

2. Setting `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability_zone | The available zone to launch ecs disks. Default from data source `alicloud_zones`. | string | - | no |
| name | Name used on all disks as prefix | string | TF_ECS_Disk | no |
| category | The data disk category used to launch one or more data disks. | string | cloud_efficiency | no |
| size | The data disk size used to launch one or more data disks | int | 40 | no |
| disk_count | The number of launching disks one time. | int | 1 | no |
| encrypted | Whether to encrypt the disks | bool | false | no |
| tags | Used to mark specified ecs data disks. `name` will be merged into tags automactially. | {created_by= "Terraform", created_from = "module-terraform-alicloud-disk"} | - | no |
| instance_id | The ID of ECS instance | string | - | yes |
| attach_disk | Whether to attach disks to one instance | bool | fasle | no |


## Outputs

| Name | Description |
|------|-------------|
| this_disk_ids | List of disks ID |
| this_availability_zone | The zone ID of the ECS disks belongs to |

Authors
-------
Created and maintained by He Guimin(@xiaozhu36, heguimin36@163.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


