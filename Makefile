
all: up

up:
	docker compose up -d #-d to run docker a background process

down:
	docker compose down

