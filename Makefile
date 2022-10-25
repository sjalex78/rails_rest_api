.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: setup
setup:
	bin/rails restart db:create db:migrate

.PHONY: create
create:
	@echo 'make create name="my name"'
	${$(or $(name),$(error Must specify a name))} \
		curl "http://127.0.0.1:3000/users" \
	 	-H "Content-type: application/json" \
		-H "Accept: application/json" \
		-X POST \
		--data '{"user": {"name": "${name}"}}' | jq

.PHONY: read
read:
	@echo "make read user_id=1"
	${$(or $(user_id),$(error Must specify a user_id))} \
	curl http://127.0.0.1:3000/users/${user_id} \
		-H "Accept: application/json" | jq

.PHONY: update
update:
	@echo 'make update user_id=1 bio="new bio"'
	${$(or $(user_id),$(error Must specify a user_id))} \
	${$(or $(bio),$(error Must specify a bio))} \
	curl "http://127.0.0.1:3000/users/${user_id}" \
		-H "Content-type: application/json" \
		-H "Accept: application/json" \
		-X PATCH \
		--data '{"user": {"bio": "${bio}"}}' | jq

.PHONY: delete
delete:
	@echo "make delete user_id=1"
	${$(or $(user_id),$(error Must specify a user_id))} \
	curl "http://127.0.0.1:3000/users/${user_id}" \
		-H "Content-type: application/json" \
		-H "Accept: application/json" \
		-X DELETE

.PHONY: get-all
get-all:
	@echo "make get-all"
	curl "http://127.0.0.1:3000/users" \
		-H "Content-type: application/json" \
		-H "Accept: application/json" | jq

.PHONY: clean
clean:
	bin/rails restart db:drop

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make${NC}            show this usage menu"
	@echo
	@echo "${YELLOW}make create name=\"my name\"${NC}"
	@echo "${YELLOW}make read user_id=1${NC}"
	@echo "${YELLOW}make update user_id=1 bio=\"my new bio\"${NC}"
	@echo "${YELLOW}make delete user_id=1${NC}"
	@echo
	@echo "${YELLOW}make get-all${NC}"
	@echo
	@echo "${YELLOW}make setup${NC}     run db migrations"
	@echo "${YELLOW}make clean${NC}     drop db"
	@echo
