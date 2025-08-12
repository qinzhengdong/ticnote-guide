#!/bin/bash

# TicNote 文档中心部署脚本
# 使用方法: ./deploy.sh [commit_message]

echo "🚀 开始部署 TicNote 文档中心..."

# 检查是否有未提交的更改
if [[ -n $(git status --porcelain) ]]; then
    echo "📝 发现未提交的更改，正在添加..."
    git add .
    
    # 获取提交信息
    if [[ -n $1 ]]; then
        commit_msg="$1"
    else
        commit_msg="Update TicNote documentation"
    fi
    
    echo "💾 提交更改: $commit_msg"
    git commit -m "$commit_msg"
else
    echo "✅ 没有发现未提交的更改"
fi

# 推送到 GitHub
echo "📤 推送到 GitHub..."
git push origin gh-pages

echo "✅ 部署完成！"
echo "🌐 您的网站应该可以在以下地址访问："
echo "   https://qinzhengdong.github.io/ticnote-guide/"
echo ""
echo "📝 提示："
echo "   - GitHub Pages 可能需要几分钟时间才能更新"
echo "   - 如果看不到更新，请清除浏览器缓存"
echo "   - 可以在 GitHub 仓库设置中查看 Pages 状态"
