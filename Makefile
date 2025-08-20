
all: up

up:
	mkdir -p /home/daortega
	mkdir -p /home/daortega/data
	mkdir -p /home/daortega/data/mysql
	mkdir -p /home/daortega/data/wordpress
	ls -la /home/daortega/data/
	docker compose -f ./srcs/docker-compose.yml up -d --build #-d to run docker a background process

down:
	docker compose -f ./srcs/docker-compose.yml down
clean:
	sudo rm -rf /home/daortega/data
	
	@if [ ! -z "$$(docker ps -qa)" ]; then \
		docker stop $$(docker ps -qa); \
		docker rm $$(docker ps -qa); \
	fi
	@if [ ! -z "$$(docker images -qa)" ]; then \
		docker rmi $$(docker images -qa); \
	fi
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@if [ ! -z "$$(docker network ls | grep inception)" ]; then \
		docker network rm inception; \
	fi
re: clean up
