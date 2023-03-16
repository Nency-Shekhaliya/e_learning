import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../model/global.dart';

class Web_page extends StatefulWidget {
  final link;

  const Web_page({Key? key, required this.link}) : super(key: key);

  @override
  State<Web_page> createState() => _Web_pageState();
}

class _Web_pageState extends State<Web_page> {
  late InAppWebViewController mywebcontroller;

  bool cangoback = false;
  String myurl = 'https://www.javatpoint.com/';

  bool cangoforward = false;
  late PullToRefreshController pullToRefreshController;
  double progress = 0;
  @override
  void initState() {
    super.initState();
    myurl = widget.link;
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        setState(() {
          pullToRefreshController.endRefreshing();
        });
      },
      options: PullToRefreshOptions(
        enabled: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                setState(() {
                  Global.bookmark.contains(myurl)
                      ? Global.bookmark.remove(myurl)
                      : Global.bookmark.add(myurl);
                });
              },
              icon: Icon((Global.bookmark.contains(myurl)
                  ? Icons.bookmark
                  : Icons.bookmark_border_outlined)),
            ),
            IconButton(
              onPressed: () {
                mywebcontroller.goBack();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: cangoback ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                mywebcontroller.reload();
              },
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {
                mywebcontroller.goForward();
              },
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: cangoforward ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: InAppWebView(
            onWebViewCreated: (controller) {
              mywebcontroller = controller;
            },
            onProgressChanged: (controller, p) {
              setState(() {
                progress = p.toDouble();
              });
            },
            pullToRefreshController: pullToRefreshController,
            onLoadStart: (con, c) async {
              Uri? dummy = await mywebcontroller.getUrl();
              myurl = dummy!.scheme;
              this.myurl = c.toString();
              cangoback = await mywebcontroller.canGoBack();
              cangoforward = await mywebcontroller.canGoForward();
              setState(() {});
            },
            onLoadStop: (InAppWebViewController controller, Uri? url) {
              this.myurl = url.toString();
              pullToRefreshController.endRefreshing();
            },
            initialUrlRequest: URLRequest(url: Uri.parse(myurl)),
          ),
        ));
  }
}
