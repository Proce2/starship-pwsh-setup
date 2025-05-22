function Set-DefaultAdvance {
    function global:prompt {
        # Initialize history ID so our condition works correctly:
        if (-not $Global:__LastHistoryId) { $Global:__LastHistoryId = -1 }
        if (-not $Global:__VSCodeIsInExecution) { $Global:__VSCodeIsInExecution = $true }
        if (-not $__vscode_shell_env_reporting) { $__vscode_shell_env_reporting = "0" }
        if (-not $isStable) { $isStable = "0" }
        if (-not $Nonce) { $Nonce = "dummyNonce" }

        ### PART 1: Build Visible Prompt
        $origPrompt = & $global:OriginalPrompt
        if ($origPrompt -match "^(PS)") {
            $prefix = $matches[1]
        }
        else {
            $prefix = "PS"
        }
        $curPath = (Get-Location).Path
        $prePrefixSegments = @()
        if ($env:VIRTUAL_ENV) {
            $prePrefixSegments += "`e[32m(" + (Split-Path $env:VIRTUAL_ENV -Leaf) + ")`e[0m "
        }
        $customSegments = @()
        if (Test-Path ".git") {
            $branch = (& git rev-parse --abbrev-ref HEAD 2>$null)
            if ($branch) { $customSegments += "on $branch" }
        }
        if ($env:DOCKER_CONTEXT -and $env:DOCKER_CONTEXT -ne "default") {
            $customSegments += "$env:DOCKER_CONTEXT"
        }
        if ($env:AWS_PROFILE) {
            $customSegments += "via AWS $env:AWS_PROFILE"
        }
        if ($env:GOOGLE_CLOUD_PROJECT) {
            $customSegments += "via GCP $env:GOOGLE_CLOUD_PROJECT"
        }
        if ($env:AZURE_SUBSCRIPTION_ID) {
            $customSegments += "via Azure $env:AZURE_SUBSCRIPTION_ID"
        }
        $jobCount = (Get-Job | Measure-Object).Count
        if ($jobCount -gt 0) {
            $customSegments += "$jobCount job(s)"
        }
        if ($env:SHLVL -and [int]$env:SHLVL -ge 1) {
            $customSegments += "SHLVL $env:SHLVL"
        }
        if ($env:CONTAINER -or $env:DOCKER_CONTAINER) {
            $customSegments += "Container"
        }
        $prePrefix = ($prePrefixSegments -join " ")
        $infix = if ($customSegments.Count -gt 0) { " " + ($customSegments -join " ") } else { "" }
        $visiblePrompt = "$prePrefix$prefix $curPath$infix>"

        ### PART 2: Build OSC Sequences (Hidden Control Commands)
        if (-not (Get-Command __ConvertTo-VSCodeEscapedValue -ErrorAction SilentlyContinue)) {
            function __ConvertTo-VSCodeEscapedValue($text) { return $text }
        }
        $FakeCode = [int]!$?
        Set-StrictMode -Off
        $LastHistoryEntry = Get-History -Count 1
        $oscResult = ""
        
        # For debugging: always output exit code OSC sequence.
        $oscResult += "$([char]0x1b)]633;D;$FakeCode`a"
  
        
        $oscResult += "$([char]0x1b)]633;A`a"
        if ($pwd.Provider.Name -eq 'FileSystem') {
            $oscResult += "$([char]0x1b)]633;P;Cwd=$(__ConvertTo-VSCodeEscapedValue $pwd.ProviderPath)`a"
        }
        if ($__vscode_shell_env_reporting -eq "1") {
            $envMap = @{}
            Get-ChildItem Env: | ForEach-Object { $envMap[$_.Name] = $_.Value }
            $envJson = $envMap | ConvertTo-Json -Compress
            $oscResult += "$([char]0x1b)]633;EnvJson;$(__ConvertTo-VSCodeEscapedValue $envJson);$Nonce`a"
        }
        if ($FakeCode -ne 0) {
            Write-Error "failure" -ea ignore
        }
        if ($isStable -eq "0") {
            $oscResult += "$([char]0x1b)]633;P;Prompt=$(__ConvertTo-VSCodeEscapedValue $visiblePrompt)`a"
        }
        $oscResult += "$([char]0x1b)]633;B`a"
        $Global:__LastHistoryId = $LastHistoryEntry.Id

        ### PART 3: Combine OSC Sequences with Visible Prompt
        return "$oscResult$visiblePrompt"
    }
    Write-Host "Advanced prompt activated" -ForegroundColor White
}
