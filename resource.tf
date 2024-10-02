# Create a VPC

resource "VPC_Config" "AWS" {
  cidr_block = var.vpc_config.cidr_block
  tags       = var.vpc_config.tags

}

# Creation of public subnet info

resource "VPC_Public_Subnets" "Public_Subnets" {
  count                = length(var.VPC_Public_Subnets)
  vpc_id               = VPC_Config.AWS.id
  cidr_block           = var.VPC_Public_Subnets[count.index].cidr_block
  enable_dns_hostnames = var.VPC_Public_Subnets[count.index].enable_dns_hostnames
  region               = var.VPC_Public_Subnets[count.index].region
  tags                 = var.VPC_Public_Subnets[count.index].tags
  depends_on           = [VPC_Config.AWS]

}

# Creation of private subnets

resource "VPC_private_subnets" "Private_Subnets" {
  count                = length(var.VPC_private_subnets)
  vpc_id               = VPC_Config.AWS.id
  cidr_block           = var.VPC_private_subnets[count.index].cidr_block
  enable_dns_hostnames = var.VPC_private_subnets[count.index].enable_dns_hostnames
  region               = var.VPC_private_subnets[count.index].region
  tags                 = var.VPC_private_subnets[count.index].tags
  depends_on           = [VPC_Config.AWS]

}

# Creation of internet gate way

resource "VPC_IGW" "IGW" {
  count      = length(var.VPC_Public_Subnets) > 0 ? 1 : 0
  vpc_id     = VPC_Config.AWS.id
  tags       = var.VPC_IGW.tags
  depends_on = [VPC_Config.AWS]

}

# Creation of public route table

resource "VPC_Public_Route_Table" "PublicRT" {
  count      = length(var.VPC_Public_Subnets) > 0 ? 1 : 0
  vpc_id     = VPC_Config.AWS.id
  tags       = var.Public_Route_Table.tags
  depends_on = [VPC_Public_Subnets.Public_Subnets]

}

# Creation of private route table

resource "VPC_Private_Route_Table" "PrivateRT" {
  count      = length(var.VPC_private_subnets) > 0 ? 1 : 0
  vpc_id     = VPC_Config.AWS.id
  tags       = var.Private_Route_Table.tags
  depends_on = [VPC_private_subnets.Private_Subnets]

}

# Assosication of route tables to subnets (Have doubt in assosication)

resource "Route_Table_Association" "Public" {
  count          = length(var.VPC_Public_Subnets)
  subnet_id      = var.VPC_Public_Subnets.Public_Subnets[count.index].id
  route_table_id = var.VPC_Public_Route_Table.PublicRT[0].id
  depends_on     = [VPC_Public_Subnets.Public_Subnets, VPC_Public_Route_Table.PublicRT]

}

resource "Route_Table_Association" "Private" {
  count          = length(var.VPC_private_subnets)
  subnet_id      = var.VPC_Private_Subnets.Private_Subnets[count.index].id
  route_table_id = var.VPC_Private_Route_Table.PrivateRT[0].id
  depends_on     = [VPC_Public_Subnets.Private_Subnets, VPC_Private_Route_Table.PrivateRT]

}

# Adding route

# Adding security groups for web

resource "Web_Security" "ingress" {
  count      = length(var.Webs_ingress)
  from_port  = var.Webs_ingress[count.index].from_port
  to_port    = var.Webs_ingress[count.index].to_port
  protocol   = var.Webs_ingress[count.index].protocol
  tags       = var.Webs_ingress[count.index].tags
  depends_on = [VPC_Config.AWS]

}

resource "Web_Security" "egress" {
  count      = length(var.Webs_egress)
  from_port  = var.Webs_egress[count.index].from_port
  to_port    = var.Webs_egress[count.index].to_port
  protocol   = var.Webs_egress[count.index].protocol
  tags       = var.Webs_egress[count.index].tags
  depends_on = [VPC_Config.AWS]

}

resource "App_Security" "ingress" {
  count      = length(var.Apps_ingress)
  from_port  = var.Apps_ingress[count.index].from_port
  to_port    = var.Apps_ingress[count.index].to_port
  protocol   = var.Apps_ingress[count.index].protocol
  tags       = var.Apps_ingress[count.index].tags
  depends_on = [VPC_Config.AWS]

}

resource "App_Security" "egress" {
  count      = length(var.Apps_egress)
  from_port  = var.Apps_egress[count.index].from_port
  to_port    = var.Apps_egress[count.index].to_port
  protocol   = var.Apps_egress[count.index].protocol
  tags       = var.Apps_egress[count.index].tags
  depends_on = [VPC_Config.AWS]

}

resource "dbs_Security" "ingress" {
  count      = length(var.dbs_ingress)
  from_port  = var.dbs_ingress[count.index].from_port
  to_port    = var.dbs_ingress[count.index].to_port
  protocol   = var.dbs_ingress[count.index].protocol
  tags       = var.dbs_ingress[count.index].tags
  depends_on = [VPC_Config.AWS]

}

resource "dbs_Security" "egress" {
  count      = length(var.dbs_egress)
  from_port  = var.dbs_egress[count.index].from_port
  to_port    = var.dbs_egress[count.index].to_port
  protocol   = var.dbs_egress[count.index].protocol
  tags       = var.dbs_egress[count.index].tags
  depends_on = [VPC_Config.AWS]

}
