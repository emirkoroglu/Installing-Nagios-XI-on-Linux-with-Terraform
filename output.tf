output "NagiosXi_Host_Public_IP" {
  value = aws_instance.nagiosxi.public_ip
}
output "Region" {
  value = "us-east-1"
}
output "Availability_Zone" {
  value = aws_instance.nagiosxi.availability_zone
}
output "Ami" {
  value = aws_instance.nagiosxi.ami
}
output "Security_Group" {
  value = aws_security_group.nagiosxisecurity.name
}
output "Key_Name" {
  value = aws_instance.nagiosxi.key_name
}