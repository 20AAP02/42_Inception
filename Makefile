all: run

# Start and run the containers in the background
run:
	@docker compose -f ./srcs/docker-compose.yml up -d

# Restart the containers
re:
	@docker compose -f ./srcs/docker-compose.yml restart

# List the containers
lst:
	@docker compose -f ./srcs/docker-compose.yml ps

# List the containers
lstImgs:
	@docker image ls

# Stop the containers
stop:
	@docker compose -f ./srcs/docker-compose.yml stop

# Delete everything, including images
destroy: stop
	@docker system prune -a
