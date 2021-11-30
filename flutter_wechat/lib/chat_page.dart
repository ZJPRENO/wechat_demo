import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          '微信',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
                color: const Color.fromRGBO(1, 1, 1, 0.5),
                offset: const Offset(0, 60),
                child: Image.asset(
                  'images/圆加.png',
                  width: 25,
                ),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<String>>[
                    PopupMenuItem(
                        child: _popupMenuItem("images/发起群聊.png", "发起群聊")),
                    PopupMenuItem(
                        child: _popupMenuItem("images/添加朋友.png", "添加好友")),
                    PopupMenuItem(
                        child: _popupMenuItem("images/扫一扫1.png", "扫一扫")),
                    PopupMenuItem(
                        child: _popupMenuItem("images/收付款.png", "收付款")),
                  ];
                }),
          )
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
            itemCount: 15,
            itemBuilder:(BuildContext context,int index){
              return ListTile(
                  title: const Text("卡卡西"),
                  subtitle: Container(
                    alignment: Alignment.bottomCenter,
                    height: 25,
                    padding: const EdgeInsets.only(right: 5),
                    child: const Text("鸣人，在吗？木叶村有紧急事情需要你处理，请速速回来！",overflow: TextOverflow.ellipsis,),
                  ),
                  //头像
                  leading: Container(
                    width: 45,height: 45,//宽高
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),//圆角
                        image: const DecorationImage(image:AssetImage("images/avatar1.jpeg"))
                    ),
                  )
              );
            },
        ),
      ),
    );
  }
  Widget _popupMenuItem(String imgAss, String title) {
    return Row(
      children: [
        Image(
          image: AssetImage(imgAss),
          width: 25,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    );
  }
}
