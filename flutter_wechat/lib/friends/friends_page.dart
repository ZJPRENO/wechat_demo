import 'package:flutter/material.dart';
import 'package:flutter_wechat/child_page.dart';

import '../common.dart';
import 'friends_data.dart';

class _FriendCell extends StatelessWidget {
  final String? imageUrl;//图片 URL
  final String? name;//昵称
  final String? groupTitle;//组头标题
  final String? imageAssets;//本地图片地址


  const _FriendCell({this.imageUrl,this.name,this.groupTitle,this.imageAssets});
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          alignment:Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          height: groupTitle!=null?30:0,
          color: GlobalThemeColor,
          child: groupTitle!=null?Text(groupTitle!,style: const TextStyle(color: Colors.grey),):null,
        ),
        Container(
          color: Colors.white,
          child: Row(
              children:[
                Container(
                    margin: const EdgeInsets.all(10),
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image:getImage(),
                        )
                    )
                ),//图片
                // ignore: avoid_unnecessary_containers
                Container(
                    width: screenWidth(context)-54,
                    child: Column(
                      children: [
                        Container(
                          alignment:Alignment.centerLeft,
                          height: 53.5,
                          child:Text(
                            name!,
                            style: const TextStyle(fontSize: 18,color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 0.5,
                          color: GlobalThemeColor,
                        ),//下划线
                      ],
                    )

                ),//昵称

              ]
          ),
        ),
      ],
    );
  }

  ImageProvider  getImage(){
    if(imageUrl == null){
      return AssetImage(imageAssets!);
    }
    return NetworkImage(imageUrl!);
  }

}

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  //头部数据
  final List<Friends> _headerData = [
    Friends(imageAssets: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageAssets: 'images/群聊.png', name: '群聊'),
    Friends(imageAssets: 'images/标签.png', name: '标签'),
    Friends(imageAssets: 'images/公众号.png', name: '公众号'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalThemeColor,
        actions:  [
          //手势
          GestureDetector(
            //点击回调方法
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context)=>ChildPage(title: "添加好友",))
              );
            },
            child: Container(
              margin:const EdgeInsets.only(right: 10),
              child:const Image(image: AssetImage("images/icon_friends_add.png"),width: 25,),
            ),
          )
        ],
        title: const Text(
          '通讯录',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:Container(
        child: ListView.builder(
          itemBuilder: _itemForRow,
          itemCount: _headerData.length,
        ),
      ),
    );
  }

  Widget _itemForRow(BuildContext context, int index) {
    //显示头部 4 个 cell
      return _FriendCell(
        imageAssets: _headerData[index].imageAssets,
        name:_headerData[index].name ,
      );

  }

}
