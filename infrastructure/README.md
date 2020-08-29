# Infrastructure

### Initial setup

1. Run `./setup.sh` to prepare infrastructure for terraform. It will create S3 bucket to store `terraform.tfstate`.

2. Initialize terraform and apply infrastructure:

```sh
  $ terraform init
  $ terraform apply
```

3. Fill CICD with secrets:

* `AWS_ACCESS_KEY_ID`
* `AWS_ACCOUNT_ID`
* `AWS_REGION`
* `AWS_SECRET_ACCESS_KEY`

### Local development

Set up local environment:

```sh
  cd infrastructure
  cp .env.example .env # copy and fill env's
  make init            # initialize each services
  make up              # start whole infrastructure
  make logs            # show logs
  make down            # shut down docker compose
```

### Monitoring

- [Dozzle](http://localhost:8080/logs/) - containers logs
- [Adminer](http://localhost:8080/db/) - database panel

## TODO

* Use DynamoDB for Terraform locks
