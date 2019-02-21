# boilerplate-gatsby-wordpress

Boilerplate of Gatsby with WordPress

## Setup

```bash
docker-compose up --build -d
bash bash/wp-install.sh
bash bash/wp-update.sh
bash bash/wp-seed.sh
bash bash/wp-disable-frontend.sh
cd client
npm install
npm start
```

## Browse

### Gatsby Pages

- http://localhost:8000/
- http://localhost:8000/__graphql

### WordPress Admin Pages

- http://localhost:8080/wp-admin/

### WordPress REST API Endpoints

- http://localhost:8080/wp-json/jwt-auth/v1/token
- http://localhost:8080/wp-json/wp/v2/pages
- http://localhost:8080/wp-json/wp/v2/posts
- http://localhost:8080/wp-json/wp-api-menus/v2/menus
