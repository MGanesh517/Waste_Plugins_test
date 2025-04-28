import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});
  final List<String> title = [
    'Pending',
    'Delivery',
    'Received',
  ];

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          SvgPicture.asset("assets/images/scooty.svg"),
          SvgPicture.asset("assets/images/scooty.svg"),
          SvgPicture.asset("assets/images/scooty.svg"),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        animationCurve: Easing.emphasizedDecelerate,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      // body: Container(
      //   color: Colors.blueAccent,
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text(_page.toString(), style: TextStyle(fontSize: 160)),
      //         ElevatedButton(
      //           child: Text('Go To Page of index 1'),
      //           onPressed: () {
      //             final CurvedNavigationBarState? navBarState =
      //                 _bottomNavigationKey.currentState;
      //             navBarState?.setPage(1);
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // )
    );
  }
}
