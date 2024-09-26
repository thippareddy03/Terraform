# Create a VPC

resource "aws_vpc" "AWS" {
  cidr_block = var.VPC_Config.cidr_block
  tags       = var.VPC_Config.tags

}
#Creation of subnets

resource "aws_subnet" "AWS" {
  count             = length(var.Subnet_config)
  vpc_id            = aws_vpc.AWS.id
  availability_zone = var.Subnet_config[count.index].availability_zone
  cidr_block        = var.Subnet_config[count.index].cidr_block
  tags              = var.Subnet_config[count.index].tags
}
