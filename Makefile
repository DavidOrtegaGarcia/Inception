
all: up

up:
	docker compose -f ./srcs/docker-compose.yml up -d --build #-d to run docker a background process

down:
	docker compose -f ./srcs/docker-compose.yml down

