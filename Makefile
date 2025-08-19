
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
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)
	docker network rm inception
re: clean up
