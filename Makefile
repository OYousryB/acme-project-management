build:
	docker build . -t asme:debug

run:
	docker-compose -f docker-compose.yml -p asme up

stop:
	docker-compose -f docker-compose.yml -p asme down