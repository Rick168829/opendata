# 設定資料夾路徑
$sourceFolderPath = "E:\Program Files\Systems\JAV_output"
$outputFilePath = "C:\Users\Nicky\Downloads\listav.txt"

# 抓取資料夾清單
$folders = Get-ChildItem -Path $sourceFolderPath -Directory

# 初始化清單
$list = @()

# 遍歷每個資料夾清單
foreach ($folder in $folders) {
    # 取得資料夾內的所有檔案名稱並大寫
    $subfiles = (Get-ChildItem -Path $folder.FullName -File).Name.ToUpper() -join ", "
    
    
    # 將資料整理到清單
    $list += "$folder : $subfiles"
}

# 將清單輸出到文字檔，強制大寫
$list | Out-File -FilePath $outputFilePath -Force -Encoding utf8

Write-Host "Done! The list has been updated to $outputFilePath"

# 暫停視窗
# pause