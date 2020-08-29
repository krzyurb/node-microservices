# Nest.js microservices

Monorepo Nest.js microservices architecture.

## 📦 Project Structure

```sh
.
├── infrastructure/
└── services/
    └── posts
```

## 🧰 Stack

* [Nest.js](https://nestjs.com/)

## ⚙️ Local development

### Set up local environment

```sh
  cd infrastructure
  make init        # initialize each services
  make up          # start whole infrastructure
  make logs        # show logs
  make down        # shut down docker compose
```
