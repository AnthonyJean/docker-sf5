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

```
make install
```

### Compile live Js & Css

```
docker-composer exec node yarn watch
```

### Use bin/console

```
docker-composer exec apache bin/console
```

### Links

| Protocol      | Url                      |
| ------------- | ------------------------ |
| Apache        | http://localhost         |
| Apache SSL    | https://localhost        |
| Mailer        | http://localhost:8025    |
| PMA           | http://localhost:8081    |