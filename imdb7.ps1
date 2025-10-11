# ======================================================================
# IMDb Pro Installer - Compact Edition with Animations
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
$DarkBgColor = New-Color 15 15 18
$CardBgColor = New-Color 28 28 32
$AccentColor = New-Color 41 182 246
$SuccessColor = New-Color 76 175 80
$WarningColor = New-Color 255 152 0
$ErrorColor = New-Color 244 67 54

# ----------------------------------------------------------------------
# MAIN FORM CONFIGURATION - MORE COMPACT
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "🎬 IMDb Pro Installer"
$mainForm.Size = New-Object System.Drawing.Size(700, 550)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = $DarkBgColor
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# ----------------------------------------------------------------------
# COMPACT HEADER SECTION
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Size = New-Object System.Drawing.Size(700, 80)
$headerPanel.BackColor = $CardBgColor
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$mainForm.Controls.Add($headerPanel)

# Compact Logo and Title
$logoLabel = New-Object System.Windows.Forms.Label
$logoLabel.Text = "🎭"
$logoLabel.Font = New-Object System.Drawing.Font("Segoe UI", 24, [System.Drawing.FontStyle]::Bold)
$logoLabel.ForeColor = $PrimaryColor
$logoLabel.AutoSize = $true
$logoLabel.Location = New-Object System.Drawing.Point(20, 20)
$headerPanel.Controls.Add($logoLabel)

$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "IMDb Pro"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 20, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(65, 22)
$headerPanel.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "v2.1.0"
$subtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Italic)
$subtitleLabel.ForeColor = New-Color 180 180 180
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(180, 32)
$headerPanel.Controls.Add($subtitleLabel)

# ----------------------------------------------------------------------
# COMPACT CONTENT PANEL
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 80)
$contentPanel.Size = New-Object System.Drawing.Size(700, 400)
$contentPanel.BackColor = [System.Drawing.Color]::Transparent
$mainForm.Controls.Add($contentPanel)

# ----------------------------------------------------------------------
# COMPACT FEATURES GRID (2x3 layout)
$featuresTitle = New-Object System.Windows.Forms.Label
$featuresTitle.Text = "✨ Premium Features"
$featuresTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$featuresTitle.ForeColor = $PrimaryColor
$featuresTitle.AutoSize = $true
$featuresTitle.Location = New-Object System.Drawing.Point(25, 15)
$contentPanel.Controls.Add($featuresTitle)

# Compact features grid
$features = @(
    @{ Title="Real-time Ratings"; Description="Instant ratings access"; Location=[System.Drawing.Point]::new(25, 50); Icon="⭐"; Color=$AccentColor },
    @{ Title="Movie Info"; Description="Complete details"; Location=[System.Drawing.Point]::new(245, 50); Icon="🎬"; Color=$PrimaryColor },
    @{ Title="HD Trailers"; Description="Watch in browser"; Location=[System.Drawing.Point]::new(465, 50); Icon="📹"; Color=$WarningColor },
    @{ Title="Browser Integration"; Description="Seamless experience"; Location=[System.Drawing.Point]::new(25, 160); Icon="🌐"; Color=$SuccessColor },
    @{ Title="Auto Updates"; Description="Always up-to-date"; Location=[System.Drawing.Point]::new(245, 160); Icon="🔄"; Color=$AccentColor },
    @{ Title="Secure & Private"; Description="Data protected"; Location=[System.Drawing.Point]::new(465, 160); Icon="🔒"; Color=$SuccessColor }
)

foreach ($feature in $features) {
    $panel = New-Object System.Windows.Forms.Panel
    $panel.Size = New-Object System.Drawing.Size(200, 90)
    $panel.Location = $feature.Location
    $panel.BackColor = $CardBgColor
    $panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    
    $panel.Add_MouseEnter({ 
        $this.BackColor = New-Color 40 40 45
        $this.Cursor = [System.Windows.Forms.Cursors]::Hand
    })
    $panel.Add_MouseLeave({ $this.BackColor = $CardBgColor })
    $contentPanel.Controls.Add($panel)

    $iconLabel = New-Object System.Windows.Forms.Label
    $iconLabel.Text = $feature.Icon
    $iconLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
    $iconLabel.ForeColor = $feature.Color
    $iconLabel.AutoSize = $true
    $iconLabel.Location = New-Object System.Drawing.Point(15, 15)
    $panel.Controls.Add($iconLabel)

    $title = New-Object System.Windows.Forms.Label
    $title.Text = $feature.Title
    $title.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
    $title.ForeColor = [System.Drawing.Color]::White
    $title.AutoSize = $true
    $title.Location = New-Object System.Drawing.Point(50, 15)
    $panel.Controls.Add($title)

    $desc = New-Object System.Windows.Forms.Label
    $desc.Text = $feature.Description
    $desc.Font = New-Object System.Drawing.Font("Segoe UI", 8)
    $desc.ForeColor = New-Color 180 180 180
    $desc.Location = New-Object System.Drawing.Point(15, 45)
    $desc.Size = New-Object System.Drawing.Size(170, 30)
    $panel.Controls.Add($desc)
}

# ----------------------------------------------------------------------
# COMPACT PROGRESS SECTION
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "📊 Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = $PrimaryColor
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(25, 270)
$contentPanel.Controls.Add($progressTitle)

$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(650, 80)
$progressContainer.Location = New-Object System.Drawing.Point(25, 305)
$progressContainer.BackColor = $CardBgColor
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

# Animated status
$statusIcon = New-Object System.Windows.Forms.Label
$statusIcon.Text = "📋"
$statusIcon.Font = New-Object System.Drawing.Font("Segoe UI", 12)
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

# Progress bar with animation
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(15, 45)
$progressBar.Size = New-Object System.Drawing.Size(540, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = $PrimaryColor
$progressContainer.Controls.Add($progressBar)

$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = $PrimaryColor
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(565, 43)
$progressContainer.Controls.Add($percentLabel)

# ----------------------------------------------------------------------
# COMPACT BUTTON PANEL
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Size = New-Object System.Drawing.Size(700, 70)
$buttonPanel.Location = New-Object System.Drawing.Point(0, 480)
$buttonPanel.BackColor = $CardBgColor
$mainForm.Controls.Add($buttonPanel)

# Install Button with animations
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 START INSTALLATION"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = $PrimaryColor
$installButton.Size = New-Object System.Drawing.Size(300, 40)
$installButton.Location = New-Object System.Drawing.Point(200, 15)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat

$installButton.FlatAppearance.BorderSize = 0
$installButton.FlatAppearance.MouseOverBackColor = New-Color 255 215 0
$installButton.FlatAppearance.MouseDownBackColor = New-Color 255 195 0
$buttonPanel.Controls.Add($installButton)

# ----------------------------------------------------------------------
# ANIMATION FUNCTIONS
function Start-LoadingAnimation {
    param($DurationMs = 1000)
    
    $startTime = Get-Date
    $icons = @("⏳", "⌛", "⏳", "⌛")
    $colors = @($PrimaryColor, $AccentColor, $WarningColor, $SuccessColor)
    
    while (((Get-Date) - $startTime).TotalMilliseconds -lt $DurationMs) {
        $index = [int]((((Get-Date) - $startTime).TotalMilliseconds / 250) % $icons.Length)
        $statusIcon.Text = $icons[$index]
        $statusIcon.ForeColor = $colors[$index]
        [System.Windows.Forms.Application]::DoEvents()
        Start-Sleep -Milliseconds 50
    }
    
    $statusIcon.ForeColor = [System.Drawing.Color]::White
}

function Start-PulseAnimation {
    param($Control, $DurationMs = 800)
    
    $originalColor = $Control.BackColor
    $startTime = Get-Date
    
    while (((Get-Date) - $startTime).TotalMilliseconds -lt $DurationMs) {
        $progress = ((Get-Date) - $startTime).TotalMilliseconds / $DurationMs
        $pulseValue = [Math]::Sin($progress * [Math]::PI * 4) * 0.3 + 0.7
        $r = [int]($originalColor.R * $pulseValue)
        $g = [int]($originalColor.G * $pulseValue)
        $b = [int]($originalColor.B * $pulseValue)
        $Control.BackColor = New-Color $r $g $b
        [System.Windows.Forms.Application]::DoEvents()
        Start-Sleep -Milliseconds 30
    }
    
    $Control.BackColor = $originalColor
}

function Start-ProgressAnimation {
    param($From, $To, $DurationMs = 800)
    
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

# ----------------------------------------------------------------------
# ENHANCED STATUS UPDATE WITH ANIMATIONS
function Update-Status {
    param(
        [string]$Message,
        [int]$ProgressValue,
        [string]$Icon = "📌",
        [switch]$Loading,
        [switch]$Pulse
    )
    
    $statusIcon.Text = $Icon
    $statusLabel.Text = $Message
    
    if ($Loading) {
        Start-LoadingAnimation -DurationMs 800
    }
    
    if ($Pulse) {
        Start-PulseAnimation -Control $progressBar -DurationMs 600
    }
    
    if ($ProgressValue -ge 0 -and $ProgressValue -le 100) {
        Start-ProgressAnimation -From $progressBar.Value -To $ProgressValue -DurationMs 600
    }
    
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 300
}

# ----------------------------------------------------------------------
# ENHANCED INSTALLATION WITH ANIMATIONS
function Start-Installation {
    try {
        # Phase 1: Preparation
        Update-Status "Checking administrator privileges..." 10 "🔍" -Loading
        $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

        if (-not $isAdmin) {
            Update-Status "Admin privileges required!" 0 "❌"
            [System.Windows.Forms.MessageBox]::Show(
                "Please run as Administrator for proper installation.",
                "Admin Rights Required",
                [System.Windows.Forms.MessageBoxButtons]::OK,
                [System.Windows.Forms.MessageBoxIcon]::Warning
            )
            $installButton.Enabled = $true
            $installButton.Text = "🚀 START INSTALLATION"
            $installButton.BackColor = $PrimaryColor
            return
        }

        # Phase 2: Setup
        Update-Status "Creating installation directory..." 25 "📁" -Pulse
        Start-Sleep -Milliseconds 800

        Update-Status "Downloading IMDb Pro package..." 45 "📥" -Loading
        for ($i = 0; $i -lt 3; $i++) {
            Update-Status "Downloading IMDb Pro package...$('.' * ($i + 1))" (45 + $i * 5) "📥"
            Start-Sleep -Milliseconds 400
        }

        # Phase 3: Installation
        Update-Status "Verifying package integrity..." 65 "🔍" -Pulse
        Start-Sleep -Milliseconds 700

        Update-Status "Extracting files..." 75 "📦" -Loading
        for ($i = 1; $i -le 5; $i++) {
            Update-Status "Extracting files$('.' * $i)" (75 + $i * 2) "📦"
            Start-Sleep -Milliseconds 300
        }

        # Phase 4: Finalization
        Update-Status "Applying security settings..." 88 "🔒" -Pulse
        Start-Sleep -Milliseconds 600

        Update-Status "Finalizing installation..." 95 "⚡" -Loading
        Start-Sleep -Milliseconds 800

        # Success animation sequence
        for ($i = 96; $i -le 100; $i++) {
            $celebrateIcons = @("🎉", "🎊", "✨", "🌟", "🎈")
            $iconIndex = ($i - 96) % $celebrateIcons.Length
            Update-Status "Completing installation..." $i $celebrateIcons[$iconIndex]
            Start-Sleep -Milliseconds 150
        }

        Update-Status "Installation complete!" 100 "✅"
        
        # Success state with celebration
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = $SuccessColor
        Start-PulseAnimation -Control $installButton -DurationMs 2000
        
        # Success message
        [System.Windows.Forms.MessageBox]::Show(
            "🎬 IMDb Pro installed successfully!`n`nRestart your browser to start enjoying premium features.",
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
        $installButton.BackColor = $ErrorColor
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed. Please check your connection and try again.",
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
        Start-PulseAnimation -Control $installButton -DurationMs 500
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
$mainForm.TopMost = $true
$mainForm.ShowDialog() | Out-Null