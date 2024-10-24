import 'package:blog_somnio_test/features/blog/presentation/widgets/widgets.dart';
import 'package:blog_somnio_test/widgets/global_widget.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: HeaderWidget(),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _FixedTabBar(
                tabBar: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Posts'),
                    Tab(text: 'Otro tab'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            PostsWidget(),
            Center(child: Text('Other section')),
          ],
        ),
      ),
    );
  }
}

class _FixedTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _FixedTabBar({required this.tabBar});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
