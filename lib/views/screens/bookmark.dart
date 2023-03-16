import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';

import '../model/global.dart';

class Bookmark_page extends StatefulWidget {
  const Bookmark_page({Key? key}) : super(key: key);

  @override
  State<Bookmark_page> createState() => _Bookmark_pageState();
}

class _Bookmark_pageState extends State<Bookmark_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: Global.bookmark
              .map((e) => Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: AnyLinkPreview(
                        link: e,
                        displayDirection: UIDirection.uiDirectionHorizontal,
                        bodyMaxLines: 3,
                        showMultimedia: false,
                        bodyTextOverflow: TextOverflow.ellipsis,
                        backgroundColor: Colors.grey.shade50),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
