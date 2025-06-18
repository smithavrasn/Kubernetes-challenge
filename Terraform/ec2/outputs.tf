# Output the public ip
output public_ip {
    value = aws_instance.webserver.public_ip
}

output "ssh_command" {
  value = "ssh -i web.pem ec2-user@${aws_instance.webserver.public_ip}"
}