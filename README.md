# Starship for PowerShell 7+ with VSCode Integration

A setup for PowerShell 7+ with the [Starship prompt](https://starship.rs) that **preserves VSCode terminal features** and **fixes Copilot Prompt Symbol issues**.
This setup maintains full VSCode terminal functionality while giving you Starship prompts when you want them.

## Why This Setup?

Using Starship directly in VSCode terminals breaks important features:
- ❌ No command status indicators (blue circle for success / red X in red circle for failure)
- ❌ Lost IntelliSense and autocomplete features 
- ❌ GitHub Copilot Prompt Symbol doesn't show, and Copilot agent stops working

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
  
2. Keep normal prompt in terminals where you need Copilot agent, use Starship in others

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
