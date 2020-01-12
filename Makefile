# Makefile

APP_ENV					?= dev
APP_COMPOSE				?= docker-compose.yml

EXEC_APACHE 			= docker-compose exec apache
EXEC_APACHE_COMPOSER 	= $(EXEC_APACHE) composer
EXEC_APACHE_CONSOLE 	= $(EXEC_APACHE) php bin/console

EXEC_NODE				= docker-compose exec node

file-install:
	rm -rf .env
	rm -rf .env.*
	cp docker/environment/.env .env
	cp docker/environment/.env.$(APP_ENV) .env.$(APP_ENV)
	cp docker/htaccess/.htaccess.$(APP_ENV) public/.htaccess

up:
	docker-compose -f $(APP_COMPOSE) up -d --build

down:
	docker-compose down -v

composer-install:
	$(EXEC_APACHE_COMPOSER) install --no-suggest --no-progress

db-drop:
	$(EXEC_APACHE_CONSOLE) doctrine:database:drop --force --if-exists

db-create:
	$(EXEC_APACHE_CONSOLE) doctrine:database:create --if-not-exists

db-migrate:
	$(EXEC_APACHE_CONSOLE) doctrine:migrations:migrate -n

db-diff:
	$(EXEC_APACHE_CONSOLE) doctrine:migrations:diff

db-fixtures:
	$(EXEC_APACHE_CONSOLE) doctrine:fixtures:load -n

db-install: db-drop db-create #db-migrate

yarn-install:
	$(EXEC_NODE) yarn install

yarn-encore-dev:
	$(EXEC_NODE) yarn encore dev

yarn-build:
	$(EXEC_NODE) yarn build

cache-clear:
	$(EXEC_APACHE_CONSOLE) cache:clear --env=$(APP_ENV)

install: file-install up composer-install db-install yarn-install yarn-encore-dev cache-clear