// Output the IDs of the ECS instances created
output "availability_zone" {
  value = var.availability_zone == "" ? data.alicloud_zones.this.zones[0].id : var.availability_zone
}

// Output the IDs of the ECS disks created
output "disk_ids" {
  value = flatten(alicloud_disk.this.*.id)
}

output "name" {
  value = concat(alicloud_disk.this.*.name, [""])[0]
}

output "category" {
  value = concat(alicloud_disk.this.*.category, [""])[0]
}

output "size" {
  value = concat(alicloud_disk.this.*.size, [""])[0]
}

output "tags" {
  value = concat(alicloud_disk.this.*.tags, [""])[0]
}

output "encrypted" {
  value = concat(alicloud_disk.this.*.encrypted, [""])[0]
}