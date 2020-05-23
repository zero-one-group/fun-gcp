.PHONY: run test uberjar deploy

run:
	clj -m zero-one-group.fun-gcp

repl:
	clj -m nrepl.cmdline --middleware "[cider.nrepl/cider-middleware]" --interactive

test:
	clj -A:runner:test

uberjar:
	clj -A:uberjar

cloverage:
	clj -m cloverage.coverage -p src

deploy: test
	clj -Spom
	mvn deploy
