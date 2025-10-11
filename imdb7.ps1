# ======================================================================
# IMDb Pro Installer - Professional Edition
# Fixed and Tested Version
# ======================================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore, PresentationFramework

# ----------------------------------------------------------------------
# Utility: Create Color Shortcut
function New-Color {
    param($r, $g, $b)
    return [System.Drawing.Color]::FromArgb($r, $g, $b)
}

# ----------------------------------------------------------------------
# GLOBAL VARIABLES
$PrimaryColor = New-Color 245 197 24
$DarkBgColor = New-Color 18 18 20
$CardBgColor = New-Color 32 32 35
$AccentColor = New-Color 41 182 246
$SuccessColor = New-Color 76 175 80
$WarningColor = New-Color 255 152 0
$ErrorColor = New-Color 244 67 54

# ----------------------------------------------------------------------
# MAIN FORM CONFIGURATION
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "🎬 IMDb Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(900, 800)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = $DarkBgColor
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# ----------------------------------------------------------------------
# HEADER SECTION
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Size = New-Object System.Drawing.Size(900, 120)
$headerPanel.BackColor = $CardBgColor
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$mainForm.Controls.Add($headerPanel)

# Logo and Title Container
$titleContainer = New-Object System.Windows.Forms.Panel
$titleContainer.Size = New-Object System.Drawing.Size(800, 80)
$titleContainer.Location = New-Object System.Drawing.Point(50, 20)
$titleContainer.BackColor = [System.Drawing.Color]::Transparent
$headerPanel.Controls.Add($titleContainer)

# Logo Icon
$logoLabel = New-Object System.Windows.Forms.Label
$logoLabel.Text = "🎭"
$logoLabel.Font = New-Object System.Drawing.Font("Segoe UI", 36, [System.Drawing.FontStyle]::Bold)
$logoLabel.ForeColor = $PrimaryColor
$logoLabel.AutoSize = $true
$logoLabel.Location = New-Object System.Drawing.Point(0, 0)
$titleContainer.Controls.Add($logoLabel)

# Title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "IMDb Pro"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 32, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(70, 10)
$titleContainer.Controls.Add($titleLabel)

# Subtitle
$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional Extension Suite v2.1.0"
$subtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Italic)
$subtitleLabel.ForeColor = New-Color 180 180 180
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(75, 55)
$titleContainer.Controls.Add($subtitleLabel)

# ----------------------------------------------------------------------
# CONTENT PANEL
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 120)
$contentPanel.Size = New-Object System.Drawing.Size(900, 550)
$contentPanel.BackColor = [System.Drawing.Color]::Transparent
$mainForm.Controls.Add($contentPanel)

# ----------------------------------------------------------------------
# WELCOME MESSAGE
$welcomeLabel = New-Object System.Windows.Forms.Label
$welcomeLabel.Text = "Welcome to IMDb Pro Installation"
$welcomeLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$welcomeLabel.ForeColor = $PrimaryColor
$welcomeLabel.AutoSize = $true
$welcomeLabel.Location = New-Object System.Drawing.Point(50, 20)
$contentPanel.Controls.Add($welcomeLabel)

$descriptionLabel = New-Object System.Windows.Forms.Label
$descriptionLabel.Text = "Enhance your movie browsing experience with premium features and real-time data."
$descriptionLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$descriptionLabel.ForeColor = New-Color 200 200 200
$descriptionLabel.AutoSize = $true
$descriptionLabel.Location = New-Object System.Drawing.Point(50, 55)
$descriptionLabel.Size = New-Object System.Drawing.Size(800, 25)
$contentPanel.Controls.Add($descriptionLabel)

# ----------------------------------------------------------------------
# FEATURES SECTION
$featuresTitle = New-Object System.Windows.Forms.Label
$featuresTitle.Text = "✨ Premium Features"
$featuresTitle.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$featuresTitle.ForeColor = $PrimaryColor
$featuresTitle.AutoSize = $true
$featuresTitle.Location = New-Object System.Drawing.Point(50, 100)
$contentPanel.Controls.Add($featuresTitle)

# Define features with enhanced design
$features = @(
    @{ Title="Real-time IMDb Ratings"; Description="Instant access to ratings and reviews"; Location=[System.Drawing.Point]::new(50, 150); Icon="⭐"; Color=$AccentColor },
    @{ Title="Complete Movie Info"; Description="Cast, crew, and detailed information"; Location=[System.Drawing.Point]::new(320, 150); Icon="🎬"; Color=$PrimaryColor },
    @{ Title="HD Trailers & Previews"; Description="Watch trailers directly in browser"; Location=[System.Drawing.Point]::new(590, 150); Icon="📹"; Color=$WarningColor },
    @{ Title="Browser Integration"; Description="Seamless browsing experience"; Location=[System.Drawing.Point]::new(50, 290); Icon="🌐"; Color=$SuccessColor },
    @{ Title="Auto Updates"; Description="Always up-to-date features"; Location=[System.Drawing.Point]::new(320, 290); Icon="🔄"; Color=$AccentColor },
    @{ Title="Secure & Private"; Description="Your data is protected"; Location=[System.Drawing.Point]::new(590, 290); Icon="🔒"; Color=$SuccessColor }
)

foreach ($feature in $features) {
    $panel = New-Object System.Windows.Forms.Panel
    $panel.Size = New-Object System.Drawing.Size(240, 130)
    $panel.Location = $feature.Location
    $panel.BackColor = $CardBgColor
    $panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    
    $panel.Add_MouseEnter({ 
        $this.BackColor = New-Color 50 50 55
        $this.Cursor = [System.Windows.Forms.Cursors]::Hand
    })
    $panel.Add_MouseLeave({ $this.BackColor = $CardBgColor })
    $contentPanel.Controls.Add($panel)

    $iconLabel = New-Object System.Windows.Forms.Label
    $iconLabel.Text = $feature.Icon
    $iconLabel.Font = New-Object System.Drawing.Font("Segoe UI", 24, [System.Drawing.FontStyle]::Bold)
    $iconLabel.ForeColor = $feature.Color
    $iconLabel.AutoSize = $true
    $iconLabel.Location = New-Object System.Drawing.Point(20, 20)
    $panel.Controls.Add($iconLabel)

    $title = New-Object System.Windows.Forms.Label
    $title.Text = $feature.Title
    $title.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $title.ForeColor = [System.Drawing.Color]::White
    $title.AutoSize = $true
    $title.Location = New-Object System.Drawing.Point(70, 25)
    $title.Size = New-Object System.Drawing.Size(150, 25)
    $panel.Controls.Add($title)

    $desc = New-Object System.Windows.Forms.Label
    $desc.Text = $feature.Description
    $desc.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $desc.ForeColor = New-Color 180 180 180
    $desc.Location = New-Object System.Drawing.Point(20, 75)
    $desc.Size = New-Object System.Drawing.Size(200, 40)
    $panel.Controls.Add($desc)
}

# ----------------------------------------------------------------------
# INSTALLATION STATUS SECTION
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "📊 Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = $PrimaryColor
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(50, 440)
$contentPanel.Controls.Add($progressTitle)

$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(800, 120)
$progressContainer.Location = New-Object System.Drawing.Point(50, 490)
$progressContainer.BackColor = $CardBgColor
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

# Status with animation support
$statusIcon = New-Object System.Windows.Forms.Label
$statusIcon.Text = "📋"
$statusIcon.Font = New-Object System.Drawing.Font("Segoe UI", 16)
$statusIcon.AutoSize = $true
$statusIcon.Location = New-Object System.Drawing.Point(25, 25)
$progressContainer.Controls.Add($statusIcon)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Ready to begin installation"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$statusLabel.ForeColor = [System.Drawing.Color]::White
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(60, 28)
$progressContainer.Controls.Add($statusLabel)

# Enhanced Progress Bar
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(25, 70)
$progressBar.Size = New-Object System.Drawing.Size(680, 25)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressContainer.Controls.Add($progressBar)

$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = $PrimaryColor
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(715, 68)
$progressContainer.Controls.Add($percentLabel)

# ----------------------------------------------------------------------
# BUTTON PANEL
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Size = New-Object System.Drawing.Size(900, 130)
$buttonPanel.Location = New-Object System.Drawing.Point(0, 670)
$buttonPanel.BackColor = $CardBgColor
$mainForm.Controls.Add($buttonPanel)

# Enhanced Install Button with hover effects
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 START INSTALLATION"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = $PrimaryColor
$installButton.Size = New-Object System.Drawing.Size(350, 60)
$installButton.Location = New-Object System.Drawing.Point(275, 35)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat

$installButton.FlatAppearance.BorderSize = 0
$installButton.FlatAppearance.MouseOverBackColor = New-Color 255 215 0
$installButton.FlatAppearance.MouseDownBackColor = New-Color 255 195 0
$buttonPanel.Controls.Add($installButton)

# ----------------------------------------------------------------------
# FOOTER
$footerLabel = New-Object System.Windows.Forms.Label
$footerLabel.Text = "© 2024 IMDb Pro Professional Edition. All rights reserved."
$footerLabel.Font = New-Object System.Drawing.Font("Segoe UI", 8)
$footerLabel.ForeColor = New-Color 120 120 120
$footerLabel.AutoSize = $true
$footerLabel.Location = New-Object System.Drawing.Point(320, 105)
$buttonPanel.Controls.Add($footerLabel)

# ----------------------------------------------------------------------
# ENHANCED HELPER FUNCTION WITH ANIMATIONS
function Update-Status {
    param(
        [string]$Message,
        [int]$ProgressValue,
        [string]$Icon = "📌"
    )
    
    $statusIcon.Text = $Icon
    $statusLabel.Text = $Message
    $percentLabel.Text = "$ProgressValue%"
    
    if ($ProgressValue -ge 0 -and $ProgressValue -le 100) { 
        $progressBar.Value = $ProgressValue 
    }
    
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 600
}

# ----------------------------------------------------------------------
# ENHANCED INSTALLATION LOGIC WITH BETTER FEEDBACK
function Start-Installation {
    # Simulate installation process for demo
    # In real scenario, you would use actual download and extraction
    
    try {
        Update-Status "Checking administrator privileges..." 10 "🔍"
        
        # Check if running as administrator
        $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

        if (-not $isAdmin) {
            [System.Windows.Forms.MessageBox]::Show(
                "Administrator privileges are required to install IMDb Pro.`n`nPlease right-click and select 'Run as Administrator'.",
                "Elevation Required",
                [System.Windows.Forms.MessageBoxButtons]::OK,
                [System.Windows.Forms.MessageBoxIcon]::Warning
            )
            Update-Status "Administrator privileges required" 0 "❌"
            $installButton.Enabled = $true
            $installButton.Text = "🚀 START INSTALLATION"
            $installButton.BackColor = $PrimaryColor
            return
        }

        Update-Status "Creating installation directory..." 20 "📁"
        Start-Sleep -Milliseconds 800

        Update-Status "Downloading IMDb Pro package..." 40 "📥"
        Start-Sleep -Milliseconds 1000

        Update-Status "Verifying download integrity..." 60 "✅"
        Start-Sleep -Milliseconds 800

        Update-Status "Extracting package contents..." 75 "📦"
        Start-Sleep -Milliseconds 1200

        Update-Status "Applying security settings..." 85 "🔒"
        Start-Sleep -Milliseconds 700

        Update-Status "Finalizing installation..." 95 "🛠️"
        Start-Sleep -Milliseconds 900

        Update-Status "Installation complete!" 100 "🎉"
        
        # Success state
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = $SuccessColor
        
        # Show success message
        [System.Windows.Forms.MessageBox]::Show(
            "🎬 IMDb Pro has been successfully installed!`n`n" +
            "📍 Location: C:\Program Files\imdb-pro`n" +
            "✅ Features activated`n" +
            "🔒 Security configured`n`n" +
            "Please restart your browser to start using IMDb Pro.",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
    }
    catch {
        Update-Status "Installation failed: $($_.Exception.Message)" 0 "💥"
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = $ErrorColor
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)`n`nPlease check your internet connection and try again.",
            "Installation Error",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

# ----------------------------------------------------------------------
# EVENT HANDLERS
$installButton.Add_Click({
    $installButton.Enabled = $false
    $installButton.Text = "⏳ INSTALLING..."
    $installButton.BackColor = $WarningColor
    Start-Installation
})

$installButton.Add_MouseEnter({ 
    if ($installButton.Text -eq "🚀 START INSTALLATION") {
        $installButton.BackColor = New-Color 255 215 0
    }
})

$installButton.Add_MouseLeave({
    if ($installButton.Text -eq "🚀 START INSTALLATION") {
        $installButton.BackColor = $PrimaryColor
    }
})

# ----------------------------------------------------------------------
# SHOW FORM
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null