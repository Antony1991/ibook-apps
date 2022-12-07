/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 22:28:44
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-06 21:47:23
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/index/index_route.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/discount/discount_page.dart';
import 'package:ibooks_app/pages/home/home_page.dart';
import 'package:ibooks_app/pages/news/news_page.dart';
import 'package:ibooks_app/pages/profile/profile_page.dart';
import 'package:ibooks_app/pages/sponsor/sponsor_page.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';

/// 首页带tabbottom
class IndexRoute extends StatefulWidget {
  const IndexRoute({super.key});

  @override
  State<IndexRoute> createState() => _IndexRouteState();
}

class _IndexRouteState extends State<IndexRoute>
    with AutomaticKeepAliveClientMixin {
  double iconSize = 30.sp;
  int tabIdex = 0;

  Widget _buildBarItemIcon(int currentIndex, String? icon, String? activeIcon) {
    if (currentIndex == tabIdex) {
      if (activeIcon!.isNotEmpty) {
        return Image.asset(activeIcon, width: iconSize, height: iconSize);
      }
      return SizedBox(height: 30.sp);
    }
    if (icon!.isNotEmpty) {
      return Image.asset(icon, width: iconSize, height: iconSize);
    }
    return SizedBox(height: 30.sp);
  }

  Widget _buildBarItem(
      String label, int currentIdx, String icon, String? activeIcon) {
    // 选中文字样式
    return Expanded(
        flex: 1,
        child: InkWell(
          child: SizedBox(
            height: 52.h,
            child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: SizedBox(
                  child: Center(
                    child: Column(
                      children: [
                        _buildBarItemIcon(currentIdx, icon, activeIcon),
                        Text(label,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: currentIdx == tabIdex
                                    ? Theme.of(context).primaryColor
                                    : IbookTheme.tabbarTextColor))
                      ],
                    ),
                  ),
                )),
          ),
          onTap: () {
            setState(() {
              tabIdex = currentIdx;
            });
          },
        ));

    // return BottomNavigationBarItem(
    //     icon: icon!.isNotEmpty
    //         ? Image.asset(
    //             icon,
    //             width: iconSize,
    //             height: iconSize,
    //             fit: BoxFit.contain,
    //           )
    //         : const SizedBox(),
    //     label: label,
    //     activeIcon: activeIcon!.isNotEmpty
    //         ? Image.asset(
    //             activeIcon,
    //             width: iconSize,
    //             height: iconSize,
    //             fit: BoxFit.contain,
    //           )
    //         : const SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        index: tabIdex,
        children: const [
          HomePage(),
          DiscountPage(),
          NewsPage(),
          SponsorPage(),
          ProfilePage()
        ],
      ),
      // 悬浮按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tabIdex = 0;
          });
        },
        child: Image.asset(IbookIcons.h_tab_home, width: 54.sp, height: 56.sp),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.sp,
        // selectedFontSize: 12.sp, // 选中时的字体大小
        // unselectedFontSize: 12.sp, // 未选中时的字体大小
        // type: BottomNavigationBarType.fixed, // 底部导航栏的类型
        // showUnselectedLabels: true, // 不选中时显示label
        // backgroundColor: Colors.white, // 背景
        // unselectedItemColor: IbookTheme.tabbarTextColor, // 未选中字体颜色
        // selectedItemColor: Theme.of(context).primaryColor, // 选中字体颜色
        // items: const [],
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBarItem('优惠', 1, IbookIcons.h_tab_discount,
                IbookIcons.h_tab_discount_select),
            _buildBarItem('客服', 2, IbookIcons.h_tab_problem,
                IbookIcons.h_tab_problem_select),
            _buildBarItem('首页', 0, '', ''),
            _buildBarItem('赞助', 3, IbookIcons.h_tab_sponsor,
                IbookIcons.h_tab_sponsor_select),
            _buildBarItem('我的', 4, IbookIcons.h_tab_profile,
                IbookIcons.h_tab_profile_select),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
