.PHONY: init.py install reset
# assumes python3 environment already setup, or let IDE do some magic
init.py:
	python3 -m venv tmp/local
	source tmp/local/bin/activate
# install minikube as needed
install:
	kubectl create ns jupyter || true
	helm upgrade test jupyterhub -install -n jupyter -f dev-config.yaml -f dev-config-arm.yaml -f chartpress.yaml
reset:
	kubectl delete ns jupyter
	install