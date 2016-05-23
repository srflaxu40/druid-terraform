# Terraform The Things for Druid:

---

* In order to use Terraform, first install:

https://www.terraform.io/intro/getting-started/install.html

* Now, export your AWS-related environment credentials:
* `source tf_env_staging`

* NOTE - Do not attempt to run Terraform modules singularly as this is a known issue that Terraform may attempt
  to re-create your resources adding duplicates in casees.

```
# For druid ansible stuffz:
export TF_VAR_region=$AWS_DEFAULT_REGION
export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY
export TF_VAR_aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
```

* You can also export your credentials file location (typically `~/.aws/credentials`::

`AWS_SHARED_CREDENTIALS_FILE`

* Now, pull down your terraform modules locally:

`terraform get`

* You are now ready to plan:

`terraform plan`

---

* Now terraform:

```
jknepper@MacBook-Pro-3:~/druid_ansible/terraform> terraform get
Get: file:///Users/jknepper/druid_ansible/terraform/route53
jknepper@MacBook-Pro-3:~/druid_ansible/terraform> terraform plan
Refreshing Terraform state prior to plan...


The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed.

Note: You didn't specify an "-out" parameter to save this plan, so when
"apply" is called, Terraform can't guarantee this is what will execute.

+ module.route53
    2 resource(s)

Plan: 2 to add, 0 to change, 0 to destroy.

jknepper@MacBook-Pro-3:~/druid_ansible/terraform> terraform apply
module.route53.aws_route53_record.zookeeper: Creating...
  fqdn:               "" => "<computed>"
  name:               "" => "druid-zookeeper.knepper.co"
  records.#:          "" => "1"
  records.3632233996: "" => "test"
  ttl:                "" => "300"
  type:               "" => "CNAME"
module.route53.aws_route53_record.postgres: Creating...
  fqdn:              "" => "<computed>"
  name:              "" => "druid-postgres.knepper.co"
  records.#:         "" => "1"
  records.331058520: "" => "test2"
  ttl:               "" => "300"
  type:              "" => "CNAME"
module.route53.aws_route53_record.postgres: Creation complete
module.route53.aws_route53_record.zookeeper: Creation complete

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```

# NOTES:

* The tf_env_variables file requires you have a pre-baked set of AMIs for each Druid role / node.
* This allows you to create launch configs utilizing those AMIs, and then attach them to ASGs.


