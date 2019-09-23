// Output the IDs of the ECS instances created
output "availability_zone" {
  value = var.availability_zone == "" ? data.alicloud_zones.this.zones[0].id : var.availability_zone
}

// Output the IDs of the ECS disks created
output "disk_ids" {
  value = flatten(alicloud_disk.this.*.id)
}

