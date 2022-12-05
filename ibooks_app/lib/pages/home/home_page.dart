/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 18:38:39
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 22:24:44
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/home/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/swiper/ibook_indicator.dart';
import 'package:marquee/marquee.dart';
import 'package:marqueer/marqueer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      height: 180,
      child: Swiper(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            child: const FadeInImage(
              placeholder: AssetImage(IbookIcons.homeBanner),
              image: AssetImage(IbookIcons.homeBanner),
              fit: BoxFit.fill,
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.notifications_on_outlined),
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
    return Column(
      children: const [Text('您还未登录'), Text('登录/注册')],
    );
  }

  /// 渲染用户action
  Widget _buildUserAction() {
    return Row(
      children: const [],
    );
  }

  /// 渲染用户
  Widget _buildUser() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildUserInfo(), _buildUserAction()],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      // ),
      backgroundColor: IbookTheme.whiteColor02,
      body: EasyRefresh(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          SliverToBoxAdapter(
            child: _buildNotice(),
          ),
          SliverToBoxAdapter(
            child: _buildUser(),
          )
        ],
      )),
    );
  }
}
