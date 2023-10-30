resource "aws_instance" "ec2-one" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id = aws_subnet.private_subnet1.id
  key_name = ""
  instance_type = "t2.micro"
  user_data = file("userdata.sh")
  tags={
    Name = "webserver-one"
  }
}

resource "aws_instance" "ec2-two" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id = aws_subnet.private_subnet2.id // this won't work when we get to alb.tf because it is on private and private subnet doesn't have internet access. so we have to create something called a NAT gateway which will be connected to an ELASTIC IP. Check vpc.tf for code
  key_name = ""
  instance_type = "t2.micro"
  user_data = file("userdata.sh")
  tags={
    Name = "webserver-two"
  }
}