resource "aws_instance" "nagiosxi" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  # associate_public_ip_address = true
  availability_zone = "us-east-1a"
  # user_data = file("userdata.sh")

  vpc_security_group_ids = [aws_security_group.nagiosxisecurity.id]

  #run jenkins.sh file
  # provisioner "file" {
  #   source      = "./jenkins.sh"
  #   destination = "/tmp/jenkins.sh"
  # }
  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.nagiosxi.public_ip
  }

  #run the following commands
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install wget",
      "sudo wget https://assets.nagios.com/downloads/nagiosxi/install.sh",
      "sudo bash install.sh",
    ]
  }
  tags = {
    Name = "NagiosXi"
    Team = "DevOps"
  }
}