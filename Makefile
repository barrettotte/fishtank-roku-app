# Load .env file if it exists
ifneq (,$(wildcard .env))
    include .env
    export
endif

.PHONY: build lint deploy test clean debug

build:
	npm run build

lint:
	npm run lint

deploy: build
	@echo '{"host":"$(ROKU_DEV_TARGET)","password":"$(ROKU_DEV_PASSWORD)","rootDir":"out/staging","files":["**/*"]}' > rokudeploy.json
	npx roku-deploy

test:
	npm run test

clean:
	npm run clean
	@rm -f rokudeploy.json

debug:
	telnet $(ROKU_DEV_TARGET) 8085
