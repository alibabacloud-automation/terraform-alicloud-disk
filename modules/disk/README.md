# alicloud_disk

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability_zone | The available zone to launch ecs disks. Default from data source `alicloud_zones`. | string | - | no |
| name | Name used on all disks as prefix | string | TF_ECS_Disk | no |
| category | The data disk category used to launch one or more data disks. | string | cloud_efficiency | no |
| size | The data disk size used to launch one or more data disks | int | 40 | no |
| disk_count | Number of disks to launch | int | 1 | no |
| tags | Used to mark specified ecs data disks. `name` will be merged into tags automactially. | {created_by= "Terraform", created_from = "module-terraform-alicloud-disk"} | - | no |
| encrypted | Whether to encrypt the disks | bool | false | no |

## Outputs

| Name | Description |
|------|-------------|
| availability_zone | Availability zone ID|
| disk_ids | A list IDs of disks |