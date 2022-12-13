import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/model/WithdrawalVenueModal.dart';
import 'package:ibooks_app/provider/withdrawal_provider.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/Spin.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';
import 'package:marqueer/marqueer.dart';
import 'package:provider/provider.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({super.key});

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage>
    with SingleTickerProviderStateMixin {
  late CurvedAnimation animation;
  late AnimationController controller;
  var _mFuture;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    Animation<double> linearAnimation =
        Tween<double>(begin: 0.25, end: 1).animate(controller);

    animation =
        CurvedAnimation(parent: linearAnimation, curve: Curves.easeInOut)
          ..addListener(() {
            setState(() {});
          });
    _mFuture = _initVenues();
    // controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: FutureBuilder(
          future: _mFuture,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                margin: EdgeInsets.only(top: 10.r),
                child: EasyRefresh(
                    onRefresh: () {},
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      children: [
                        _buildNotice(),
                        _buildVenuesContent(),
                        30.verticalSpace,
                        _buildBtn(),
                        10.verticalSpace,
                        _buildBankContent()
                      ],
                    )),
              );
            }
            return const Center(
              child: Spin(),
            );
          })),
    );
  }

  /// bank-content
  Widget _buildBankContent() {
    return IbookBoxShadow(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40).r,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              RoutesUtil.pushNamed(context, HomeRouter.bindBank);
            },
            child: Image.asset(IbookIcons.withdrawalAddBank,
                width: 56.w, height: 56.w),
          ),
          2.verticalSpace,
          Text('绑定银行卡',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 14)),
          Text('(最多可绑定10张银行卡)',
              style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor1))
        ],
      ),
    );
  }

  /// withdrawal按钮
  Widget _buildBtn() {
    return InkWell(
      child: Container(
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(250, 227, 218, 1),
                  Color.fromRGBO(213, 138, 113, 1)
                ]),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, -1),
                  blurRadius: 3,
                  color: Color.fromRGBO(245, 205, 192, 1),
                  blurStyle: BlurStyle.inner)
            ]),
        child: Text('极速取款',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: IbookTheme.whiteColor)),
      ),
    );
  }

  /// venues
  Future _initVenues() async {
    print('更新');
    await Future.delayed(const Duration(milliseconds: 600));
    Provider.of<WithdrawalProvider>(context, listen: false).initVenueList();
  }

  /// venue content
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
            8.verticalSpace,
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
          height: ((animation.value * 46) * 7).h,
          child: Selector<WithdrawalProvider, WithdrawalProvider>(
              selector: (p0, p1) => p1,
              shouldRebuild: (previous, next) => false,
              builder: (context, value, child) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.veneues.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 2 / 1,
                        mainAxisSpacing: 10.r),
                    itemBuilder: (context, index) {
                      return _buildVenueItem(value.veneues[index]);
                    });
              }),
        ),
        10.verticalSpace,
        InkWell(
          onTap: () {
            if (animation.value == 1) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: SizedBox(
            height: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '显示所有场馆',
                  style:
                      TextStyle(fontSize: 14.sp, color: IbookTheme.grayColor2),
                ),
                3.horizontalSpace,
                Image.asset(IbookIcons.withdrawalArrowDown,
                    width: 12.w, height: 12.w)
              ],
            ),
          ),
        )
      ],
    );
  }

  /// 渲染单个场馆
  Widget _buildVenueItem(WithdrawalVenueModal venueModal) {
    return Container(
      height: 10.h,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            venueModal.api_title,
            style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor1),
          ),
          Text(
            venueModal.balance,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
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
