# terraform_alb_rule_redirect

Terraform module to create AWS loadbalancer rule to redirect traffic somewhere

##  Dependencies

- ALB listener - <https://github.com/virsas/terraform_alb_listener_ssl>
- ALB listener - <https://github.com/virsas/terraform_alb_listener_nonssl>

## Files

- None

## Terraform example

``` terraform
##############
# Variable
##############
# not needed

##############
# Module
##############
module "alb_rl_rd_example_2_google" {
  source = "git::https://github.com/virsas/terraform_alb_rule_redirect.git?ref=v1.0.0"
  listener = module.alb_listener_main_https.arn
  dstPort = 443
  dstProto = "HTTPS"
  dstHost = "www.google.com"
  dstPath = "/"
  srcHost = "www.example.org"
  priority = 2
}
```