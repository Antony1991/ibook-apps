/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-04 22:14:30
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-05 18:26:04
 * @FilePath: /ibook-apps/ibooks_app/lib/ibooks_app.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:ibooks_app/routes/auth_router.dart';
import 'package:ibooks_app/routes/home_router.dart';
import 'package:ibooks_app/styles/theme.dart';

class IbooksApp extends StatefulWidget {
  const IbooksApp({super.key});

  @override
  State<IbooksApp> createState() => _IbooksAppState();
}

class _IbooksAppState extends State<IbooksApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ibooks App',
      debugShowCheckedModeBanner: false,
      routes: AuthRouter.getRoutes(context)
        ..addAll(HomeRouter.getRoutes(context)),
      initialRoute: AuthRouter.signin,
      theme: ThemeData(
          primaryColor: IbookTheme.primaryColor,
          colorScheme: const ColorScheme.light().copyWith(
              primary: IbookTheme.primaryColor,
              secondary: IbookTheme.primaryColor,
              onSecondary: Colors.white)),
    );
  }
}
