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

# List the containers
lstImgs:
	@docker image ls

# Stop the containers
stop:
	@docker compose stop

# Delete everything, including images
destroy: stop
	@docker system prune -a
