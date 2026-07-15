output "instance_ids" {
  description = "IDs of the EC2 instances."
  value = [
    for instance in aws_instance.web :
    instance.id
  ]

}

output "public_ip" {
  description = "Public IP of the web server."
  value = [
    for instance in aws_instance.web :
    instance.public_ip
  ]
}

output "web_url" {
  description = "Open this in your browser once the instance boots."
  value = [
    for instance in aws_instance.web :
    "http://${instance.public_ip}"
  ]
}

output "ami_id" {
  description = "The Amazon Linux 2023 AMI resolved via the data source."
  value       = data.aws_ami.al2023.id
}