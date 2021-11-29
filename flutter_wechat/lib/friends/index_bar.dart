// ignore_for_file: prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../common.dart';

class IndexBar extends StatefulWidget {

  final void Function(String str)? indexBarCallBack;
  IndexBar({this.indexBarCallBack});


  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  // ignore: unused_field
  Color _backColor = const Color.fromRGBO(1, 1, 1, 0.0);//背景色
  // ignore: unused_field,
  Color _textColor = Colors.black;
  double _indicatorY = 0.0;
  bool _indicatorHidden = true;
  String _indicatorText = 'A';

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> words = [];//字母索引
    for(int i = 0;i < INDEX_WORDS.length;i++){
      words.add(
        Expanded(
          child: Text(
            INDEX_WORDS[i],
            style: TextStyle(fontSize: 10,color:_textColor),
          ),

        ),
      );

    }
    return Positioned(
      right: 0.0,
      top: screenHeight(context)/8,
      height: screenHeight(context)/2,
      width: 120,
      child: Row(
        children: [
          //指示器
          Container(
            alignment: Alignment(0,_indicatorY),
            width: 100,
            // color: Colors.red,
            child: _indicatorHidden?null:Stack(
              alignment: const Alignment(-0.2,0),
              children: [
               const Image(image: AssetImage("images/气泡.png"),width: 60,),
                Text(_indicatorText,style: const TextStyle(fontSize: 18,color: Colors.white),)
              ],
            ),
          ),
          //索引
          GestureDetector(
            onVerticalDragDown: (DragDownDetails details){
              int index = getIndexItem(context, details.globalPosition);
              widget.indexBarCallBack!(INDEX_WORDS[index]);
              setState(() {
                _backColor = const Color.fromRGBO(1, 1, 1, 0.5);//设置背景颜色
                _textColor = Colors.white;//文字显示颜色
                _indicatorY = 2.28 / INDEX_WORDS.length * index - 1.14;//改变坐标 Y值
                _indicatorText = INDEX_WORDS[index];//获取对应的字母
                _indicatorHidden = false;//是否隐藏指示器
              });
            },
            onVerticalDragEnd:(DragEndDetails details){
              setState(() {
                _backColor = const Color.fromRGBO(1, 1, 1, 0.0);
                _textColor = Colors.black;
                _indicatorHidden = true;
              });
            },
            onVerticalDragUpdate: (DragUpdateDetails details){
              int index = getIndexItem(context, details.globalPosition);
              widget.indexBarCallBack!(INDEX_WORDS[index]);
              setState(() {
                _indicatorY = 2.28 / INDEX_WORDS.length * index - 1.14;
                _indicatorText = INDEX_WORDS[index];
                _indicatorHidden = false;
              });
            },
            child: Container(
              width:20,
              color: _backColor,
              child: Column(
                children:words,
              ),
            ),
          )
        ],
      ),
    );
  }
}

int getIndexItem(BuildContext context,Offset globalPosition){
  //拿到当前盒子
  RenderBox box = context.findRenderObject() as RenderBox;
  //拿到y值，当前位置到部件原点(部件左上角)的距离(x,y)
  var y = box.globalToLocal(globalPosition).dy;
  //算出字符高度
  var itemHeight = screenHeight(context)/2/INDEX_WORDS.length;
  int index = y ~/itemHeight.clamp(0, INDEX_WORDS.length-1);//~取整,设置取整范围clamp
  print("${INDEX_WORDS[index]}");
  return index;
}
// ignore: constant_identifier_names
const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

