import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2);
  }

  int index1 = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: 5,
            onPageChanged: (page) => setState(() {}),
            itemBuilder: (context, index) => Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  '$index Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CfNavigationBar(
        controller: _controller!,
        onPressed: (index) => print(index),
        backgroundColor: Colors.red,
        barColor: Colors.orange,
        circleColor: Colors.grey,
        duration: Duration(seconds: 1),
        curve: Curves.linear,
        items: [
          Icon(
            Icons.person,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.access_alarm,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.notification_important,
            size: 30.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
