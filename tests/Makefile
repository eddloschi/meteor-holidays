REPORTER ?= spec
TIMEOUT ?= 10000

unit:
	./node_modules/mocha/bin/mocha \
		--compilers coffee:coffee-script \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--ui bdd \
		unit/*.spec.coffee

acceptance:
	./node_modules/mocha/bin/mocha \
		--compilers coffee:coffee-script \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--ui bdd \
		acceptance/*.spec.coffee

test: unit acceptance

.PHONY: unit acceptance
