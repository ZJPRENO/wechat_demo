import 'package:flutter/material.dart';

import 'common.dart';
import 'mine_cell.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  Widget headerWidget(){
    return Container(
      height: 110,
      color:Colors.white,
      child:Container(
        child: Container(
          margin: const EdgeInsets.only(top: 0,bottom: 20,left: 10,right: 10),
          // color: Colors.red,
          child: Row(
              children:[
                //头像
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("images/avatar.jpeg"),
                          fit:BoxFit.cover
                      )
                  ),
                ),
                //昵称/微信号
                Container(
                  width: screenWidth(context)-90,
                  padding: const EdgeInsets.only(left: 10,top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      //昵称
                       Container(
                        height: 35,
                        child:  Text("RENO",style: TextStyle(fontSize: 25,color: Colors.grey),),
                      ),
                      //微信号
                      Container(
                        height: 35,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text("微信号：12345",style: TextStyle(fontSize: 17,color: Colors.grey),),
                            Image(image: AssetImage("images/icon_right.png"),width: 15,)
                          ],
                        ) ,),
                    ],
                  ),

                )
              ]
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          '我的',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:Container(
        child: MediaQuery.removePadding(
          removeTop: true,//去掉导航栏的间隙
          context: context,
          child: ListView(
            children: [
              //头部
              headerWidget(),
              Column(
                  children: [
                    const SizedBox(height: 10,),
                    const MineCell(
                      imageName: 'images/微信支付.png',
                      title: '支付',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MineCell(
                      imageName: 'images/微信收藏.png',
                      title: '收藏',
                    ),
                    Row(
                      children: <Widget>[
                        Container(width: 50, height: 0.5, color: Colors.white),
                        Container(height: 0.5, color: Colors.grey)
                      ],
                    ),
                    const MineCell(
                      imageName: 'images/微信相册.png',
                      title: '相册',
                    ),
                    Row(
                      children: <Widget>[
                        Container(width: 50, height: 0.5, color: Colors.white),
                        Container(height: 0.5, color: Colors.grey)
                      ],
                    ),
                    const MineCell(
                      imageName: 'images/微信卡包.png',
                      title: '卡包',
                    ),
                    Row(
                      children: <Widget>[
                        Container(width: 50, height: 0.5, color: Colors.white),
                        Container(height: 0.5, color: Colors.grey)
                      ],
                    ),
                    const MineCell(
                      imageName: 'images/微信表情.png',
                      title: '表情',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MineCell(
                      imageName: 'images/微信设置.png',
                      title: '设置',
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
