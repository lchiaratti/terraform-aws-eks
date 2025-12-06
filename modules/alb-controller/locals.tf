locals {
  oidc = split("/", var.oidc-identity)[4]
}