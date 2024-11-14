module "dynamodb" {
  source   = "./modules/dynamodb"
  dynamodb = "dynamodb"
}

module "s3" {
  source    = "./modules/s3"
  s3_bucket = "atlasbucket0001"
}