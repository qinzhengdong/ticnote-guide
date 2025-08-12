#!/bin/bash

# TicNote 文档中心自动部署脚本
# 使用方法: ./deploy.sh [commit_message]

echo "🚀 开始自动部署 TicNote 文档中心..."

# 检查是否有未提交的更改
if [[ -n $(git status --porcelain) ]]; then
    echo "📝 发现未提交的更改，正在添加..."
    git add .
    
    # 获取提交信息
    if [[ -n $1 ]]; then
        commit_msg="$1"
    else
        commit_msg="Auto update: $(date '+%Y-%m-%d %H:%M:%S')"
    fi
    
    echo "💾 提交更改: $commit_msg"
    git commit -m "$commit_msg"
else
    echo "✅ 没有发现未提交的更改"
fi

# 推送到 GitHub（这会自动触发 GitHub Actions 部署）
echo "📤 推送到 GitHub 并触发自动部署..."
git push origin main

echo "✅ 部署完成！"
echo "🌐 您的网站将在几分钟后可用："
echo "   https://qinzhengdong.github.io/ticnote-guide/"
echo ""
echo "📊 查看部署状态："
echo "   https://github.com/qinzhengdong/ticnote-guide/actions"
echo ""
echo "📝 提示："
echo "   - GitHub Actions 会自动部署您的网站"
echo "   - 部署通常需要 2-5 分钟"
echo "   - 可以在 Actions 标签页查看部署进度"
echo "   - 如果看不到更新，请清除浏览器缓存"
