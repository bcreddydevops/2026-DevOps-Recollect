## SECTION 1 — WHAT IS VPC?
First, let’s understand what exactly VPC is.
VPC stands for Virtual Private Cloud.
A VPC is your own private network inside AWS.
Just like in your company or home, you have your own network with IP ranges, routers, and internet access, similarly AWS gives you a virtual network environment called VPC.
Inside a VPC, you can launch:
* EC2 instances
* Databases
* Containers
* Applications
And you can fully control:
* IP addresses
* Routing
* Internet access
* Security

Think of VPC like this:
AWS Cloud is a big apartment building.
Your VPC is your private apartment inside that building.
Only you control what happens inside your VPC.

## SECTION 2 — WHAT HAPPENS WHEN YOU CREATE A VPC?
Now let’s understand what happens when we create a VPC.
When you create a VPC manually, AWS creates a few things automatically.

For example:

* Main Route Table
* Default Network ACL
* Default Security Group

But AWS does NOT automatically create:

* Public subnets
* Internet Gateway
* NAT Gateway

You must create and configure them manually.

In this tutorial, we will build everything from scratch so you understand how networking works internally.
