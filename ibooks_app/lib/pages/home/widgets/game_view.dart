import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  List<GameModel> menus = [
    GameModel(
        iconName: IbookIcons.homeSportIc,
        activeIconName: IbookIcons.homeActiveSportIc,
        value: 'sport'),
    GameModel(
        iconName: IbookIcons.homeEgameIc,
        activeIconName: IbookIcons.homeActiveEgameIc,
        value: 'egame'),
    GameModel(
        iconName: IbookIcons.homeLiveIc,
        activeIconName: IbookIcons.homeActiveLiveIc,
        value: 'live'),
    GameModel(
        iconName: IbookIcons.homeChessIc,
        activeIconName: IbookIcons.homeActiveChessIc,
        value: 'chess'),
    GameModel(
        iconName: IbookIcons.homeLotteryIc,
        activeIconName: IbookIcons.homeActiveLotteryIc,
        value: 'lottery'),
    GameModel(
        iconName: IbookIcons.homeGameIc,
        activeIconName: IbookIcons.homeActiveGameIc,
        value: 'game'),
    GameModel(
        iconName: IbookIcons.homeFishIc,
        activeIconName: IbookIcons.homeActiveFishIc,
        value: 'fish'),
  ];
  int activeIndex = 0;
  final ScrollController _controller = ScrollController();
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
      children: menus.map((GameModel gameModel) {
        int initVal = 12;
        int idx =
            menus.indexWhere((element) => element.value == gameModel.value);
        int middleIdx = (menus.length / 2).truncate();
        double marginValue = 0;
        if (middleIdx >= idx) {
          marginValue = (idx * initVal).toDouble();
        } else {
          marginValue = ((menus.length - idx - 1) * initVal).toDouble();
        }
        print('marginValue$marginValue');
        return InkWell(
            onTap: () {
              setState(() {
                activeIndex = idx;
              });
              _controller.animateTo(((105 * 4) * idx).h,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn);
            },
            child: Container(
              padding: EdgeInsets.only(left: marginValue.r),
              child: Image.asset(
                activeIndex == idx
                    ? gameModel.activeIconName
                    : gameModel.iconName,
                width: 50.w,
                height: 50.w,
              ),
            ));
      }).toList(),
    );
  }

  Widget _buildContent() {
    return Expanded(
      flex: 1,
      child: Container(
        child: ListView.builder(
            controller: _controller,
            itemCount: 27,
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

class GameModel {
  final String iconName;
  final String activeIconName;
  final String value;
  GameModel(
      {required this.iconName,
      required this.activeIconName,
      required this.value});
}
