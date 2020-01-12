# Docker Symfony 5.0.2

### Requirements

- git
- docker
- docker-compose
- make

### Environment

| Service   | Version |
| --------- | ------- |
| Apache    | 2.4     |
| PHP       | 7.3     |
| Node      | 12.0    |
| Mysql     | 5.7     |
| PMA       | latest  |
| Mailhog   | latest  |

### Usage

```
make install
make up
make down
make file-install
make composer-install
make db-drop
make db-create
make db-diff
make db-migrate
make db-fixtures
make db-install
make yarn-install
make yarn-encore-dev
make yarn-build
```

### Install

Disable chmod for git

```
git config core.fileMode false
```

Install all

```
make install
```

### Compile live Js & Css

```
docker-composer exec node yarn watch
```

### Links

| Protocol      | Url                      |
| ------------- | ------------------------ |
| Apache        | http://localhost         |
| Apache SSL    | https://localhost        |
| Mailer        | http://localhost:8025    |
| PMA           | http://localhost:8081    |