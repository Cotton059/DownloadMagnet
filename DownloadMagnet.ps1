
# ��ʾ�û�����������ַ
$url = Read-Host "���������ص���ַ"

# ʹ�� wget ���ز�����Ϊ��ҳ�ļ�
wget $url -O "webpage.html"

Write-Host "��������ַ: $url ���ļ� webpage.html"

# ��ȡ����
Select-String -Path "webpage.html" -Pattern "magnet:\?xt=urn:btih:[A-Za-z0-9]+" | ForEach-Object { $_.Matches.Value }

# ��ȡ��ҳ�еĴ�������
Select-String -Path "webpage.html" -Pattern "magnet:\?xt=urn:btih:[A-Za-z0-9]+" | ForEach-Object { $_.Matches.Value } | 
# ����������д�뵱ǰ�ļ��е� txt �ļ�
Out-File -FilePath "$(Get-Location)\magnet_links.txt"
