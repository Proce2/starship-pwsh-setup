function Use-StarshipConfig {
    param (
        [Parameter(Position=0)]
        [string]$Mode = "default"
    )

    # Set the appropriate config file based on the mode
    if ($Mode.ToLower() -eq "aws") {
        $env:STARSHIP_CONFIG = "$HOME\.config\starship_aws_on.toml"
        Write-Host "Using AWS-enhanced Starship config" -ForegroundColor Yellow
    } else {
        $env:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
    }

    # Store the last history count to detect empty Enter presses
    $script:lastHistoryCount = (Get-History).Count

    # 1) Grab Starship's full PowerShell init script
    $code = & starship init powershell --print-full-init | Out-String

    # 2) Inject a capture of the original $? at the start of the prompt function
    $code = $code -replace 'function global:prompt \{', @'
function global:prompt {
  
    # ===== Capture exit status of last user command ===== #
    $lastSuccess = $?
    $lastExitCode = $LASTEXITCODE
    
    
    # Check if this is just an empty Enter press (no new command in history)
    $currentHistoryCount = (Get-History).Count
    $isEmptyEnter = ($currentHistoryCount -eq $script:lastHistoryCount)
    $script:lastHistoryCount = $currentHistoryCount
    
    # ONLY treat empty Enter as success - don't override actual command failures
    if ($isEmptyEnter) {
        # This was just an empty Enter press
        $lastSuccess = $true
    }
'@

    # 3) Inject Trim + DEBUG + OSC + visible return, using $lastSuccess
    $code = $code -replace '(?m)^[ \t]*\$promptText\s*$', @'
    # Trim whitespace
    $promptText = $promptText.TrimStart().TrimEnd()

    # Set exit code based on command success
    $exitCode = if ($lastSuccess) { 0 } else { 1 }
    
    # Build OSC sequences
    $esc      = [char]27
    $osc      = "$esc]633;D;$exitCode`a" +
                "$esc]633;A`a"     +
                "$esc]633;P;Cwd=$($pwd.Path)`a" +
                "$esc]633;B`a"

    # Output OSC invisibly
    Write-Host -NoNewline $osc

    # Return only the visible prompt (with trailing >)
    return "$promptText> "
'@

    # 4) Activate the customized prompt
    Invoke-Expression $code

    # 5) Re-enable PSReadLine's prediction & UI features
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Set-PSReadLineOption -EditMode Windows
    Set-PSReadLineOption -ViModeIndicator Script
    Set-PSReadLineOption -ShowToolTips
    Set-PSReadLineOption -BellStyle None
    
    Write-Host "Starship prompt activated" -ForegroundColor Green
}
