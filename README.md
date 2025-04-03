# private-shell-file
個人用Shell-Scriptリポジトリ

## pixel
### 初期設定

```bash
sudo apt update
sudo apt install -y curl ca-certificates
```

### shellで実行

```bash
curl -sf https://raw.githubusercontent.com/shimajima-eiji/Chocolatey/master/wsl/update_CHANGELOG.sh | sh -s -- $GITHUB_TOKEN
```
