SHELL := /bin/sh

args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`
DIR := $(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

.PHONY: init
init:
	docker build --build-arg GARMIN_USER="$(GARMIN_USER)" --build-arg GARMIN_PASS="$(GARMIN_PASS)" -t extraction:latest .

.PHONY: run_dev
run_dev: # Code style
	docker run extraction:latest /bin/sh -c "cd extraction && python garmin.py"