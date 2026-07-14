data "cloudfoundry_org" "org" {
  name = var.org_name
}

resource "cloudfoundry_space" "bookshop" {
  name = var.space_name
  org  = data.cloudfoundry_org.org.id
}