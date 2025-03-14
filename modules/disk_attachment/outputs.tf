output "disk_ids" {
  description = "A list IDs of disk attachment."
  value       = flatten(alicloud_disk_attachment.this[*].id)
}