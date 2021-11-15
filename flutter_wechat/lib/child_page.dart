import 'package:flutter/material.dart';

import 'common.dart';

class ChildPage extends StatelessWidget {
  final String title; ChildPage({this.title=""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalThemeColor,
        title: Text('$title'),
      ),
      body: Center(
        child: Text('$title'),
      ),
    );
  }
}
