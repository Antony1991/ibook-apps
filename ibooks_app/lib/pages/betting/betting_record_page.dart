import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/styles/icons.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:ibooks_app/widgets/layout/Ibook_box_shadow.dart';

class BettingRecordPage extends StatefulWidget {
  const BettingRecordPage({super.key});

  @override
  State<BettingRecordPage> createState() => _BettingRecordPageState();
}

class _BettingRecordPageState extends State<BettingRecordPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late EasyRefreshController _easyRefreshController;
  int currentTabIndex = 0;
  var pickerData2 = '''
[
    [
        1,
        2,
        3,
        4
    ],
    [
        11,
        22,
        33,
        44
    ],
    [
        "aaa",
        "bbb",
        "ccc"
    ]
]
    ''';
  TabBar get _tabBar => TabBar(
          onTap: (value) {
            _easyRefreshController.callRefresh();
          },
          controller: tabController,
          isScrollable: true,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: IbookTheme.tabbarTextColor,
          tabs: const [
            Tab(text: '今日'),
            Tab(text: '昨日'),
            Tab(text: '近7日'),
            Tab(text: '近15日'),
            Tab(text: '自选')
          ]);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    _easyRefreshController = EasyRefreshController(
        controlFinishLoad: true, controlFinishRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                title: const Text('投注记录'),
                backgroundColor: IbookTheme.whiteColorAppbar,
                actions: [
                  GestureDetector(
                    onTap: () {
                      showPicker(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(IbookIcons.globalService,
                            width: 22.w, height: 22.w),
                        const Text('全部'),
                        10.horizontalSpace
                      ],
                    ),
                  )
                ],
                bottom: PreferredSize(
                    preferredSize: _tabBar.preferredSize, child: _tabBar),
              )
            ];
          },
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Column(
                children: [
                  _buildTotalContent(),
                  Expanded(
                      child: EasyRefresh(
                          controller: _easyRefreshController,
                          onRefresh: () {
                            _easyRefreshController.finishRefresh();
                          },
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(top: 10.r),
                                  height: 80,
                                  color: Theme.of(context).primaryColor,
                                );
                              })))
                ],
              ))),
    );
  }

  /// show picker
  void showPicker(BuildContext context) async {
    Picker picker = Picker(
      height: 200.h,
      adapter: PickerDataAdapter(
          pickerdata: const JsonDecoder().convert(pickerData2)),
      cancelText: '取消',
      confirmText: '确认',
      confirmTextStyle:
          TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor),
      cancelTextStyle: TextStyle(fontSize: 14.sp, color: IbookTheme.grayColor1),
      onConfirm: (picker, selected) {
        print(selected.toString());
      },
    );
    picker.showModal(context);
  }

  /// total
  Widget _buildTotalContent() {
    return IbookBoxShadow(
      margin: EdgeInsets.only(top: 10.r),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemText('总投注额', '0.00'),
              10.verticalSpace,
              _buildItemText('笔数', '0'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildItemText('盈利额', '0.00',
                  color: Theme.of(context).primaryColor),
              10.verticalSpace,
              _buildItemText('有效流水', '0.00', color: IbookTheme.blueColor),
            ],
          )
        ],
      ),
    );
  }

  /// item Text
  Widget _buildItemText(String label, String value,
      {color = IbookTheme.defaultTextColor}) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: '$label：',
          style: TextStyle(color: IbookTheme.grayColor1, fontSize: 14.sp)),
      TextSpan(
          text: value,
          style: TextStyle(
            color: color ?? IbookTheme.defaultTextColor,
            fontSize: 16.sp,
          ))
    ]));
  }
}
