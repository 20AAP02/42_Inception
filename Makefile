
all: run

# Start and run the containers in the background
run:
	@docker-compose up -d

# Restart the containers
re:
	@docker compose restart

# List the containers
lst:
	@docker compose ps

# Stop the containers
stop:
	@docker compose stop

# Stop and/or destroy the containers
stopDestroy:
	@docker compose down -v

# Delete everything, including images
destroy:
	@docker compose down -v --rmi all --remove-orphans
