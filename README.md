# boilerplate-gatsby-wordpress-with-jwt

[![License: MIT][license-image]][license-url]

Boilerplate of Gatsby and WordPress REST API with JWT

## Prerequisite

- Git installed
- Docker installed

## Getting started

### Setup

```bash
git clone https://github.com/keidrun/boilerplate-gatsby-wordpress-with-jwt.git
cd boilerplate-gatsby-wordpress
docker-compose up --build -d
bash setup.sh
docker-compose restart web
```

### Develop

```bash
docker-compose up --build -d
docker-compose logs -f web
```

## Browse

### Gatsby Pages

- http://0.0.0.0:8000/
- http://0.0.0.0:8000/___graphql

### WordPress Admin Pages

- http://api:8080/wp-admin/

NOTE: If you'd like to browse the admin page locally, add `0.0.0.0 api` to your `hosts` file.

## Endpoints

### WordPress REST API Routes

- http://localhost:8080/wp-json/jwt-auth/v1/token
- http://localhost:8080/wp-json/wp/v2/pages
- http://localhost:8080/wp-json/wp/v2/posts
- http://localhost:8080/wp-json/wp-api-menus/v2/menus

[license-url]: https://opensource.org/licenses/MIT
[license-image]: https://img.shields.io/badge/License-MIT-yellow.svg
