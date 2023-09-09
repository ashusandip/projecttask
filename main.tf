#### provider for us-east-1 region
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region_us_east_1}"
}

#### provider for us-west-2 region
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  alias = "us_west_2"
  region = "${var.region_us_west_2}"
}

