# TicNote 文档中心

这是一个包含 TicNote 相关文档的 GitHub Pages 项目，支持在线预览 HTML 文件。

## 📁 项目内容

- **📖 使用指南** (`ticnote-guide.html`) - TicNote 使用教程

## 🚀 部署到 GitHub Pages

### 方法一：自动部署（推荐）

1. **推送代码到 GitHub**
   ```bash
   git add .
   git commit -m "Add TicNote documentation center"
   git push origin main
   ```

2. **启用 GitHub Pages**
   - 进入 GitHub 仓库设置
   - 找到 "Pages" 选项
   - 选择 "Deploy from a branch"
   - 选择 `main` 分支和 `/ (root)` 目录
   - 点击 "Save"

3. **访问网站**
   - 等待几分钟后，GitHub 会提供访问链接
   - 通常格式为：`https://[用户名].github.io/[仓库名]`

### 方法二：手动部署

如果您想使用 GitHub Actions 自动部署：

1. **创建 GitHub Actions 工作流**
   ```bash
   mkdir -p .github/workflows
   ```

2. **创建部署脚本** (`.github/workflows/deploy.yml`)
   ```yaml
   name: Deploy to GitHub Pages
   
   on:
     push:
       branches: [ main ]
   
   jobs:
     deploy:
       runs-on: ubuntu-latest
       steps:
       - uses: actions/checkout@v2
       - name: Deploy
         uses: peaceiris/actions-gh-pages@v3
         with:
           github_token: ${{ secrets.GITHUB_TOKEN }}
           publish_dir: .
   ```

## 📖 使用说明

### 本地预览

1. **克隆仓库**
   ```bash
   git clone https://github.com/[用户名]/[仓库名].git
   cd [仓库名]
   ```

2. **打开 index.html**
   - 直接在浏览器中打开 `index.html` 文件
   - 或使用本地服务器：
     ```bash
     # Python 3
     python -m http.server 8000
     
     # Node.js
     npx serve .
     ```

### 文件结构

```
├── index.html                    # 主页
├── ticnote-guide.html           # TicNote 使用指南
├── README.md                    # 项目说明
└── .gitignore                   # Git 忽略文件
```

## 🎨 自定义样式

所有 HTML 文件都包含内联 CSS 样式，您可以根据需要修改：

- **颜色主题**：修改 CSS 中的颜色值
- **布局**：调整容器宽度、间距等
- **字体**：更改字体族和大小

## 🔧 维护

### 更新文档

1. 修改相应的 HTML 文件
2. 提交更改：
   ```bash
   git add .
   git commit -m "Update documentation"
   git push origin main
   ```

### 添加新文档

1. 创建新的 HTML 文件
2. 在 `index.html` 中添加链接
3. 提交并推送更改

## 📞 支持

如果您在使用过程中遇到问题，请：

1. 检查 GitHub Pages 设置
2. 查看浏览器控制台是否有错误
3. 确保所有文件路径正确

## 📄 许可证

本项目仅用于文档展示，请遵守相关法律法规。

---

**© 2025 TicNote - 智能笔记，让记录更简单**
