import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:webview_flutter/webview_flutter.dart';
export 'package:webview_flutter/webview_flutter.dart'
    show NavigationRequest, NavigationDecision;

class WebviewScaffold extends StatefulWidget {
  final String url;
  final String appBarTitle;
  final Color? appBarTitleColor;
  final Color appBarColor;
  final Color? iconAppBarColor;
  final double? appBarElevation;
  final String? userAgent;
  final Map<String, String>? headers;
  final FutureOr<NavigationDecision> Function(NavigationRequest)?
      navigationDelegate;

  const WebviewScaffold(
      {Key? key,
      required this.url,
      this.appBarTitle = 'Safe School Game',
      this.appBarTitleColor,
      this.appBarColor = const Color(0xFFE51C8B),
      this.iconAppBarColor = Colors.white,
      this.appBarElevation,
      this.userAgent,
      this.headers,
      this.navigationDelegate})
      : super(key: key);

  @override
  State<WebviewScaffold> createState() => _WebviewScaffoldState();
}

class _WebviewScaffoldState extends State<WebviewScaffold> {
  final _loadingWebViewController = BehaviorSubject<bool>.seeded(true);

  @override
  void initState() {
    super.initState();
    // fix android 12 keyboard
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:  AppBar(
              elevation: widget.appBarElevation,
              backgroundColor: widget.appBarColor,
              title: Text(
                widget.appBarTitle,
                style: TextStyle(color: widget.appBarTitleColor),
              ),
              iconTheme: IconThemeData(color: widget.iconAppBarColor),
            ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              onWebViewCreated: (WebViewController webViewController) {
                webViewController.loadUrl(widget.url, headers: widget.headers);
              },
              onPageStarted: (_) {
                _loadingWebViewController.add(true);
              },
              onPageFinished: (_) {
                _loadingWebViewController.add(false);
              },
              allowsInlineMediaPlayback: true,
              javascriptMode: JavascriptMode.unrestricted,
              userAgent: widget.userAgent,
              navigationDelegate: widget.navigationDelegate,
            ),
            StreamBuilder<bool>(
              stream: _loadingWebViewController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loadingWebViewController.close();
    super.dispose();
  }
}

class WebViewHelper extends StatefulWidget {
  final String url;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;
  final FutureOr<NavigationDecision> Function(NavigationRequest)?
      navigationDelegate;

  const WebViewHelper(
      {Key? key,
      this.gestureRecognizers,
      this.navigationDelegate,
      required this.url})
      : super(key: key);

  @override
  State<WebViewHelper> createState() => _WebViewHelperState();
}

class _WebViewHelperState extends State<WebViewHelper> {
  final _loadingWebViewController = BehaviorSubject<bool>.seeded(true);

  @override
  void initState() {
    super.initState();
    // fix android 12 keyboard
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          onWebViewCreated: (WebViewController webViewController) {
            webViewController.loadUrl(widget.url);
          },
          onPageStarted: (_) {
            _loadingWebViewController.add(true);
          },
          onPageFinished: (_) {
            _loadingWebViewController.add(false);
          },
          gestureRecognizers: widget.gestureRecognizers,
          navigationDelegate: widget.navigationDelegate,
          javascriptMode: JavascriptMode.unrestricted,
        ),
        StreamBuilder<bool>(
          stream: _loadingWebViewController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _loadingWebViewController.close();
    super.dispose();
  }
}
