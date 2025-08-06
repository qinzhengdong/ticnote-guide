#!/bin/bash

# TicNote 使用指南 - GitHub Pages 部署脚本
# 免费托管静态网站

echo "🚀 开始部署 TicNote 使用指南到 GitHub Pages..."

# 检查是否在 Git 仓库中
if [ ! -d ".git" ]; then
    echo "❌ 错误：当前目录不是 Git 仓库"
    echo "请先初始化 Git 仓库："
    echo "git init"
    echo "git add ."
    echo "git commit -m 'Initial commit'"
    exit 1
fi

# 创建 GitHub Pages 分支
echo "📝 创建 gh-pages 分支..."
git checkout -b gh-pages 2>/dev/null || git checkout gh-pages

# 确保只包含必要的文件
echo "📁 准备部署文件..."
rm -rf *
cp ../ticnote-guide.html ./index.html
cp ../ticnote_parts_overview.jpg ./

# 添加文件到 Git
git add .
git commit -m "Deploy TicNote guide to GitHub Pages"

# 推送到远程仓库
echo "📤 推送到 GitHub..."
git push origin gh-pages

# 切换回主分支
git checkout main 2>/dev/null || git checkout master

echo "✅ 部署完成！"
echo ""
echo "📋 下一步操作："
echo "1. 在 GitHub 仓库设置中启用 GitHub Pages"
echo "2. 选择 gh-pages 分支作为源"
echo "3. 访问 https://你的用户名.github.io/仓库名 查看网站"
echo ""
echo "🔧 如需更新网站，重新运行此脚本即可" 