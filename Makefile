
SRCDIR	:= ./srcs
DIR		:= $(SRCDIR)/requirements
COMPOSE	:= $(SRCDIR)/docker-compose.yml

all:
	@- $(DIR)/tools/setup.sh
	cd $(SRCDIR) && docker compose up --build

clean:
	cd $(SRCDIR) && docker compose down
	$(DIR)/tools/clean.sh

fclean: clean
	-docker stop $(shell docker ps -qa) 2>/dev/null
	-docker rm $(shell docker ps -qa) 2>/dev/null
	-docker rmi -f $(shell docker images -qa) 2>/dev/null
	-docker volume rm $(shell docker volume ls -q) 2>/dev/null
	-docker network rm $(shell docker network ls -q) 2>/dev/null

re: fclean
	@- $(DIR)/tools/setup.sh
	cd $(SRCDIR) && docker compose build --no-cache && docker compose up


# -------------------------------- docker exec ------------------------------- #
nginx:
	cd $(SRCDIR) && docker compose exec nginx /bin/sh

wp:
	cd $(SRCDIR) && docker compose exec wordpress /bin/sh

db:
	cd $(SRCDIR) && docker compose exec mariadb /bin/sh