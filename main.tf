resource "aws_instance" "devops-school-level3" {
ami = var.ami_id
instance_type = var.ec2_type
subnet_id = var.subnet_id
key_name = var.keypair

vpc_security_group_ids = [var.main_sg_id]

tags = {
Name = var.ec2_name
}
}
