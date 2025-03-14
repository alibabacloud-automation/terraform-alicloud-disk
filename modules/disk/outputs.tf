# Output the IDs of the ECS instances created
output "availability_zone" {
  description = "The zone ID of the ECS disks belongs to."
  value       = var.availability_zone == "" ? data.alicloud_zones.this.zones[0].id : var.availability_zone
}

# Output the IDs of the ECS disks created
output "disk_ids" {
  description = "A list IDs of disks."
  value       = flatten(alicloud_disk.this[*].id)
}

output "name" {
  description = "Name of the ECS disk."
  value       = concat(alicloud_disk.this[*].disk_name, [""])[0]
}

output "category" {
  description = "Category of the disk."
  value       = concat(alicloud_disk.this[*].category, [""])[0]
}

output "size" {
  description = "The data disk size used to launch one or more data disks."
  value       = concat(alicloud_disk.this[*].size, [""])[0]
}

output "tags" {
  description = "Used to mark specified ecs data disks."
  value       = concat(alicloud_disk.this[*].tags, [""])[0]
}

output "encrypted" {
  description = "Whether to encrypt the disks."
  value       = concat(alicloud_disk.this[*].encrypted, [""])[0]
}