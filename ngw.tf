resource "aws_eip" "eks-ngw-eip_1a" {
  domain = "vpc"

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )

}

resource "aws_eip" "eks-ngw-eip_1b" {
  domain = "vpc"
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )

}

resource "aws_nat_gateway" "eks-ngw-1a" {
  allocation_id = aws_eip.eks-ngw-eip_1a.id
  subnet_id     = aws_subnet.eks-subnet-public-1a.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )

}

resource "aws_nat_gateway" "eks-ngw-1b" {
  allocation_id = aws_eip.eks-ngw-eip_1b.id
  subnet_id     = aws_subnet.eks-subnet-public-1b.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )

}