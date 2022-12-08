/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 22:14:30
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-08 10:45:39
 * @FilePath: /ibook-apps/ibooks_app/lib/ibooks_app.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibooks_app/provider/discount_provider.dart';
import 'package:ibooks_app/provider/sponsor_provider.dart';
import 'package:ibooks_app/provider/user_provider.dart';
import 'package:ibooks_app/routes/auth_router.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:provider/provider.dart';

class IbooksApp extends StatefulWidget {
  const IbooksApp({super.key});

  @override
  State<IbooksApp> createState() => _IbooksAppState();
}

class _IbooksAppState extends State<IbooksApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DiscountProvider()),
          ChangeNotifierProvider(create: (context) => SponsorProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider())
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          builder: (context, child) => MaterialApp(
            title: 'Ibooks App',
            debugShowCheckedModeBanner: false,
            routes: HomeRouter.getRoutes(context)
              ..addAll(AuthRouter.getRoutes(context)),
            theme: ThemeData(
                primaryColor: IbookTheme.primaryColor,
                colorScheme: const ColorScheme.light().copyWith(
                    primary: IbookTheme.primaryColor,
                    secondary: IbookTheme.primaryColor,
                    onPrimary: IbookTheme.defaultTextColor,
                    onSecondary: Colors.white)),
          ),
        ));
  }
}
