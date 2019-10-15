output "this_disk_ids" {
  value       = module.disks.this_disk_ids
}

output "this_availability_zone" {
  value       = module.disks.this_availability_zone
}

# Disk outputs
output "this_name" {
  value       = module.disks.this_name
}

output "this_category" {
  value       = module.disks.this_category
}

output "this_size" {
  value = module.disks.this_size
}

output "this_tags" {
  value = module.disks.this_tags
}

output "this_disk_count" {
  value = length(module.disks.this_disk_ids)
}


