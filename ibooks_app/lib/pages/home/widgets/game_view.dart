import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  List<String> menus = [
    'sport',
    'sport1',
    'sport2',
    'sport3',
    'sport4',
    'sport5',
    'sport6'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildMenu(), 10.horizontalSpace, _buildContent()],
    );
  }

  Widget _buildMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: menus.map((e) {
        int initVal = 12;
        int idx = menus.indexOf(e);
        int middleIdx = (menus.length / 2).truncate();
        double marginValue = 0;
        if (middleIdx >= idx) {
          marginValue = (idx * initVal).toDouble();
        } else {
          marginValue = ((menus.length - idx - 1) * initVal).toDouble();
        }
        print('marginValue$marginValue');
        return Container(
          padding: EdgeInsets.only(left: marginValue.r),
          child: Image.asset(
            IbookIcons.homeSportIc,
            width: 50.w,
            height: 50.w,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContent() {
    return Expanded(
      flex: 1,
      child: Container(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                child: Image.asset(IbookIcons.homeGameBanner,
                    width: 168.w, height: 105.h),
              );
            }),
      ),
    );
  }
}
