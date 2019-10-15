// Output the IDs of the ECS instances created
output "availability_zone" {
  value = var.availability_zone == "" ? data.alicloud_zones.this.zones[0].id : var.availability_zone
}

// Output the IDs of the ECS disks created
output "disk_ids" {
  value = flatten(alicloud_disk.this.*.id)
}

output "name" {
  value = alicloud_disk.this[0].name
}

output "category" {
  value = alicloud_disk.this[0].category
}

output "size" {
  value = alicloud_disk.this[0].size
}

output "tags" {
  value = alicloud_disk.this[0].tags
}

output "encrypted" {
  value = alicloud_disk.this[0].encrypted
}