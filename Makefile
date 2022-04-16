# ===========================
# Main commands
# ===========================

info: do-show-commands

restart: do-stop do-start
start: do-start
stop: do-stop
kill: do-kill
update: do-composer-install do-yarn-install
client: do-enter-client-shell
server: do-enter-server-shell

# ===========================
# Snippets
# ===========================

set-ids = USERID=$$(id -u) GROUPID=$$(id -g)

do-show-commands:
	@echo "\n=== Make commands ===\n"
	@echo "make restart       Restart the app containers"
	@echo "make start         Start the app containers"
	@echo "make stop          Stop the app containers"
	@echo "make kill          Stop the containers and remove networks and containers"
	@echo "make update        Update modules on all containers"
	@echo "make client        Enter client(vue) app container shell"
	@echo "make server        Enter server(laravel) app container shell"
	@echo ""

do-start:
	@echo "\n=== Start app ===\n"
	@${set-ids} docker-compose up -d
	@echo "\n> Laravel is running on http://localhost:8000"
	@echo "> Vue is running on http://localhost:8080\n"

do-stop:
	@echo "\n=== Stop app ===\n"
	@${set-ids} docker-compose stop

do-kill:
	@echo "\n=== Kill app ===\n"
	@${set-ids} docker-compose down

do-composer-install:
	@echo "\n=== Installing composer packages ===\n"
	@${set-ids} docker-compose run server-app composer install

do-yarn-install:
	@echo "\n=== Installing yarn packages ===\n"
	@${set-ids} docker-compose run client-app yarn install

do-enter-client-shell:
	@echo "\n=== Entering client shell ===\n"
	@${set-ids} docker exec -it client-app sh

do-enter-server-shell:
	@echo "\n=== Entering server shell ===\n"
	@${set-ids} docker exec -it server-app sh