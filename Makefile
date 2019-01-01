HOSTS = hosts
ANSIBLE_USER = gv8
TAGS = setup hub
PLAYBOOK = deploy.yml

deploy:
	ansible-playbook -i ${HOSTS} -u ${ANSIBLE_USER} -b ${PLAYBOOK} $(addprefix -t , $(TAGS))
