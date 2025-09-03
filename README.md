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
   git clone https://github.com/jgornowich/dev-setup.git
   cd dev-setup
   ```
   
2. Modify the entries in `ansible/group_vars/all.yml` for `git_name` and `git_email`

3. Run the bootstrap script:
   ```bash
   make bootstrap
   ```

4. Run the full setup playbook:
   ```bash
   make setup
   ```

## Project Structure

```
.
├── ansible/                 # Ansible configuration
│   ├── group_vars/          # Group variables (versions, packages, etc)
│   ├── playbooks/           # Playbooks for different scenarios
│   └── roles/               # Ansible roles
│       ├── common/          # Common configurations
│       ├── configs/         # Configuration files
│       ├── containers/      # Docker/Podman, Kubernetes
│       ├── development/     # Development tools
│       └── terminal/        # Terminal tools
├── bootstrap.sh             # Bootstrap script
├── Makefile                 # Helper makefile 
└── README.md                # This file
```

## Available Playbook

- `full_setup.yml`: Complete development environment setup including all tools, configurations, and system packages

## Customization

### Variables

You can customize the setup by editing the `group_vars/all.yml` file with your preferred settings.

### Adding New Tools

To add new tools:

1. Edit the appropriate role in `ansible/roles/*/tasks/main.yml`
2. Add package names or download/install tasks
3. Include all versions as variables in `group_vars/all.yml`

### Adding New Configuration Files

1. Create template in `ansible/roles/configs/templates/`
2. Add deployment task in `ansible/roles/configs/tasks/main.yml`

## Included Tools

### Programming Languages & Compilers
- **Git** - Version control
- **C/C++** - GCC, G++, CMake, GDB
- **Boost** - C++ libraries
- **Java** - OpenJDK + JavaFX
- **Gradle & Maven** - Java build tools
- **Python 3** - With pip and venv
- **Anaconda** - Python data science distribution
- **Rust** - Via rustup with Cargo
- **Go** - Latest stable version
- **Node.js & NPM** - JavaScript runtime
- **Ruby & RubyGems** - Ruby language and package manager
- **Flutter** - Mobile app development framework
- **Terraform** - Infrastructure as code
- **Hugo & Jekyll** - Static site generators
- **Vagrant** - Virtual machine management

### Terminal & CLI Tools
- **bat** - Better cat with syntax highlighting
- **btop** - Modern system monitor
- **ctop** - Container monitoring
- **cmatrix** - Matrix-style terminal effect
- **dive** - Docker image inspection
- **fastfetch** - System information display
- **fd** - Better find command
- **fzf** - Fuzzy finder
- **gping** - Ping with graph
- **lazydocker** - Docker TUI
- **lazygit** - Git TUI
- **ripgrep** - Better grep
- **nvim** - Modern Vim editor
- **WavTerm** - Modern terminal emulator
- **spf (superfile)** - Modern file manager
- **starship** - Cross-shell prompt
- **terminator** - Terminal emulator

### Container & Kubernetes Tools
- **Docker** - Container runtime
- **Podman** - Alternative container runtime
- **Docker Compose** - Multi-container applications
- **kubectl** - Kubernetes CLI
- **kubeadm** - Kubernetes cluster setup
- **k9s** - Kubernetes TUI
- **Helm** - Kubernetes package manager

### Editors & IDEs
- **Neovim** - With custom configuration
- **VS Code** - Microsoft's editor
- **Windsurf** - AI-powered editor (if available)

### Configuration Files
- **~/.bashrc** - Enhanced with aliases and functions
- **~/.gitconfig** - Git configuration with aliases
- **~/.git_aliases** - Extended Git aliases
- **~/.kubectl_aliases** - Kubernetes shortcuts
- **~/.config/starship.toml** - Starship prompt configuration
- **~/.config/nvim/init.vim** - Neovim configuration

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

4. **Tool not found after installation:**
   - Restart your terminal or run `source ~/.bashrc`
   - Check if `~/.local/bin` is in your PATH

5. **Docker permission denied:**
   - Log out and back in after installation (to apply group membership)
   - Or run: `newgrp docker`

### Getting More Information

- Check the log file `ansible.log`
- Rerun `ansible-playbook` with `-v` flag for verbose output
- Test specific roles: Use `--tags` to run only specific components
- Clean up: Run `make clean` to remove downloaded installers

## Todo

Add cloud cli packages (aws, gcp, azure) and vibe coding cli packages (Claude Code, Gemini CLI, Aider, etc).  And setup any configuration to authentication or api key managment. 

Setup a vault to store any sensitive information.

Find a way to automate VSCode extension installation and settings configuration.

Play with setting up virtual desktops like Azure Virtual Desktop, Paperspace, Kasm Workspaces, etc.  
https://3dfuzion.com/top-10-best-free-virtual-desktop-cloud-pc-providers-in-2025/

## Contributing

Contributions or suggestions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

