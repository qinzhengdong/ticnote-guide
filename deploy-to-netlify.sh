#!/bin/bash

# TicNote 使用指南 - Netlify 部署脚本
# 免费托管，支持自定义域名

echo "🚀 开始部署 TicNote 使用指南到 Netlify..."

# 检查是否安装了 Netlify CLI
if ! command -v netlify &> /dev/null; then
    echo "📦 安装 Netlify CLI..."
    npm install -g netlify-cli
fi

# 创建部署目录
echo "📁 准备部署文件..."
mkdir -p deploy
cp ticnote-guide.html deploy/index.html
cp ticnote_parts_overview.jpg deploy/

# 创建 netlify.toml 配置文件
cat > deploy/netlify.toml << EOF
[build]
  publish = "."
  command = ""

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-XSS-Protection = "1; mode=block"
    X-Content-Type-Options = "nosniff"
    Referrer-Policy = "strict-origin-when-cross-origin"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
EOF

# 切换到部署目录
cd deploy

# 部署到 Netlify
echo "📤 部署到 Netlify..."
netlify deploy --prod --dir=.

echo "✅ 部署完成！"
echo ""
echo "📋 部署信息："
echo "• 网站已部署到 Netlify"
echo "• 支持自定义域名"
echo "• 自动 HTTPS"
echo "• 全球 CDN"
echo ""
echo "🔧 如需更新网站，重新运行此脚本即可" 