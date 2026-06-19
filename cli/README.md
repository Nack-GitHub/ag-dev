# AG-Kit CLI

CLI tool to install [Antigravity Kit](https://github.com/Nack-GitHub/ag-dev) - AI Agent templates with Skills, Agents, and Workflows.

## Installation

Using the automated installer script:
```bash
curl -fsSL https://raw.githubusercontent.com/Nack-GitHub/ag-dev/main/install.sh | bash
```

Or install manually from your local repository clone:
```bash
npm install -g .
```

## Commands

| Command | Description |
|---------|-------------|
| `ag-kit init` | Install `.agents` folder into your project |
| `ag-kit update` | Update to the latest version |
| `ag-kit status` | Check installation status |

## Options

```bash
ag-kit init --force        # Overwrite existing .agents folder
ag-kit init --path ./myapp # Install in specific directory
ag-kit init --branch dev   # Use specific branch
ag-kit init --quiet        # Suppress output (for CI/CD)
ag-kit init --dry-run      # Preview actions without executing
```

## What it does

Downloads and installs the `.agents` folder from [ag-kit](https://github.com/Nack-GitHub/ag-dev) containing:
- **20 Specialist Agents** - Role-based AI personas
- **45 Skills** - Domain-specific knowledge modules
- **13 Workflows** - Slash command procedures

## License

MIT
