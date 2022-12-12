import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/deposit/widgets/deposit_button.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 虚拟币投注

class UsdtDeposit extends StatefulWidget {
  const UsdtDeposit({super.key});

  @override
  State<UsdtDeposit> createState() => _UsdtDepositState();
}

class _UsdtDepositState extends State<UsdtDeposit> with UsdtDepositBLoC {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: easyController,
      onRefresh: () {
        easyController.finishRefresh();
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildBanner(),
          ),
          SliverToBoxAdapter(
            child: _buildWallteProtocol(),
          ),
          SliverToBoxAdapter(
            child: _buildUsdtImage(),
          ),
          SliverToBoxAdapter(
            child: _buildHint(),
          )
        ],
      ),
    );
  }

  /// 渲染hint
  Widget _buildHint() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(top: 15).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor1),
                children: [
                  const TextSpan(text: "1.向该地址充值后，资金直接入账BOB用户："),
                  TextSpan(
                      text: 'chenwen22',
                      style: TextStyle(
                          fontSize: 12.sp, color: IbookTheme.orangeColor))
                ])),
            4.verticalSpace,
            Text.rich(
              TextSpan(
                  style:
                      TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor1),
                  children: [
                    const TextSpan(text: "2.请勿向上述地址充值任何非 "),
                    TextSpan(
                        text: 'USDT-ERC20',
                        style: TextStyle(
                            fontSize: 12.sp, color: IbookTheme.orangeColor)),
                    const TextSpan(text: " 和 "),
                    TextSpan(
                        text: 'USDT-TRC20',
                        style: TextStyle(
                            fontSize: 12.sp, color: IbookTheme.orangeColor)),
                    const TextSpan(text: '的货币，否则将无法找回，一概自行负责。')
                  ]),
              maxLines: 2,
            ),
            4.verticalSpace,
            Text.rich(TextSpan(
                style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor1),
                children: [
                  const TextSpan(text: "3.当前汇率为："),
                  TextSpan(
                      text: '7.08 ',
                      style: TextStyle(
                          fontSize: 12.sp, color: IbookTheme.orangeColor)),
                  const TextSpan(text: "CNY/USDT（仅供参考，以实际上分为准）。"),
                ])),
            4.verticalSpace,
            Text.rich(TextSpan(
                style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor1),
                children: const [
                  TextSpan(text: "4.具体到账金额以实际到账金额为准"),
                ]))
          ],
        ));
  }

  /// 渲染usdturl
  Widget _buildUsdtImage() {
    return IbookBoxShadow(
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 8),
        margin: EdgeInsets.only(top: 15.r),
        child: Column(
          children: [
            Text('请充值任意数量 USDT 到下面地址，均可自动上分',
                style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor)),
            Container(
                margin: EdgeInsets.only(top: 10.r),
                width: 152.w,
                height: 152.w,
                child: QrImage(
                  data: '0x571C25634F459490861Fc21CaF273916040B4EBB',
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 10.r),
              child: const DepositButton('保存二维码'),
            ),
            _buildUsdtUrl()
          ],
        ));
  }

  /// 渲染虚拟币充值地址
  Widget _buildUsdtUrl() {
    return Container(
      padding: const EdgeInsets.all(10).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: const Color.fromRGBO(255, 238, 233, .5),
      ),
      child: Row(
        children: [
          Text('充币地址：',
              style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: Text('0x571C25634F459490861Fc21CaF273916040B4EBB',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12.sp, color: IbookTheme.grayColor)))),
          const DepositButton('复制')
        ],
      ),
    );
  }

  /// 渲染协议
  Widget _buildWallteProtocol() {
    return IbookBoxShadow(
      margin: EdgeInsets.only(top: 10.r),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8).r,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('钱包协议',
                style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor)),
            Text(
              '点我了解更多',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12.sp,
                  color: IbookTheme.primaryColor),
            )
          ])
        ],
      ),
    );
  }

  /// 渲染banner
  Widget _buildBanner() {
    return Image.asset(IbookIcons.depositUsdtBanner,
        width: 351.w, height: 101.h);
  }
}

mixin UsdtDepositBLoC on State<UsdtDeposit> {
  late EasyRefreshController easyController;

  @override
  void initState() {
    super.initState();
    easyController = EasyRefreshController(
        controlFinishLoad: true, controlFinishRefresh: true);
  }
}
