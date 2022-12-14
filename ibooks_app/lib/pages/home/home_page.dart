/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 18:38:39
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 20:21:10
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/home/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/home/widgets/game_view.dart';
import 'package:ibooks_app/routes/auth_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/swiper/ibook_indicator.dart';
import 'package:marqueer/marqueer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final controller = MarqueerController(); // 渲染header
  Widget _buildHeader() {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('I BOOKS APP',
                      style: TextStyle(color: IbookTheme.whiteColor)),
                  InkWell(
                    child: Icon(Icons.headphones_outlined,
                        color: IbookTheme.whiteColor),
                  )
                ],
              )),
          _buildSwiper()
        ],
      ),
    );
  }

  // 渲染swiper
  Widget _buildSwiper() {
    return SizedBox(
      height: 185.h,
      child: Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const SizedBox(
            child: FadeInImage(
              placeholder: AssetImage(IbookIcons.homeBanner),
              image: AssetImage(IbookIcons.homeBanner),
              fit: BoxFit.cover,
            ),
          );
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            builder: SwiperCustomPagination(builder: ((context, config) {
              return IbookIndicator(
                  currentIndex: config.activeIndex, itemCount: 4);
            }))),
      ),
    );
  }

  /// 消息
  Widget _buildNotice() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 14.sp),
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(IbookIcons.homeNoticeBg))),
      height: 30.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            child:
                Image.asset(IbookIcons.homeNotice, width: 14.sp, height: 14.h),
          ),
          Expanded(
              child: Marqueer(
                  pps: 30,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 30.h,
                    child: Text(
                        '激情世界杯，决战卡塔尔：11月1日-12月18日期间竞猜助威瓜分2888万；免费竞猜晋级队伍瓜分8888888；指定赛事竞猜比分场场瓜分388万，首存会员竞猜成功更有额外嘉奖；竞猜投注BOB赞助球队【荷兰】、【威尔士】赛事早盘，可申请100%包赔最高1188，赞助球队晋级或夺冠再享免费红包雨；点击【用户推荐链接】邀请好友，最高可得566元并享有30天内队员有效流水0.15%返利！',
                        style: TextStyle(
                            color: IbookTheme.defaultTextColor,
                            fontSize: 12.sp)),
                  )))
        ],
      ),
    );
  }

  /// 渲染用户信息
  Widget _buildUserInfo() {
    return GestureDetector(
      onTap: () {
        RoutesUtil.pushNamed(context, AuthRouter.signin);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '欢迎您，亲爱的用户',
            style:
                TextStyle(fontSize: 12.sp, color: IbookTheme.defaultTextColor),
          ),
          5.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('请先登录',
                  style: TextStyle(
                      fontSize: 12.sp, color: IbookTheme.defaultTextColor)),
              5.horizontalSpace,
              Image.asset(IbookIcons.homeUserArrowRight,
                  width: 18.sp, height: 18.sp)
            ],
          )
        ],
      ),
    );
  }

  /// 渲染单个action
  Widget _buildActionItem(String label, String iconName) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            children: [
              Image.asset(
                iconName,
                width: 24.sp,
                height: 24.sp,
                fit: BoxFit.contain,
              ),
              4.verticalSpace,
              Text(label,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12.r))
            ],
          )),
    );
  }

  /// 渲染用户action
  Widget _buildUserAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionItem('存款', IbookIcons.homeUserDisposit),
        _buildActionItem('取款', IbookIcons.homeUserWithdrawal),
        _buildActionItem('转账', IbookIcons.homeUserTransfer),
        _buildActionItem('会员', IbookIcons.homeUserVip),
      ],
    );
  }

  /// 渲染用户
  Widget _buildUser() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 6.sp),
        padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 12.sp),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  IbookIcons.homeUserBg,
                ))),
        child: Column(
          children: [
            _buildNotice(),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildUserInfo(),
                Expanded(flex: 1, child: _buildUserAction()),
              ],
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      // ),
      backgroundColor: IbookTheme.whiteColor02,
      body: Column(
        children: [
          _buildSwiper(),
          _buildUser(),
          const Expanded(child: GameView())
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
