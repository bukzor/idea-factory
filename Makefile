.PHONY: dev
dev:
	./docker/dev/run

.PHONY: build
build: node_modules

node_modules: package.json yarn.lock
	cp myapp.py docker/http/build/
	yarn install
