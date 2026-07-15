locals {
  ingress_rules = {
    HTTP = {
      port        = 80
      description = "HTTP from anywhere"
    }
    HTTPS = {
      port        = 443
      description = "HTTPS from anywhere"
    }
  }
}