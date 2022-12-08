/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 18:42:02
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 20:21:57
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/profile/profile_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 我的页面
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/pages/profile/Widgets/MemberGrade.dart';
import 'package:ibooks_app/pages/profile/Widgets/ProfileFunction.dart';
import 'package:ibooks_app/pages/profile/Widgets/UserInfo.dart';
import 'package:ibooks_app/pages/profile/Widgets/UserWallet.dart';
import 'package:ibooks_app/provider/user_provider.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';
import 'package:ibooks_app/widgets/swiper/ibook_indicator.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with ProfilePageBLoC, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: IbookTheme.whiteColorAppbar,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
              child: Row(
                children: [
                  Consumer<UserProvider>(
                      builder: ((context, user, child) => user.userInfo != null
                          ? Expanded(child: UserInfo(user.userInfo!))
                          : const SizedBox())),
                  InkWell(
                      onTap: () {},
                      child: Image.asset(IbookIcons.profileNotice,
                          width: 16.w, height: 16.h))
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: MemberGrade(),
          ),
          const SliverToBoxAdapter(
            child: UserWallet(),
          ),
          SliverToBoxAdapter(
            child: _buildSwiper(),
          ),
          SliverToBoxAdapter(
            child: _buildFunction(),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              child: IbookBoxShadow(
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 46).r,
                child: Container(
                  alignment: Alignment.center,
                  height: 43.h,
                  child: Text('退出登录',
                      style: TextStyle(
                          color: IbookTheme.tabbarTextColor, fontSize: 14.sp)),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  /// 渲染我的功能
  Widget _buildFunction() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      margin: const EdgeInsets.only(top: 30).r,
      child: IbookBoxShadow(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.r),
            child: Row(
              children: [
                Image.asset(IbookIcons.profileTitleBar,
                    width: 5.w, height: 14.h),
                10.horizontalSpace,
                Text('我的功能',
                    style: TextStyle(
                        color: IbookTheme.defaultTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const ProfileFunction()
        ],
      )),
    );
  }

  // 渲染swiper
  Widget _buildSwiper() {
    return Container(
      height: 111.h,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      margin: EdgeInsets.only(top: 15.r),
      child: Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const SizedBox(
            child: FadeInImage(
              placeholder: AssetImage(IbookIcons.disPlaceholder),
              image: AssetImage(IbookIcons.profileBanner1),
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: SwiperCustomPagination(builder: ((context, config) {
              return IbookIndicator(
                  currentIndex: config.activeIndex, itemCount: 4);
            }))),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

mixin ProfilePageBLoC on State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).initUserInfo();
  }
}
