
resource "aws_security_group" "my_security_group" {
	name= "test-group-ssh-appache"
	description="ssh and appache port open"

	ingress {
    		from_port   = 22
    		to_port     = 22
    		protocol    = "tcp"
    		cidr_blocks = ["0.0.0.0/0"]
  }
	ingress{
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
}

  	egress {
    		from_port   = 0
    		to_port     = 0
    		protocol    = "-1"
    		cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "web1" {
	ami=var.my_ami
	instance_type="t3.micro"
	vpc_security_group_ids=[aws_security_group.my_security_group.id]
	tags={
		Name="web1"
             }
}