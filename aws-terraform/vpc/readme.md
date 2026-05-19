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

## SECTION 3 — CIDR BLOCK EXPLANATION
Now let’s understand CIDR blocks.

We are creating VPC with:
10.0.0.0/16

What does /16 mean?

It means the network has 65,536 IP addresses.

Inside this VPC, we can create multiple subnets.

Example:

* 10.0.1.0/24
* 10.0.2.0/24
* 10.0.101.0/24

Each /24 subnet gives 256 IP addresses.

You can think of VPC as a big land area,
and subnets are smaller plots inside that land.

## SECTION 4 — PUBLIC VS PRIVATE SUBNET
Public Subnet

A public subnet is a subnet that has internet access.

Resources inside public subnet can:

* Access the internet
* Receive traffic from internet

Example:

* Web servers
* Load balancers
* Bastion servers

In our demo:
Public subnet:
10.0.1.0/24

Private Subnet

A private subnet does NOT have direct internet access.

Resources inside private subnet cannot be accessed directly from the internet.

Example:

* Databases
* Backend applications
* Internal services

In our demo:
Private subnet:
10.0.101.0/24

Private subnet is more secure because applications are hidden from public internet.

## SECTION 5 — INTERNET GATEWAY
Now let’s understand Internet Gateway.

Internet Gateway is a component that allows communication between your VPC and the internet.

Without Internet Gateway:
your instances cannot access the internet.

Internet Gateway is attached at VPC level.

Important point:
Even if subnet is called “public subnet”,
it becomes public only when:

* Route table has internet route
* Internet Gateway is attached

So subnet is not public by name.
It becomes public because of routing.

## SECTION 6 — ROUTE TABLE
Now let’s understand Route Tables.

A Route Table is like a traffic rule book.

It tells AWS:
“Where should network traffic go?”

Example:
Destination: 0.0.0.0/0
Target: Internet Gateway

Meaning:
Any traffic going outside should go to internet.

Each subnet must be associated with a route table.

This is called Route Table Association.

## SECTION 7 — NAT GATEWAY
Now let’s understand NAT Gateway.

NAT stands for Network Address Translation.

Private subnet instances cannot directly access internet.

But sometimes they need outbound internet access for:

* Software updates
* Download packages
* Access APIs

This is where NAT Gateway helps.

NAT Gateway allows:
Private subnet → Internet

But blocks:
Internet → Private subnet

This increases security.

## SECTION 8 — ELASTIC IP
Now let’s understand Elastic IP.

Elastic IP is a static public IP provided by AWS.

NAT Gateway requires Elastic IP because:
the internet needs a public IP to communicate.

Without Elastic IP:
NAT Gateway cannot connect to internet.

Flow looks like this:

Private EC2
→ NAT Gateway
→ Elastic IP
→ Internet

That is why we attach Elastic IP to NAT Gateway.

## HANDS-ON PRACTICAL DEMO
## STEP 1 — CREATE VPC
Go to VPC Dashboard.

Click Create VPC.

Enter:
Name: my-manual-vpc
IPv4 CIDR Block: 10.0.0.0/16

Click Create VPC.

## STEP 2 — CREATE SUBNETS
Public Subnet
Create Public Subnet

VPC ID: my-manual-vpc
Subnet Name: my-public-subnet-1
Availability Zone: us-east-1a
IPv4 CIDR Block: 10.0.1.0/24

Click Create Subnet.

Private Subnet
Create Private Subnet

Subnet Name: my-private-subnet-1
Availability Zone: us-east-1a
IPv4 CIDR Block: 10.0.101.0/24

Click Create Subnet.

## STEP 3 — CREATE INTERNET GATEWAY
Create Internet Gateway

Name Tag: my-igw

Click Create Internet Gateway.

Now attach it to VPC.

Actions
→ Attach to VPC
→ Select my-manual-vpc

## STEP 4 — CREATE NAT GATEWAY
Create NAT Gateway

Name: my-nat-gateway

Subnet:
Select Public Subnet
my-public-subnet-1

Now click Allocate Elastic IP.

Finally click Create NAT Gateway.

Important:
NAT Gateway must always be created inside public subnet.


## STEP 5 — CREATE PUBLIC ROUTE TABLE
Create Public Route Table

Name:
my-public-route-table

VPC:
my-manual-vpc

Now add route:

Destination:
0.0.0.0/0

Target:
my-igw

Save route.

Now associate public subnet.

Edit Subnet Associations
→ Select my-public-subnet-1
→ Save


## STEP 6 — CREATE PRIVATE ROUTE TABLE
Create Private Route Table

Name:
my-private-route-table

VPC:
my-manual-vpc

Add route:

Destination:
0.0.0.0/0

Target:
my-nat-gateway

Save route.

Now associate private subnet.

Edit Subnet Associations
→ Select my-private-subnet-1
→ Save

## SECTION — COMPLETE TRAFFIC FLOW EXPLANATION
Now let’s understand complete traffic flow.

PUBLIC SUBNET FLOW:

EC2 Instance
→ Route Table
→ Internet Gateway
→ Internet

PRIVATE SUBNET FLOW:

EC2 Instance
→ Route Table
→ NAT Gateway
→ Elastic IP
→ Internet

Key Difference:

Public subnet allows inbound and outbound internet traffic.

Private subnet allows only outbound internet through NAT Gateway.

## CLEANUP SECTION
Now let’s clean up resources to avoid AWS billing.

Delete NAT Gateway first.

Wait until NAT Gateway is completely deleted.

Then delete VPC:
my-manual-vpc

AWS automatically deletes associated subnets, route tables, and internet gateway if possible.


## SECTION — IMPORTANT INTERVIEW QUESTIONS
Interview Question 1:
Can private subnet access internet?

Answer:
Yes, using NAT Gateway.

Interview Question 2:
Can internet directly access private subnet?

Answer:
No.

Interview Question 3:
Why NAT Gateway requires Elastic IP?

Answer:
Because internet communication requires public IP.

Interview Question 4:
Can NAT Gateway exist in private subnet?

Answer:
No. NAT Gateway must be inside public subnet.

Interview Question 5:
What makes subnet public?

Answer:
Route to Internet Gateway.

