import 'package:flutter/material.dart';
import 'package:flutter_wechat/child_page.dart';
import 'package:flutter_wechat/friends/index_bar.dart';

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
        //组头
        Container(
          alignment:Alignment.centerLeft,//靠左边居中
          padding: const EdgeInsets.only(left: 10),//距离左10 个间距
          height: groupTitle!=null?30:0,
          color: GlobalThemeColor,
          child: groupTitle!=null?Text(
            groupTitle!,
            style: const TextStyle(color: Colors.grey),
          ) :null,
        ),
        //昵称和图片
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
  late final List<Friends> _listDatas = [];//列表数据
  late ScrollController _scrollController;//滚动控制器

  final double _cellHeight = 54.0;
  final double _groupHeight = 30.0;
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]:0.0,
    INDEX_WORDS[0]:0.0,
  };

  //页面创建渲染的时候走这个方法
  @override
  void initState(){
    super.initState();
    //创建数据
    // _listDatas.addAll(datas);
    // _listDatas.addAll(datas);
    _listDatas..addAll(datas)..addAll(datas)..addAll(datas);//数据
    _scrollController = ScrollController();//初始化


    //排序
    _listDatas.sort((Friends a,Friends b){
      return a.indexLetter!.compareTo(b.indexLetter!);
    });
    print(_listDatas);
    Future.delayed(Duration.zero, () {
      //字典存放 item对应的高度
      var _groupOffset = _cellHeight*_headerData.length;//头部的高度
      for(int i = 0; i < _listDatas.length; i++){
        if(i < 1){//第一个 cell一定是有组头的
          _groupOffsetMap.addAll(
              {_listDatas[i].indexLetter:_groupOffset}
          );
          _groupOffset += _cellHeight + _groupHeight;
        }else if(_listDatas[i].indexLetter==_listDatas[i-1].indexLetter){
          //组头下一个 cell
          _groupOffset += _cellHeight;
        }else{

          //如果剩余的加起来没有屏幕的高度，就不添加
          // double left = (_listDatas.length-i-1)*_cellHeight;
          // if(_listDatas[i].indexLetter!=_listDatas[i+1].indexLetter){
          //   left += _groupHeight;
          // }
          // if (left > MediaQuery.of(context).size.height){
          //   _groupOffsetMap.addAll(
          //       {_listDatas[i].indexLetter:_groupOffset}
          //   );
          // }
          _groupOffsetMap.addAll(
              {_listDatas[i].indexLetter:_groupOffset}
          );
          _groupOffset += _cellHeight + _groupHeight;

        }
      }
    });
  }

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
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: _itemForRow,
            itemCount: _headerData.length+_listDatas.length,
            controller: _scrollController,//控制器
          ),
          //索引条
          IndexBar(indexBarCallBack:(String str){
            if(_groupOffsetMap[str]!=null){

              _scrollController.animateTo(_groupOffsetMap[str],
                  duration: const Duration(microseconds: 100),
                  curve: Curves.easeIn);
            }

          }
          )
        ],
      ),
    );
  }

  Widget _itemForRow(BuildContext context, int index) {
    //显示头部 4 个 cell
    if(index < _headerData.length){
      return _FriendCell(
        imageAssets: _headerData[index].imageAssets,
        name:_headerData[index].name ,
      );
    }else {
      //是否显示组名
      bool isShowT =  index-_headerData.length>0&&_listDatas[index-_headerData.length].indexLetter==_listDatas[index-_headerData.length-1].indexLetter;

        return _FriendCell(
          imageUrl: _listDatas[index-4].imageUrl,
          name:_listDatas[index-4].name,
          groupTitle: isShowT?null:_listDatas[index-4].indexLetter
        );

    }


  }

}
