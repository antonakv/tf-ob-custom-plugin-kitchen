terraform {
  required_providers {
    extip = {
      source = "localproviders/petems/extip"
      version = "= 0.1.2"
    }
  }
}

data "extip" "external_ip" {}

output "external_ip" {
  value = data.extip.external_ip.ipaddress
}

