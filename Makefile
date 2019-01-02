HOSTS = inventory/hosts
ANSIBLE_USER = gv8
TAGS = setup hub
PLAYBOOK = deploy.yml

all:

deploy:
	ansible-playbook -i ${HOSTS} -u ${ANSIBLE_USER} -b ${PLAYBOOK} $(addprefix -t , $(TAGS))

docs-serve:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

clean:
	rm *.retry 2>/dev/null || true
	rm -rf site 2>/dev/null || true

.PHONY: deploy docs-serve clean all
