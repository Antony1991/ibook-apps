/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-06 21:19:33
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 19:51:56
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/discount/widgets/activity_item.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/model/DiscountModal.dart';
import 'package:ibooks_app/pages/discount/discount_detail_page.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/routes/routes_util.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';

class ActivityItem extends StatelessWidget {
  final DiscountModal item;
  const ActivityItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: IbookTheme.whiteColorAppbar,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: const Offset(1, 2),
                blurRadius: 3.r)
          ]),
      margin: EdgeInsets.only(top: 10.r),
      // padding: EdgeInsets.all(10.r),
      alignment: Alignment.center,
      child: _buildContent(context),
    );
  }

  /// 渲染时间
  Widget _buildDesc() {
    return Positioned(
      left: 10.r,
      top: 10.r,
      child: Row(
        children: [
          Text(
              '距活动开始：${item.startAt.split(' ').first} - ${item.endAt.split(' ').first}',
              style: TextStyle(
                  color: IbookTheme.defaultTextColor, fontSize: 12.sp))
        ],
      ),
    );
  }

  /// 渲染内容区域
  Widget _buildContent(context) {
    return InkWell(
      onTap: () {
        RoutesUtil.pushNamed(context, HomeRouter.discountDetail,
            arguments: DiscountDetailQuery(item.title, item.content));
      },
      child: Stack(
        children: [
          FadeInImage(
              fit: BoxFit.fill,
              placeholder: const AssetImage(IbookIcons.disPlaceholder),
              image: NetworkImage(item.h5ListImgPath)),
          _buildDesc(),
        ],
      ),
    );
  }
}
