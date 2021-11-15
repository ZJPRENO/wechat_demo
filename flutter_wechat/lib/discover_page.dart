import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          '发现',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:const Center(
        child: Text('发现页面'),
      ),
    );
  }
}
