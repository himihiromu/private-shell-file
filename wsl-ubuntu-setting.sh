#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


# 初期設定: systemdを使うため&ネットにつなげる為
rm /etc/wsl.conf
echo "[boot]
systemd=true

[network]
generateResolvConf = false
" | tee /etc/wsl.conf

rm /etc/resolv.conf

echo "nameserver 8.8.8.8" | tee /etc/resolv.conf

# 基本の'き'
apt-get update
# 下記の処理の事前対応として
apt-get install -y ca-certificates curl

function docker_install () {

    # Docker install (公式サイトのコピペ)
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc

    # Dockerインストールのリポジトリ追加
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # リポジトリの更新
    sudo apt-get update

    # Dockerのインスコ
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # dockerをsudo無しで実行できるようにする
    sudo gpasswd -a $USER docker
}

function k3s_install () {
    curl -sfL https://get.k3s.io | sh -
}


while getopts ":dk-:" opt; do
    if [ "$opt" = - ]; then
        opt="${OPTARG}"
    fi
        case "$opt" in
            d|docker-install)
                docker_install
                ;;
            k|k3s-install)
                k3s_install
                ;;
        esac
done

apt-get upgrade -y
