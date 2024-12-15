Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop bucket add extras
scoop bucket add java
scoop bucket add games
scoop install 7zip adb bun cmake cpu-z crystaldiskinfo dark discord eclipse-java epic-games-launcher filezilla firefox gimp git go googlechrome gradle innounp jetbrains-toolbox latex libreoffice nmap nvm openjdk openjdk22 openssh openssl pandoc pipx ppsspp putty pwsh python rufus rustup skype slack teamviewer teraterm vivaldi vlc vscode winscp xampp zoom
