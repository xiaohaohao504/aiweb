#requires -Version 5.1
<#
  Auto-commit & push for the aiweb Nuxt project.

  - Stages all tracked/non-ignored changes (git add -A)
  - Auto-generates a conventional-commit message from the changed paths
  - Commits and pushes to origin/<current branch>

  Usage (from anywhere):
    pwsh scripts/auto-commit.ps1
#>
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

# Fail fast if git is not initialized or no remote is configured.
$branch = git rev-parse --abbrev-ref HEAD 2>$null
if (-not $branch) {
    Write-Error 'Not inside a git repository (run: git init).'
    exit 1
}

$remote = git remote
if (-not ($remote -contains 'origin')) {
    Write-Error "Remote 'origin' is not configured (run: git remote add origin <url>)."
    exit 1
}

# Stage everything (respecting .gitignore — secrets/node_modules are excluded there).
git add -A

$status = git status --porcelain
if (-not $status) {
    Write-Host 'Nothing to commit — working tree clean.'
    exit 0
}

# Build a sorted, unique list of changed file paths.
$files = $status | ForEach-Object { ($_ -replace '^.{3}', '').Trim() }
$fileSet = @($files | Sort-Object -Unique | Where-Object { $_ })

# Derive a conventional-commit type from the changed paths.
$paths = $fileSet -join ' '
$type = 'chore'
if     ($paths -match '\.github/|nuxt\.config\.ts|package\.json|package-lock\.json') { $type = 'ci' }
elseif ($paths -match '^components/|^app\.vue|^pages/') { $type = 'feat' }
elseif ($paths -match '^assets/|^public/')              { $type = 'style' }
elseif ($paths -match '\.md$|README')                   { $type = 'docs' }
elseif ($paths -match 'fix|bug')                        { $type = 'fix' }

# Subject line (kept <= 72 chars). Single file -> show its name; many -> count.
$summary = if ($fileSet.Count -eq 1) { $fileSet[0] } else { "$($fileSet.Count) files" }
$subject = "${type}: update ${summary}"
if ($subject.Length -gt 72) { $subject = $subject.Substring(0, 72) }

# Body = list of changed files, one per line.
$body = $fileSet -join "`n"

# Use a temp message file to avoid any shell quoting issues.
$tmp = [System.IO.Path]::GetTempFileName()
try {
    "$subject`n`n$body" | Out-File -FilePath $tmp -Encoding utf8
    git commit -F $tmp
}
finally {
    Remove-Item $tmp -Force -ErrorAction SilentlyContinue
}

# Push (set upstream on first push).
git push -u origin $branch
Write-Host "Pushed to origin/$branch."
