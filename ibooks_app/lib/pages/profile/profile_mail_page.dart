import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:ibooks_app/styles/theme.dart';

class ProfileMailPage extends StatefulWidget {
  const ProfileMailPage({super.key});

  @override
  State<ProfileMailPage> createState() => _ProfileMailPageState();
}

class _ProfileMailPageState extends State<ProfileMailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  TabBar get _tabBar => TabBar(
      controller: tabController,
      indicatorColor: Theme.of(context).primaryColor,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: IbookTheme.tabbarTextColor,
      tabs: const [Tab(text: '收件箱'), Tab(text: '发件箱')]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                elevation: 10,
                title: const Text('消息公告'),
                backgroundColor: IbookTheme.whiteColorAppbar,
                bottom: PreferredSize(
                    preferredSize: _tabBar.preferredSize, child: _tabBar),
              )
            ];
          },
          body: const EasyRefresh(child: Text('22'))),
    );
  }
}
