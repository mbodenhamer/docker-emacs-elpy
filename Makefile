all: test

TEST = docker run --rm -it -v $(CURDIR):/app -v /tmp:/tmp \
	-v /var/run/docker.sock:/var/run/docker.sock \
	mbodenhamer/docker-test:1.9.1

#-------------------------------------------------------------------------------

build:
	$(TEST) docker build -t mbodenhamer/emacs-elpy:latest .

shell:
	xhost +local:docker
	docker run --rm -it -v $(CURDIR):/files \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY --entrypoint bash mbodenhamer/emacs-elpy:latest

.PHONY: build shell
#-------------------------------------------------------------------------------

test-shell:
	$(TEST) bash

quick-test:
	$(TEST) bats tests

test:
	$(MAKE) build
	$(MAKE) quick-test

.PHONY: test-shell quick-test test
#-------------------------------------------------------------------------------

install:
	@cp emacs-elpy /usr/local/bin

uninstall:
	@rm /usr/local/bin/emacs-elpy

.PHONY: install uninstall
#-------------------------------------------------------------------------------
