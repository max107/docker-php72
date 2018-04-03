all: build push

build:
	docker build -t max107/php71 .

push:
	docker push max107/php71