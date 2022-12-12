/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-08 20:51:39
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-09 15:10:35
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/deposit/deposit_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/deposit/widgets/general_deposit.dart';
import 'package:ibooks_app/pages/deposit/widgets/usdt_deposit.dart';
import 'package:ibooks_app/provider/deposit_provider.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/Spin.dart';
import 'package:ibooks_app/widgets/data_entry/tab_button.dart';
import 'package:provider/provider.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> with DepositPageBLoC {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExtendedNestedScrollView(
      onlyOneScrollInBody: true,
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [_buildAppBar()];
      }),
      body: Container(
        // height: double.infinity,
        margin: EdgeInsets.only(top: 10.r),
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          children: [
            _buildTab(),
            FutureBuilder(
                future: _buildFuture(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: IndexedStack(
                        index: currentTabIndex,
                        children: const [
                          ExtendedVisibilityDetector(
                              uniqueKey: Key('Tab0'), child: GeneralDeposit()),
                          ExtendedVisibilityDetector(
                              uniqueKey: Key('Tab1'), child: UsdtDeposit())
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: Spin(),
                  );
                })
          ],
        ),
      ),
    ));
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
  SliverAppBar _buildAppBar() {
    return SliverAppBar(
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
  int currentTabIndex = 1;

  Future _buildFuture() async {
    return Future.delayed(const Duration(milliseconds: 450)).then((value) {
      Provider.of<DepositProvider>(context, listen: false)
          .initDepositChannelList();
    });
  }
}
