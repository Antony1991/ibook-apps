/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 22:28:44
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 22:13:53
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/index/index_route.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:ibooks_app/pages/home/home_page.dart';
import 'package:ibooks_app/pages/news/news_page.dart';
import 'package:ibooks_app/pages/profile/profile_page.dart';
import 'package:ibooks_app/pages/promo/promo_page.dart';
import 'package:ibooks_app/pages/sponsor/sponsor_page.dart';
import 'package:ibooks_app/styles/theme.dart';

/// 首页带tabbottom
class IndexRoute extends StatefulWidget {
  const IndexRoute({super.key});

  @override
  State<IndexRoute> createState() => _IndexRouteState();
}

class _IndexRouteState extends State<IndexRoute>
    with AutomaticKeepAliveClientMixin {
  int tabIdex = 0;
  BottomNavigationBarItem _buildBarItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
        icon: Icon(iconData, color: IbookTheme.tabbarTextColor),
        label: label,
        activeIcon: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        index: tabIdex,
        children: const [
          HomePage(),
          PromoPage(),
          NewsPage(),
          SponsorPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIdex,
        onTap: (value) {
          print('--------$value');
          setState(() {
            tabIdex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        unselectedItemColor: IbookTheme.tabbarTextColor,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          _buildBarItem(Icons.home_outlined, '首页'),
          _buildBarItem(Icons.redeem_outlined, '活动'),
          _buildBarItem(Icons.manage_search_outlined, '发现'),
          _buildBarItem(Icons.access_time_outlined, '赞助'),
          _buildBarItem(Icons.account_circle_outlined, '我的')
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
