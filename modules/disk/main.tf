// Zones data source for availability_zone
data "alicloud_zones" "this" {
  available_disk_category = var.category
}

// ECS Disk Resource for Module
resource "alicloud_disk" "this" {
  count = var.disk_count

  availability_zone = var.availability_zone == "" ? data.alicloud_zones.this.zones[0].id : var.availability_zone
  name              = var.disk_count < 2 ? var.name : format("%s%s", var.name, format("%02d", count.index + 1))
  category          = var.category
  size              = var.size
  encrypted         = var.encrypted

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}

