resource "aws_security_group" "sg" {

  vpc_id      = aws_vpc.main.id

  ingress = [
    {
      description      = "Web from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = "0.0.0.0/0"
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

}

output "web_sg_id" {

  value = aws_security_group.sg.id
}