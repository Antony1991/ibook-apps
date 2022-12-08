/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-05 18:41:10
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 20:23:29
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

class SponsorPage extends StatefulWidget {
  const SponsorPage({super.key});

  @override
  State<SponsorPage> createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            return ListView.builder(
                itemCount: value.sponsorList.length,
                itemBuilder: (context, index) {
                  final item = value.sponsorList[index];
                  return Container(
                    height: 150.h,
                    margin: EdgeInsets.only(top: 10.r),
                    child: FadeInImage(
                        placeholder:
                            const AssetImage(IbookIcons.disPlaceholder),
                        image: NetworkImage(item.cover_img_day)),
                  );
                });
          })),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
