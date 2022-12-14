/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 18:41:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 20:50:24
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/promo/promo_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 优惠页面
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/provider/sponsor_provider.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:provider/provider.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: IbookTheme.whiteColorAppbar,
        title: const Text('赞助专题'),
      ),
      body: EasyRefresh(
          onRefresh: () {
            Provider.of<SponsorProvider>(context, listen: false)
                .initSponsorList();
          },
          refreshOnStart: true,
          child: Consumer<SponsorProvider>(builder: (context, value, child) {
            return ListView.builder(itemBuilder: (context, index) {
              final item = value.sponsorList[index];
              return Container(
                height: 150.h,
                margin: EdgeInsets.only(top: 10.r),
                child: FadeInImage(
                    placeholder: const AssetImage(IbookIcons.disPlaceholder),
                    image: NetworkImage(item.cover_img_day)),
              );
            });
          })),
    );
  }
}
