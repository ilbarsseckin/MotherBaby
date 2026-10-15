param([Parameter(Mandatory)][string]$Lang)
# Çeviri parçalarını (daily/<dil>/baby_*.json, mother_*.json) birleştirip
# uygulamadaki assets/content/<dil>.daily.json dosyasını üretir.
$ErrorActionPreference = 'Stop'
$src = Join-Path $PSScriptRoot "daily\$Lang"
$out = "C:\Users\seckin\Documents\GitHub\MotherBaby\mother_flutter\assets\content\$Lang.daily.json"
$tr = Get-Content "C:\Users\seckin\Documents\GitHub\MotherBaby\mother_flutter\assets\content\tr.daily.json" -Raw -Encoding UTF8 | ConvertFrom-Json
$result = [ordered]@{}
$problems = @()
foreach ($who in 'baby', 'mother') {
  $merged = @{}
  foreach ($f in Get-ChildItem $src -Filter "$who`_*.json" | Sort-Object Name) {
    try { $j = Get-Content $f.FullName -Raw -Encoding UTF8 | ConvertFrom-Json }
    catch { throw "JSON hatası: $($f.Name): $($_.Exception.Message)" }
    foreach ($p in $j.PSObject.Properties) { $merged[$p.Name] = $p.Value }
  }
  $days = [ordered]@{}
  foreach ($i in 1..280) {
    $v = $merged["$i"]
    $hasTr = [bool]$tr.$who."$i"
    if ($v) {
      $days["$i"] = $v
      if (-not $v.StartsWith([string][char]0x2726)) { $problems += "${who} ${i}: ✦ ile başlamıyor" }
      $tn = ($tr.$who."$i" -split [char]0x2726 | Where-Object { $_.Trim() }).Count
      $vn = ($v -split [char]0x2726 | Where-Object { $_.Trim() }).Count
      if ($hasTr -and [Math]::Abs($tn - $vn) -gt 2) { $problems += "${who} ${i}: madde sayısı tr=$tn $Lang=$vn" }
    } elseif ($hasTr) { $problems += "${who} ${i}: EKSİK" }
  }
  $result[$who] = $days
}
[IO.File]::WriteAllText($out, ($result | ConvertTo-Json -Depth 4), (New-Object Text.UTF8Encoding $false))
"$Lang -> baby $($result.baby.Count), mother $($result.mother.Count) gün, {0:N0} KB" -f ((Get-Item $out).Length / 1KB)
if ($problems) { "UYARILAR:"; $problems }
