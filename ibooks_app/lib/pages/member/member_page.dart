import 'package:card_swiper/card_swiper.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> with TickerProviderStateMixin {
  late TabController tabController;
  List<String> vipList = [
    IbookIcons.memberVip0,
    IbookIcons.memberVip1,
    IbookIcons.memberVip2,
    IbookIcons.memberVip3,
    IbookIcons.memberVip4,
    IbookIcons.memberVip5,
    IbookIcons.memberVip6,
    IbookIcons.memberVip7,
    IbookIcons.memberVip8,
    IbookIcons.memberVip9,
    IbookIcons.memberVip10,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: EasyRefresh(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildSwiper(),
          ),
          SliverToBoxAdapter(
            child: _buildContent(),
          )
        ],
      )),
    );
  }

  /// content
  Widget _buildContent() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).r,
        child: Column(
          children: [
            _buildGradeInfo(),
            10.verticalSpace,
            _buildLimit(),
            10.verticalSpace,
            _buildDiscount(),
            10.verticalSpace,
            _buildHint()
          ],
        ));
  }

  /// hint
  Widget _buildHint() {
    return Text(
      '注：以上为BOB自研场馆（包含博雅棋牌）、IM体育、FB体育、AG真人最高返水比例，具体返水金额请以实际游戏为准，其它疑问请联系7*24在线客服咨询。',
      style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor3),
    );
  }

  /// discount
  Widget _buildDiscount() {
    return IbookBoxShadow(
        padding: const EdgeInsets.only(bottom: 15).r,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10.r, top: 5.r),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6).r,
                  color: IbookTheme.whiteColor,
                  child: Row(
                    children: [
                      Image.asset(IbookIcons.profileTitleBar,
                          width: 5.w, height: 14.h),
                      10.horizontalSpace,
                      Text('VIP优惠',
                          style: TextStyle(
                              color: IbookTheme.defaultTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
            ),
            _buildDiscountList()
          ],
        ));
  }

  /// discountList
  Widget _buildDiscountList() {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 60.h, mainAxisSpacing: 10.r),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0.38%',
                  style: TextStyle(
                      fontSize: 24.sp, color: Theme.of(context).primaryColor)),
              10.verticalSpace,
              Text('体育反水',
                  style: TextStyle(
                      fontSize: 12.sp, color: IbookTheme.defaultTextColor))
            ],
          );
        });
  }

  /// limit
  Widget _buildLimit() {
    return IbookBoxShadow(
        padding: const EdgeInsets.only(bottom: 15).r,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10.r, top: 5.r),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6).r,
                  color: IbookTheme.whiteColor,
                  child: Row(
                    children: [
                      Image.asset(IbookIcons.profileTitleBar,
                          width: 5.w, height: 14.h),
                      10.horizontalSpace,
                      Text('VIP提款额度',
                          style: TextStyle(
                              color: IbookTheme.defaultTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
            ),
            _buildLimitRow()
          ],
        ));
  }

  Widget _buildLimitRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      child: Row(
        children: [
          _buildLimitItem(IbookIcons.memberTimeUp, '提款次数提升', '5次'),
          15.horizontalSpace,
          _buildLimitItem(IbookIcons.memberMoneyUp, '提款额度提升', '20万/日')
        ],
      ),
    );
  }

  Widget _buildLimitItem(String iconName, String label, String value) {
    return Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.all(10).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: IbookTheme.whiteColor),
          child: Row(
            children: [
              Image.asset(iconName, width: 31.w, height: 31.w),
              8.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                        color: IbookTheme.defaultTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                        color: IbookTheme.grayColor3, fontSize: 12.sp),
                  )
                ],
              )
            ],
          ),
        ));
  }

  /// grade
  Widget _buildGradeInfo() {
    return IbookBoxShadow(
        padding: const EdgeInsets.all(15).r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'VIP0',
                  style: TextStyle(
                      fontSize: 14.sp, color: IbookTheme.defaultTextColor),
                ),
                10.horizontalSpace,
                Image.asset(
                  IbookIcons.profileDefProgress,
                  fit: BoxFit.fill,
                  width: 221.w,
                  height: 10.h,
                ),
                10.horizontalSpace,
                Text(
                  'VIP1',
                  style: TextStyle(
                      fontSize: 14.sp, color: IbookTheme.defaultTextColor),
                )
              ],
            ),
            4.verticalSpace,
            Text('您已完成0.00流水 （每日16点更新）',
                style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor3))
          ],
        ));
  }

  /// swiper
  Widget _buildSwiper() {
    return SizedBox(
      height: 144.h,
      child: Swiper(
        loop: false,
        itemCount: vipList.length,
        viewportFraction: .8,
        scale: .9,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 296.w,
            height: 144.h,
            child: FadeInImage(
                fit: BoxFit.contain,
                image: AssetImage(vipList[index]),
                placeholder: const AssetImage(IbookIcons.disPlaceholder)),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: TabBar(
          controller: tabController,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: IbookTheme.tabbarTextColor,
          isScrollable: true,
          tabs: const [
            Tab(
              text: 'VIP特权',
            ),
            Tab(text: 'VIP详情')
          ]),
    );
  }
}
