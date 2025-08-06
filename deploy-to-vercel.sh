#!/bin/bash

# TicNote 使用指南 - Vercel 部署脚本
# 免费托管，极速性能

echo "🚀 开始部署 TicNote 使用指南到 Vercel..."

# 检查是否安装了 Vercel CLI
if ! command -v vercel &> /dev/null; then
    echo "📦 安装 Vercel CLI..."
    npm install -g vercel
fi

# 创建部署目录
echo "📁 准备部署文件..."
mkdir -p deploy
cp ticnote-guide.html deploy/index.html
cp ticnote_parts_overview.jpg deploy/

# 创建 vercel.json 配置文件
cat > deploy/vercel.json << EOF
{
  "version": 2,
  "builds": [
    {
      "src": "*.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        },
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "Referrer-Policy",
          "value": "strict-origin-when-cross-origin"
        }
      ]
    }
  ]
}
EOF

# 切换到部署目录
cd deploy

# 部署到 Vercel
echo "📤 部署到 Vercel..."
vercel --prod

echo "✅ 部署完成！"
echo ""
echo "📋 部署信息："
echo "• 网站已部署到 Vercel"
echo "• 极速全球 CDN"
echo "• 自动 HTTPS"
echo "• 支持自定义域名"
echo "• 自动部署预览"
echo ""
echo "🔧 如需更新网站，重新运行此脚本即可" 