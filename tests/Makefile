REPORTER ?= spec
TIMEOUT ?= 10000

unit:
	./node_modules/mocha/bin/mocha \
		--compilers coffee:coffee-script \
		--globals location \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--ui bdd \
		unit/*.spec.coffee

integration:
	./node_modules/mocha/bin/mocha \
		--compilers coffee:coffee-script \
		--globals location \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--ui bdd \
		integration/*.spec.coffee

test: unit integration

.PHONY: unit integration
