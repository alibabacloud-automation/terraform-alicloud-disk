module "ecs-instance" {
  source = "github.com/terraform-alicloud-modules/terraform-alicloud-ecs-instance"
}

module "disks" {
  source = "../../"
  name = var.name
  category = var.category
  size = var.size
  tags = var.tags
  disk_count = var.disk_count
  encrypted = var.encrypted
  instance_id = module.ecs-instance.instance_ids[0]
  attach_disk = var.attach_disk
}

