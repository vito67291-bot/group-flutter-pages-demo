# 小组 Flutter Web 展示页示例项目

这是配套“GitHub 协作与 Flutter Web 部署”案例的初始项目。组长可以把这个项目提交到 GitHub 仓库的 `main` 分支，4 名组员分别基于它提交 Pull Request。

## 本地运行

```bash
flutter pub get
flutter run
```

如果要用浏览器运行，可以选择 Chrome 或 web-server：

```bash
flutter run -d chrome
```

## 构建 Web 静态文件

把 `REPO_NAME` 替换成你的 GitHub 仓库名：

```bash
flutter build web --base-href /REPO_NAME/
```

构建完成后，静态网站文件位于：

```text
build/web/
```

这些文件可以发布到仓库的 `gh-pages` 分支。

## 组员任务入口

4 名组员可以分别修改 `lib/main.dart` 中的不同位置：

1. 组员 A：修改 `projectTitle` 和 `projectSlogan`。
2. 组员 B：修改 `members`，补充真实姓名和分工。
3. 组员 C：修改 `features`，补充项目功能。
4. 组员 D：修改 `releaseNotes`，补充部署说明和访问地址。

每名组员都应该在自己的分支上修改，提交 commit，然后向组长发起 Pull Request。
