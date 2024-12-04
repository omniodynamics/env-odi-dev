module "lambda" {
    source = "../../../../libs/terraform/lambda"
}

# module "dev-vpc" {
#     source = "../../../../libs/terraform/vpc"
#     domain = "omnio.dev"
#     name = "dev"
#     region = "ca-central-1"
#     cidr = "10.0.0.0/16"

#     subnets = {
#         public = {
#             cidrs = [
#                 for i in range(0, length(data.aws_availability_zones.available.names)):
#                     cidrsubnet(local.cidr,
#                         ceil(log(length(data.aws_availability_zones.available.names)*2, 2)),
#                         i
#                     )
#             ]
#         },
#         private = {
#             cidrs = [
#                 for i in range(0, length(data.aws_availability_zones.available.names)):
#                     cidrsubnet(local.cidr,
#                         ceil(log(length(data.aws_availability_zones.available.names)*2, 2)),
#                         length(data.aws_availability_zones.available.names)+i
#                     )
#             ]
#         }
#     }
# }

# # module "dev-webserver" {
# #     source = "../../../../libs/terraform/webserver"
# #     subnet_id = module.dev-vpc.public_subnets[0].id
# # #     allow_sg_id = module.dev-vpc.aws_security_group_allow.id
# # # }

# module "dev_cluster" {
#     source = "../../../../libs/terraform/cluster"
#     cluster_name = "eks-cluster"
#     public_subnets = [for id in module.dev-vpc.public_subnets.*.id: id ]
#     private_subnets = [for id in module.dev-vpc.private_subnets.*.id: id ]
#     vpc_id = module.dev-vpc.vpc_id  
# }