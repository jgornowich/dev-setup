# Development Environment Setup

This project provides a complete, automated setup for a development environment using Ansible. It supports multiple Linux distributions and includes configurations for development tools, terminal utilities, container runtimes, and more.

## Features

- **Multi-distribution support**: Works on Debian/Ubuntu and RHEL/Rocky Linux
- **Complete development environment**: Includes tools for various programming languages
- **Custom configurations**: Pre-configured settings for shells, editors, and other tools
- **Modular design**: Easy to extend and customize
- **Reproducible**: Ensures consistent environments across machines

## Prerequisites

- A Linux system (Debian/Ubuntu or RHEL/Rocky Linux recommended)
- Python 3.6 or higher
- Internet connection
- Sudo/root access (for package installation)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dev-setup.git
   cd dev-setup
   ```

2. Run the bootstrap script:
   ```bash
   ./bootstrap.sh
   ```

3. Follow the instructions to activate the virtual environment and run the playbooks.

## Project Structure

```
.
├── ansible/                  # Ansible configuration
│   ├── inventory/           # Inventory files
│   ├── playbooks/           # Playbooks for different scenarios
│   └── roles/               # Ansible roles
│       ├── common/          # Common configurations
│       ├── configs/         # Configuration files
│       ├── containers/      # Docker/Podman, Kubernetes
│       ├── development/     # Development tools
│       └── terminal/        # Terminal tools
├── bootstrap.sh             # Bootstrap script
└── README.md                # This file
```

## Available Playbook

- `full_setup.yml`: Complete development environment setup including all tools, configurations, and system packages

## Usage

1. **Basic usage**:
   ```bash
   # Run the full setup (recommended)
   ansible-playbook -i inventory/ playbooks/full_setup.yml
   ```

2. **Target specific hosts**:
   ```bash
   # Run only on localhost (default behavior)
   ansible-playbook -i inventory/ playbooks/full_setup.yml -l localhost
   ```

3. **Run with tags**:
   ```bash
   # Run only specific components using tags
   ansible-playbook -i inventory/ playbooks/full_setup.yml --tags "development,terminal"
   ```

## Customization

### Variables

You can customize the setup by creating a `group_vars/all.yml` or `host_vars/localhost.yml` file with your preferred settings.

### Adding Tools

To add new tools:

1. Add the package to the appropriate role's `vars/main.yml` file
2. Add installation tasks to the role's `tasks/main.yml` file
3. Add any necessary configurations to the `templates/` directory

## Included Tools

### Development Tools
- Git
- Python 3 with pip and virtualenv
- Go
- Node.js (via NVM)
- Rust (via rustup)
- Java (OpenJDK)
- Build tools (make, cmake, etc.)

### Terminal Tools
- zsh with Oh My Zsh
- tmux
- fzf
- ripgrep
- fd
- bat
- exa
- htop/btop
- lazygit
- lazydocker

### Container Tools
- Docker/Podman
- Docker Compose
- Kubernetes tools (kubectl, k9s, etc.)
- Helm

### Editors
- Neovim with plugins
- VS Code (optional)

## Troubleshooting

### Common Issues

1. **Permission denied errors**:
   - Make sure your user has sudo privileges
   - Run the bootstrap script as a non-root user

2. **Python/pip not found**:
   - Install Python 3 and pip using your system's package manager
   - Ensure they are in your PATH

3. **Playbook fails**:
   - Check the error message for specific issues
   - Run with `-v` for more verbose output
   - Make sure all required variables are set

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Ansible](https://www.ansible.com/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Neovim](https://neovim.io/)
- And all the amazing open-source tools included in this setup!
