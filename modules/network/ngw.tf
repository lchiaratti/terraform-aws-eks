resource "aws_eip" "eks-ngw-eip_1a" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )

}

resource "aws_eip" "eks-ngw-eip_1b" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )

}

resource "aws_nat_gateway" "eks-ngw-1a" {
  allocation_id = aws_eip.eks-ngw-eip_1a.id
  subnet_id     = aws_subnet.eks-subnet-public-1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )

}

resource "aws_nat_gateway" "eks-ngw-1b" {
  allocation_id = aws_eip.eks-ngw-eip_1b.id
  subnet_id     = aws_subnet.eks-subnet-public-1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )

}


resource "aws_route_table" "eks_rt_private-1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-rtb-private-1a"
    }
  )
}



resource "aws_route_table" "eks_rt_private-1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-rtb-private-1b"
    }
  )
}
