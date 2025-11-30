resource "aws_subnet" "eks-subnet-public-1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                        = "eks-subnet-public-1a",
      "kubernetes.io/ role / alb" = 1
    }
  )
}

resource "aws_subnet" "eks-subnet-public-1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                        = "eks-subnet-public-1b",
      "kubernetes.io/ role / alb" = 1
    }
  )
}

