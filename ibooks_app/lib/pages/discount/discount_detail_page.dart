/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-12-07 17:35:59
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-12-07 19:45:38
 * @FilePath: /ibook-apps/ibooks_app/lib/pages/discount/discount_detail_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:ibooks_app/styles/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiscountDetailPage extends StatefulWidget {
  const DiscountDetailPage({super.key});

  @override
  State<DiscountDetailPage> createState() => _DiscountDetailPageState();
}

class _DiscountDetailPageState extends State<DiscountDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DiscountDetailQuery;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: IbookTheme.whiteColorAppbar,
        title: Text(args.title),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller.loadHtmlString(args.content);
        },
      ),
    );
  }
}

class DiscountDetailQuery {
  final String title;
  final String content;
  DiscountDetailQuery(this.title, this.content);
}
