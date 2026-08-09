# Windows Setup Guide - Repository Rename Script

## Prerequisites: Install GitHub CLI

Since `winget` isn't recognized on your system, here are alternative methods:

### Option 1: Direct Download (Easiest)
1. Go to https://cli.github.com/
2. Click "Download for Windows"
3. Run the installer (.msi file)
4. Follow the installation wizard
5. Close and reopen PowerShell

### Option 2: Using Chocolatey
If you have Chocolatey installed:
```powershell
choco install gh
```

### Option 3: Using Scoop
If you have Scoop installed:
```powershell
scoop install gh
```

### Option 4: Install Windows Package Manager
If you want to use `winget` in the future:
1. Open Microsoft Store
2. Search for "App Installer"
3. Click Install
4. Close and reopen PowerShell
5. Then run: `winget install GitHub.cli`

---

## Authenticate with GitHub

After installing GitHub CLI, authenticate:
```powershell
gh auth login
```

Follow the prompts:
- Choose "GitHub.com"
- Choose "HTTPS"
- Authenticate via browser when prompted

---

## Run the Rename Script

1. Download `rename-repos-kebab-case.ps1` to your local machine
2. Open PowerShell (Run as Administrator recommended)
3. Navigate to the script directory:
   ```powershell
   cd C:\path\to\script
   ```
4. Allow script execution (one-time):
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
5. Run the script:
   ```powershell
   .\rename-repos-kebab-case.ps1
   ```

---

## Troubleshooting

### "gh is not recognized"
- Restart PowerShell/Windows Terminal
- Verify gh is installed: `gh --version`

### "Permission denied" or "cannot be loaded"
- Run PowerShell as Administrator
- Re-run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Authentication issues
- Run: `gh auth status`
- If not authenticated: `gh auth login`

---

## What the Script Does

The PowerShell script will:
- ✅ Convert all PascalCase repo names to kebab-case (lowercase with hyphens)
- ✅ Skip repos already in kebab-case format
- ✅ Show progress as it renames each repository
- ✅ Display a summary at the end

Example conversions:
- `AI-Agents-Playground` → `ai-agents-playground`
- `Data-Structures-and-Algorithms` → `data-structures-and-algorithms`
- `parkour2` → `parkour2` (skipped, already correct)
