/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 18:38:39
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 20:21:10
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/home/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'dart:convert';
import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/routes/auth_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/swiper/ibook_indicator.dart';
import 'package:marquee/marquee.dart';
import 'package:marqueer/marqueer.dart';
import 'package:path_provider/path_provider.dart';

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
              child: Marquee(
                  text:
                      '---232323023020302302094993434340023423423042340234934934929400sdksdkskdksdkskdksdksdkskd'))
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
    // TODO: implement initState
    rootBundle.loadString('assets/json/discount_json.json').then((value) async {
      var valueMap = json.decode(value);
      List<dynamic> newList = [];
      for (var element in (valueMap['data'] as List<dynamic>)) {
        Map<String, dynamic> map = {};
        element = Map<String, dynamic>.from(element);
        map['id'] = element['id'];
        map['type'] = element['type'];
        map['startAt'] = element['startAt'];
        map['endAt'] = element['endAt'];
        map['tag'] = element['tag'];
        map['title'] = element['title'];
        map['h5ListImgPath'] = element['h5ListImgPath'];
        map['content'] = element['content'];
        newList.add(map);
      }
      valueMap['data'] = newList;
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/test.json');
      await file.writeAsString(json.encode(valueMap));
    });
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
      body: EasyRefresh(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildSwiper(),
          ),
          SliverToBoxAdapter(
            child: _buildUser(),
          )
        ],
      )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
