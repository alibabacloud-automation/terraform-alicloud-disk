provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/disk"
}

######
# ECS Disk
######
module "disks" {
  source = "./modules/disk"

  disk_count = var.disk_count

  name     = var.name
  category = var.category
  size     = var.size

  availability_zone = var.availability_zone
  encrypted         = var.encrypted

  tags = var.tags
}

#################
# ECS Disk Attachment
#################
module "disk_attachment" {
  source = "./modules/disk_attachment"

  disk_count = var.disk_count

  disk_ids    = module.disks.disk_ids
  attach_disk = var.attach_disk
  instance_id = var.instance_id
}

