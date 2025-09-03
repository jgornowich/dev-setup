#!/bin/bash

# Bootstrap script for setting up a new development environment
set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo -e "${YELLOW}Please do not run this script as root.${NC}"
    exit 1
fi

echo -e "${GREEN}Starting development environment setup...${NC}"

# Install Python and pip if not already installed
if ! command -v python3 &> /dev/null; then
    echo -e "${YELLOW}Python 3 is not installed. Installing...${NC}"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/debian_version ]; then
            # Debian/Ubuntu
            sudo apt update
            sudo apt install -y python3 python3-pip python3-venv
        elif [ -f /etc/redhat-release ]; then
            # RHEL/CentOS/Rocky
            sudo dnf install -y python3 python3-pip
        else
            echo -e "${YELLOW}Unsupported Linux distribution. Please install Python 3 manually.${NC}"
            exit 1
        fi
    else
        echo -e "${YELLOW}Unsupported operating system. Please install Python 3 manually.${NC}"
        exit 1
    fi
fi

# Create and activate virtual environment
echo -e "${GREEN}Setting up Python virtual environment...${NC}"
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# Upgrade pip and install Ansible
echo -e "${GREEN}Installing Ansible and dependencies...${NC}"
pip install --upgrade pip
pip install -r ansible/requirements.txt

# Install Ansible collections
echo -e "${GREEN}Installing Ansible collections...${NC}"
ansible-galaxy collection install community.general

# Make inventory directory if it doesn't exist
mkdir -p ansible/inventory

# Create a default inventory file if it doesn't exist
if [ ! -f "ansible/inventory/localhost" ]; then
    cat > ansible/inventory/localhost <<EOL
[local]
localhost ansible_connection=local

[all:vars]
ansible_python_interpreter=auto_silent
EOL
    echo -e "${GREEN}Created default inventory file at ansible/inventory/localhost${NC}"
fi

echo -e "\n${GREEN}Setup complete!${NC}"
echo -e "\nTo get started, run the following commands:"
echo -e "1. ${YELLOW}source venv/bin/activate${NC} - Activate the Python virtual environment"
echo -e "2. ${YELLOW}cd ansible${NC} - Change to the Ansible directory"
echo -e "3. Run the setup playbook:"
echo -e "   - ${YELLOW}ansible-playbook -i inventory/ playbooks/full_setup.yml${NC} - Complete development environment setup"
echo -e "\nTo run against a specific host or group, use the -l flag:"
echo -e "   - ${YELLOW}ansible-playbook -i inventory/ playbooks/full_setup.yml -l localhost${NC}"

echo -e "\n${GREEN}Happy coding! 🚀${NC}"
