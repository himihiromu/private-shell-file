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
curl -sf https://raw.githubusercontent.com/himihiromu/private-shell-file/refs/heads/feat-pixel-setting/pixel-setting.sh | sh -s -- $GITHUB_TOKEN
```
