import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({
    super.key,
    required this.url,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;

  static const platform = MethodChannel('webview/theme');

  @override
  void initState() {
    // TODO: implement initState
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..loadRequest(
        Uri.parse(widget.url.isEmpty
            ? 'https://animemangatoon.com/lore-olympus-season-1-review/'
            : widget.url),
      );

    super.initState();
  }

  void _setDarkMode(bool isDarkMode) {
    String jsCode = '''
      (function() {
        if (window.matchMedia && window.matchMedia('(prefers-color-scheme)').media !== 'not all') {
          document.documentElement.style.backgroundColor = '${isDarkMode ? 'black' : 'white'}';
          document.documentElement.style.color = '${isDarkMode ? 'white' : 'black'}';
        }
      })();
    ''';
    controller.runJavaScript(jsCode);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    _setDarkMode(isDarkMode); // Call this whenever the theme changes
    return SafeArea(
      top: false,
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.black.withOpacity(0.2)
                    : Colors.white.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
