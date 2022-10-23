
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/tab_bar_widget.dart';

class ArticleView extends StatefulWidget {
  final String blogView;
  const ArticleView({Key? key, required this.blogView}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  /// We will need a controller named Completer for the WebView to establish connection between the Actual Article of web and the Article_View's WebView
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('MyNews',
              style: TextStyle(
                color: Colors.black,
              ),),
            Text('App',
              style: TextStyle(
                color: Colors.blue,
              ),),
          ],
        ),
      ),
      body: Container(
        child: WebView(
          //providing link for the WebView to open a WebView to the exact link we want
          initialUrl: widget.blogView,
          onWebViewCreated:((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
          /// Either of upper and below works but upper one be preffered as it gives less errors
          javascriptMode: JavascriptMode.unrestricted,
        ),
        ///Implementing the controller

      ),
      bottomNavigationBar: const TabBarWidget(),
    );
  }
}
