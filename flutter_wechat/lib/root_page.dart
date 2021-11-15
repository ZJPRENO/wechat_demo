import 'package:flutter/material.dart';
import 'package:flutter_wechat/chat_page.dart';
import 'package:flutter_wechat/discover_page.dart';
import 'package:flutter_wechat/friends_page.dart';
import 'package:flutter_wechat/mine_page.dart';
//BottomNavigationBarItem(
//             icon: Image.asset(
//               'images/tabbar_chat.png',
//               height: 20,
//               width: 20,
//             ),
//             activeIcon: Image.asset(
//               'images/tabbar_chat_hl.png',
//               height: 20,
//               width: 20,
//             ),
//             label: '微信',
//           )
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> _pages = [ChatPage(), FriendsPage(), DiscoverPage(),MinePage()];

  int  _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:_pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //BottomNavigationBar 的点击事件
        onTap: (index) {
          print("index = $index");
          setState(() {
            _currentIndex = index;
          });
        },
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: '微信'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: '通讯录'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: '发现'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '我'),
        ],


      ),
    );
  }

}
