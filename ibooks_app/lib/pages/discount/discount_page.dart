/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-06 19:50:43
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 16:35:53
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/discount/discount_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/discount/widgets/activity_item.dart';
import 'package:ibooks_app/provider/discount_provider.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:provider/provider.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  /// 渲染内容
  List<Widget> _buildContent() {
    return [_buildActivityList()];
  }

  /// 渲染单个列表
  Widget _buildActivityList() {
    return EasyRefresh(
        onRefresh: () {
          Provider.of<DiscountProvider>(context, listen: false)
              .initActivityList();
        },
        refreshOnStart: true,
        footer: const ClassicFooter(position: IndicatorPosition.locator),
        child: Consumer<DiscountProvider>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.activityList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  child: ActivityItem(value.activityList[index]),
                );
              });
          // return CustomScrollView(
          //   slivers: [
          //     SliverList(
          //         delegate: SliverChildBuilderDelegate(((context, index) {
          //       return Selector<DiscountProvider, DiscountModal>(
          //           builder: ((context, value, child) {
          //             return Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 10.r),
          //               child: ActivityItem(value),
          //             );
          //           }),
          //           selector: (context, provider) =>
          //               provider.activityList[index]);
          //     }), childCount: value.activityList.length)),
          //     const FooterLocator.sliver()
          //   ],
          // );
        }));
  }

  TabBar get _tabBar => TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: Theme.of(context).primaryColor,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: IbookTheme.tabbarTextColor,
      tabs: const [Tab(text: '全部'), Tab(text: '热门活动')]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 10,
            title: const Text('优惠活动'),
            backgroundColor: IbookTheme.whiteColorAppbar,
            leading: const SizedBox(),
            bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize, child: _tabBar),
          )
        ];
      }),
      body: IndexedStack(
        index: tabIndex,
        children: _buildContent(),
      ),
    ));
  }
}
