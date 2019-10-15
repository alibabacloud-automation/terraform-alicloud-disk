output "this_disk_ids" {
  description = "List of disks ID"
  value       = module.disks.disk_ids
}

output "this_availability_zone" {
  description = "The zone ID of the ECS disks belongs to"
  value       = module.disks.availability_zone
}

# Disk outputs
output "this_name" {
  value       = module.disks.name
}

output "this_category" {
  value       = module.disks.category
}

output "this_size" {
  value = module.disks.size
}

output "this_tags" {
  value = module.disks.tags
}

output "this_disk_count" {
  value = length(module.disks.disk_ids)
}



