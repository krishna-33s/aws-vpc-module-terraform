# CREATION OF NEW VPC USING TERRAFORM IN AWS

Flow ----

* -> VPC
* -> IGW with VPC association
* -> Subnets = public private database
* -> Route tables = public route , private route , database route
* -> Associations and Routes
* -> EIP
* -> NAT gateway
* -> VPC peering with default VPC on condition
* -> Route table entries through peering

## Inputs 
* project -> (required) user should pass in string type
* environment -> (required) string type. user should pass the environment ,values should be one of dev , prod ,qat...


## Outputs 
* vpc id
* public subnet
* private subnet 
* database subnet like soo on while we creating an ec2 instances...