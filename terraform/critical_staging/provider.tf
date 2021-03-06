provider "aws" {
  region = var.region

  assume_role {
    role_arn = "arn:aws:iam::299497370133:role/workflow-admin"
  }
}

provider "aws" {
  region = "eu-west-1"
  alias  = "digitisation"

  assume_role {
    role_arn = "arn:aws:iam::404315009621:role/digitisation-admin"
  }
}
