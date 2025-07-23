resource "aws_s3_bucket" "s3bucket" {
    bucket = "awsterra042002bucket"
    acl    = "private"
 
    tags = {
        Name        = "bucketterra"
        Environment = "Dev"
    }
}