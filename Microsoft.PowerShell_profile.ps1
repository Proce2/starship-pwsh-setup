# Microsoft.PowerShell_profile.ps1

# Store original prompt if not already stored
if (-not $global:OriginalPrompt) {
    $global:OriginalPrompt = $function:prompt
}

function Set-DefaultPrompt {
    function global:prompt {
        $venv = ""
        if ($env:VIRTUAL_ENV) {
            $green  = "`e[32m"
            $reset  = "`e[0m"
            $venv = $green + "(" + (Split-Path $env:VIRTUAL_ENV -Leaf) + ")" + $reset + " "
        }
        return $venv + (& $global:OriginalPrompt)
    }
    Write-Host "Default prompt activated."
}

function p {
    [CmdletBinding(PositionalBinding=$true)]
    param(
        [Parameter(Position=0, Mandatory=$true)]
        [string]$Mode,

        [Parameter(Position=1)]
        [string]$Flag = ""
    )

    switch ($Mode.ToLower()) {
        "s" {
            if ($Flag.ToLower() -eq "aws") {
                Use-StarshipConfig "aws"
            }
            else {
                Use-StarshipConfig
            }
        }
        "off" { Set-DefaultPrompt }
        "a"   { Set-DefaultAdvance }
        default {
            Write-Host "Usage: p s [aws] | off | a"
        }
    }
}

# Get the directory where this profile is located
$profileDir = Split-Path $PROFILE

# --- Load Advanced Prompt Functions ---
. "$profileDir\advanced-prompt.ps1"

# --- Load Prompt Configurations ---
. "$profileDir\starship-prompt.ps1"

