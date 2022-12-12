/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-09 14:56:25
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-09 16:33:01
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/deposit/widgets/general_deposit.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/model/DepositChannelModal.dart';
import 'package:ibooks_app/pages/deposit/widgets/quick_money_list.dart';
import 'package:ibooks_app/provider/deposit_provider.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';
import 'package:marqueer/marqueer.dart';
import 'package:provider/provider.dart';

/// 普通充值

class GeneralDeposit extends StatefulWidget {
  const GeneralDeposit({super.key});

  @override
  State<GeneralDeposit> createState() => _GeneralDepositState();
}

class _GeneralDepositState extends State<GeneralDeposit>
    with GeneralDepositBLoC {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      header: const ClassicHeader(safeArea: false),
      footer: const ClassicFooter(position: IndicatorPosition.locator),
      onRefresh: () {},
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([_buildNotice()]),
          ),
          _buildChannelPay(),
          SliverToBoxAdapter(
            child: _buildCommonContent(),
          ),
          const FooterLocator.sliver()
        ],
      ),
    );
  }

  /// 渲染公共内容区域
  Widget _buildCommonContent() {
    if (currentChannelIdx == 0) {
      return _buildOnlineBankContent();
    }
    return _buildOnlineBankContent();
  }

  /// 渲染网银转账
  Widget _buildOnlineBankContent() {
    return Column(
      children: [
        10.verticalSpace,
        _buildHint(),
        10.verticalSpace,
        _buildNameField(),
        10.verticalSpace,
        _buildMoneyContent(),
        20.verticalSpace,
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () {}, child: const Text('立即存款')),
        )
      ],
    );
  }

  /// 存款金额
  Widget _buildMoneyContent() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5).r,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const QuickMoneyList(),
              4.verticalSpace,
              Text(
                '存款金额',
                style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor),
              ),
              4.verticalSpace,
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 25.h),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 4.r),
                      constraints: const BoxConstraints(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                      prefix: Padding(
                          padding: EdgeInsets.only(right: 4.r),
                          child: Text('¥',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: IbookTheme.defaultTextColor,
                                  fontSize: 20.sp))),
                      prefixIconConstraints: const BoxConstraints(),
                      hintText: '请输入存款金额：¥100.00～¥20000.00',
                      hintStyle:
                          TextStyle(fontSize: 10.sp, color: Colors.black38)),
                ),
              ),
              4.verticalSpace,
              Text(
                '使用手机银行APP进行相关操作，若支付遇风控拦截，请用其他充值方式进行存款',
                style:
                    TextStyle(fontSize: 12.sp, color: IbookTheme.orangeColor),
              )
            ],
          ),
        ));
  }

  /// 存储姓名
  Widget _buildNameField() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8).r,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('存款姓名',
                  style:
                      TextStyle(color: IbookTheme.grayColor, fontSize: 12.sp)),
              _buildNameInput()
            ],
          ),
        ));
  }

  /// 存储信息表单
  Widget _buildNameInput() {
    return const TextField(
      decoration: InputDecoration(hintText: '请输入存款姓名'),
    );
  }

  /// 渲染提示
  Widget _buildHint() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5.r),
      // margin: EdgeInsets.symmetric(vertical: 10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 250, 250, 1),
                Color.fromRGBO(255, 240, 235, 1)
              ]),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(128, 89, 75, .15),
                offset: Offset(0, 2),
                blurRadius: 3)
          ]),
      child: Text(
        '为了您的资金安全，请使用账号绑定的姓名存款',
        style: TextStyle(color: IbookTheme.orangeColor, fontSize: 12.sp),
      ),
    );
  }

  /// 渲染支付通道
  Widget _buildChannelPay() {
    return SliverToBoxAdapter(
      child: IbookBoxShadow(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
          child: Consumer<DepositProvider>(builder: ((context, data, child) {
            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.depositChannelList.length,
                itemBuilder: ((context, index) {
                  DepositChannelModal item = data.depositChannelList[index];
                  return GestureDetector(
                    onTap: () {
                      channelClick(index);
                    },
                    child: Container(
                        width: 76.w,
                        height: 76.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                width: currentChannelIdx == index ? 1.r : .2.r,
                                color: const Color.fromRGBO(215, 150, 127, 2))),
                        child: Stack(children: [
                          Container(
                              width: double.infinity,
                              height: double.infinity,
                              padding: EdgeInsets.only(top: 8.r),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 29.w,
                                    height: 29.w,
                                    child: FadeInImage(
                                        fit: BoxFit.fill,
                                        placeholder: const AssetImage(
                                            IbookIcons.disPlaceholder),
                                        image:
                                            NetworkImage(item.ios_icon_chosen)),
                                  ),
                                  2.verticalSpace,
                                  Text(item.card_name,
                                      style: TextStyle(
                                          color: IbookTheme.grayColor,
                                          fontSize: 12.sp)),
                                  item.hint.isNotEmpty
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 2.r),
                                          child: Text(
                                            '加送${item.rate}',
                                            style: TextStyle(
                                                color: IbookTheme.orangeColor,
                                                fontSize: 10.sp),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              )),
                          item.isRecommend == '1'
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Image.asset(IbookIcons.depositCommend,
                                      fit: BoxFit.fill,
                                      width: 27.w,
                                      height: 27.w),
                                )
                              : const SizedBox(),
                        ])),
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.r,
                    crossAxisSpacing: 10.r));
          }))),
    );
  }

  /// 通知
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
                      '尊敬的会员：极力推荐使用【极速存款】、【极速取款】，高效的存取款体验，减少银行风控监管，自主完成比在线存款更为高效。提款后请区分接收金额与转账附言备注，核查金额接收、余额变化无误后再点击确认按钮，谨防资金流失！',
                      style: TextStyle(
                          color: IbookTheme.grayColor, fontSize: 12.sp)),
                )),
          )
        ],
      ),
    );
  }
}

mixin GeneralDepositBLoC on State<GeneralDeposit> {
  int currentChannelIdx = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DepositProvider>(context, listen: false)
        .initDepositChannelList();
  }

  // 选择当前的channel
  void channelClick(int idx) {
    setState(() {
      currentChannelIdx = idx;
    });
  }
}
