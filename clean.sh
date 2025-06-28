#!/data/data/com.termux/files/usr/bin/bash

CONFIG_FILE="/data/data/com.termux/files/home/aria2/aria2.conf"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "错误：配置文件 $CONFIG_FILE 不存在"
    exit 1
fi

DOWNLOAD_DIR=$(grep '^dir=' "$CONFIG_FILE" | cut -d'=' -f2)

if [ -z "$DOWNLOAD_DIR" ]; then
    echo "错误：无法从配置文件中读取下载目录"
    exit 1
fi

if [ ! -d "$DOWNLOAD_DIR" ]; then
    echo "错误：下载目录 $DOWNLOAD_DIR 不存在"
    exit 1
fi

cd "$DOWNLOAD_DIR" || exit 1

find . -type f -name "*.aria2" -delete

if [ $? -eq 0 ]; then
    echo "已成功清理所有.aria2文件"
else
    echo "清理.aria2文件时发生错误"
    exit 1
fi

exit 0