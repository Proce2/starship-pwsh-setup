# PowerShell Scripts That Fix Starship and VSCode Terminal Issues

A PowerShell 7 configuration that preserves VSCode terminal features while using the [Starship prompt](https://starship.rs). These features include IntelliSense, command decorations, and GitHub Copilot prompt support.

## 🔧 Problem Overview

Using Starship in the VSCode terminal often causes:

- IntelliSense suggestions (the selection box with completions) to stop appearing
- Command decorations (blue circle for success, red ❌ in red circle for failure) to disappear  
- GitHub Copilot’s prompt icon to vanish or stop responding  

These are all part of VSCode terminal features that rely on shell integration. This configuration restores them without disabling Starship.

## ✅ Prerequisites

- [PowerShell 7+](https://github.com/PowerShell/PowerShell)  
- [Starship](https://starship.rs) installed and available in your `PATH`

## ⚙️ One-Line Installation

```powershell
irm https://raw.githubusercontent.com/Proce2/starship-pwsh-setup/main/install.ps1 | iex
```

## 🧩 Features

- ✅ Preserves VSCode terminal features (command status, IntelliSense)  
- 🛡️ Safe installation with environment checks  
- 🔌 Easy one-line install from GitHub  

## 📘 Instructions

1. **Prompt switching**:
   - `p s` — Activate Starship prompt  
   - `p s aws` — Activate Starship with AWS enhancements  
   - `p a` — Activate advanced PowerShell-native prompt (maintains VSCode integration)  
   - `p off` — Switch to standard PowerShell prompt appearance

2. **Copilot Agent work-around**:
   - Keep native prompt in terminals where Copilot is needed, use Starship in others

## 🛠 Manual Installation

If you prefer to install manually:

```powershell
git clone https://github.com/Proce2/starship-pwsh-setup
cd starship-pwsh-setup
./install.ps1
```

Then restart your PowerShell session.

## ✏️ Customization

Feel free to modify any of the configuration files:

- Edit `.toml` files to customize Starship prompt appearance  
- Modify the PowerShell scripts to add your own functions and customizations

## 📄 License

MIT
