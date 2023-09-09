###### create vpc in us-east-1 region

resource "aws_vpc" "vpc_us_east_1" {
  cidr_block = "10.10.0.0/16"
        tags = {
        Name = "test"
	}
}
#### create public subnet us-east-1a

resource "aws_subnet" "public_subnet_us_east_1" {
  vpc_id     = aws_vpc.vpc_us_east_1.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}


resource "aws_subnet" "public_subnet_us_east_1b" {
  vpc_id     = aws_vpc.vpc_us_east_1.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
}

##### create private subnet us-east-1c

resource "aws_subnet" "private_subnet_us_east_1" {
  vpc_id     = aws_vpc.vpc_us_east_1.id
  cidr_block = "10.10.3.0/24"
  availability_zone = "us-east-1c"
}

##### create private subnet us-east-1d

resource "aws_subnet" "private_subnet_us_east_1d" {
  vpc_id     = aws_vpc.vpc_us_east_1.id
  cidr_block = "10.10.4.0/24"
  availability_zone = "us-east-1d"
}

###########creating igw us-east-1

resource "aws_internet_gateway" "igw_us_east_1" {
    vpc_id = "${aws_vpc.vpc_us_east_1.id}"
	tags = {
		Name = "igw"
	}
}

####### creating route table public us_east_1
resource "aws_route_table" "pub-rt_us" {
        vpc_id = "${aws_vpc.vpc_us_east_1.id}"
        tags = {
                  Name = "pub-rt"
        }
		route {
				cidr_block = "0.0.0.0/0"
                gateway_id = "${aws_internet_gateway.igw_us_east_1.id}"
		}
	}

####### creating route table private
resource "aws_route_table" "pri-rt_us" {
  
        vpc_id = "${aws_vpc.vpc_us_east_1.id}"
        tags = {
			Name = "pri-rt"
		}
	}
####subnet associations

resource "aws_route_table_association" "one_us_east_1" {
		subnet_id = "${aws_subnet.public_subnet_us_east_1.id}"
        route_table_id = "${aws_route_table.pub-rt_us.id}"
}
resource "aws_route_table_association" "two_us_east_1" {
        subnet_id = "${aws_subnet.public_subnet_us_east_1b.id}"
        route_table_id = "${aws_route_table.pub-rt_us.id}"
}
resource "aws_route_table_association" "three_us_east_1" {
		subnet_id = "${aws_subnet.private_subnet_us_east_1.id}"
        route_table_id = "${aws_route_table.pri-rt_us.id}"

}
resource "aws_route_table_association" "four_us_east_1" {
                subnet_id = "${aws_subnet.private_subnet_us_east_1d.id}"
        route_table_id = "${aws_route_table.pri-rt_us.id}"

}
  
##### create vpc in  us-west-2

  resource "aws_vpc" "vpc_us_west_2" {
  provider = aws.us_west_2
  cidr_block = "10.1.0.0/16"
}

##### Create subnet in us-west-2a
resource "aws_subnet" "public_subnet_us_west_2" {
  provider = aws.us_west_2
  vpc_id     = aws_vpc.vpc_us_west_2.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
}

##### create subnet in us-west-2b
resource "aws_subnet" "private_subnet_us_west_2" {
  provider = aws.us_west_2
  vpc_id     = aws_vpc.vpc_us_west_2.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-west-2b"
}

##### create subnet in us_west_2c
resource "aws_subnet" "public_subnet_us_west_2c" {
  provider = aws.us_west_2
  vpc_id     = aws_vpc.vpc_us_west_2.id
  cidr_block = "10.1.3.0/24"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true
}

###########creating igw us_west_2

resource "aws_internet_gateway" "igw" {
    provider = aws.us_west_2
    vpc_id = "${aws_vpc.vpc_us_west_2.id}"
	tags = {
		Name = "igw"
	}
}

####### creating route table public us_west_2
resource "aws_route_table" "pub-rt" {
        provider = aws.us_west_2
        vpc_id = "${aws_vpc.vpc_us_west_2.id}"
        tags = {
                  Name = "pub-rt"
        }
		route {
				cidr_block = "0.0.0.0/0"
                gateway_id = "${aws_internet_gateway.igw.id}"
		}
	}

####### creating route table private us_west_2
resource "aws_route_table" "pri-rt" {
        provider = aws.us_west_2
        vpc_id = "${aws_vpc.vpc_us_west_2.id}"
        tags = {
			Name = "pri-rt"
		}
	}
####subnet associations us_west_2

resource "aws_route_table_association" "one" {
        provider = aws.us_west_2
		subnet_id = "${aws_subnet.public_subnet_us_west_2.id}"
        route_table_id = "${aws_route_table.pub-rt.id}"
}
resource "aws_route_table_association" "two" {
        provider = aws.us_west_2
        subnet_id = "${aws_subnet.private_subnet_us_west_2.id}"
        route_table_id = "${aws_route_table.pri-rt.id}"
}
resource "aws_route_table_association" "three" {
        provider = aws.us_west_2
		subnet_id = "${aws_subnet.public_subnet_us_west_2c.id}"
        route_table_id = "${aws_route_table.pub-rt.id}"

}

  
