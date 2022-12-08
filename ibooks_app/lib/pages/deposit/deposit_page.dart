/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 20:51:39
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 22:45:07
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/deposit/deposit_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 存款页面
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/data_entry/tab_button.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> with DepositPageBLoC {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10).r,
        margin: const EdgeInsets.only(top: 10).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTab(),
            Expanded(
                flex: 1,
                child: IndexedStack(
                  index: currentTabIndex,
                  children: [_buildGeneral(), _buildUsdt()],
                ))
          ],
        ),
      ),
    );
  }

  /// 普通充值
  Widget _buildGeneral() {
    return EasyRefresh(
        child: CustomScrollView(
      slivers: [
        SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return const Text('我是谁!!!');
            }), childCount: 30),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4))
      ],
    ));
  }

  /// 虚拟币充值
  Widget _buildUsdt() {
    return const EasyRefresh(child: Text('33'));
  }

  /// 渲染tab
  Widget _buildTab() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TabButton(
          '普通充值',
          isActive: currentTabIndex == 0,
          onTap: () {
            setState(() {
              currentTabIndex = 0;
            });
          },
        ),
        TabButton(
          '虚拟币充值',
          isActive: currentTabIndex == 1,
          onTap: () {
            setState(() {
              currentTabIndex = 1;
            });
          },
        )
      ],
    );
  }

  // appbar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: const Text('存款'),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              IbookIcons.globalService,
              width: 22.w,
              height: 22.h,
            ))
      ],
    );
  }
}

mixin DepositPageBLoC on State<DepositPage> {
  int currentTabIndex = 0;
}
