output "private-address" {
  description = "This wil give the pivate ip as an update"
  value       = module.ec2_instance.*.private_ip
}