# terraform.module.s3.static-site
Terraform Module for S3 Static Site

## Usage Example

- main.tf
```HCL
provider "aws" {
  region = var.region
}

module "www_s3_static_site" {
  source = "../modules/s3.static_site"
  
  name = "www"
  domain_name = var.domain_name
  s3_website_endpoint_route53_hosted_zone_id = var.s3_website_endpoint_route53_hosted_zone_id
  virginia_acm_arn = module.acm.acm_virginia_arn
}

```

- variable.tf
```HCL
variable "region" { }
variable "domain_name" { }
variable "s3_website_endpoint_route53_hosted_zone_id" { }
variable "virginia_acm_arn" { }
```

- variable.tfvars
```javascript
region   = "ap-northeast-2"
domain_name   = "devstarsj.com"

// https://docs.aws.amazon.com/ko_kr/general/latest/gr/s3.html
s3_website_endpoint_route53_hosted_zone_id = "Z3W03O7B5YMIYP"
virginia_acm_arn = "arn:aws:acm:us-east-1:ACCOUNTNO:certificate/HASHHASH"
```

```bash
> terraform plan -var-file=variable.tfvars
```
