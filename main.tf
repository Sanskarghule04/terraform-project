resource "aws_s3_bucket" "s3bucket" {
    bucket = "awsterra042002bucket"
    acl    = "private"
 
    tags = {
        Name        = "bucketterra"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket" "s3bucket12" {
    bucket = "awsterra04200204bucket"
    acl    = "private"
 
    tags = {
        Name        = "bucketterra"
        Environment = "Dev"
    }
}