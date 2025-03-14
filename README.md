Alicloud ECS Disk Terraform Module On Alibaba Cloud 
terraform-alicloud-disk

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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_disk_attachment"></a> [disk\_attachment](#module\_disk\_attachment) | ./modules/disk_attachment | n/a |
| <a name="module_disks"></a> [disks](#module\_disks) | ./modules/disk | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_disk"></a> [attach\_disk](#input\_attach\_disk) | Whether to attach disks to one instance. | `bool` | `false` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The available zone to launch ecs disks. Default from data source `alicloud_zones`. | `string` | `""` | no |
| <a name="input_category"></a> [category](#input\_category) | The data disk category used to launch one or more data disks. | `string` | `"cloud_efficiency"` | no |
| <a name="input_disk_count"></a> [disk\_count](#input\_disk\_count) | Number of disks to launch. | `number` | `1` | no |
| <a name="input_disk_ids"></a> [disk\_ids](#input\_disk\_ids) | A list ECS disks ID. | `list(string)` | `[]` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Whether to encrypt the disks. | `bool` | `false` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | The ID of ECS instance. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name used on all disks as prefix. Like TF\_ECS\_Disk-1, TF\_ECS\_Disk-2. | `string` | `""` | no |
| <a name="input_size"></a> [size](#input\_size) | The data disk size used to launch one or more data disks. | `string` | `"40"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Used to mark specified ecs data disks. Name will be merged into tags automactially. | `map(string)` | <pre>{<br>  "created_by": "Terraform",<br>  "created_from": "module-terraform-alicloud-disk"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_availability_zone"></a> [this\_availability\_zone](#output\_this\_availability\_zone) | The zone ID of the ECS disks belongs to. |
| <a name="output_this_category"></a> [this\_category](#output\_this\_category) | Category of the disk. |
| <a name="output_this_disk_count"></a> [this\_disk\_count](#output\_this\_disk\_count) | Whether to encrypt the disks. |
| <a name="output_this_disk_ids"></a> [this\_disk\_ids](#output\_this\_disk\_ids) | List of disks ID. |
| <a name="output_this_name"></a> [this\_name](#output\_this\_name) | Name of the ECS disk. |
| <a name="output_this_size"></a> [this\_size](#output\_this\_size) | The data disk size used to launch one or more data disks. |
| <a name="output_this_tags"></a> [this\_tags](#output\_this\_tags) | Used to mark specified ecs data disks. |
<!-- END_TF_DOCS -->

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


