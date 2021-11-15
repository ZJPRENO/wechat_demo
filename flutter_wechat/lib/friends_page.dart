import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          '通讯录',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:const Center(
        child: Text('通讯录页面'),
      ),
    );
  }
}
