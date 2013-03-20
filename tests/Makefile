REPORTER ?= spec
TIMEOUT ?= 10000

test-acceptance:
	./node_modules/mocha/bin/mocha \
		--compilers coffee:coffee-script \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		--ui bdd \
		acceptance/*.spec.coffee
