// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:godo/src/presentation/tasks/components/custom_avatar.dart';

class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController listController;
  double toolbarHeight = 0;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    listController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: CustomScrollView(
            controller: listController,
            slivers: [
              SliverAppBar(
                title: Text('Godo'),
                actions: const [CustomAvatar()],
                centerTitle: true,
                primary: false,
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _CategoriesBarHeader(tabController: _tabController),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (ctx, i) => Dismissible(
                        key: ValueKey(i + 2),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            width: 10,
                            height: 10,
                          ),
                          title: Text('SampleTitle'),
                          subtitle: Text('SampleDescription'),
                          trailing: IconButton(onPressed: () => null, icon: Icon(Icons.star_border)),
                          isThreeLine: true,
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) => Dismissible(
                        key: ValueKey(i + 3),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            width: 10,
                            height: 10,
                          ),
                          title: Text('SampleTitle'),
                          subtitle: Text('SampleDescription'),
                          trailing: IconButton(onPressed: () => null, icon: Icon(Icons.star_border)),
                          isThreeLine: true,
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) => Dismissible(
                        key: ValueKey(i + 5),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            width: 10,
                            height: 10,
                          ),
                          title: Text('SampleTitle'),
                          subtitle: Text('SampleDescription'),
                          trailing: IconButton(onPressed: () => null, icon: Icon(Icons.star_border)),
                          isThreeLine: true,
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) => Dismissible(
                        key: ValueKey(i + 7),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            width: 10,
                            height: 10,
                          ),
                          title: Text('SampleTitle'),
                          subtitle: Text('SampleDescription'),
                          trailing: IconButton(onPressed: () => null, icon: Icon(Icons.star_border)),
                          isThreeLine: true,
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) => Dismissible(
                        key: ValueKey(i + 8),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            width: 10,
                            height: 10,
                          ),
                          title: Text('SampleTitle'),
                          subtitle: Text('SampleDescription'),
                          trailing: IconButton(onPressed: () => null, icon: Icon(Icons.star_border)),
                          isThreeLine: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom delegate to control the sliver's behavior
class _CategoriesBarHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 40.0; // Minimum height of the header when it's pinned
  @override
  double get maxExtent => 40.0; // Maximum height of the header
  final TabController tabController;

  _CategoriesBarHeader({required this.tabController});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // The header widget that will appear when pinned
    return TabBar(
      controller: tabController,
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      tabs: [
        Text('Sample1'),
        Text('Sample2'),
        Text('Sample3'),
        Text('Sample4'),
        Text('Sample5'),
        RichText(
          overflow: TextOverflow.visible,
          text: TextSpan(
            children: const [
              WidgetSpan(child: Icon(Icons.add), alignment: PlaceholderAlignment.middle),
              TextSpan(text: 'Add category', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
      onTap: (i) => i == 5
          ? showBottomSheet(
              context: context,
              builder: (context) => Center(
                child: Text('Sheet'),
              ),
            )
          : null,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // You can use this to decide when the header should be rebuilt
  }
}
