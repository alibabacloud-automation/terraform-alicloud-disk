output "this_disk_ids" {
  description = "List of disks ID."
  value       = module.disks.disk_ids
}

output "this_availability_zone" {
  description = "The zone ID of the ECS disks belongs to."
  value       = module.disks.availability_zone
}

# Disk outputs
output "this_name" {
  description = "Name of the ECS disk."
  value       = module.disks.name
}

output "this_category" {
  description = "Category of the disk."
  value       = module.disks.category
}

output "this_size" {
  description = "The data disk size used to launch one or more data disks."
  value       = module.disks.size
}

output "this_tags" {
  description = "Used to mark specified ecs data disks."
  value       = module.disks.tags
}

output "this_disk_count" {
  description = "Whether to encrypt the disks."
  value       = length(module.disks.disk_ids)
}