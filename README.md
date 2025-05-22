# Starship for PowerShell 7+

A clean, efficient setup for PowerShell 7+ with the [Starship prompt](https://starship.rs).

## Features

- ✅ Cross-platform PowerShell 7+ compatibility
- 🚀 Optimized Starship integration with VSCode terminals
- 🔄 Multiple prompt configurations (regular, AWS mode, advanced)
- 🛡️ Safe installation with environment checks
- 🔌 Easy one-line install from GitHub

## One-Line Installation

```powershell
irm https://raw.githubusercontent.com/Proce2/starship-pwsh-setup/main/install.ps1 | iex
```

## Prerequisites

- [PowerShell 7+](https://github.com/PowerShell/PowerShell)
- [Starship](https://starship.rs) installed and available in your PATH

## What's Included

This setup provides:

1. **Multiple Starship configurations**:
   - Default configuration (`starship.toml`)
   - AWS-enhanced configuration (`starship_aws_on.toml`)

2. **PowerShell helper scripts**:
   - `advanced-prompt.ps1` - Fancy PowerShell-native prompt alternative
   - `starship-prompt.ps1` - Optimized Starship integration for PowerShell
   - `Microsoft.PowerShell_profile.ps1` - Main profile with prompt switcher

3. **Easy prompt switching**:
   - `p s` - Activate Starship prompt
   - `p s aws` - Activate Starship with AWS enhancements
   - `p a` - Activate advanced PowerShell-native prompt
   - `p off` - Revert to default PowerShell prompt

## Manual Installation

If you prefer to install manually:

1. Clone this repository
2. Run `install.ps1` in PowerShell 7+
3. Restart your PowerShell session

## Customization

Feel free to modify any of the configuration files:

- Edit `.toml` files to customize Starship prompt appearance
- Modify the PowerShell scripts to add your own functions and customizations

## License

MIT