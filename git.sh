#!/bin/bash

# 备份目录
backup_dir="/Users/offsec/Desktop/OpenHarmony-v5.0-Beta1/data"

# 在本地仓库中查找大于 100MB 的文件
find . -type f -size +100M | while read file; do
    # 获取文件路径相对于仓库根目录的路径
    relative_path="${file#./}"
    # 创建目标目录结构
    mkdir -p "${backup_dir}/${relative_path%/*}"
    # 移动文件到备份目录
    mv "$file" "${backup_dir}/${relative_path}"
    echo "备份文件: ${relative_path}"
done

