import 'package:flutter/material.dart';

import 'common.dart';
import 'mine_cell.dart';

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
        backgroundColor: GlobalThemeColor,
        title: const Text(
          '发现',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0, //导航栏底部边栏，这样设置就没有底部的黑线了
      ),
      body:Container(
        color: GlobalThemeColor,
        height: 800,
        child: ListView(
          children: <Widget>[
            //朋友圈
            const MineCell(
              imageName: 'images/朋友圈.png',
              title: '朋友圈',
            ),
            //间隔
            const SizedBox(
              height: 10,
            ),
            //扫一扫
            const MineCell(
              imageName: 'images/扫一扫2.png',
              title: '扫一扫',
            ),
            //分割线
            Row(
              children: <Widget>[
                Container(width: 50, height: 0.5, color: Colors.white),
                Container(height: 0.5, color: Colors.grey)
              ],
            ),
            //摇一摇
            const MineCell(
              imageName: 'images/摇一摇.png',
              title: '摇一摇',
            ),
            const SizedBox(
              height: 10,
            ),
            //看一看
            const MineCell(
              imageName: 'images/看一看icon.png',
              title: '看一看',
            ),
            Row(
              children: <Widget>[
                Container(width: 50, height: 0.5, color: Colors.white),
                Container(height: 0.5, color: Colors.grey)
              ],
            ),
            //搜一搜
            const MineCell(
              imageName: 'images/搜一搜 2.png',
              title: '搜一搜',
            ),
            const SizedBox(
              height: 10,
            ),
            //附近的人
            const MineCell(
              imageName: 'images/附近的人icon.png',
              title: '附近的人',
            ),
            const SizedBox(
              height: 10,
            ),
            //购物
            const MineCell(
              imageName: 'images/购物.png',
              title: '购物',
              subTitle: '618限时特价',
              subImageName: 'images/badge.png',
            ),
            Row(
              children: <Widget>[
                Container(width: 50, height: 0.5, color: Colors.white),
                Container(height: 0.5, color: Colors.grey)
              ],
            ),
            //游戏
            const MineCell(
              imageName: 'images/游戏.png',
              title: '游戏',
            ),
            const  SizedBox(
              height: 10,
            ),
            //小程序
            const MineCell(
              imageName: 'images/小程序.png',
              title: '小程序',
            ),
          ],
        ),
      ),
    );
  }
}
