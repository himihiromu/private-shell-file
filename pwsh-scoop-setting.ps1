Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop install 7zip adb aomei-partition-assistant-standard appium bun cmake cpu-z crystaldiskinfo dark deepl discord \
  eclipse-java epic-games-launcher filezilla firefox gimp git go googlechrome gradle innounp jetbrains-toolbox latex \
  libreoffice musicbee nmap nvm openjdk openjdk22 openssh openssl pandoc pipx ppsspp putty pwsh python rufus rustup \
  skype slack teamviewer teraterm vivaldi vlc vscode winscp xampp zoom
