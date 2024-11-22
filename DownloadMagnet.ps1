
# 提示用户输入下载网址
$url = Read-Host "请输入下载的网址"

# 使用 wget 下载并保存为网页文件
wget $url -O "webpage.html"

Write-Host "已下载网址: $url 到文件 webpage.html"

# 提取链接
Select-String -Path "webpage.html" -Pattern "magnet:\?xt=urn:btih:[A-Za-z0-9]+" | ForEach-Object { $_.Matches.Value }

# 提取网页中的磁力链接
Select-String -Path "webpage.html" -Pattern "magnet:\?xt=urn:btih:[A-Za-z0-9]+" | ForEach-Object { $_.Matches.Value } | 
# 将磁力链接写入当前文件夹的 txt 文件
Out-File -FilePath "$(Get-Location)\magnet_links.txt"
