data "alicloud_zones" "default" {
  available_resource_creation = "Disk"
}

data "alicloud_images" "default" {
  name_regex = "^centos_6"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones[0].id
  cpu_core_count       = 2
  memory_size          = 8
  instance_type_family = "ecs.g6"
}

resource "alicloud_security_group" "default" {
  vpc_id = module.vpc.this_vpc_id
}

resource "alicloud_instance" "default" {
  security_groups = [alicloud_security_group.default.id]
  vswitch_id      = module.vpc.this_vswitch_ids[0]
  instance_type   = data.alicloud_instance_types.default.instance_types[0].id
  image_id        = data.alicloud_images.default.images[0].id
}

module "vpc" {
  source  = "alibaba/vpc/alicloud"
  version = "~>1.11"

  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones[0].id]
}

#alicloud_ecs_disk
module "disks" {
  source = "../.."

  #alicloud_ecs_disk
  disk_count = 1

  name              = var.name
  category          = var.category
  size              = var.size
  availability_zone = data.alicloud_zones.default.zones[0].id
  encrypted         = false
  tags              = var.tags

  #alicloud_ecs_disk_attachment
  attach_disk = false

}

#alicloud_ecs_disk_attachment
module "disk_attachment" {
  source = "../.."

  #alicloud_ecs_disk_attachment
  attach_disk = true
  disk_count  = module.disks.this_disk_count
  name        = var.name

  disk_ids    = module.disks.this_disk_ids
  instance_id = alicloud_instance.default.id

}