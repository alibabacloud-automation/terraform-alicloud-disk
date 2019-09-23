// ECS Disk Attachment Resource for Module
resource "alicloud_disk_attachment" "this" {
  count       = var.attach_disk ? var.disk_count : 0
  disk_id     = var.disk_ids[count.index]
  instance_id = var.instance_id
}

