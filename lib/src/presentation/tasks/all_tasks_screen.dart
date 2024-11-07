// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:godo/core/router/routes.dart';
import 'package:godo/src/domain/entities/task.dart';
import 'package:godo/src/presentation/tasks/components/add_task_bottomsheet.dart';
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
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == _tabController.length - 1) {
        _tabController.animateTo(_tabController.previousIndex, duration: Duration.zero);
      }
    });
    listController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: add these under didUpdate so that they only change when the theme changes
    SystemChrome.setSystemUIOverlayStyle(Theme.of(context).brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.1, maxHeight: MediaQuery.of(context).size.height * 0.95),
          isScrollControlled: true,
          isDismissible: true,
          showDragHandle: true,
          enableDrag: true,
          context: context,
          builder: (context) => AddTaskBottomSheet(),
        ),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: listController,
          slivers: [
            SliverAppBar(
              title: Text('Godo'),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny)), CustomAvatar()],
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
                  ReorderableListView(
                    onReorder: (oldIndex, newIndex) {},
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 10),
                    children: List.generate(
                      10,
                      (i) => ListTile(
                        onTap: () => context.push(
                          Routes.updateTaskScreen,
                          extra: Task(
                            id: 'i+1',
                            title: 'SampleTitle$i',
                            description: 'SampleDescription$i',
                            createdAt: DateTime.now(),
                            reminder: DateTime.now().subtract(Duration(days: 2)),
                          ),
                        ),
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        key: ValueKey(i + 1),
                        leading: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Theme.of(context).primaryColor)),
                          width: 20,
                          height: 48,
                          child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {},
                                radius: 3,
                                splashColor: Colors.grey,
                                highlightColor: Colors.transparent,
                                // overlayColor: WidgetStatePropertyAll(Colors.transparent),
                              )),
                        ),
                        title: Text('SampleTitle$i'),
                        subtitle: Text('SampleDescription'),
                        // TODO: improvise handling multiline descriptions
                        isThreeLine: true,
                        trailing: IconButton(onPressed: () => null, icon: Icon(Icons.star_border)),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        10,
                        (i) => ListTile(
                          leading: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            width: 10,
                            height: 10,
                          ),
                          title: Text('SampleTitle${i + 1}'),
                          subtitle: Text('SampleDescription'),
                          trailing: IconButton(onPressed: () => null, icon: Icon(Icons.star_border)),
                          isThreeLine: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  rebuild() => setState(() {});
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
    return Material(
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        tabs: [
          Text('Sample1'),
          Text('Sample2'),
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
        onTap: (i) {
          if (i == tabController.length - 1) {
            showBottomSheet(
              context: context,
              builder: (context) => Center(
                child: Text('Sheet'),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _CategoriesBarHeader oldDelegate) {
    if (tabController.index == 2) {
      tabController.animateTo(0);
      return true;
    }
    return false;
  }
}
