# Infrastructure

### Initial setup

1. Run `./setup.sh` to prepare infrastructure for terraform. It will create S3 bucket to store `terraform.tfstate`.

2. Initialize terraform and apply infrastructure:

```sh
  $ terraform init
  $ terraform apply
```

2. Fill CICD with secrets:

* `AWS_ACCESS_KEY_ID`
* `AWS_ACCOUNT_ID`
* `AWS_REGION`
* `AWS_SECRET_ACCESS_KEY`

## Local development

All services and tools are available via `localhost:8080`.

### Monitoring

- [Dozzle](http://localhost:8080/logs/) - containers logs
- [Adminer](http://localhost:8080/db/) - database panel

## TODO

* Use DynamoDB for Terraform locks
