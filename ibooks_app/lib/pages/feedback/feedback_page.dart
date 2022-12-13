import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> with FeedbackPageBLoC {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: EasyRefresh(
          child: ListView(
        padding: const EdgeInsets.all(10).r,
        children: [
          _buildAccount(),
          10.verticalSpace,
          _buildTitle(),
          10.verticalSpace,
          _buildTitleHint(),
          10.verticalSpace,
          _buildContent(),
          10.verticalSpace,
          _buildImgHint(),
          20.verticalSpace,
          _buildBindBtn()
        ],
      )),
    );
  }

  /// bind btn
  Widget _buildBindBtn() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 10, bottom: 15).r,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(IbookIcons.depositActiveTabbg))),
        child: Text(
          '提交',
          style: TextStyle(fontSize: 16.sp, color: IbookTheme.whiteColor),
        ),
      ),
    );
  }

  Widget _buildImgHint() {
    return Text(
      '（图片仅支持JPG、PNG、JPEG、BMP格式文件，最大不可超过5M；视频仅支持.mp4、.mov格式，最大不可超出20M）',
      style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor3),
      maxLines: 3,
    );
  }

  /// content
  Widget _buildContent() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4).r,
        child: TextField(
          style: TextStyle(fontSize: 13.sp, color: IbookTheme.defaultTextColor),
          maxLines: 10,
          decoration: InputDecoration(
              hintText: '请输入内容',
              hintStyle:
                  TextStyle(color: IbookTheme.grayColor3, fontSize: 13.sp),
              border: const UnderlineInputBorder(borderSide: BorderSide.none)),
        ));
  }

  /// title hint
  Widget _buildTitleHint() {
    return Text(
      '尊敬的BOB会员，反馈有礼畅所欲言，说出您对平台的意见、建议，您的建议是我们前进的动力，我们将对有价值意见给予丰厚奖励，尽情吐槽吧！',
      style: TextStyle(fontSize: 12.sp, color: IbookTheme.grayColor3),
      maxLines: 4,
    );
  }

  /// 标题
  Widget _buildTitle() {
    return IbookBoxShadow(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: TextField(
        style: TextStyle(fontSize: 14.sp, color: IbookTheme.defaultTextColor),
        maxLines: 1,
        decoration: InputDecoration(
            hintText: '请输入内容',
            hintStyle: TextStyle(color: IbookTheme.grayColor3, fontSize: 14.sp),
            border: const UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }

  Widget _buildAccount() {
    return IbookBoxShadow(
        padding: const EdgeInsets.symmetric(horizontal: 15).r,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('账号问题'),
                InkWell(
                    onTap: () => openDialog(context),
                    child: Image.asset(
                      IbookIcons.globalArrowRight,
                      width: 16.w,
                      height: 16.w,
                    ))
              ],
            )));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: IbookTheme.whiteColorAppbar,
      title: const Text('意见反馈'),
    );
  }
}

enum SingingCharacter { finance, account, game, activity, other }

mixin FeedbackPageBLoC on State<FeedbackPage> {
  String? _character = 'finance';
  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return SimpleDialog(
              children: [
                RadioListTile<String>(
                    title: const Text('财务问题'),
                    value: 'finance',
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: _character,
                    onChanged: (String? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
                RadioListTile<String>(
                    title: const Text('账号问题'),
                    value: 'account',
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: _character,
                    onChanged: (String? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
                RadioListTile<String>(
                    title: const Text('游戏问题'),
                    value: 'game',
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: _character,
                    onChanged: (String? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
                RadioListTile<String>(
                    title: const Text('活动问题'),
                    value: 'activity',
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: _character,
                    onChanged: (String? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
                RadioListTile<String>(
                    title: const Text('其他问题'),
                    value: 'other',
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: _character,
                    onChanged: (String? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
              ],
            );
          }));
        });
  }
}
