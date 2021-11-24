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

## Notes
From the version v1.5.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
   version              = ">=1.56.0"
   region               = var.region != "" ? var.region : null
   configuration_source = "terraform-alicloud-modules/disk"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.4.0:

```hcl
module "disks" {
   source     = "terraform-alicloud-modules/disk/alicloud"
   version    = "1.4.0"
   region     = "cn-beijing"
   disk_count = 2
   name       = "disk-exapmle"
   // ...
}
```

If you want to upgrade the module to 1.5.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
   region = "cn-beijing"
}
module "disks" {
   source     = "terraform-alicloud-modules/disk/alicloud"
   disk_count = 2
   name       = "disk-exapmle"
   // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
   region = "cn-beijing"
   alias  = "bj"
}
module "disks" {
   source     = "terraform-alicloud-modules/disk/alicloud"
   providers  = {
      alicloud = alicloud.bj
   }
   disk_count = 2
   name       = "disk-exapmle"
   // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


