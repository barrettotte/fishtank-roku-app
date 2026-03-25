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
	@VERSION=$$(node -p "require('./package.json').version"); \
	MAJOR=$$(echo $$VERSION | cut -d. -f1); \
	MINOR=$$(echo $$VERSION | cut -d. -f2); \
	PATCH=$$(echo $$VERSION | cut -d. -f3); \
	sed -i "s/major_version=.*/major_version=$$MAJOR/" out/staging/manifest; \
	sed -i "s/minor_version=.*/minor_version=$$MINOR/" out/staging/manifest; \
	sed -i "s/build_version=.*/build_version=$$PATCH/" out/staging/manifest; \
	echo "app_version=$$VERSION" >> out/staging/manifest
ifdef FT_EMAIL
	@echo "ft_email=$(FT_EMAIL)" >> out/staging/manifest
	@echo "ft_password=$(FT_PASSWORD)" >> out/staging/manifest
endif
	@echo '{"host":"$(ROKU_DEV_TARGET)","password":"$(ROKU_DEV_PASSWORD)","rootDir":"out/staging","files":["**/*"]}' > rokudeploy.json
	npx roku-deploy

test:
	npm run test

clean:
	npm run clean
	@rm -f rokudeploy.json

debug:
	telnet $(ROKU_DEV_TARGET) 8085
