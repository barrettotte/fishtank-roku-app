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
ifdef FT_EMAIL
	@echo "ft_email=$(FT_EMAIL)" >> out/staging/manifest
	@echo "ft_password=$(FT_PASSWORD)" >> out/staging/manifest
endif
	@echo '{"host":"$(ROKU_DEV_TARGET)","password":"$(ROKU_DEV_PASSWORD)","rootDir":"out/staging","files":["**/*"],"deleteInstalledChannel":false}' > rokudeploy.json
	npx roku-deploy

test:
	npm run test

clean:
	npm run clean
	@rm -f rokudeploy.json

debug:
	telnet $(ROKU_DEV_TARGET) 8085
