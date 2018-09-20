output "this_disk_ids" {
  description = "List of disks ID"
  value       = "${module.disks.disk_ids}"
}

output "this_availability_zone" {
  description = "The zone ID of the ECS disks belongs to"
  value       = "${module.disks.availability_zone}"
}
