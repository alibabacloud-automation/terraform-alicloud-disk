# ECS Disk
module "disks" {
  source = "./modules/disk"

  disk_count = var.disk_count

  name              = var.name
  category          = var.category
  size              = var.size
  availability_zone = var.availability_zone
  encrypted         = var.encrypted
  tags              = var.tags
}

# ECS Disk Attachment
module "disk_attachment" {
  source = "./modules/disk_attachment"

  attach_disk = var.attach_disk

  disk_count  = var.disk_count
  disk_ids    = length(var.disk_ids) > 0 ? var.disk_ids : module.disks.disk_ids
  instance_id = var.instance_id

}
