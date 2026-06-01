# 第 1 组校园活动展示平台

基于 **Flutter Web** 的小组协作展示项目，用于演示 GitHub 多人协作流程与 Flutter Web 静态站点部署。

## 项目简介

这是一个 Flutter Web 页面，展示小组的项目主题、成员分工、功能列表和发布说明。项目源码托管在 `main` 分支，通过 Pull Request 合并各成员的修改，最终构建为静态网页并发布到 GitHub Pages。

## 小组成员与分工

| 角色 | 姓名 | 任务 |
|------|------|------|
| 组长 | 代子涵 | 创建仓库、维护 main 分支、审核 PR、发布 GitHub Pages |
| 组员 A | 李从周 | 修改首页标题和项目口号 |
| 组员 B | 林赟 | 补充成员介绍卡片 |
| 组员 C | 林煜练 | 补充项目功能列表 |
| 组员 D | 万华江 | 补充发布说明和访问地址 |
| 组员 E | 刘其凯 | 编写项目 README 文档 |

## 项目结构

```
group-flutter-pages-demo/
├── lib/
│   └── main.dart          # 应用主文件（页面内容、数据定义）
├── test/
│   └── widget_test.dart   # Widget 测试
├── web/
│   ├── index.html         # Web 入口
│   └── manifest.json      # PWA 配置
├── pubspec.yaml           # 依赖和项目配置
└── analysis_options.yaml  # Lint 规则
```

## 本地运行

**前置要求：** 安装 [Flutter SDK](https://docs.flutter.dev/get-started/install)（3.11+）。

```bash
# 安装依赖
flutter pub get

# 在 Chrome 中运行
flutter run -d chrome

# 运行测试
flutter test
```

## 构建与部署

### 构建 Web 静态文件

将 `<仓库名>` 替换为你的 GitHub 仓库名称：

```bash
flutter build web --base-href /<仓库名>/
```

例如本项目的构建命令：

```bash
flutter build web --base-href /group-flutter-pages-demo/
```

构建产物位于 `build/web/` 目录。

### 发布到 GitHub Pages

将构建产物推送到 `gh-pages` 分支，GitHub Pages 即可自动部署：

```bash
# 将 build/web 的内容发布到 gh-pages 分支
git subtree push --prefix build/web origin gh-pages
```

部署完成后，访问地址为：

```
https://<用户名>.github.io/group-flutter-pages-demo/
```

本项目当前访问地址：[https://vito67291-bot.github.io/group-flutter-pages-demo/](https://vito67291-bot.github.io/group-flutter-pages-demo/)

## 协作流程

1. **组员**从 `main` 分支创建自己的功能分支
2. 在 `lib/main.dart` 中修改对应区域的数据
3. 提交 commit 并推送到远程仓库
4. 向 `main` 分支发起 **Pull Request**
5. **组长**审核代码后合并 PR
6. 所有修改合并后，组长重新构建 Web 产物并发布

### 组员任务入口

`lib/main.dart` 中包含以下数据区域，各成员修改自己负责的部分：

| 组员 | 修改内容 | 对应代码位置 |
|------|----------|-------------|
| 组员 A | `projectTitle` 和 `projectSlogan` | `TeamHomePage` 类中的静态常量 |
| 组员 B | `members` 成员列表 | `TeamHomePage.members` |
| 组员 C | `features` 功能列表 | `TeamHomePage.features` |
| 组员 D | `releaseNotes` 发布说明 | `TeamHomePage.releaseNotes` |

## 技术栈

- **Flutter** 3.11+
- **Dart** SDK 3.11+
- **Material Design 3**
- **GitHub Pages** 静态站点托管
