# PowerShell Setup Fix for VSCode Terminal Features Overridden by Starship

This setup for PowerShell 7+ lets you use the Starship prompt in the VSCode terminal without breaking important features. It restores IntelliSense, command decorations, and GitHub Copilot prompt support, all part of VSCode’s Shell Integration.

🔧 **Problem Overview**

Using Starship in the VSCode terminal often causes:

- IntelliSense and autocomplete to stop working
- Command decorations (blue circle for success, red ❌ in red circle for failure) to disappear
- GitHub Copilot’s prompt icon to vanish or stop responding

These are all part of VSCode terminal features that rely on shell integration. This configuration restores them without disabling Starship.

✅ **What You Need**

- PowerShell 7+
- Starship installed and available in your system PATH

⚙️ **One-Line Installation**

```powershell
irm https://raw.githubusercontent.com/Proce2/starship-pwsh-setup/main/install.ps1 | iex
```

This command runs a secure script that checks your environment and installs the fix with full VSCode compatibility.

🧩 **What This Fix Does**

- Restores IntelliSense and autocomplete in the terminal
- Enables command decorations (status icons for command success/failure)
- Fixes Copilot prompt symbol support inside VSCode terminals
- Adds prompt switching: Starship, AWS mode, PowerShell-native, or plain

🚀 **Prompt Switch Commands**

Use these to switch between prompt modes:

- `p s` — Use Starship prompt
- `p s aws` — Use Starship with AWS enhancements
- `p a` — Use native PowerShell prompt (preserves all VSCode features)
- `p off` — Use plain PowerShell prompt

This lets you keep full functionality where needed (e.g., Copilot) and enjoy Starship elsewhere.

🛠 **Manual Installation**

To install manually:

```powershell
git clone https://github.com/Proce2/starship-pwsh-setup
cd starship-pwsh-setup
./install.ps1
```

Then restart your terminal session.

✏️ **Customization**

This configuration is fully editable:

- Modify `.toml` files to change the Starship prompt design
- Add your own PowerShell functions, aliases, or module imports to the scripts

**License**

MIT
