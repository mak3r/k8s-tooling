SHELL := /bin/bash
KUBECTL_VERSION=v1.24.4
MACHINE_ARCH=amd64

install: kubectl helm jq

.PHONY: kubectl
kubectl:
	curl -LO "https://dl.k8s.io/release/$(KUBECTL_VERSION)/bin/linux/$(MACHINE_ARCH)/kubectl"
	sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

.PHONY: helm
helm:
	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
	chmod 700 get_helm.sh
	./get_helm.sh

.PHONY: jq
jq: 
	sudo zypper -n in jq