resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Security group to allow SSH access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SSH"
  }
}
resource "aws_key_pair" "my_key" {
  key_name   = "my-ec2-key"
  public_key = file("${path.module}/my_ec2_key.pub")
}

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public2.id
  key_name      = aws_key_pair.my_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "EC2_Sub2_test"
  }
}
