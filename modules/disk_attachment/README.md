# alicloud_disk_attachment

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| disk_count | Number of disks to launch | int | - | yes |
| disk_ids | A list IDs of disks | list | - | yes |
| instance_id | The ID of ECS instance | string | - | yes |
| attach_disk | Whether to attach disks to one instance | bool | fasle | no |