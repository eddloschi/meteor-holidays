REPORTER ?= spec
TIMEOUT ?= 10000
SPEC ?= *

unit:
	./node_modules/mocha/bin/mocha \
		--compilers coffee:coffee-script \
		--globals location \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--ui bdd \
		unit/$(SPEC).spec.coffee

integration:
	./node_modules/mocha/bin/mocha \
		--compilers coffee:coffee-script \
		--globals location \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--ui bdd \
		integration/$(SPEC).spec.coffee

test: unit integration

.PHONY: unit integration
