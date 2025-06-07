# Starship for PowerShell 7+ with VSCode Integration

A clean setup for PowerShell 7+ with the [Starship prompt](https://starship.rs) that **preserves VSCode terminal features** and **fixes Copilot Prompt Symbol issues**.

## Why This Setup?

Using Starship directly in VSCode terminals breaks important features:
- ❌ No command status indicators (blue circle for success / red X in red circle for failure)
- ❌ Lost IntelliSense and autocomplete features 
- ❌ GitHub Copilot Prompt Symbol doesn't show, and Copilot agent stops working

This setup maintains full VSCode terminal functionality while giving you Starship prompts when you want them.

## Prerequisites

- [PowerShell 7+](https://github.com/PowerShell/PowerShell)
- [Starship](https://starship.rs) installed and available in your PATH

## One-Line Installation

```powershell
irm https://raw.githubusercontent.com/Proce2/starship-pwsh-setup/main/install.ps1 | iex
```

## Features

- ✅ Preserves VSCode terminal features (command status, IntelliSense)
- 🚀 **Smart Prompt Switching**: Easy commands to switch between prompts without losing functionality
- 🔄 Multiple prompt configurations (regular, AWS mode, advanced PowerShell-native)
- 🛡️ Safe installation with environment checks
- 🔌 Easy one-line install from GitHub
- 🤖 **Copilot Prompt Symbol compatibility** (Note: Copilot agent mode requires terminal without Starship)

## Instructions

1. **Prompt switching**:
   - `p s` - Activate Starship prompt
   - `p s aws` - Activate Starship with AWS enhancements  
   - `p a` - Activate advanced PowerShell-native prompt (**maintains VSCode integration**)
   - `p off` - Switch to standard PowerShell prompt appearance

1. **Multiple Starship configurations**:
   - Custom configuration (`starship.toml`)
   - AWS-enhanced configuration (`starship_aws_on.toml`)

2. **PowerShell helper scripts**:
   - `advanced-prompt.ps1` - **VSCode-compatible** PowerShell-native prompt with full terminal integration
   - `starship-prompt.ps1` - Optimized Starship integration for PowerShell
   - `Microsoft.PowerShell_profile.ps1` - Main profile with intelligent prompt switcher

## Key Benefits

- **Copilot Prompt Symbol**: Works perfectly when using Starship mode
- **Copilot Agent Protection**: Keep normal prompt in terminals where you need Copilot agent, use Starship in others
- **Command Status**: Visual indicators for command success/failure in VSCode
- **IntelliSense**: Full autocomplete and IntelliSense support
- **Best of Both Worlds**: Beautiful prompts when you want them, full functionality when you need it

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
