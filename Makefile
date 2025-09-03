.PHONY: help bootstrap test setup clean

# Default target
help:
	@echo "Available targets:"
	@echo "  bootstrap    - Run the bootstrap script to set up Ansible environment"
	@echo "  test         - Test Ansible connection and gather system facts"
	@echo "  setup        - Run the full development environment setup"
	@echo "  setup-dev    - Install only development tools"
	@echo "  setup-term   - Install only terminal tools"
	@echo "  setup-docker - Install only Docker/container tools"
	@echo "  setup-config - Deploy only configuration files"
	@echo "  clean        - Clean up downloaded installers"

bootstrap:
	@echo "Running bootstrap script..."
	./bootstrap.sh

test:
	@echo "Testing Ansible connection..."
	source venv/bin/activate && cd ansible && ansible-playbook playbooks/test_connection.yml

setup:
	@echo "Running full development environment setup..."
	source venv/bin/activate && cd ansible && ansible-playbook playbooks/full_setup.yml

setup-dev:
	@echo "Installing development tools only..."
	source venv/bin/activate && cd ansible && ansible-playbook playbooks/full_setup.yml --tags "development"

setup-term:
	@echo "Installing terminal tools only..."
	source venv/bin/activate && cd ansible && ansible-playbook playbooks/full_setup.yml --tags "terminal"

setup-docker:
	@echo "Installing container tools only..."
	source venv/bin/activate && cd ansible && ansible-playbook playbooks/full_setup.yml --tags "containers"

setup-config:
	@echo "Deploying configuration files only..."
	source venv/bin/activate && cd ansible && ansible-playbook playbooks/full_setup.yml --tags "configs"

clean:
	@echo "Cleaning up downloaded installers..."
	rm -rf ~/Downloads/installers/*
