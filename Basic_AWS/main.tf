resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = aws_key_pair.key_pair.key_name
  tags = {
    Name = "server1"
  }
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.key_path_private)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "echo 'hello remote exec' | sudo tee /usr/share/nginx/html/index.html"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> Public_IP.txt"
  }
}