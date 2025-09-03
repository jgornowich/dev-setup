# Linux Development Environment Configuration

This Ansible project helps you set up a consistent development environment across different Linux distributions.

## Features

- Support for multiple Linux distributions (RHEL, Rocky Linux, Ubuntu, Linux Mint, etc.)
- Installation of development tools and languages
- Configuration management for shell and development tools
- Customizable playbooks for different setup scenarios

## Requirements

- Ansible 2.9+
- Python 3.6+
- Target machines accessible via SSH
- Sudo privileges on target machines

## Project Structure

```
ansible/
├── README.md           # This file
├── ansible.cfg         # Ansible configuration
├── inventory/          # Inventory files
│   ├── production/     # Production inventory
│   ├── staging/        # Staging inventory
│   └── localhost       # Local development
├── group_vars/         # Group variables
├── host_vars/          # Host specific variables
├── library/            # Custom modules (if any)
├── filter_plugins/     # Custom filter plugins (if any)
├── roles/              # Ansible roles
│   ├── common/         # Common configurations
│   ├── development/    # Development tools
│   ├── terminal/       # Terminal tools
│   ├── containers/     # Docker/Podman, Kubernetes
│   └── configs/        # Configuration files
└── playbooks/          # Playbooks for different scenarios
    └── full_setup.yml  # Complete development environment setup
```

## Getting Started

1. Clone this repository
2. Install Ansible
3. Configure your inventory in `inventory/`
4. Run the desired playbook:
   ```bash
   ansible-playbook -i inventory/ playbooks/full_setup.yml
   ```

## Customization

- Edit variables in `group_vars/` or `host_vars/` to customize the setup
- Add or modify roles in the `roles/` directory
- Create new playbooks in `playbooks/` for specific scenarios
