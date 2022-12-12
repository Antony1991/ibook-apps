import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';
import 'package:marqueer/marqueer.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({super.key});

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage>
    with SingleTickerProviderStateMixin {
  late CurvedAnimation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    Animation<double> linearAnimation =
        Tween<double>(begin: 0, end: 1).animate(controller);

    animation =
        CurvedAnimation(parent: linearAnimation, curve: Curves.fastOutSlowIn)
          ..addListener(() {
            setState(() {});
          });
    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 10.r),
        child: EasyRefresh(
            onRefresh: () {},
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              children: [_buildNotice(), _buildVenuesContent()],
            )),
      ),
    );
  }

  /// 渲染场馆内容
  Widget _buildVenuesContent() {
    return IbookBoxShadow(
        margin: EdgeInsets.only(top: 10.r),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8).r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWalletItem(
                    IbookIcons.withdrawalCenterWallet, '中心钱包', '0.00'),
                _buildWalletItem(
                    IbookIcons.withdrawalLockWallet, '锁定钱包', '0.00'),
                _buildWalletItem(IbookIcons.withdrawalRecycle, '一键回收', ''),
              ],
            ),
            const Divider(),
            _buildVenuesList()
          ],
        ));
  }

  /// 渲染场馆列表
  Widget _buildVenuesList() {
    return Column(
      children: [
        SizedBox(
          height: animation.value == 0 ? 40.h : animation.value * 46 * 7,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 28,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2 / 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 10.h,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text('IM体育'), Text('0.00')],
                  ),
                );
              }),
        ),
        10.verticalSpace,
        InkWell(
          onTap: () {
            controller.forward();
          },
          child: SizedBox(
            height: 20.h,
            child: Text(
              '显示所有场馆',
              style: TextStyle(fontSize: 14.sp, color: IbookTheme.grayColor2),
            ),
          ),
        )
      ],
    );
  }

  /// 单个钱包
  Widget _buildWalletItem(String imgName, String label, String? money) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      decoration: money!.isNotEmpty
          ? BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 1.r,
                      color: const Color.fromRGBO(152, 163, 177, .2))))
          : const BoxDecoration(),
      child: Row(children: [
        Image.asset(imgName, width: 24.w, height: 24.w),
        5.horizontalSpace,
        money.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: TextStyle(
                          fontSize: 12.sp, color: IbookTheme.defaultTextColor)),
                  Text('¥$money',
                      style: TextStyle(
                          fontSize: 14.sp, color: IbookTheme.defaultTextColor))
                ],
              )
            : Text(label,
                style: TextStyle(
                    fontSize: 12.sp, color: IbookTheme.defaultTextColor))
      ]),
    );
  }

  Widget _buildNotice() {
    return Container(
      margin: EdgeInsets.only(top: 4.r, bottom: 10.r),
      padding: EdgeInsets.symmetric(horizontal: 4.r),
      height: 36.h,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 238, 233, .8),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(155, 128, 128, .24),
                offset: Offset(0, 3),
                blurRadius: 4)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.r),
              child: Image.asset(IbookIcons.depositNotice,
                  width: 14.w, height: 14.w)),
          Expanded(
            child: Marqueer(
                pps: 30,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 30.h,
                  child: Text(
                      '尊敬的会员：世界杯火热进行中，BOB为您送上福利，极力推荐您使用【预约极速取款】，0-12小时内取款-加送0.7%。12-24小时内取款-加送1.5%。福利不断，高潮不断，祝您游戏愉快！',
                      style: TextStyle(
                          color: IbookTheme.grayColor, fontSize: 12.sp)),
                )),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: const Text('存款'),
    );
  }
}
