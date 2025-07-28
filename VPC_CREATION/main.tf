#VPC, Subnets, NAT Gateway, Internet Gateway, Route Tables, and Security Group

#VPC_Creation
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
  
  tags = {
    Name = "csg-vpc"
  }
}

#Internet Gateway Creation
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  
  tags = {
    Name = "csg-igw"
  }
  
}

#Route Tables Creation
#Public Route Table
resource "aws_route_table" "myrt_pub" {
  vpc_id = aws_vpc.myvpc.id
  
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myigw.id
    }

  tags = {
    Name = "csg-pub-rt"
  }
  
}

#Private Route Table
resource "aws_route_table" "myrt_pvt" {
    vpc_id = aws_vpc.myvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.mynat.id
    }

    tags = {
        Name = "csg-rt-pvt"
    }
  
}

#Subnets Creation
#Public Subnet01
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PubS1_cidr
    availability_zone = var.PubS1_az   
    map_public_ip_on_launch = true

    tags = {
      Name = "Pub-subnet-1"
    }
  
}




#Public Subnet02
resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PubS2_cidr
    availability_zone = var.PubS2_az
    map_public_ip_on_launch = true

    tags = {
      Name = "Pub-subnet-2"
    }
  
}

#Private Subnet
resource "aws_subnet" "pvtsub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.PvtS1_cidr
    availability_zone = var.PvtS1_az  
    map_public_ip_on_launch = false

    tags = {
      Name = "Pri-subnet-1"
    }
  
}

#Route Table Associations
#Public Subnet Route Table Association
resource "aws_route_table_association" "PubRt" {
   subnet_id = aws_subnet.sub1.id
    
   route_table_id = aws_route_table.myrt_pub.id
}

resource "aws_route_table_association" "PubRt2" {
   subnet_id = aws_subnet.sub2.id
   route_table_id = aws_route_table.myrt_pub.id
  
}

#Private Subnet Route Table Association
resource "aws_route_table_association" "PvtRt" {
   subnet_id = aws_subnet.pvtsub1.id
   route_table_id = aws_route_table.myrt_pvt.id
  
}

#elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {

  tags = {
    Name = "my-nat-gateway-eip"
  }
}

#NAT Gateway Creation
resource "aws_nat_gateway" "mynat" {
   allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.sub1.id
}

#Security Group Creation
resource "aws_security_group" "Pub_sg" {
    vpc_id = aws_vpc.myvpc.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/24"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Pub-ec2-sg01"
    }
  
}


resource "aws_instance" "Pub_inst_01" {
  ami = var.ami_id
  instance_type = var.instance_type 
  subnet_id = aws_subnet.sub1.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.Pub_sg.id]
  user_data = file("nginx.sh")
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }
   
  tags = {
    Name = "Ubuntu-London"
  }
  
}

