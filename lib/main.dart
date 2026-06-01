import 'package:flutter/material.dart';

void main() {
  runApp(const GroupFlutterPagesApp());
}

class GroupFlutterPagesApp extends StatelessWidget {
  const GroupFlutterPagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '小组 Flutter Web 展示页',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TeamHomePage(),
    );
  }
}

class TeamHomePage extends StatefulWidget {
  const TeamHomePage({super.key});

  static const String projectTitle = '星火小组 Flutter Web 展示页';
  static const String projectSlogan = '用 GitHub 协作完成一次真实的小组项目发布';
  static const String projectCreatedAt = '2024-01-15';
  static const String lastUpdatedAt = '2024-06-01';

  static const List<TeamMember> members = [
    TeamMember(role: '组长', name: '李组长', task: '创建仓库、维护 main 分支、审核 PR、发布 GitHub Pages', githubUrl: 'https://github.com/vito67291-bot'),
    TeamMember(role: '组员 A', name: '成员 A', task: '修改首页标题和项目口号', githubUrl: 'https://github.com/memberA'),
    TeamMember(role: '组员 B', name: '成员 B', task: '补充成员介绍卡片', githubUrl: 'https://github.com/memberB'),
    TeamMember(role: '组员 C', name: '成员 C', task: '补充项目功能列表', githubUrl: 'https://github.com/Pyleandinspire'),
    TeamMember(role: '组员 D', name: '成员 D', task: '补充发布说明和访问地址', githubUrl: 'https://github.com/memberD'),
  ];

  static const List<String> features = [
    'Flutter Web 单页应用',
    'GitHub Pull Request 协作',
    '组长审核与合并代码',
    'GitHub Pages 静态站点发布',
  ];

  static const List<String> releaseNotes = [
    '源码保存在 main 分支。',
    'Flutter Web 编译产物发布到 gh-pages 分支。',
    '组长合并 PR 后统一执行部署命令。',
  ];

  @override
  State<TeamHomePage> createState() => _TeamHomePageState();
}

class _TeamHomePageState extends State<TeamHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showBackToTop = _scrollController.offset > 300;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('小组项目展示')),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 20),
          TimestampSection(),
          SizedBox(height: 20),
          MembersSection(),
          SizedBox(height: 20),
          FeaturesSection(),
          SizedBox(height: 20),
          ReleaseSection(),
          SizedBox(height: 20),
          FooterSection(),
        ],
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: '返回顶部',
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              TeamHomePage.projectTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(TeamHomePage.projectSlogan, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class MembersSection extends StatelessWidget {
  const MembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('小组成员与分工', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...TeamHomePage.members.map((member) => MemberCard(member: member)),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(member.role.characters.last)),
        title: Text('${member.role}：${member.name}'),
        subtitle: Text(member.task),
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('项目功能', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.features.map((feature) => Text('• $feature')),
          ],
        ),
      ),
    );
  }
}

class ReleaseSection extends StatelessWidget {
  const ReleaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('发布说明', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...TeamHomePage.releaseNotes.map((note) => Text('• $note')),
          ],
        ),
      ),
    );
  }
}

class TeamMember {
  const TeamMember({required this.role, required this.name, required this.task, this.githubUrl});

  final String role;
  final String name;
  final String task;
  final String? githubUrl;
}

class TimestampSection extends StatelessWidget {
  const TimestampSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.indigo),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('项目创建时间：${TeamHomePage.projectCreatedAt}', style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                Text('最后更新：${TeamHomePage.lastUpdatedAt}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  static const String repoUrl = 'https://github.com/vito67291-bot/group-flutter-pages-demo.git';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('社交链接', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('项目仓库：', style: TextStyle(fontWeight: FontWeight.w500)),
            InkWell(
              onTap: () => _launchUrl(repoUrl),
              child: const Text(
                repoUrl,
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 12),
            const Text('小组成员 GitHub：', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            ...TeamHomePage.members.map((member) => member.githubUrl != null
                ? InkWell(
                    onTap: () => _launchUrl(member.githubUrl!),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '• ${member.name}: ${member.githubUrl}',
                        style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                : Text('• ${member.name}: 暂无链接')),
            const SizedBox(height: 16),
            const Text('© 2024 星火小组', style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  static void _launchUrl(String url) {
    // 在实际项目中可以使用 url_launcher 包打开链接
    // 这里暂时只是打印提示
    print('打开链接: $url');
  }
}
